CREATE TABLE rarities (

	id         tinyint unsigned NOT NULL,
	name       varchar(15)      NOT NULL,

	PRIMARY KEY (id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO 
	rarities (id, name) 
VALUES
	(1, 'Бесплатная'),
	(2, 'Обычная'),
	(3, 'Редкая'),
	(4, 'Эпическая'),
	(5, 'Легендарная');
