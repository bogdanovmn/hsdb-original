CREATE TABLE types (

	id         tinyint unsigned NOT NULL,
	name       varchar(15)      NOT NULL,

	PRIMARY KEY (id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO 
	types (id, name) 
VALUES
	(1, 'Существо'),
	(2, 'Заклинание'),
	(3, 'Оружие');
