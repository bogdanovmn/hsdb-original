package HsdbApp::Action::Collection::Modify;

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

	my $collection = schema
		->resultset('Collection')
		->search({ 
			user_id => $self->params->{user_id},
			card_id => $self->params->{card_id}
		})
		->single;

}


1;
