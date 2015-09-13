CREATE TABLE collections (

	id         int unsigned NOT NULL auto_increment,
	user_id    int unsigned NOT NULL,
	card_id    int unsigned NOT NULL,
	norm_count int unsigned NOT NULL,
	gold_count int unsigned NOT NULL,

	PRIMARY KEY (id),
	UNIQUE  KEY (user_id, card_id),

	FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
	FOREIGN KEY (card_id) REFERENCES cards (id) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8
