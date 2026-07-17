CREATE DATABASE CompanyDB;

use CompanyDB;

CREATE TABLE Departments(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE Employees(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    salary DECIMAL(10,2),
    hire_date DATE,
    department_id INT,

    FOREIGN KEY(department_id)
    REFERENCES Departments(department_id)
);


CREATE TABLE Projects(
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    employee_id INT,

    FOREIGN KEY(employee_id)
    REFERENCES Employees(employee_id)
);


INSERT INTO Departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Marketing'),
(5,'Sales');

INSERT INTO Employees VALUES
(101,'Amit',25,'Male',45000,'2022-01-10',2),
(102,'Priya',28,'Female',52000,'2021-05-14',1),
(103,'Rahul',30,'Male',70000,'2020-03-25',2),
(104,'Sneha',26,'Female',48000,'2023-02-15',4),
(105,'Arjun',35,'Male',85000,'2019-09-11',3),
(106,'Neha',27,'Female',60000,'2021-11-20',5),
(107,'Karan',31,'Male',75000,'2020-07-17',2),
(108,'Riya',24,'Female',42000,'2023-06-05',1),
(109,'Vikas',29,'Male',55000,'2022-04-01',5),
(110,'Anjali',32,'Female',90000,'2018-08-18',3);


INSERT INTO Projects VALUES
(1,'Payroll System',102),
(2,'E-Commerce Website',101),
(3,'Banking Software',103),
(4,'Marketing Campaign',104),
(5,'Finance Dashboard',105),
(6,'CRM System',106),
(7,'Mobile App',107),
(8,'HR Portal',108),
(9,'Sales Tracker',109),
(10,'AI Chatbot',103),
(11,'Inventory System',101);


-- Display all employee details.

select * from Employees;

-- Display employee names only.
select employee_name from Employees;

-- Display employee name and salary.

select employee_name , salary from Employees;

-- Display unique department IDs.
select DISTINCT employee_id from employees;

-- Display employees having salary greater than 60000.

select salary from Employees where salary>60000;

-- Display employees whose age is less than 28.

select * from Employees where age<28;

-- Display employees working in department 2.

SELECT * FROM Employees WHERE department_id = 2;

-- Display employees hired after 2021.

select * from Employees WHERE hire_date>'2021-12-31';

-- Display employees whose name starts with 'A'.

select * from employees where employee_name like 'A%';

-- Display employees whose name ends with 'a'.

select * from employees where employee_name like '%A';

-- Display employees whose salary is greater than 50,000 AND age is less than 30.

select * from employees where salary>50000 and age<30;

-- Display employees who belong to department 1 OR department 3.

select * from employees where department_id=1 or department_id=3;

-- Display employees whose age is between 25 and 30.

-- select * from employees where age>25 and age<30;

-- alternate
select * from employees where age BETWEEN 25 and 30;

-- NOTES - between k andar 25 and 30 dono included hote hai

-- Display employees working in departments 1, 3 and 5.

select * from employees where department_id in (1,3,5);


-- Display employees NOT working in department 2.

select * from employees where department_id!=2;

-- Display employees whose salary is NOT between 45,000 and 70,000.

select * from employees where salary not BETWEEN 45000 and 70000;

-- Display employees whose name contains ar.

select * from employees where employee_name like '%ar%';

-- Display employees whose second letter is r.
select * from employees where employee_name like '_r%';

-- Display employees hired between 2020-01-01 and 2022-12-31.

SELECT * FROM Employees WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31';

-- Display employees whose salary is greater than 50,000 AND belong to department 2 or 3.

SELECT * FROM Employees WHERE salary > 50000 AND department_id IN (2,3);

-- Display all employees sorted by salary in ascending order.

SELECT * FROM Employees ORDER BY salary ASC;

-- Display employee names and salaries sorted by employee name alphabetically.

SELECT employee_name, salary FROM Employees ORDER BY employee_name ;

-- Display employees sorted by age (youngest first).

SELECT * FROM Employees ORDER BY age;

-- Display the first 5 employees.

select * from employees LIMIT 5;

-- Display the top 3 highest-paid employees.

SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 3;

-- Count employees hired after 2021.

SELECT COUNT(*)
FROM employees 
WHERE hire_date>'2021-12-31';

-- Find the total salary of employees earning more than 50000.
SELECT  SUM(salary)
FROM employees
WHERE salary>50000;

-- Find the average salary of department 2.

SELECT  AVG(salary)
FROM employees
WHERE department_id=2;

-- Find the most recent hiring date.
//very well done
SELECT  hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 1;


select max(hire_date) from employees;


-- Find the earliest hire date.

SELECT  hire_date
FROM employees
ORDER BY hire_date ASC
LIMIT 1;

select min(hire_date) from employees;








use CompanyDB;