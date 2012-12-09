<DB TABLE 생성 정보>

CREATE DATABASE datecourse DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON datecourse.* TO 'datec'@'localhost' IDENTIFIED BY '5713'

use datecourse;

CREATE TABLE users (
uid int AUTO_INCREMENT PRIMARY KEY, 
email VARCHAR(100) UNIQUE, 
u_userid VARCHAR(100) NOT NULL,
pwd VARCHAR(255) NOT NULL,
photoUrl VARCHAR(255), 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO users (uid, email, u_userid, pwd, photoUrl) VALUES (1, 'dongseop1@gmail.com', 'ds1', '12345', 'firstid.jpg');
INSERT INTO users (uid, email, u_userid, pwd, photoUrl) VALUES (2, 'dongseop2@gmail.com', 'ds2', '12345', 'firstid.jpg');
INSERT INTO users (uid, email, u_userid, pwd, photoUrl) VALUES (3, 'dongseop3@gmail.com', 'ds3', '12345', 'firstid.jpg');

CREATE TABLE fbusers (
fid int AUTO_INCREMENT PRIMARY KEY, 
fb_id VARCHAR(100) UNIQUE, 
f_userid VARCHAR(100) NOT NULL,
pwd VARCHAR(255) NOT NULL,
photo_url VARCHAR(255), 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO fbusers (fid, fb_id, f_userid, pwd, photo_url) VALUES (1, '1', 'dongseop3', '12345', 'firstid.jpg');
INSERT INTO fbusers (fid, fb_id, f_userid, pwd, photo_url) VALUES (2, '2', 'dongseop4', '12345', 'firstid.jpg');
INSERT INTO fbusers (fid, fb_id, f_userid, pwd, photo_url) VALUES (3, '3', 'dongseop5', '12345', 'firstid.jpg');

CREATE TABLE boards (
	sid INT AUTO_INCREMENT PRIMARY KEY,
	s_userid VARCHAR(100) NOT NULL,
	category VARCHAR(100),
	subject VARCHAR(100) NOT NULL,
	content TEXT NOT NULL,
	spot VARCHAR(5000),
	image VARCHAR(8000),
	pin_count INT DEFAULT 0,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO boards(sid, user_id, category, subject, content) VALUES (1, 'kj', 'seoul', 'testSubject1', 'testContent1');

CREATE TABLE pin (
user_id VARCHAR(100) NOT NULL, 
post_id int(10) NOT NULL, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

alter table pin add PRIMARY KEY(user_id, post_id);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE photo (
id int AUTO_INCREMENT PRIMARY KEY,  
photo_url VARCHAR(255) NOT NULL, 
post_id int(10) NOT NULL, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE spot (
id int AUTO_INCREMENT PRIMARY KEY, 
post_id int(10) NOT NULL,
icon VARCHAR(20) NOT NULL,
latitude float(20,18) NOT NULL, 
longitude float(20,18) NOT NULL);

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

alter table like add PRIMARY KEY(user_id, post_id);