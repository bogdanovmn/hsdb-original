use utf8;
package Hsdb::Schema::Result::Card;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("cards");
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
  "mana_cost",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "attack",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "life",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "descr",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "image_url",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "character_id",
  {
    data_type => "tinyint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "rarity_id",
  {
    data_type => "tinyint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "type_id",
  {
    data_type => "tinyint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "race_id",
  {
    data_type => "tinyint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "set_id",
  {
    data_type => "tinyint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "collectible",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "ext_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "hh_rating",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("name", ["name"]);
__PACKAGE__->has_many(
  "card2abilities",
  "Hsdb::Schema::Result::Card2ability",
  { "foreign.card_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->belongs_to(
  "character",
  "Hsdb::Schema::Result::Character",
  { id => "character_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->has_many(
  "collections",
  "Hsdb::Schema::Result::Collection",
  { "foreign.card_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->belongs_to(
  "race",
  "Hsdb::Schema::Result::Race",
  { id => "race_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "rarity",
  "Hsdb::Schema::Result::Rarity",
  { id => "rarity_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "set",
  "Hsdb::Schema::Result::Set",
  { id => "set_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);
__PACKAGE__->belongs_to(
  "type",
  "Hsdb::Schema::Result::Type",
  { id => "type_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2015-09-13 23:10:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gRPbSilicSkkqqdpg2/aAQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
