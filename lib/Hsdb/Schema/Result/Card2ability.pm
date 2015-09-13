use utf8;
package Hsdb::Schema::Result::Card2ability;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("card2abilities");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "card_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "ability_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("card_id", ["card_id", "ability_id"]);
__PACKAGE__->belongs_to(
  "ability",
  "Hsdb::Schema::Result::Ability",
  { id => "ability_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "card",
  "Hsdb::Schema::Result::Card",
  { id => "card_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2015-09-13 23:10:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0QUXSyvu4cbku2SQHSKSwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
