CREATE TABLE characters (

	id         tinyint unsigned NOT NULL,
	name       varchar(20)      NOT NULL,

	PRIMARY KEY (id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8; 


INSERT INTO 
	characters (id, name)
VALUES
	(1, 'Маг'),
	(2, 'Чернокнижник'),
	(3, 'Шаман'),
	(4, 'Воин'),
	(5, 'Паладин'),
	(6, 'Разбойник'),
	(7, 'Жрец'),
	(8, 'Охотник'),
	(9, 'Друид');
