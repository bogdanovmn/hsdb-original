package Hsdb::DB;

use strict;
use warnings;
use utf8;

use Hsdb::Schema;
use Hsdb::Config;

use Exporter;
our @ISA    = qw( Exporter );
our @EXPORT = qw( 
	schema 
	AS_HASH
);

use constant AS_HASH => (result_class => 'DBIx::Class::ResultClass::HashRefInflator');

my $__SCHEMA;

sub schema {
	unless ($__SCHEMA) {
		$__SCHEMA  = Hsdb::Schema->connect(
			sprintf('dbi:mysql:%s:%s', config_db->param('name'), config_db->param('host')), 
			config_db->param('user'), 
			config_db->param('pass'),
			{ 
				RaiseError           => 1,
				mysql_auto_reconnect => 1,
				mysql_enable_utf8    => 1,
			},
		) or die $!;
	}
	return $__SCHEMA;
}

1;
