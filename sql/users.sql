CREATE TABLE users (

	id          int unsigned NOT NULL AUTO_INCREMENT,
	name        varchar(50)  DEFAULT NULL,
	email       varchar(70)  NOT NULL,
	password    char(32)     NOT NULL,
	ip          char(15)     DEFAULT NULL,
	updated     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
	PRIMARY KEY (id),
	UNIQUE  KEY (email)

) ENGINE=InnoDB DEFAULT CHARSET=utf8
