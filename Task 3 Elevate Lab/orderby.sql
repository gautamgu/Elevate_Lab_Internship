--------SELECT------------------
select * from Customers
select * from Categories
select * from Orders
select * from OrderItems
select * from Products
select * from Payments

-------ORDER BY-----------------
SELECT * FROM Customers 
ORDER BY name ASC;

SELECT * FROM Products 
ORDER BY price ASC;

SELECT * FROM Orders 
ORDER BY order_date DESC;

SELECT * FROM Orders 
ORDER BY total_amount DESC, order_date ASC;

SELECT order_id, total_amount FROM Orders
ORDER BY total_amount ASC;

SELECT payment_method, amount FROM Payments
ORDER BY amount DESC;

SELECT product_name, category_id, price FROM Products
ORDER BY category_id ASC, price ASC;