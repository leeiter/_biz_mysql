-- secure DB schema  생성
CREATE DATABASE secur;

-- 사용자 등록
CREATE USER 'secur'@'localhost' IDENTIFIED BY 'secur';

-- 권한 부여
GRANT ALL PRIVILEGES ON *.* TO 'secur'@'localhost';

SELECT username, password, enabled
FROM users WHERE username=?;

USE secur;

-- users table 생성
CREATE TABLE users(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50) ,
    password VARCHAR(125),
    enabled BOOLEAN
);

-- DROP TABLE tbl_users;
CREATE TABLE tbl_users(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(50) ,
    user_pass VARCHAR(125),
    enabled BOOLEAN
);

-- DROP TABLE authorities;
CREATE TABLE authorities(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50),
	authority VARCHAR(50)
);
