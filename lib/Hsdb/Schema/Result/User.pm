use utf8;
package Hsdb::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("users");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 70 },
  "password",
  { data_type => "char", is_nullable => 0, size => 32 },
  "ip",
  { data_type => "char", is_nullable => 1, size => 15 },
  "updated",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("email", ["email"]);
__PACKAGE__->has_many(
  "collections",
  "Hsdb::Schema::Result::Collection",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-10-03 16:22:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:y7tx6LUcjCoOFGbcMxVKoA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
