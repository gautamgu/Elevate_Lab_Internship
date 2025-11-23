use customer_order;

----Inner Join------------
SELECT * FROM Customers c INNER JOIN Orders o on c.customer_id=o.customer_id;

SELECT c.customer_name, c.city, o.product, o.amount FROM Customers c INNER JOIN Orders o ON c.customer_id = o.customer_id;

SELECT C.customer_id, C.customer_name, O.order_id, O.amount FROM Customers C INNER JOIN Orders O ON C.customer_id = O.customer_id;

----Left Join------------
SELECT C.customer_name, C.city, O.product, O.amount FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id;

SELECT C.customer_name, C.email, O.product FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id;

----Right Join-----------
SELECT C.customer_name, O.product, O.amount FROM Customers C RIGHT JOIN Orders O ON C.customer_id = O.customer_id;

SELECT C.customer_name, C.city, O.product, O.order_date FROM Customers C RIGHT JOIN Orders O ON C.customer_id = O.customer_id;

----Full Outer Join------
SELECT C.customer_name, O.product, O.amount FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id
UNION
SELECT C.customer_name, O.product, O.amount FROM Customers C RIGHT JOIN Orders O ON C.customer_id = O.customer_id;

SELECT C.customer_name, O.product, O.amount FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id
UNION
SELECT C.customer_name, O.product, O.amount FROM Customers C RIGHT JOIN Orders O ON C.customer_id = O.customer_id;

----Cross Join-------------
SELECT Customers.customer_name, Orders.product
FROM Customers
CROSS JOIN Orders;

----Self Join---------------
SELECT A.customer_name AS Person1, B.customer_name AS Person2, A.city FROM Customers A
INNER JOIN Customers B
ON A.city = B.city AND A.customer_id <> B.customer_id;



