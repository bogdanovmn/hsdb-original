CREATE TABLE cards (

	id           int unsigned     NOT NULL auto_increment,
	name         varchar(50)      NOT NULL,
	mana_cost    tinyint unsigned NOT NULL,
	attack       tinyint unsigned NOT NULL,
	life         tinyint unsigned NOT NULL,
	descr        varchar(255)     NOT NULL,
	image_url    varchar(255)     NOT NULL,
	character_id tinyint unsigned DEFAULT NULL,
	rarity_id    tinyint unsigned NOT NULL,
	type_id      tinyint unsigned NOT NULL,
	race_id      tinyint unsigned DEFAULT NULL,
	set_id       tinyint unsigned NOT NULL,
	collectible  tinyint unsigned NOT NULL,
	ext_id       int unsigned     NOT NULL,
	hh_rating    int unsigned     NOT NULL,

	PRIMARY KEY (id),

	UNIQUE KEY (name), 

	KEY i_cards__char_id   (character_id),
	KEY i_cards__set_id    (set_id),
	KEY i_cards__type_id   (type_id),
	KEY i_cards__rarity_id (rarity_id),
	KEY i_cards__race_id   (race_id),

	FOREIGN KEY (character_id) REFERENCES characters (id) ON DELETE CASCADE,
	FOREIGN KEY (set_id)       REFERENCES sets (id)       ON DELETE CASCADE,
	FOREIGN KEY (type_id)      REFERENCES types (id)      ON DELETE CASCADE,
	FOREIGN KEY (rarity_id)    REFERENCES rarities (id)   ON DELETE CASCADE,
	FOREIGN KEY (race_id)      REFERENCES races (id)      ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
