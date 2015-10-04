package HsdbApp::Action::Collection;

use strict;
use warnings;
use utf8;

use Hsdb::DB;
use List::Compare;
use Utils;

my $__ALL_CARDS;
my $__HELPERS;

sub main {
	my ($self) = @_;

	my $character_id = $self->params->{character_id} || 1;

	$self->_load_all_cards;

	my %collection = 
		map  { $_->{card_id} => $_ } 
		grep { $__ALL_CARDS->{by_id}->{$_->{card_id}}->{character_id} eq $character_id }
		schema->resultset('Collection')
		->search(
			{ user_id => $self->params->{user_id} },
			{ AS_HASH }
		)->all;

	my @card_ids = $self->params->{type} eq 'out'
		? List::Compare->new(
			[ @{$__ALL_CARDS->{by_character}->{$character_id}} ],
			[ map { $_->{card_id} } keys %collection ],
		  )->get_Lonly
		: keys %collection; 
	
	return {
		cards => [ 
			sort { $a->{mana_cost} <=> $b->{mana_cost} or $a->{id} <=> $b->{id} }
			grep { $_->{set_id} ne 1 }
			map  { $__ALL_CARDS->{by_id}->{$_} } @card_ids 
		],
		filter_character => $self->_prepare_filter('character', $character_id),
		#filter_character => $self->_prepare_filter('character', $character_id),
	};
}

sub _load_helpers {
	my ($self) = @_;

	return if $__HELPERS;

	foreach my $name (qw/ Character Rarity Race Set Type /) {
		$__HELPERS->{lc $name} = {
			map { $_->{id} => $_->{name} }
			schema->resultset($name)->search({}, {AS_HASH})->all
		}
	}
}

sub _prepare_filter {
	my ($self, $helper_name, $selected_id) = @_;

	$self->_load_helpers;

	return [
		map {{
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
			push @{$__ALL_CARDS->{by_character}->{$c->{character_id} || 0}}, $c->{id};
			$__ALL_CARDS->{by_id}->{$c->{id}} = $c;
		}
	}
}

1;
