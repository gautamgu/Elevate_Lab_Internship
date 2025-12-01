/* -------------------------------------
         CREATE A SAMPLE TABLE
---------------------------------------*/

USE Task8DB;

select * from Employees
/*-----------------------------------------------------------------
STEP 3: SQL FUNCTION (with RETURN value)
 Function Name: CalculateBonus
 Return bonus amount based on salary.

Formula:
If salary < 40000 → 10% bonus  
If salary 40000-70000 → 15% bonus  
If salary > 70000 → 20%
-----------------------------------------------------------------*/
CREATE FUNCTION CalculateBonus (@salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @bonus DECIMAL(10,2);

    SET @bonus =
        CASE 
            WHEN @salary < 40000 THEN @salary * 0.10
            WHEN @salary BETWEEN 40000 AND 70000 THEN @salary * 0.15
            ELSE @salary * 0.20
        END;

    RETURN @bonus;
END;

SELECT emp_name, salary, dbo.CalculateBonus(salary) AS Bonus
FROM Employees;

/*-----------------------------------------------------------------
STEP 4: Extra — Another Useful Stored Procedure (INSERT Operation)
-----------------------------------------------------------------*/
CREATE PROCEDURE AddEmployee
    @nameInput VARCHAR(100),
    @deptInput VARCHAR(50),
    @salInput DECIMAL(10,2),
    @hireInput DATE
AS
BEGIN
    INSERT INTO Employees (emp_name, department, salary, hire_date)
    VALUES (@nameInput, @deptInput, @salInput, @hireInput);

    SELECT 'Employee Added Successfully!' AS Message;
END;

EXEC AddEmployee 
    @nameInput = 'Raj Kumar',
    @deptInput = 'HR',
    @salInput = 45000,
    @hireInput = '2024-02-10';

