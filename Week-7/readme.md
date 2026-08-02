# Week 7 

## Objective
The objective of this assignment is to learn basic data exploration and data cleaning techniques using PySpark in Databricks. The dataset is loaded, explored, cleaned, transformed, and saved as a new CSV file.

## Dataset
- **Dataset:** Sample - Superstore
- **Source:** Kaggle Superstore Dataset

## Tasks Performed
1. Loaded the CSV dataset into a Spark DataFrame.
2. Explored the dataset:
   - Displayed the first and last records
   - Checked dataset shape
   - Listed column names
   - Examined data types
3. Identified missing values and handled them using dropna().
4. Performed basic operations:
   - Selected specific columns
   - Filtered records based on conditions
5. Removed duplicate records using dropDuplicates().
6. Created derived columns:
   - Unit_Price = Sales / Quantity
   - total_amount = Unit_Price × Quantity
7. Saved the cleaned dataset as **Cleaned_Superstore.csv**.

## Technologies Used
- Python
- PySpark
- Apache Spark
- Databricks Free Edition

## Output
- Cleaned CSV file
- Data exploration results
- Data cleaning and transformation performed successfully
