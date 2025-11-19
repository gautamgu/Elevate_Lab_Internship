--------SELECT------------------
select * from Customers
select * from Categories
select * from Orders
select * from OrderItems
select * from Products
select * from Payments

--------GROUP BY AND HAVING -------
SELECT category_id, COUNT(*) AS total_products FROM Products
GROUP BY category_id;

SELECT category_id, SUM(stock) AS total_stock FROM Products
GROUP BY category_id;

SELECT category_id, AVG(price) AS avg_price FROM Products
GROUP BY category_id;

SELECT customer_id, COUNT(order_id) AS total_orders FROM Orders
GROUP BY customer_id;

SELECT customer_id, SUM(total_amount) AS total_spent FROM Orders
GROUP BY customer_id;

SELECT payment_method, SUM(amount) AS total_collected FROM Payments
GROUP BY payment_method;

SELECT product_id, SUM(quantity * price) AS revenue FROM OrderItems
GROUP BY product_id;

SELECT product_id, SUM(quantity) AS qty_sold FROM OrderItems
GROUP BY product_id;

----------------------------------------------
SELECT category_id, COUNT(*) AS product_count FROM Products
GROUP BY category_id
HAVING COUNT(*) > 2;

SELECT customer_id, SUM(total_amount) AS total_spent FROM Orders
GROUP BY customer_id
HAVING SUM(total_amount) > 5000;

SELECT product_id, SUM(quantity) AS qty_sold FROM OrderItems
GROUP BY product_id
HAVING SUM(quantity) > 10;

SELECT product_id, SUM(quantity * price) AS revenue FROM OrderItems
GROUP BY product_id
HAVING SUM(quantity * price) > 10000;

SELECT customer_id, COUNT(order_id) AS total_orders FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 3;

SELECT order_date, SUM(total_amount) AS total_sales FROM Orders
GROUP BY order_date
HAVING SUM(total_amount) > 5000;








