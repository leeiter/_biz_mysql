USE emsDB;

INSERT INTO users (username, password, enabled)
VALUE('admin', '{noop}admain', true);

INSERT INTO users (username, password, enabled)
VALUE('user', '{noop}user', true);

INSERT INTO authorities(username, authority)
VALUE('admin', 'ROLE_ADMIN');

INSERT INTO authorities(username, authority)
VALUE('user', 'ROLE_USER');

SELECT * FROM users;
SELECT * FROM authorities;

COMMIT;

DELETE FROM authorities WHERE seq = 2;

DELETE FROM users WHERE username = 'admin';
DELETE FROM users WHERE username = 'user';
DELETE FROM users WHERE username = 'users';

DELETE FROM authorities WHERE seq = 3;
DELETE FROM authorities WHERE seq = 4;
DELETE FROM authorities WHERE seq = 5;

SELECT * FROM tbl_product;