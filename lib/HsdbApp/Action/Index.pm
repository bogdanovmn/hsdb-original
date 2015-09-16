package HsdbApp::Action::Index;

use strict;
use warnings;
use utf8;

use Hsdb::DB;

sub main {
	my ($self) = @_;

	my @cards = schema
		->resultset('Card')
		->search(
			{ character_id => 1 },
			{ AS_HASH }
		)->all;

	return {
		cards => \@cards
	};
}

1;
