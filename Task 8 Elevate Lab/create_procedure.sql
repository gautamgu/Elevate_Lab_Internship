/* -------------------------------------
         CREATE A SAMPLE TABLE
---------------------------------------*/
CREATE DATABASE Task8DB;
USE Task8DB;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO Employees (emp_id, emp_name, department, salary, hire_date) VALUES
(101,'Amit Sharma', 'IT', 55000, '2022-05-10'),
(105,'Riya Verma', 'HR', 38000, '2023-01-12'),
(111,'Mohit Gupta', 'Finance', 60000, '2021-11-20'),
(116,'Sneha Singh', 'IT', 72000, '2020-06-15');

/*-----------------------------------------------------------------
STEP 2: STORED PROCEDURE (with parameters + IF condition)
Procedure Name: GetEmployeeByDept 
-----------------------------------------------------------------*/
CREATE PROCEDURE GetEmployeeByDept
    @deptName VARCHAR(50)
AS
BEGIN
    DECLARE @empCount INT;

    -- Count employees
    SELECT @empCount = COUNT(*)
    FROM Employees
    WHERE department = @deptName;

    -- Conditional logic
    IF @empCount = 0
    BEGIN
        SELECT 'No employees found in department: ' + @deptName AS Message;
    END
    ELSE
    BEGIN
        SELECT *
        FROM Employees
        WHERE department = @deptName;
    END
END;

EXEC GetEmployeeByDept 'IT';
EXEC GetEmployeeByDept 'Marketing';
