CREATE TABLE cards (

	id         int unsigned     NOT NULL auto_increment,
	name       varchar(50)      NOT NULL,
	attack     tinyint unsigned NOT NULL,
	life       tinyint unsigned NOT NULL,
	descr      varchar(255)     NOT NULL,
	image_url  varchar(255)     NOT NULL,
	mana_cost  tinyint          NOT NULL,
	rarity     tinyint          NOT NULL,
	set_id     int unsigned     NOT NULL,

	PRIMARY KEY (id),

	FOREIGN KEY (set_id) REFERENCES sets (id) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8 
