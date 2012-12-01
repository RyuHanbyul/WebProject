<DB TABLE 생성 정보>

CREATE DATABASE datecourse DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON datecourse.* TO 'datec'@'localhost' IDENTIFIED BY '5713'

use datecourse;

CREATE TABLE users (
id int AUTO_INCREMENT PRIMARY KEY, 
email VARCHAR(100) UNIQUE, 
pwd VARCHAR(255) NOT NULL, 
name VARCHAR(100) NOT NULL, 1
photo_url VARCHAR(255), 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO users (id, email, pwd, name, photo_url) VALUES (1, 'dongseop1@gmail.com', '12345', 'dongseop1', 'a');
INSERT INTO users (id, email, pwd, name, photo_url) VALUES (2, 'dongseop2@gmail.com', '12345', 'dongseop2', 'b');
INSERT INTO users (id, email, pwd, name, photo_url) VALUES (3, 'dongseop3@gmail.com', '12345', 'dongseop3', 'c');
INSERT INTO users (id, email, pwd, name, photo_url) VALUES (4, 'dongseop4@gmail.com', '12345', 'dongseop4', 'd');
INSERT INTO users (id, email, pwd, name, photo_url) VALUES (5, 'dongseop5@gmail.com', '12345', 'dongseop5', 'e');


// 밑에 테이블부터는 꼭 필요하지 않은 이상 건들이지 말 것

CREATE TABLE boards (
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id VARCHAR(100) NOT NULL,
	subject VARCHAR(100) NOT NULL,
	content TEXT NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO boards(id, user_id, subject, content) VALUES (1, 'kj', 'testSubject1', 'testContent1');

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