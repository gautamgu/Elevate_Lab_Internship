create database store;
use store;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    age INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

/* ---------------------------
   2. INSERT DATA
--------------------------- */
INSERT INTO Customers VALUES
(1,'Aarav','Delhi',25),
(2,'Riya','Mumbai',30),
(3,'Kabir','Delhi',35),
(4,'Anita','Pune',28),
(5,'Mohit','Chennai',40);

INSERT INTO Orders VALUES
(101,1,5000,'2024-01-12'),
(102,1,10000,'2024-02-12'),
(103,2,15000,'2024-03-21'),
(104,3,8000,'2024-04-01'),
(105,4,12000,'2024-05-05'),
(106,5,7000,'2024-06-08');

/* -------------------------------------------------------
   3. SUBQUERIES IN WHERE CLAUSE
------------------------------------------------------- */

-- Q1 Customers who placed orders above average order amount
SELECT name
FROM Customers
WHERE customer_id IN (
   SELECT customer_id
   FROM Orders
   WHERE amount > (SELECT AVG(amount) FROM Orders)
);

-- Q2 Customers who never placed orders
SELECT name
FROM Customers
WHERE customer_id NOT IN (SELECT customer_id FROM Orders);

-- Q3 Customers older than average age
SELECT name
FROM Customers
WHERE age > (SELECT AVG(age) FROM Customers);

-- Q4 Customers who placed an order of more than 10,000
SELECT name
FROM Customers
WHERE customer_id IN (
   SELECT customer_id 
   FROM Orders 
   WHERE amount > 10000
);


/* -------------------------------------------------------
   4. SUBQUERIES IN SELECT CLAUSE
------------------------------------------------------- */

-- Q5 Each customer with total spent
SELECT 
    name,
    (SELECT SUM(amount) 
     FROM Orders o 
     WHERE o.customer_id = c.customer_id) AS total_spent
FROM Customers c;

-- Q6 Each customer’s maximum order amount
SELECT 
    name,
    (SELECT MAX(amount)
     FROM Orders o
     WHERE o.customer_id = c.customer_id) AS max_order
FROM Customers c;


/* -------------------------------------------------------
   5. SUBQUERIES IN FROM CLAUSE (DERIVED TABLE)
------------------------------------------------------- */

-- Q7 Customers whose total spending is > 10,000
SELECT name, total_spent
FROM (
    SELECT c.name, SUM(o.amount) AS total_spent
    FROM Customers c 
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.name
) AS t
WHERE total_spent > 10000;

-- Q8 Ranking customers by total spending
SELECT name, total_spent, 
       RANK() OVER (ORDER BY total_spent DESC) AS ranking
FROM (
    SELECT c.name, SUM(o.amount) AS total_spent
    FROM Customers c 
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.name
) AS t;


/* -------------------------------------------------------
   6. EXISTS & NOT EXISTS
------------------------------------------------------- */

-- Q9 Customers who placed at least one order
SELECT name
FROM Customers c
WHERE EXISTS (
    SELECT 1 FROM Orders o 
    WHERE o.customer_id = c.customer_id
);

-- Q10 Customers with no orders
SELECT name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o 
    WHERE o.customer_id = c.customer_id
);


/* -------------------------------------------------------
   7. CORRELATED SUBQUERIES
------------------------------------------------------- */

-- Q11 Orders greater than customer's average order
SELECT c.name, o.amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.amount > (
    SELECT AVG(amount)
    FROM Orders o2
    WHERE o2.customer_id = c.customer_id
);

-- Q12 Max order > average order amount of customers in same city
SELECT name
FROM Customers c
WHERE (
    SELECT MAX(amount) 
    FROM Orders o 
    WHERE o.customer_id = c.customer_id
) > (
    SELECT AVG(o.amount) 
    FROM Orders o
    JOIN Customers c2 ON o.customer_id = c2.customer_id
    WHERE c2.city = c.city
);


/* -------------------------------------------------------
   8. USING ANY & ALL
------------------------------------------------------- */

-- Q13 Order > ANY order from Delhi customers
SELECT name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM Orders
    WHERE amount > ANY (
        SELECT amount FROM Orders o2
        JOIN Customers c2 ON o2.customer_id = c2.customer_id
        WHERE c2.city = 'Delhi'
    )
);

-- Q14 Order > ALL orders from Mumbai customers
SELECT DISTINCT name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM Orders
    WHERE amount > ALL (
        SELECT amount FROM Orders o2
        JOIN Customers c2 ON o2.customer_id = c2.customer_id
        WHERE c2.city = 'Mumbai'
    )
);


/* -------------------------------------------------------
   9. SUBQUERIES WITH HAVING
------------------------------------------------------- */

-- Q15 Customers with total spending > avg spending of all customers
SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING SUM(amount) > (
    SELECT AVG(total_amt)
    FROM (
        SELECT customer_id, SUM(amount) AS total_amt
        FROM Orders
        GROUP BY customer_id
    ) AS t
);


/* -------------------------------------------------------
  10. UPDATE & DELETE USING SUBQUERIES
------------------------------------------------------- */

-- Q16 Update city to 'VIP City' if spending > 10,000
UPDATE Customers
SET city = 'VIP City'
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING SUM(amount) > 10000
);

-- Q17 Delete orders of customers older than average age
DELETE FROM Orders
WHERE customer_id IN (
    SELECT customer_id
    FROM Customers
    WHERE age > (SELECT AVG(age) FROM Customers)
);


/* -------------------------------------------------------
   11. ADVANCED INTERVIEW STYLE SUBQUERIES
------------------------------------------------------- */

-- Q18 Third highest order amount
SELECT amount
FROM Orders o
WHERE 2 = (
    SELECT COUNT(DISTINCT amount) 
    FROM Orders 
    WHERE amount > o.amount
);

-- Q19 Latest order for each customer
SELECT *
FROM Orders o
WHERE order_date = (
    SELECT MAX(order_date)
    FROM Orders o2
    WHERE o2.customer_id = o.customer_id
);

-- Q20 Customers with exactly 2 orders
SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) = 2;
