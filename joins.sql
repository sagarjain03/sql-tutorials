CREATE DATABASE TechAcademy;



USE TechAcademy;


-- creating a table named as user

CREATE TABLE users(
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
)


CREATE TABLE Subscription(
    sub_id INT PRIMARY KEY,
    user_id INT,
    plan_name VARCHAR(50),
    monthly_fee VARCHAR(50)
)




-- Insert Mock Data
INSERT INTO users VALUES 
(1, 'Sagar', 'India'),
(2, 'Sneha', 'India'),
(3, 'Yogesh', 'US'),
(4, 'Amit', 'UK'),
(6, 'Rahul', 'India'); 



INSERT INTO subscription VALUES 
(101, 1, 'Basic Dev Plan', 499),
(102, 1, 'Cloud Architect', 1999), 
(103, 2, 'Data Science Pro', 999),
(104, 3, 'DevOps Mastery', 1499),
(105, 5, 'Cyber Security', 2499);   

-- this is inner join - if you don't match both sides ,you get dropped

select u.user_id,u.name,s.plan_name,s.monthly_fee from users u INNER JOIN subscription s ON u.user_id=s.user_id;


SELECT u.name ,u.country,s.plan_name from users u LEFT JOIN subscription s ON u.user_id=s.user_id;


SELECT u.name ,u.country,s.plan_name from users u RIGHT JOIN subscription s ON u.user_id=s.user_id;


select u.user_id as user_table_id ,u.name,s.plan_name from users  u LEFT JOIN subscription s ON u.user_id=s.user_id 
UNION
select u.user_id as user_table_id ,u.name,s.plan_name from users  u LEFT JOIN subscription s ON u.user_id=s.user_id 







select u.name ,s.plan_name,u.country ,s.monthly_fee from users u CROSS JOIN subscription s;