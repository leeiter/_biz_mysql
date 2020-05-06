-- 새로운 데이터 베이스 생성
CREATE DATABASE spBoot;

USE spBoot;

DESC tbl_users;
-- DROP TABLE tbl_users;
-- DROP TABLE hibernate_sequence;

SELECT * FROM tbl_users;
SELECT * FROM tbl_roles;

SELECT * FROM tbl_books;

DELETE FROM tbl_users WHERE id = 2;

DROP TABLE tbl_users;

DROP TABLE tbl_roles;


alter table tbl_users 
       add constraint UK_c190nfu2w5xwvexf9dv08grsq unique (username);
       
alter table tbl_roles 
       drop 
       foreign key FKqrp2qf5p62y0bb7fh8mru3n5a;


   drop table if exists tbl_users;       
 create table tbl_users (
       id bigint not null auto_increment,
        account_non_expired bit not null,
        account_non_locked bit not null,
        address varchar(255),
        credentials_non_expired bit not null,
        email varchar(255),
        enabled bit not null,
        password varchar(255),
        phone varchar(255),
        username varchar(64),
        primary key (id)
    ) engine=InnoDB;
    
    drop table if exists tbl_users;
    
    
    INSERT INTO tbl_roles (username, role_name)
    VALUES('admin', 'ROLE_ADMIN');
    
    
    INSERT INTO tbl_roles (username, role_name)
    VALUES('admin', 'USER');
    
    
    DELETE FROM tbl_bbs;
    
    
    SELECT * FROM tbl_bbs;