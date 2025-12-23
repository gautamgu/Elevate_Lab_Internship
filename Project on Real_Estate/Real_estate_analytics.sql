-- Agents --
CREATE TABLE Agents (
    agent_id SERIAL PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    region VARCHAR(50)
);
-- Buyers --
CREATE TABLE Buyers (
    buyer_id SERIAL PRIMARY KEY,
    buyer_name VARCHAR(100),
    email VARCHAR(100)
);
-- Properties --
CREATE TABLE Properties (
    property_id SERIAL PRIMARY KEY,
    property_type VARCHAR(50),
    region VARCHAR(50),
    area_sqft INT,
    price NUMERIC(12,2),
    listing_date DATE,
    agent_id INT REFERENCES Agents(agent_id)
);
-- Transactions --
CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    property_id INT REFERENCES Properties(property_id),
    buyer_id INT REFERENCES Buyers(buyer_id),
    sale_price NUMERIC(12,2),
    sale_date DATE
);
-------- Insert : Agents ------
INSERT INTO Agents (agent_name, phone, region) VALUES
('Amit Sharma', '9876543210', 'Delhi'),
('Rohit Verma', '9876543222', 'Mumbai'),
('Neha Gupta', '9876543333', 'Bangalore'),
('Pooja Malhotra', '9876543444', 'Pune'),
('Sandeep Singh', '9876543555', 'Hyderabad');

select * from Agents;
------- Insert : Buyers ------
INSERT INTO Buyers (buyer_name, email) VALUES
('Rahul Mehta', 'rahul@gmail.com'),
('Anita Singh', 'anita@gmail.com'),
('Suresh Kumar', 'suresh@gmail.com'),
('Kavita Joshi', 'kavita@gmail.com'),
('Manish Arora', 'manish@gmail.com'),
('Priya Kapoor', 'priya@gmail.com');

select * from Buyers;

------ Insert: Properties -----
INSERT INTO Properties (property_type, region, area_sqft, price, listing_date, agent_id) VALUES
('Apartment', 'Delhi', 1100, 7200000, '2024-01-05', 1),
('Villa', 'Delhi', 2200, 13500000, '2024-02-10', 1),
('Apartment', 'Mumbai', 900, 10800000, '2024-01-15', 2),
('Apartment', 'Mumbai', 1000, 11500000, '2024-03-01', 2),
('Apartment', 'Bangalore', 1200, 6800000, '2024-02-18', 3),
('Villa', 'Bangalore', 2500, 14500000, '2024-03-25', 3),
('Apartment', 'Pune', 950, 6200000, '2024-01-20', 4),
('Apartment', 'Pune', 1050, 6600000, '2024-03-05', 4),
('Apartment', 'Hyderabad', 1150, 7000000, '2024-02-01', 5),
('Villa', 'Hyderabad', 2300, 12800000, '2024-03-10', 5),
('Apartment', 'Delhi', 1300, 8200000, '2024-03-15', 1),
('Apartment', 'Mumbai', 850, 10200000, '2024-04-01', 2);

Select * from Properties;

------ Insert : Transactions -------
INSERT INTO Transactions (property_id, buyer_id, sale_price, sale_date) VALUES
(1, 1, 7100000, '2024-02-12'),
(3, 2, 10700000, '2024-02-28'),
(5, 3, 6700000, '2024-03-05'),
(7, 4, 6100000, '2024-03-12'),
(9, 5, 6900000, '2024-03-20'),
(2, 6, 13200000, '2024-03-30'),
(4, 1, 11200000, '2024-04-05'),
(6, 2, 14200000, '2024-04-15');

select * from Transactions;

------ BASIC QUERIES WITH COMMANDS ------

SELECT agent_name, region FROM Agents;
SELECT buyer_name, email FROM Buyers;
SELECT property_type, price FROM Properties;

SELECT * FROM Properties WHERE region = 'Delhi';
SELECT * FROM Properties WHERE price > 8000000;
SELECT * FROM Transactions WHERE sale_price > 10000000;

SELECT * FROM Properties ORDER BY price ASC;
SELECT * FROM Properties ORDER BY price DESC;
SELECT * FROM Properties ORDER BY price DESC LIMIT 5;

SELECT DISTINCT region FROM Properties;

SELECT COUNT(*) FROM Properties;
SELECT AVG(price) FROM Properties;
SELECT SUM(sale_price) FROM Transactions;

SELECT region, COUNT(*) AS total_properties
FROM Properties
GROUP BY region;

SELECT region, AVG(price) AS avg_price
FROM Properties
GROUP BY region;

SELECT region, COUNT(*)
FROM Properties
GROUP BY region
HAVING COUNT(*) > 2;

SELECT p.property_id, p.region, a.agent_name
FROM Properties p
JOIN Agents a
ON p.agent_id = a.agent_id;

SELECT p.property_id, t.sale_price
FROM Properties p
LEFT JOIN Transactions t
ON p.property_id = t.property_id;

SELECT DISTINCT property_id FROM Transactions;

SELECT p.property_id
FROM Properties p
LEFT JOIN Transactions t
ON p.property_id = t.property_id
WHERE t.transaction_id IS NULL;

