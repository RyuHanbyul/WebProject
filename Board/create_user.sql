<DB TABLE 생성 정보>

CREATE DATABASE datecourse DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON datecourse.* TO 'datec'@'localhost' IDENTIFIED BY '5713'

use datecourse;

CREATE TABLE users (
id int AUTO_INCREMENT PRIMARY KEY, 
email VARCHAR(100) UNIQUE, 
userid VARCHAR(100) NOT NULL,
pwd VARCHAR(255) NOT NULL,
photoUrl VARCHAR(255), 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO users (id, email, userid, pwd, photoUrl) VALUES (1, 'dongseop1@gmail.com', 'ds11', '12345', 'NULL');
INSERT INTO users (id, email, userid, pwd, photoUrl) VALUES (2, 'dongseop2@gmail.com', 'ds22', '12345', 'NULL');
INSERT INTO users (id, email, userid, pwd, photoUrl) VALUES (3, 'dongseop3@gmail.com', 'ds33', '12345', 'NULL');

CREATE TABLE fbusers (
id int AUTO_INCREMENT PRIMARY KEY, 
fb_id VARCHAR(100) UNIQUE, 
userid VARCHAR(100) NOT NULL,
pwd VARCHAR(255) NOT NULL,
photo_url VARCHAR(255), 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO fbusers (id, fb_id, userid, pwd, photo_url) VALUES (1, '1', 'dongseop3', '12345', 'NULL');
INSERT INTO fbusers (id, fb_id, userid, pwd, photo_url) VALUES (2, '2', 'dongseop4', '12345', 'NULL');
INSERT INTO fbusers (id, fb_id, userid, pwd, photo_url) VALUES (3, '3', 'dongseop5', '12345', 'NULL');


// 밑에 테이블부터는 꼭 필요하지 않은 이상 건들이지 말 것

CREATE TABLE boards (
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id VARCHAR(100) NOT NULL,
	category VARCHAR(100),
	subject VARCHAR(100) NOT NULL,
	content TEXT NOT NULL,
	spot VARCHAR(5000),
	image VARCHAR(5000),
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO boards(id, user_id, category, subject, content) VALUES (1, 'kj', 'seoul', 'testSubject1', 'testContent1');

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

CREATE TABLE pin (
user_id int(10) NOT NULL, 
post_id int(10) NOT NULL, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

alter table pin add PRIMARY KEY(user_id, post_id);