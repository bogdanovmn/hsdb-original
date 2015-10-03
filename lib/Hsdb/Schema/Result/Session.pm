use utf8;
package Hsdb::Schema::Result::Session;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("session");
__PACKAGE__->add_columns(
  "id",
  { data_type => "char", is_nullable => 0, size => 40 },
  "session_data",
  { data_type => "text", is_nullable => 1 },
  "last_active",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-10-03 16:22:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XVzmrjhARH6qrldajfJEzg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
