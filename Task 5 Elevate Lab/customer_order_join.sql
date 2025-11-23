create database customer_order;
use customer_order;

----------------CUSTOMERS-----------------------------------------------------------
create table Customers(
customer_id int primary key,
customer_name varchar(100),
gender varchar(10),
email varchar(150),
phone int,
city varchar(50),
state varchar(50),
created_at Date);

alter table Customers
alter column phone varchar(20);

INSERT INTO Customers (customer_id, customer_name, gender, email, phone, city, state, created_at) VALUES
(1, 'Amit Sharma', 'Male', 'amit.sharma@gmail.com', '9876543210', 'Delhi', 'Delhi', '2023-01-12'),
(2, 'Riya Gupta', 'Female', 'riya.g@gmail.com', '9876543211', 'Mumbai', 'Maharashtra', '2023-02-05'),
(3, 'Rohan Singh', 'Male', 'rohan.singh@yahoo.com', '9876543212', 'Chennai', 'Tamil Nadu', '2023-03-15'),
(4, 'Neha Verma', 'Female', 'neha.verma@gmail.com', '9876543213', 'Kolkata', 'West Bengal', '2023-04-20'),
(5, 'Vikas Kumar', 'Male', 'vikas.kumar@gmail.com', '9876543214', 'Pune', 'Maharashtra', '2022-11-10'),
(6, 'Shruti Mehta', 'Female', 'shruti.mehta@gmail.com', '9876543215', 'Ahmedabad', 'Gujarat', '2023-06-30'),
(7, 'Karan Patel', 'Male', 'karan.patel@gmail.com', '9876543216', 'Surat', 'Gujarat', '2023-07-10'),
(8, 'Priya Sharma', 'Female', 'priya.sharma@gmail.com', '9876543217', 'Jaipur', 'Rajasthan', '2023-03-21'),
(9, 'Aditya Yadav', 'Male', 'aditya.y@gmail.com', '9876543218', 'Lucknow', 'Uttar Pradesh', '2023-01-09'),
(10, 'Sneha Roy', 'Female', 'sneha.roy@gmail.com', '9876543219', 'Bhopal', 'Madhya Pradesh', '2023-05-16'),
(11, 'Harshit Jain', 'Male', 'harshit.jain@gmail.com', '9876543220', 'Agra', 'Uttar Pradesh', '2022-12-01'),
(12, 'Meera Soni', 'Female', 'meera.soni@gmail.com', '9876543221', 'Chandigarh', 'Chandigarh', '2023-06-01'),
(13, 'Sahil Khan', 'Male', 'sahil.khan@gmail.com', '9876543222', 'Hyderabad', 'Telangana', '2023-01-18'),
(14, 'Pooja Thakur', 'Female', 'pooja.thakur@gmail.com', '9876543223', 'Indore', 'Madhya Pradesh', '2023-04-25'),
(15, 'Manish Pandey', 'Male', 'manish.pandey@gmail.com', '9876543224', 'Varanasi', 'Uttar Pradesh', '2023-02-28');

select * from Customers;

--------------ORDERS---------------------------------------------------------------
create table Orders(
order_id int primary key,
customer_id int,
product varchar(50),
category varchar(50),
quantity int,
amount decimal(10,2),
order_date date,
foreign key (customer_id) references Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, product, category, quantity, amount, order_date) VALUES
(101, 1, 'Laptop', 'Electronics', 1, 55000, '2023-05-10'),
(102, 1, 'Mouse', 'Electronics', 2, 1400, '2023-05-11'),
(103, 2, 'Keyboard', 'Electronics', 1, 1500, '2023-05-13'),
(104, 3, 'Monitor', 'Electronics', 1, 9000, '2023-05-15'),
(105, 4, 'Shoes', 'Fashion', 1, 2500, '2023-05-16'),
(106, 5, 'Mobile Phone', 'Electronics', 1, 23000, '2023-05-17'),
(107, 6, 'Handbag', 'Fashion', 1, 3200, '2023-05-20'),
(108, 7, 'Smartwatch', 'Electronics', 1, 4500, '2023-05-21'),
(109, 8, 'Dress', 'Fashion', 2, 2800, '2023-05-22'),
(110, 9, 'AC', 'Electronics', 1, 38000, '2023-05-23'),
(111, 10, 'Refrigerator', 'Electronics', 1, 42000, '2023-05-24'),
(112, 11, 'Sunglasses', 'Fashion', 1, 1200, '2023-05-26'),
(113, 12, 'Blender', 'Home Appliances', 1, 1500, '2023-05-27'),
(114, 13, 'Shoes', 'Fashion', 1, 2600, '2023-05-28'),
(115, 15, 'Washing Machine', 'Home Appliances', 1, 18500, '2023-06-01');

select * from Orders;