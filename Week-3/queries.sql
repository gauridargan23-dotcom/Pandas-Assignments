CREATE DATABASE week3_sales;
USE week3_sales;
SHOW TABLES;
SELECT COUNT(*) AS Total_Rows
FROM superstore_raw;
-- Create Customers Table
CREATE TABLE customers (
    `Customer ID` TEXT,
    `Customer Name` TEXT,
    Segment TEXT,
    Country TEXT,
    City TEXT,
    State TEXT,
    `Postal Code` INT,
    Region TEXT
);
INSERT INTO customers
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    Segment,
    Country,
    City,
    State,
    `Postal Code`,
    Region
FROM superstore_raw;
-- Create Orders Table
CREATE TABLE orders (
    `Order ID` TEXT,
    `Order Date` TEXT,
    `Ship Date` TEXT,
    `Ship Mode` TEXT,
    `Customer ID` TEXT,
    Sales DOUBLE,
    Quantity INT,
    Discount DOUBLE,
    Profit DOUBLE
);
INSERT INTO orders
SELECT DISTINCT
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;
-- Create Products Table
CREATE TABLE products (
    `Product ID` TEXT,
    Category TEXT,
    `Sub-Category` TEXT,
    `Product Name` TEXT
);
INSERT INTO products
SELECT DISTINCT
    `Product ID`,
    Category,
    `Sub-Category`,
    `Product Name`
FROM superstore_raw;
-- Orders Above Average Sales
SELECT *
FROM superstore_raw
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM superstore_raw
);
-- Highest Order for Each Customer
SELECT *
FROM superstore_raw s
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM superstore_raw
    WHERE `Customer ID` = s.`Customer ID`
);
-- Total Sales Per Customer
WITH CustomerSales AS
(
SELECT
`Customer ID`,
SUM(Sales) AS TotalSales
FROM superstore_raw
GROUP BY `Customer ID`
)
SELECT *
FROM CustomerSales;
-- Window Function – ROW_NUMBER()
SELECT
`Customer ID`,
Sales,
ROW_NUMBER() OVER
(
PARTITION BY `Customer ID`
ORDER BY Sales DESC
) AS Row_Num
FROM superstore_raw;
-- Window Function – RANK()
SELECT
`Customer ID`,
Sales,
RANK() OVER
(
ORDER BY Sales DESC
) AS Sales_Rank
FROM superstore_raw;
-- JOIN + CTE + Window Function
WITH CustomerSales AS
(
SELECT
`Customer ID`,
SUM(Sales) AS TotalSales
FROM superstore_raw
GROUP BY `Customer ID`
)
SELECT
c.`Customer Name`,
cs.TotalSales,
RANK() OVER
(
ORDER BY cs.TotalSales DESC
) AS CustomerRank
FROM CustomerSales cs
JOIN customers c
ON cs.`Customer ID` = c.`Customer ID`;
-- Top 10 Customers
WITH CustomerSales AS
(
SELECT
`Customer ID`,
SUM(Sales) AS TotalSales
FROM superstore_raw
GROUP BY `Customer ID`
)
SELECT *
FROM CustomerSales
ORDER BY TotalSales DESC
LIMIT 10;
-- Lowest 10 Customers
WITH CustomerSales AS
(
SELECT
`Customer ID`,
SUM(Sales) AS TotalSales
FROM superstore_raw
GROUP BY `Customer ID`
)
SELECT *
FROM CustomerSales
ORDER BY TotalSales ASC
LIMIT 10;
-- Customers with Only One Order
SELECT
`Customer ID`,
COUNT(`Order ID`) AS TotalOrders
FROM superstore_raw
GROUP BY `Customer ID`
HAVING COUNT(`Order ID`) = 1;
-- Above Average Sales
SELECT *
FROM superstore_raw
WHERE Sales >
(
SELECT AVG(Sales)
FROM superstore_raw
);
