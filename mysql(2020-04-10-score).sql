-- score DB schema  생성
CREATE DATABASE scoreDB;

-- 사용자 등록
CREATE USER 'score'@'localhost' IDENTIFIED BY 'score';

-- 권한 부여
GRANT ALL PRIVILEGES ON *.* TO 'score'@'localhost';

USE scoreDB;

DROP TABLE tbl_student;
-- tbl_student table 생성
CREATE TABLE tbl_student (
	id bigint  PRIMARY KEY AUTO_INCREMENT,
    st_num varchar(5) UNIQUE,
    st_name varchar(20),
    st_class int,
    st_group int
);
DESC tbl_student;

DROP TABLE tbl_score;
CREATE TABLE tbl_score (
	id bigint  PRIMARY KEY AUTO_INCREMENT,
    s_num varchar(5),
    s_subject varchar(10),
    s_score int,
    UNIQUE KEY(s_num, s_subject)
);

INSERT INTO tbl_student(st_num, st_name, st_class, st_group) VALUES('20001', '홍길동', 1, 1);
INSERT INTO tbl_student(st_num, st_name, st_class, st_group) VALUES('20002', '이몽룡', 1, 1);
INSERT INTO tbl_student(st_num, st_name, st_class, st_group) VALUES('20003', '성춘향', 1, 1);
INSERT INTO tbl_student(st_num, st_name, st_class, st_group) VALUES('20004', '장영실', 1, 1);
INSERT INTO tbl_student(st_num, st_name, st_class, st_group) VALUES('20005', '임꺽정', 1, 1);

INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20001', '국어', 80);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20001', '영어', 60);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20001', '수학', 70);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20001', '과학', 88);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20001', '국사', 76);

INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20002', '국어', 90);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20002', '영어', 70);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20002', '수학', 80);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20002', '과학', 68);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20002', '국사', 56);

INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20003', '국어', 60);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20003', '영어', 70);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20003', '수학', 90);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20003', '과학', 98);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20003', '국사', 66);

INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20004', '국어', 50);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20004', '영어', 80);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20004', '수학', 60);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20004', '과학', 98);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20004', '국사', 56);

INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20005', '국어', 90);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20005', '영어', 90);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20005', '수학', 80);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20005', '과학', 98);
INSERT INTO tbl_score(s_num, s_subject, s_score) VALUES('20005', '국사', 96);

-- pivot
SELECT s_num, st_name,
	SUM(CASE WHEN s_subject = '국어' 
		THEN s_score ELSE 0 END) AS 국어,
	SUM(CASE WHEN s_subject = '영어' 
		THEN s_score ELSE 0 END) AS 영어,
	SUM(CASE WHEN s_subject = '수학' 
		THEN s_score ELSE 0 END) AS 수학,
	SUM(CASE WHEN s_subject = '과학' 
		THEN s_score ELSE 0 END) AS 과학,
	SUM(CASE WHEN s_subject = '국사' 
		THEN s_score ELSE 0 END) AS 국사,
	SUM(s_score) AS 총점,
    AVG(s_score) AS 평균
FROM tbl_score
	LEFT JOIN tbl_student 
		ON tbl_student.st_num = tbl_score.s_num
GROUP BY s_num;

DELETE FROM tbl_users  WHERE id = 3;
SELECT * FROM tbl_student;
SELECT * FROM tbl_score;
COMMIT;
