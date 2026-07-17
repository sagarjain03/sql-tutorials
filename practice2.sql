use CompanyDB;

-- Count employees in each department.
select
    department_id,
    count(*) as total_employees
from employees
GROUP BY
    department_id;
-- Find the total salary of each department.
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY
    department_id;
-- Find the average salary of each department.
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY
    department_id;
-- Find the highest salary in each department.

SELECT department_id, MAX(salary) AS maximum_salary
FROM employees
GROUP BY
    department_id;
-- Find the lowest salary in each department.
SELECT department_id, MIN(salary) AS minimum_salary
FROM employees
GROUP BY
    department_id;

-- Count employees by gender.
SELECT gender, COUNT(*) AS employee_count
FROM employees
GROUP BY gender;
-- Find the average salary by gender.
SELECT gender, AVG(salary) AS average_salary
FROM employees
GROUP BY gender;
-- Count employees in each department according to gender.
SELECT department_id,gender, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id, gender;
-- Find the total salary of each gender in every department.
SELECT department_id,gender, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id, gender;
-- Find the highest salary for each gender.
SELECT gender, MAX(salary) AS maximum_salary
FROM employees
GROUP BY department_id, gender;

-- Display employee names along with their department names.
select e.employee_name,d.department_name from employees e INNER JOIN departments d on e.department_id = d.department_id;

-- Display employee names and their project names.
SELECT e.employee_name, p.project_name from employees e INNER JOIN projects p on p.employee_id=e.employee_id;

-- Display employee name, department name, and salary.

select e.employee_name,d.department_name,e.salary  from employees e INNER JOIN departments d on e.department_id = d.department_id;

-- Display employee name, department name, and project name.

select e.employee_name,d.department_name,p.project_name from employees e INNER JOIN departments d on e.department_id = d.department_id INNER JOIN projects p on e.employee_id=p.employee_id;

-- Display employees working in the IT department.

SELECT e.employee_name, d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id
WHERE d.department_name='IT';

-- Display employees earning more than 60000 along with their department names.

SELECT e.employee_name, d. department_name, e. salary
FROM Employees e
JOIN Departments d
ON e.department_id = d.department_id
WHERE salary>60000

-- Count the number of employees in each department.    

SELECT department_id, COUNT(*) AS employee_count
FROM Employees
GROUP BY department_id;