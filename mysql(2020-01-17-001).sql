-- mysql 설치위치 주소
-- C:\ProgramData\MySQL\MySQL Server 8.0\Data\
show variables like 'datadir';

-- mysql에서는 사용자 등록할 때 접속경로를 설정
-- iouser는 localhost에서만 접속할 수 있다.
-- 본인의 컴퓨터, 현재 접속하는 서버에서만 접근 가능
-- 그래서 이 4가지를 같이 해줘야 원격 접속이 서로 가능
create user 'iouser'@'localhost' identified by '1234'; -- 1
grant all privileges on *.* to 'iouser'@'%'; -- 2

-- iouser는 모든 곳에서 원격, 로컬로 접속할 수 있다.
create user 'iouser'@'%' identified by '1234'; -- 3
grant all privileges on *.* to 'iouser'@'%'; -- 4
-- DBA 권한

-- IP 대역이 192.168.*.*에서만 접속허가
create user 'iouser'@'192.168.%' identified by '1234';
grant all privileges on *.* to 'iouser'@'192.168.%';

-- 2020-01-21
-- 새로운 사용자 등록하고 권한 부여
create user 'ems'@'localhost' identified by 'ems'; -- 1
grant all privileges on *.* to 'ems'@'localhost'; -- 2

-- ems는 모든 곳에서 원격, 로컬로 접속할 수 있다.
create user 'ems'@'%' identified by 'ems'; -- 3
grant all privileges on *.* to 'iouser'@'%'; -- 4

-- 
create DaTABASE emsDB;
USE emsDB;
SHOW TAbLES;
desc tbl_ems;