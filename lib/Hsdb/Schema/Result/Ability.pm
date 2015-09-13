use utf8;
package Hsdb::Schema::Result::Ability;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("abilities");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 50 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "card2abilities",
  "Hsdb::Schema::Result::Card2ability",
  { "foreign.ability_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2015-09-13 17:35:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:X1ZJfVIfZ3Cn27n+WBEReQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
