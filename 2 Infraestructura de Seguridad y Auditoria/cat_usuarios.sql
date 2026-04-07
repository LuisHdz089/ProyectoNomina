CREATE TABLE cat_usuarios(
	id_usuario SMALLINT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password_hash VARCHAR(64) NOT NULL
);

INSERT INTO cat_usuarios (username, password_hash) VALUES ('admin', '12345');
INSERT INTO cat_usuarios (username, password_hash) VALUES ('ERT', '6767');
