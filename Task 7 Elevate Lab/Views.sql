/*-------------------------------------
SHREE TECHNOLOGY PVT LTD
--------------------------------------*/
CREATE DATABASE ShreeTechnologyDB;
USE ShreeTechnologyDB;

--------CREATE TABLE----------------------
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    department VARCHAR(50),
    location VARCHAR(50)
);
------------INSERT COMMAND-------------------------
INSERT INTO Employees VALUES
(1, 'Amit Sharma', 'IT', 55000, '2020-03-10'),
(2, 'Reena Patel', 'HR', 45000, '2021-05-12'),
(3, 'John Paul', 'Tester', 70000, '2019-08-22'),
(4, 'Kavita Rao', 'IT', 60000, '2022-01-11'),
(5, 'Raj Mehta', 'Support', 50000, '2020-10-05');

INSERT INTO Departments VALUES
(101, 'IT', 'Delhi'),
(102, 'HR', 'Mumbai'),
(103, 'Finance', 'Delhi'),
(104, 'Marketing', 'Bangalore');

-------------SELECT COMMAND-------------------------
select * from Employees
select * from Departments

/*
---------------CREATE VIEW --------------------------
*/
CREATE VIEW IT_Employees AS
SELECT emp_id, name, salary
FROM Employees
WHERE department = 'IT';

CREATE VIEW Employee_Department_View AS
SELECT e.emp_id, e.name, e.department, d.location, e.salary
FROM Employees e
JOIN Departments d
ON e.department = d.department;

CREATE VIEW Salary_With_Tax AS
SELECT emp_id, name, salary,
       salary * 0.10 AS tax_amount
FROM Employees;

CREATE VIEW High_Salary_View AS
SELECT *
FROM Employees
WHERE salary > 55000
WITH CHECK OPTION;

CREATE VIEW Avg_Salary_Department AS
SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department;

/*----------USING VIEW-------------------*/
SELECT * FROM IT_Employees;
SELECT * FROM Employee_Department_View;

UPDATE IT_Employees
SET salary = 62000
WHERE emp_id = 1;

INSERT INTO IT_Employees (emp_id, name, salary)
VALUES (6, 'Neha Singh', 58000);

DROP VIEW IT_Employees;

