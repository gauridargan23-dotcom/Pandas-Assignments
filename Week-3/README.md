 Week 3 - SQL Sales Data Analysis


Objective:
Analyze the Superstore sales dataset using advanced SQL concepts such as Subqueries, Common Table Expressions (CTEs), Window Functions, and JOINs to solve real-world business problems.
 
 
 Tools Used:
- MySQL Workbench
- SQL
- Superstore Dataset (CSV)

 Dataset
- Dataset: Sample - Superstore
- Source: Kaggle Superstore Dataset


Tasks Performed:
1. Data Import
- Imported the Superstore dataset into MySQL.
- Created the `superstore_raw` table.

2. Table Creation:
Created separate tables from the raw dataset:
- Customers
- Orders
- Products

3. Data Insertion:
- Inserted unique records into each table using `SELECT DISTINCT`.

 4. Subqueries:
Implemented subqueries to:
- Find orders with above-average sales.
- Find the highest-value order for each customer.

5. Common Table Expressions (CTEs):
Used CTEs to:
- Calculate total sales for each customer.
- Simplify complex aggregation queries.

6. Window Functions:
Applied:
- `ROW_NUMBER()`
- `RANK()`
to rank customers and analyze sales performance.

7. JOIN Operations:
Combined JOIN, CTE, and Window Functions to generate customer sales rankings.

8. Business Queries:
Solved various business problems, including:
- Top-performing customers
- Lowest-performing customers
- Customers with only one order
- Above-average sales orders

Key Learnings:
- Imported and managed CSV data in MySQL.
- Created normalized tables using SQL.
- Used `SELECT DISTINCT` to remove duplicate records.
- Applied Subqueries for advanced filtering.
- Used Common Table Expressions (CTEs) for better query readability.
- Implemented Window Functions (`ROW_NUMBER()` and `RANK()`) for analytical reporting.
- Combined JOINs with CTEs and Window Functions to solve business scenarios.
- Improved SQL query writing and data analysis skills.

Conclusion:
This assignment demonstrates the practical application of advanced SQL techniques to analyze sales data and generate meaningful business insights. By using Subqueries, CTEs, Window Functions, and JOIN operations, raw transactional data was transformed into structured information that supports business decision-making and performance analysis.

