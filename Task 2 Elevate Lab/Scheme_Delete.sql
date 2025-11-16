-----------------SELECT COMMANDS---------------------------
select * from Categories
select * from Products
select * from OrderItems
select * from Orders
select * from Customers
-----------------------DELETE COMMANDS---------------------
DELETE FROM Customers
WHERE customer_id = 10;

DELETE FROM Products
WHERE stock = 0;

DELETE FROM OrderItems
WHERE order_id = 209;

DELETE FROM OrderItems
WHERE order_item_id = 2;

DELETE FROM Payments
WHERE amount IS NULL;

DELETE FROM Products
WHERE category_id IS NULL;

DELETE FROM Orders
WHERE total_amount IS NULL;

DELETE FROM OrderItems
WHERE product_id IN (
    SELECT product_id 
    FROM Products
    WHERE category_id = (SELECT category_id FROM Categories WHERE category_name = 'Toys')
);

DELETE FROM Products
WHERE category_id = (SELECT category_id FROM Categories WHERE category_name = 'Toys');

DELETE FROM Categories
WHERE category_name = 'Toys';

-----------------SELECT COMMANDS---------------------------
select * from Categories
select * from Products
select * from OrderItems
select * from Orders
select * from Customers




