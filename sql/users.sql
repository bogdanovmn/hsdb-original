CREATE TABLE users (

	id          int unsigned NOT NULL AUTO_INCREMENT,
	name        varchar(50)  NOT NULL,
	email       varchar(70)  NOT NULL,
	password    varchar(20)  NOT NULL,
	updated     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
	PRIMARY KEY (id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user parsed data'
