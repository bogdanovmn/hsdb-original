CREATE TABLE races (

	id         tinyint unsigned NOT NULL,
	name       varchar(15)      NOT NULL,

	PRIMARY KEY (id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO 
	races (id, name) 
VALUES
	(1, 'Демон'),
	(2, 'Дракон'),
	(3, 'Зверь'),
	(4, 'Механизм'),
	(5, 'Мурлок'),
	(6, 'Пират'),
	(7, 'Тотем');
