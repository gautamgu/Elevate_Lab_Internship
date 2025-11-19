--------SELECT------------------
select * from Customers
select * from Categories
select * from Orders
select * from OrderItems
select * from Products
select * from Payments

----AGGREGATE FUNCTION ON NUMERIC-----
SELECT COUNT(*) AS total_customers FROM Customers;
SELECT COUNT(*) AS total_products FROM Products;
SELECT category_id, COUNT(*) AS product_count FROM Products GROUP BY category_id;

SELECT AVG(price) AS average_price FROM Products;
SELECT MAX(price) AS max_price FROM Products;
SELECT MIN(price) AS min_price FROM Products;
SELECT SUM(stock) AS total_stock FROM Products;

SELECT AVG(total_amount) AS average_order_amount FROM Orders;
SELECT COUNT(order_id) AS total_orders FROM Orders;
SELECT SUM(amount) AS total_payments FROM Payments;
SELECT AVG(amount) AS average_payment FROM Payments;
SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM Orders;
SELECT ROUND(AVG(price), 2) AS rounded_avg_price FROM Products;







