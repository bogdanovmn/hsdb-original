create table collection (
	id int unsigned not null aprimary key auto_increment,
	user_id int unsigned not null,
	card_id int unsigned not null,
	norm_count int unsigned not null,
	gold_count int unsigned not null,
	UNIQUE KEY (user_id, card_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
