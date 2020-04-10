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

-- 2020-04-10 변경
-- tbl_users 테이블 변경
-- user_name 칼럼 UNIQUE로 변경
-- DROP TABLE tbl_users;
CREATE TABLE tbl_users(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	user_name VARCHAR(50) UNIQUE,
    user_pass VARCHAR(125),
    enabled BOOLEAN
);

-- 로그인한 User의 권한들을 보관할 TABLE
-- DROP TABLE authorities;
CREATE TABLE authorities(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(50),
	authority VARCHAR(50)
);

DELETE FROM tbl_users  WHERE id = 3;
SELECT * FROM tbl_users;
COMMIT;
