package HsdbApp::Action::Collection;

use strict;
use warnings;
use utf8;

use Hsdb::DB;
use HsdbApp::Menu;
use List::Compare;
use Utils;

my $__ALL_CARDS;
my $__HELPERS;
my $__STAT;

sub main {
	my ($self) = @_;

	my $character_id = $self->params->{character_id} // 0;
	my $rarity_id    = $self->params->{rarity_id}    // 0;
	my $type         = $self->params->{type};

	$self->_load_all_cards;

	my %collection_stat;
	my %collection = 
		map  { $_->{card_id} => $_ } 
		grep { _card($_->{card_id}, 'character_id') eq $character_id }
		map  { 
			$collection_stat{_card($_->{card_id}, 'character_id')}->{total}
				+= (($_->{norm_count} + $_->{gold_count}) > 1)
					? 2
					: 1;
			$_;
		}
		schema->resultset('Collection')
		->search(
			{ user_id => $self->params->{user_id} },
			{ AS_HASH }
		)->all;

	my @card_ids = $type eq 'out'
		? List::Compare->new(
			[ @{$__ALL_CARDS->{by_character}->{$character_id}} ],
			[ 
				grep { ($collection{$_}->{norm_count} + $collection{$_}->{gold_count}) > 1 }
				keys %collection
			],
		  )->get_Lonly
		: keys %collection; 

	my $filter_character = $self->_prepare_filter('character', $character_id);
	my $collection_total = 0;
	my $total            = 0;
	foreach my $f (@$filter_character) {
		my $by_char_total            = $__STAT->{by_character}->{$f->{id}}->{complect_total};
		my $collection_by_char_total = $collection_stat{$f->{id}}->{total} || 0;

		my $count = $type eq 'out'
			? ($by_char_total - $collection_by_char_total)
			: $collection_by_char_total;
			
		$f->{progress} = int(100 * $count / $by_char_total);

		$collection_total += $collection_by_char_total;
		$total            += $by_char_total;
	}

	return {
		cards => [ 
			sort { $a->{mana_cost} <=> $b->{mana_cost} or $a->{id} <=> $b->{id} }
			grep { $_->{set_id} ne 1 }
			map  { 
				my $data = $__ALL_CARDS->{by_id}->{$_};
				$data->{norm_count} = $collection{$_} ? $collection{$_}->{norm_count} : 0;
				$data->{gold_count} = $collection{$_} ? $collection{$_}->{gold_count} : 0;
				$data;
			} 
			@card_ids 
		],
		collection_percent => int(100 * $collection_total / $total),
		filter_character   => $filter_character,
		filter_rarity      => $self->_prepare_filter('rarity'   , $rarity_id),
		menu               => HsdbApp::Menu->init('collection_'. $self->params->{type})->prepare,
		_prepare_filter_params(character_id => $character_id, rarity_id => $rarity_id),
	};
}

sub _is_legend {
	my ($card_id) = @_;
	return _card($card_id, 'rarity_id') eq 5;
}

sub _card {
	my ($id, $field) = @_;
	return $field 
		? $__ALL_CARDS->{by_id}->{$id}->{$field}
		: $__ALL_CARDS->{by_id}->{$id};
}

sub _prepare_filter_params {
	my (%p) = @_;

	my @full;
	my %result;
	foreach my $name (keys %p) {
		push @full, $name. '='. $p{$name};
		foreach my $k (keys %p) {
			next if $name eq $k;
			push @{$result{$name}}, $k.'='.$p{$k};
		}
	}

	foreach my $name (keys %result) {
		$result{'current_filter_wo_'.$name} = join '&', @{$result{$name}};
		delete $result{$name};
	}
	$result{current_filter} = join '&', @full;

	return %result; 
}

sub _load_helpers {
	my ($self) = @_;

	return if $__HELPERS;

	foreach my $name (qw/ Character Rarity Race Set Type /) {
		$__HELPERS->{lc $name} = {
			map { $_->{id} => $_->{name} }
			schema->resultset($name)->search({}, {AS_HASH})->all
		};

		if ($name eq 'Character') {
			$__HELPERS->{lc $name}->{0} = '!Любой';
		}

		if ($name eq 'Rarity') {
			$__HELPERS->{lc $name}->{1} = '!Любая';
		}
	}
}

sub _prepare_filter {
	my ($self, $helper_name, $selected_id) = @_;

	$self->_load_helpers;

	return [
		sort { $a->{name} cmp $b->{name} }
		map  {{
			name     => $__HELPERS->{$helper_name}->{$_},
			id       => $_,
			selected => $_ eq $selected_id ? 1 : 0,
		}}
		keys %{$__HELPERS->{$helper_name}}
	];
}

sub _load_all_cards {
	my ($self) = @_;

	unless ($__ALL_CARDS) {
		my @cards = schema
			->resultset('Card')
			->search({}, { AS_HASH })
			->all;

		foreach my $c (@cards) {
			$c->{character_id} ||= 0;
			push @{$__ALL_CARDS->{by_character}->{$c->{character_id}}}, $c->{id};
			$__ALL_CARDS->{by_id}->{$c->{id}} = $c;
			$__STAT->{by_character}->{$c->{character_id}}->{complect_total} += (_is_legend($c->{id}) ? 1 : 2);
		}
	}
}

1;
