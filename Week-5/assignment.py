from pyspark.sql import SparkSession
from pyspark.sql.functions import (
    col,
    count,
    when,
    sum,
    avg,
    min,
    max
)
spark = SparkSession.builder \
    .appName("Celebal Spark Assignment") \
    .master("local[*]") \
    .getOrCreate()

print("===== Spark Session Created Successfully =====")

df = spark.read \
    .option("header", "true") \
    .option("inferSchema", "true") \
    .option("multiLine", "true") \
    .option("quote", "\"") \
    .option("escape", "\"") \
    .csv("Sample - Superstore.csv")

print("===== First 5 Rows =====")
df.show(5, truncate=False)

print("\n===== Schema =====")
df.printSchema()

print("\n===== Total Rows =====")
print(df.count())

print("\n===== Total Columns =====")
print(len(df.columns))

print("\n===== DataFrame Immutability =====")

west_df = df.filter(df["Region"] == "West")

print("Original Dataset Count:", df.count())
print("West Region Count:", west_df.count())

print("\n===== Remove Duplicates =====")

before = df.count()

df = df.dropDuplicates()

after = df.count()

print("Rows Before Removing Duplicates:", before)
print("Rows After Removing Duplicates :", after)
print("Duplicates Removed:", before - after)

print("\n===== Null Values =====")

df.select([
    count(when(col(c).isNull(), c)).alias(c)
    for c in df.columns
]).show()

print("\n===== Removing Rows where Sales is NULL =====")

df = df.dropna(subset=["Sales"])

df.show(5)

print("\n===== Furniture Category =====")
category_df = df.filter(
    col("Category") == "Furniture"
)
category_df.show(5)

print("\n===== West Region =====")

region_df = df.filter(
    col("Region") == "West"
)

region_df.show(10) 

print("\n===== Total Number of Orders =====")

print(df.count())

print("\n===== Total Profit =====")

df.select(sum("Profit").alias("Total Profit")).show()

print("\n===== Average Profit =====")

df.select(avg("Profit").alias("Average Profit")).show()

print("\n===== Maximum Profit =====")

df.select(max("Profit").alias("Maximum Profit")).show()

print("\n===== Minimum Profit =====")

df.select(min("Profit").alias("Minimum Profit")).show()


print("\n===== Average Profit by Region =====")

region_profit = df.groupBy("Region").agg(
    avg("Profit").alias("Average Profit")
)

region_profit.show()

print("\n===== Regions with Average Profit Greater Than 30 =====")

region_profit.filter(
    col("Average Profit") > 30
).show()

print("\n===== Wide Transformation: Group By Region =====")

region_count = df.groupBy("Region").count()

region_count.show()

print("\n===== Original Schema =====")
df.printSchema()

print("\n===== Renaming Column =====")

df = df.withColumnRenamed("Customer Name", "Customer_Name")

df.printSchema()

print("\n===== Casting Postal Code to Integer =====")

df = df.withColumn(
    "Postal Code",
    col("Postal Code").cast("int")
)

df.printSchema()

print("\n===== Replacing Empty Values =====")

df = df.replace("", None)

df.show(5)

print("\n===== Fixing Schema =====")

df = df.withColumn("Profit", col("Profit").cast("double"))

df = df.withColumnRenamed("Customer_Name", "CustomerName")

df.printSchema()

print("\n===== Complete Data Processing Pipeline =====")

pipeline = (
    df
    .dropDuplicates()
    .dropna(subset=["Profit"])
    .filter(col("Category") == "Technology")
    .groupBy("Region")
    .agg(
        count("*").alias("Total Orders"),
        avg("Profit").alias("Average Profit")
    )
)

pipeline.show()

spark.stop()