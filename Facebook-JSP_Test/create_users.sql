<DB TABLE 생성 정보>
CREATE DATABASE datecourse DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON datecourse.* TO 'datec'@'localhost' IDENTIFIED BY '5713'

use datecourse;

CREATE TABLE users (
id int AUTO_INCREMENT PRIMARY KEY, 
email VARCHAR(100) UNIQUE, 
userid VARCHAR(100),
pwd VARCHAR(255) NOT NULL,
photo_url VARCHAR(255), 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO users (id, email, userid, pwd, photo_url) VALUES (1, 'dongseop1@gmail.com', 'ds1', '12345', 'a');
INSERT INTO users (id, email, userid, pwd, photo_url) VALUES (2, 'dongseop2@gmail.com', 'ds2', '12345', 'b');
INSERT INTO users (id, email, userid, pwd, photo_url) VALUES (3, 'dongseop3@gmail.com', 'ds3', '12345', 'c');

CREATE TABLE fbusers (
id int AUTO_INCREMENT PRIMARY KEY, 
fb_id int(20) UNIQUE, 
userid VARCHAR(100),
pwd VARCHAR(255) NOT NULL,
photo_url VARCHAR(255), 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO fbusers (id, fb_id, userid, pwd, photo_url) VALUES (1, '1', 'dongseop3', '12345', 'c');
INSERT INTO fbusers (id, fb_id, userid, pwd, photo_url) VALUES (2, '2', 'dongseop4', '12345', 'd');
INSERT INTO fbusers (id, fb_id, userid, pwd, photo_url) VALUES (3, '3', 'dongseop5', '12345', 'e');

---------------------------------------------------------------------------------------------------------------------------------------------

// 밑에 테이블부터는 꼭 필요하지 않은 이상 건들이지 말 것


CREATE TABLE post (
id int AUTO_INCREMENT PRIMARY KEY, 
user_id int(10) NOT NULL, 
category_id int(10), 
content TEXT, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE photo (
id int AUTO_INCREMENT PRIMARY KEY,  
photo_url VARCHAR(255) NOT NULL, 
post_id int(10) NOT NULL, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE spot (
id int AUTO_INCREMENT PRIMARY KEY, 
post_id int(10) NOT NULL, 
latitude float(20,18) NOT NULL, 
longitude float(20,18) NOT NULL, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE reply (
id int AUTO_INCREMENT PRIMARY KEY,  
user_id int(10) NOT NULL, 
post_id int(10) NOT NULL, 
content TEXT, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE likes (
user_id int(10) NOT NULL, 
post_id int(10) NOT NULL, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

alter table likes add PRIMARY KEY(user_id, post_id);

CREATE TABLE pin (
user_id int(10) NOT NULL, 
post_id int(10) NOT NULL, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

alter table pin add PRIMARY KEY(user_id, post_id);