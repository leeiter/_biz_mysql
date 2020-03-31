USE emsDB;

CREATE TABLE tbl_friend (
	f_seq BIGINT PRIMARY KEY AUTO_INCREMENT,
    f_name VARCHAR(20) NOT NULL,
    f_tel VARCHAR(20) NOT NULL,
    f_addr VARCHAR(125),
    f_hobby VARCHAR(125),
    f_rel VARCHAR(125)
);

SELECT * FROM tbl_friend;