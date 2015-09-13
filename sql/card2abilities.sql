CREATE TABLE card2abilities (

	id          int unsigned     NOT NULL auto_increment,
	card_id     int unsigned     NOT NULL,
	ability_id  int unsigned     NOT NULL,

	PRIMARY KEY (id),
	
	UNIQUE KEY (card_id, ability_id),

	KEY i_c2a__ablility_id (ability_id),

	FOREIGN KEY (card_id)    REFERENCES cards     (id) ON DELETE CASCADE,
	FOREIGN KEY (ability_id) REFERENCES abilities (id) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8 
