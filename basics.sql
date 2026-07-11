create database schoolDB;
use schoolDB;

CREATE TABLE Students(
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) ,
Age INT NOT NULL,
GPA DECIMAL(3,2),
EnrollmentDate DATE DEFAULT (CURRENT_DATE)
);

DESCRIBE Students;

INSERT INTO Students (StudentID,FirstName,LastName,Age,GPA) 
VALUES
(102,"Leena",NULL,21,9),
(103,"Ram","Chandra",17,9.5);

select * from Students where age=21;


