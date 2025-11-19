--------SELECT------------------
select * from Customers
select * from Categories
select * from Orders
select * from OrderItems
select * from Products
select * from Payments

--------WHERE-------------------

SELECT * FROM Products WHERE price > 10000;
SELECT * FROM Customers WHERE address LIKE '%Delhi%';
SELECT * FROM Orders WHERE total_amount < 500;
SELECT * FROM Products WHERE product_name LIKE 'S%';
SELECT * FROM Orders WHERE order_id =205;
SELECT * FROM Payments WHERE payment_method = 'Cash'; 

-------BETWEEN,OR,LIKE,AND------------------

SELECT * FROM Orders 
WHERE order_date BETWEEN '2025-01-01' AND '2025-02-11';

SELECT * FROM Customers WHERE phone LIKE '98%';

SELECT * FROM Products 
WHERE price BETWEEN 500 AND 1500;

SELECT * FROM Products WHERE category_id IN (1, 2);

SELECT * FROM Products 
WHERE stock BETWEEN 10 AND 100;

SELECT * FROM Products 
WHERE product_name LIKE '%phone%';

SELECT * FROM Customers 
WHERE email LIKE '%gmail%';

SELECT * FROM Products 
WHERE product_name LIKE '_a%';

SELECT * FROM Products 
WHERE price > 500 AND stock > 50;

SELECT * FROM Customers 
WHERE address LIKE '%Delhi%' OR address LIKE '%Mumbai%';

SELECT * FROM Products
WHERE category_id = 1 OR price < 200;

SELECT * FROM Customers
WHERE email LIKE '%.com' 
AND name LIKE 'A%';

SELECT * FROM Products 
WHERE NOT category_id = 1;

SELECT * FROM Customers 
WHERE (address LIKE '%Delhi%' OR address LIKE '%Noida%')
AND NOT email LIKE '%gmail%';

SELECT * FROM Products
WHERE (price > 500 OR product_name LIKE '%X')
AND NOT category_id = 2;

