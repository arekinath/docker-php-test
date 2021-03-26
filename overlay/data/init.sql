CREATE DATABASE foobar;
USE foobar;
CREATE TABLE users ( id int primary key auto_increment, username varchar(64) unique );
INSERT INTO users (username) VALUES ('admin');
INSERT INTO users (username) VALUES ('user');

CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testuser';
GRANT ALL PRIVILEGES ON foobar.* TO 'testuser'@'localhost';

ALTER USER 'root'@'localhost' IDENTIFIED BY 'abc123';
FLUSH PRIVILEGES;