SELECT * FROM Properties
WHERE price BETWEEN 6000000 AND 9000000;

SELECT * FROM Agents
WHERE agent_name LIKE 'A%';

SELECT * FROM Properties
WHERE region IN ('Delhi', 'Mumbai');

SELECT * FROM Properties
WHERE listing_date >= '2024-03-01';

SELECT * FROM Properties
WHERE price > (SELECT AVG(price) FROM Properties);

CREATE VIEW Delhi_Properties AS
SELECT * FROM Properties
WHERE region = 'Delhi';

SELECT * FROM Delhi_Properties;


-----Average Property Price by Region-----
SELECT region, ROUND(AVG(price),2) AS avg_price
FROM Properties
GROUP BY region;

-----Total Properties Listed per Region-----
SELECT region, COUNT(*) AS total_properties
FROM Properties
GROUP BY region;

-----Total Sales Value by Region-----
SELECT p.region, SUM(t.sale_price) AS total_sales
FROM Properties p
JOIN Transactions t ON p.property_id = t.property_id
GROUP BY p.region;

-----Agent Performance (Total Sales)-----
SELECT a.agent_name, COUNT(t.transaction_id) AS total_deals,
       SUM(t.sale_price) AS total_sales
FROM Agents a
JOIN Properties p ON a.agent_id = p.agent_id
JOIN Transactions t ON p.property_id = t.property_id
GROUP BY a.agent_name;

/*
---------ADVANCED QUERIES IN COMMANDS----------
*/
-- 1. Top 3 Most Expensive Properties per Region
SELECT * FROM ( SELECT property_id, region, price,
RANK() OVER (PARTITION BY region ORDER BY price DESC) AS rnk FROM Properties) ranked WHERE rnk <= 3;

-- 2. Properties Sold vs Unsold
SELECT
    CASE
        WHEN t.transaction_id IS NULL THEN 'Unsold'
        ELSE 'Sold'
    END AS property_status, COUNT(*) AS total_properties
FROM Properties p LEFT JOIN Transactions t ON p.property_id = t.property_id
GROUP BY property_status;

-- 3.Average Sale Price vs Listing Price
SELECT p.region,
    ROUND(AVG(p.price),2) AS avg_listing_price,
    ROUND(AVG(t.sale_price),2) AS avg_sale_price
FROM Properties p JOIN Transactions t ON p.property_id = t.property_id
GROUP BY p.region;

-- 4.Buyer Purchase Frequency
SELECT b.buyer_name,
    COUNT(t.transaction_id) AS total_purchases
FROM Buyers b LEFT JOIN Transactions t ON b.buyer_id = t.buyer_id
GROUP BY b.buyer_name ORDER BY total_purchases DESC;

-- 5.Monthly Revenue Growth
SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(sale_price) AS revenue,
    SUM(SUM(sale_price)) OVER (ORDER BY DATE_TRUNC('month', sale_date)) AS cumulative_revenue
FROM Transactions GROUP BY month ORDER BY month;

-- 6.High-Value Transactions (>1 Cr)
SELECT * FROM Transactions
WHERE sale_price > 10000000;

-- 7.Region-wise Demand Ranking
SELECT p.region,
    COUNT(t.transaction_id) AS total_sales,
    DENSE_RANK() OVER (ORDER BY COUNT(t.transaction_id) DESC) AS demand_rank
FROM Properties p JOIN Transactions t ON p.property_id = t.property_id
GROUP BY p.region;

-- 8.Agent Efficiency (Avg Sale per Deal)
SELECT a.agent_name,
    ROUND(AVG(t.sale_price),2) AS avg_deal_value
FROM Agents a JOIN Properties p ON a.agent_id = p.agent_id
JOIN Transactions t ON p.property_id = t.property_id GROUP BY a.agent_name;

/* index and Views */
CREATE VIEW High_Price_Properties AS
SELECT property_id, region, price
FROM Properties
WHERE price > 8000000;

SELECT * FROM High_Price_Properties;

CREATE INDEX idx_properties_region
ON Properties(region);

CREATE INDEX idx_transactions_sale_date
ON Transactions(sale_date);

SELECT * FROM Properties
WHERE region = 'Delhi';

-----PROCEDURE ------
CREATE OR REPLACE PROCEDURE add_property(
    p_type VARCHAR,
    p_region VARCHAR,
    p_area INT,
    p_price NUMERIC,
    p_date DATE,
    p_agent INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Properties
    (property_type, region, area_sqft, price, listing_date, agent_id)
    VALUES
    (p_type, p_region, p_area, p_price, p_date, p_agent);
END;
$$;

CALL add_property('Apartment', 'Delhi', 1200, 7800000, '2024-05-01', 1);

/* 
---- WINDOWS FUNCTION ----
*/
SELECT region, listing_date, price,
    AVG(price) OVER (PARTITION BY region ORDER BY listing_date
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS moving_avg_price
FROM Properties;

SELECT listing_date, price,
price - LAG(price) OVER (ORDER BY listing_date) AS price_change FROM Properties;

SELECT region, property_id, price,
    RANK() OVER (PARTITION BY region ORDER BY price DESC) AS price_rank
FROM Properties;


