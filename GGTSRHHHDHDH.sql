sudo mysql -u root -p /*Starting the database*/

create database newdb; /*Optional (If the database is already created)*/
USE newdb;
CREATE TABLE student(
	id INT Primary Key,
	name VARCHAR(50),
	age INT not null
);
DESC student;
INSERT INTO student(id,name,age) values(8,'Sagnik',20);
INSERT INTO student(id,name,age) values(15,'Amiyo',30);
INSERT INTO student(id,name,age) values(87,'Srijita',23);
SELECT * FROM student;
SHOW DATABASES; /*Listing the names of the databases*/
DROP TABLE student;
