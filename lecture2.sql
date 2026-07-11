create DATABASE  if NOT EXISTS schooldb;

CREATE DATABASE IF NOT EXISTS CollegeDB;

USE collegeDB;

CREATE TABLE IF NOT EXISTS Students(
StudentID INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
Branch VARCHAR(50) NOT NULL,
Marks INT ,
City VARCHAR(50),
Backlogs INT DEFAULT 0
);

INSERT INTO Students (name, branch, marks, city, backlogs) VALUES
('Sagar', 'CSE', 85, 'Delhi', 0),
('Sneha', 'CSE', 92, 'Mumbai', 0),
('Yogesh', 'ECE', 78, 'Delhi', 1),
('Amit', 'CSE', 65, 'Bangalore', 2),
('Priya', 'ME', 88, 'Pune', 0),
('Rohit', 'ECE', 45, 'Delhi', 3),
('Nisha', 'CSE', 55, 'Mumbai', 1),
('Vikram', 'EE', 72, 'Bangalore', 0);

select * from Students where Branch='CSE' ;
select name,marks from Students where Marks>80;
select * from students where city= 'delhi' and backlogs=0;


-- both command do the same work
-- this is the use of IN cause
select * from students where city='Mumbai' or city='Pune';
select * from students where city in ('Mumbai','Pune');


-- This is the use of BETWEEN clause
select * from students where marks>50 and marks<80;
select * from students where marks BETWEEN 50 and 80;

select * from students WHERE branch!='CSE';

select name from students where backlogs>=1;



select * from students order by marks DESC;

