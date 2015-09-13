package Hsdb::Import;

use strict;
use warnings;
use utf8;

use Utils;
use Hsdb::DB;
use Hsdb::Downloader;
use JSON::XS;


sub new {
	my ($class, %p) = @_;

	my $self = {};

	return bless $self, $class;
}

sub run {
	my ($self) = @_;

	my $data = download('http://ru.hearthhead.com/cards=0.0');
	if ($data =~ /var\s+hearthstoneCards\s+=\s+(\[.*?\])/mi) {
		my $json = $1;
		$json =~ s/,(popularity):/,"$1":/g;
		debug (JSON::XS->new->utf8->decode($json));
		#print $1;
	}
}

1;
