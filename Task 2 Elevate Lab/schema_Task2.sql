USE ECommerceDB;
--------------INSERTION IN CUSTOMER TABLE-------------------
INSERT INTO Customers (customer_id, name, email, phone, address) VALUES
(1, 'Rahul Sharma', 'rahul@example.com', '9876543210', 'Delhi'),
(2, 'Priya Mehta', 'priya@example.com', NULL, 'Mumbai'),
(3, 'Amit Verma', 'amit@example.com', '9123456780', NULL),
(4, 'Sneha Kapoor', 'sneha@example.com', '9988776655', 'Pune'),
(5, 'Karan Singh', 'karan@example.com', '9090909090', 'Noida'),
(6, 'Megha Jain', 'megha@example.com', NULL, 'Kolkata'),
(7, 'Harsh Pandey', 'harsh@example.com', '9000012345', 'Chennai'),
(8, 'Divya Rai', 'divya@example.com', '9123001122', NULL),
(9, 'Aditya Kumar', 'aditya@example.com', '9888899999', 'Jaipur'),
(10, 'Tanya Sharma', 'tanya@example.com', NULL, 'Surat'),
(11, 'Rohit Gupta', 'rohit@example.com', '9999988888', 'Bhopal'),
(12, 'Nisha Das', 'nisha@example.com', '9345678901', 'Hyderabad');

select * from Customers

--------------INSERTION IN CATEGORIES TABLE-------------------
INSERT INTO Categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Furniture'),
(5, 'Sports'),
(6, 'Footwear'),
(7, 'Toys'),
(8, 'Beauty'),
(9, 'Groceries'),
(10, 'Books');

select * from Categories

--------------INSERTION IN PRODUCTS TABLE-------------------
INSERT INTO Products (product_id, product_name, price, stock, category_id) VALUES
(101, 'Smartphone', 15000.00, 50, 1),
(102, 'Laptop', 55000.00, 25, 1),
(103, 'Earphones', 799.00, 200, 1),
(104, 'T-Shirt', 499.00, 150, 2),
(105, 'Jeans', 999.00, 80, 2),
(106, 'Mixer Grinder', 2500.00, 40, 3),
(107, 'Sofa Set', 30000.00, 10, 4),
(108, 'Football', 499.00, 60, 5),
(109, 'Running Shoes', 1999.00, 70, 6),
(110, 'Teddy Bear', 399.00, 90, 7),
(111, 'Face Cream', 199.00, 100, 8),
(112, 'Notebook Pack', 120.00, 300, 10);

INSERT INTO Products (product_id, product_name, price, stock, category_id) VALUES
(113, 'Watch', 15000.00, 50, 1),
(114, 'T.V', 55000.00, NULL, 1),         
(115, 'HeadPhone', 799.00, DEFAULT, 1),    
(116, 'Trouser', 499.00, 150, 2),
(117, 'Kurti', 999.00, NULL, 2),
(118, 'Oven', 2500.00, DEFAULT, 3),
(119, 'Dinning Table', 30000.00, 10, 4),
(120, 'Cricket Set', 499.00, DEFAULT, 5),
(121, 'Sneaker', 1999.00, 70, 6),
(122, 'Teddy Polar Bear', 399.00, NULL, 7),
(123, 'Lotion', 199.00, DEFAULT, NULL), 
(124, 'Notebook', 120.00, DEFAULT, 10);

Select * from Products

--------------INSERTION IN ORDERS TABLE-------------------
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(201, 1, '2025-02-10', 15000.00),
(202, 2, '2025-02-11', 499.00),
(203, 3, '2025-02-12', 2500.00),
(204, 4, '2025-02-13', 999.00),
(205, 5, '2025-02-13', 55000.00),
(206, 6, '2025-02-14', 399.00),
(207, 7, '2025-02-14', 1999.00),
(208, 8, '2025-02-15', 120.00),
(209, 9, '2025-02-15', 30000.00),
(210, 10, '2025-02-16', 499.00),
(211, 11, '2025-02-16', 799.00),
(212, 12, '2025-02-17', 199.00);

select * from Orders

--------------INSERTION IN ORDERITEMS TABLE-------------------
INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, price) VALUES
(1, 201, 101, 1, 15000.00),
(2, 202, 104, 1, 499.00),
(3, 203, 106, 1, 2500.00),
(4, 204, 105, 1, 999.00),
(5, 205, 102, 1, 55000.00),
(6, 206, 110, 1, 399.00),
(7, 207, 109, 1, 1999.00),
(8, 208, 112, 1, 120.00),
(9, 209, 107, 1, 30000.00),
(10, 210, 108, 1, 499.00),
(11, 211, 103, 1, 799.00),
(12, 212, 111, 1, 199.00);

select * from OrderItems

--------------INSERTION IN PAYMENTS TABLE-------------------
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, amount) VALUES
(501, 201, '2025-02-10', 'UPI', 15000.00),
(502, 202, '2025-02-11', 'Credit Card', 499.00),
(503, 203, '2025-02-12', 'Cash', 2500.00),
(504, 204, '2025-02-13', 'UPI', 999.00),
(505, 205, '2025-02-13', 'Net Banking', 55000.00),
(506, 206, '2025-02-14', 'UPI', 399.00),
(507, 207, '2025-02-14', 'Debit Card', 1999.00),
(508, 208, '2025-02-15', 'UPI', 120.00),
(509, 209, '2025-02-15', 'EMI', 30000.00),
(510, 210, '2025-02-16', 'UPI', 499.00),
(511, 211, '2025-02-16', 'Credit Card', 799.00),
(512, 212, '2025-02-17', 'Cash', 199.00);

select * from Payments







