CREATE TABLE sets (

	id         tinyint unsigned NOT NULL,
	name       varchar(30)      NOT NULL,

	PRIMARY KEY (id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8; 


INSERT INTO 
	sets (id, name)
VALUES
	(1, 'Базовый набор'),
	(2, 'Классический набор'),
	(3, 'Награда'),
	(4, 'Задания'),
	(5, 'Промо-акция'),
	(6, 'Наскрамас'),
	(7, 'Гоблины и Гномы'),
	(8, 'Черная Гора'),
	(9, 'Большой Турнир'),
	(10, 'Создатели');
