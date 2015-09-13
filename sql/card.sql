create table card (
	id         int unsigned     not null primary key auto_increment,
	name       varchar(50)      not null,
	attack     tinyint unsigned not null,
	life       tinyint unsigned not null,
	descr      varchar(255) not null,
	image_url  varchar(255) not null,
	mana_cost  tinyint not null,
	rarity     tinyint not null,
	set_id     int unsigned not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
