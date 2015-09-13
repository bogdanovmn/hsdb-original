use utf8;
package Hsdb::Schema::Result::Type;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("types");
__PACKAGE__->add_columns(
  "id",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 15 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "cards",
  "Hsdb::Schema::Result::Card",
  { "foreign.type_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2015-09-13 23:10:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EjamEFL+sdNFayqbzEtqAw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
