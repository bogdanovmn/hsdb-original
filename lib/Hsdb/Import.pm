package Hsdb::Import;

use strict;
use warnings;
use utf8;

use Hsdb::DB;
use Hsdb::Downloader;


sub new {
	my ($class, %p) = @_;

	my $self = {};

	return bless $self, $class;
}

sub run {
	my ($self) = @_;

}

1;
