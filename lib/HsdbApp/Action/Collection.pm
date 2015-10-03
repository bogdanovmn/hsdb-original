package HsdbApp::Action::Collection;

use strict;
use warnings;
use utf8;

use Hsdb::DB;
use List::Compare;
use Utils;

my $__ALL_CARDS;


sub main {
	my ($self) = @_;

	my $character_id = $self->params->{character_id} || 0;

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
		cards => [ map { $__ALL_CARDS->{by_id}->{$_} } @card_ids ]
	};
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
