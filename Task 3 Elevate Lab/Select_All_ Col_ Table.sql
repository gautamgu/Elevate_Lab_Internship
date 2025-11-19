--------------------------------------------------------------------------------------
----SELECT COMMANDS TO DISPLAY ALL THE TABLES-----------------------------------------

select * from Customers
select * from Categories
select * from Orders
select * from OrderItems
select * from Products
select * from Payments

---------------------------------------------------------------------------------------
----SELECT COMMANDS TO DISPLAY CERTAIN COLUMNS-----------------------------------------

select name, email from Customers
select product_name,price from Products
select order_id,total_amount from Orders
select name,address from Customers
select category_name from Categories
select order_item_id,price from OrderItems
select payment_id,payment_method,amount from Payments
