CREATE DATABASE books;
CREATE USER books;
CREATE USER 'books'@'localhost' IDENTIFIED BY 'books';
GRANT ALL PRIVILEGES ON books.* TO 'books'@'localhost';

-- FLUSH PRIVILEGES;

-- books DB에 TABLE을 생성하기 위해 DB Open
use books;

CREATE table tbl_user (
	userId varchar(20) PRIMARY KEY,
    password varchar(125),
    userName varchar(30),
    userRolle varchar(10)
)