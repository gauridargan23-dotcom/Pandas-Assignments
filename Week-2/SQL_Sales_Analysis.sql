CREATE DATABASE SuperstoreDB;
USE SuperstoreDB;
CREATE TABLE Superstore (
    Row_ID INT,
    Order_ID VARCHAR(30),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(30),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code INT,
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);
SHOW TABLES;
DESCRIBE `sample - superstore`;
SELECT *
FROM `sample - superstore`
LIMIT 10;
SHOW TABLES;
SELECT COUNT(*) FROM `sample - superstore`;
SELECT *
FROM `sample - superstore`
WHERE Region = 'West';
SELECT *
FROM `sample - superstore`
WHERE Category = 'Furniture';
SELECT *
FROM `sample - superstore`
WHERE `Order Date` > '2020-01-01';
SELECT *
FROM `sample - superstore`
WHERE Sales > 1000;
SELECT *
FROM `sample - superstore`
WHERE Region = 'East'
AND Category = 'Technology'
AND Sales > 500;
SELECT Region,
SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Region;
SELECT Category,
AVG(Sales) AS Average_Sales
FROM `sample - superstore`
GROUP BY Category;
SELECT Category,
SUM(Quantity) AS Total_Quantity
FROM `sample - superstore`
GROUP BY Category;
SELECT Region,
AVG(Profit) AS Average_Profit
FROM `sample - superstore`
GROUP BY Region;
SELECT `Product Name`,
SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT Category,
SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT *
FROM `sample - superstore`
ORDER BY Profit DESC
LIMIT 10;
SELECT
YEAR(`Order Date`) AS Year,
MONTH(`Order Date`) AS Month,
SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY YEAR(`Order Date`), MONTH(`Order Date`)
ORDER BY Year, Month;
SELECT `Customer Name`,
SUM(Sales) AS Total_Sales
FROM `sample - superstore`
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT `Order ID`,
COUNT(*) AS Duplicate_Count
FROM `sample - superstore`
GROUP BY `Order ID`
HAVING COUNT(*) > 1;
SELECT COUNT(*)
FROM `sample - superstore`;
SELECT *
FROM `sample - superstore`
WHERE Sales IS NULL;