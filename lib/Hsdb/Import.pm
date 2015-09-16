package Hsdb::Import;

use strict;
use warnings;
use utf8;

use Utils;
use Hsdb::DB;
use Hsdb::Downloader;
use Hsdb::Logger;
use JSON::XS;

use constant MAP_TYPE => {
	4 => 1,
	5 => 2,
	7 => 3
};

use constant MAP_RACE => {
	15 => 1, # Демон
	24 => 2, # Дракон
	20 => 3, # Зверь
	17 => 4, # Механизм
	14 => 5, # Мурлок
	23 => 6, # Пират
	21 => 7, # Тотем
};

use constant MAP_RARITY => {
	0 => 1,
	1 => 2,
	3 => 3,
	4 => 4,
	5 => 5,
};

use constant MAP_SET => {
	2  => 1, # Базовый набор
	3  => 2, # Классический набор
	4  => 3, # Награда
	5  => 4, # Задания
	11 => 5, # Промо-акция
	12 => 6, # Наскрамас
	13 => 7, # Гоблины и Гномы
	14 => 8, # Черная Гора
	15 => 9, # Большой Турнир
	16 => 10,# Создатели
};


sub new {
	my ($class, %p) = @_;

	my $self = {};

	return bless $self, $class;
}

sub run {
	my ($self) = @_;

	my $character_id;
	my $data = download('http://ru.hearthhead.com/cards=0.0');
	if ($data =~ /var\s+hearthstoneCards\s+=\s+(\[.*?\])/mi) {
		my $json = $1;
		$json =~ s/,(popularity):/,"$1":/g;

		my $cards = JSON::XS->new->utf8->decode($json);

		if (is_list $cards) {
			foreach my $c (@$cards) {
				logger->info(sprintf 'look at card named "%s"', $c->{name});

				my $our_card = schema->resultset('Card')->search({ name => $c->{name} })->first;
				if ($our_card) {
					if ($our_card->hh_rating ne $c->{popularity}) {
						logger->info('update it');
						$our_card->update({ hh_rating => $c->{popularity} });
					}
					else {
						logger->info('already exists');
					}
				}
				else {
					logger->info('create it');
					#debug $c;
					schema->resultset('Card')->create({
						name         => $c->{name},
						attack       => $c->{attack},
						life         => $c->{health},
						mana_cost    => $c->{cost},
						descr        => $c->{description},
						image_url    => $c->{image},
						character_id => $character_id,
						rarity_id    => MAP_RARITY->{$c->{quality}},
						type_id      => MAP_TYPE->{$c->{type}},
						race_id      => $c->{race} ? MAP_RACE->{$c->{race}} : undef,
						set_id       => MAP_SET->{$c->{set}},
						collectible  => $c->{collectible},
						ext_id       => $c->{id},
						hh_rating    => $c->{popularity}
					});
				}
			}
		}
		#print $1;
	}
}

1;
