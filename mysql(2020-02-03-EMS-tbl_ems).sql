-- root 계정을 비밀번호 분실 했을 때
-- 기존에 등록된 다른 id로 로그인하여 수행
-- 단 다른 id의 grant all 로 지정되어 있어야 한다.

-- mysql 설치 후에 새로운 사용자를 등록하고
-- greant를 all로 설언하여 생성해 두자!!!

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'aa1234';

-- UTF-8
USE emsdb;
DROP TABLE tbl_ems;
DROP TABLE tbl_bbs;

CREATE TABLE tbl_bbs (
	BBS_ID	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	BBS_P_ID	BIGINT	DEFAULT 0,
	BBS_WRITER	VARCHAR(50)	NOT NULL,
	BBS_DATE	VARCHAR(10),
	BBS_TIME	VARCHAR(10),
	BBS_SUBJECT	VARCHAR(125),
	BBS_CONTENT	VARCHAR(1000),
	BBS_COUNT	INT	DEFAULT 0
); -- CHARSET utf8mb4;

-- mysql8에서는 기본 문자열 인코딩이 utf8mb4 방식으로
-- 설정되어 varchar type의 칼럼에 문자열을 저장하면
-- 영문, 숫자 등은 1개가 1byte, 기타 다국어는 1~4byte까지
-- 자동 가면형으로 저장이 된다.
-- BBS_WRITER	VARCHAR(3) 인 경우	
INSERT INTO tbl_bbs(bbs_wirter) VALUES('대한민');
INSERT INTO tbl_bbs(bbs_wirter) VALUES('대한민국'); -- 오류
INSERT INTO tbl_bbs(bbs_wirter) VALUES('123');
INSERT INTO tbl_bbs(bbs_wirter) VALUES('1234'); -- 오류

-- mysql에서 현재 database schema가 어떤 encoding인지 확인
SHOW SESSION VARIABLES LIKE 'collation_connection';

-- mysql 5.x 이하에서는 UTF-8과 latin1 방식으로 설정되어
-- 많은 문제를 일으켰다.
-- mysql 5.x 이하의 UTF-8은 3byte 방식 가변문자열로
-- Emogii와 같은 특수문자는 인식하지 못한다.

CREATE TABLE tbl_menu (
	MENU_ID	VARCHAR(3)	NOT NULL	PRIMARY KEY,
	MENU_P_ID	VARCHAR(3),
	MENU_TITLE	VARCHAR(10)	NOT NULL,
	MENU_HREF	VARCHAR(125)
);

INSERT INTO `emsdb`.`tbl_menu`
VALUES ('M01', NULL, 'HOME', '/');

INSERT INTO `emsdb`.`tbl_menu`
VALUES ('M02', NULL, '관리자', '#');

INSERT INTO `emsdb`.`tbl_menu`
VALUES ('M03', 'M02', '로그인', '#');

INSERT INTO `emsdb`.`tbl_menu`
VALUES ('M04', 'M02', '회원가입', '#');

INSERT INTO `emsdb`.`tbl_menu`
VALUES ('M05', 'M02', '게시판정리', '#');

select * from tbl_menu;

UPDATE tbl_menu
SET menu_p_id = NULL
WHERE menu_id IN ('M01', 'M02');