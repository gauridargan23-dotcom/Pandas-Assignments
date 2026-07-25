Week-6

Q1: Explain the roles of the Driver, Cluster Manager, and Executor in a Spark application.

·  Driver: The main program that creates the SparkSession, builds the execution plan, schedules tasks, and collects results.

·  Cluster Manager: Allocates resources (CPU and memory) across the cluster and launches executors.

·  Executor: Worker processes that execute tasks, store data in memory/disk, and return results to the driver.

Q2: How does Spark’s Lazy Evaluation strategy improve performance when chain-processing large datasets?

Spark does not execute transformations immediately. Instead, it records them in a DAG (Directed Acyclic Graph). When an action is called,
Spark optimizes the execution plan by combining operations, reducing unnecessary computations and disk I/O, which improves performance.

Q3: Write a Spark command to read a CSV file located at "data/source.csv", ensuring the first row is treated as a header and inferSchema 
is enabled.

df = spark.read /

.option("header", "true") /

.option("inferSchema", "true") /
 
.csv("data/source.csv")

Q4: What is the difference between CSV and Parquet in terms of storage (row-based vs. columnar) and why does it matter for performance?

CSV	               
-Row-based storage	

-Larger file size	

-Slower for analytics	

-No schema support	

Parquet 

-Columnar storage 

-Compressed, smaller size 

-Faster for analytical queries

-Stores schema metadata  
	
Q5: Given a DataFrame df, write a query to select the columns product_id and price where the category is 'Electronics'.

df.filter(df.category == "Electronics") /

  .select("product_id", "price")

Q6: Write the code to "revise" a DataFrame by renaming the column old_name to new_name and casting the price column from a String to 
a Double.

from pyspark.sql.functions import col

df = df.withColumnRenamed("old_name", "new_name") 

 .withColumn("price", col("price").cast("double"))

Q7: How does Spark use the Lineage Graph (DAG) to provide fault tolerance if a worker node fails?

Spark maintains a Lineage Graph (DAG) of all transformations. If an executor fails and loses data, Spark recomputes the lost partitions
using the recorded transformations instead of replicating the data, ensuring fault tolerance.

Q8: Write a query to filter a DataFrame df_orders for rows where the status is 'Completed' AND the amount is greater than 1000.

df_orders.filter(

 (df_orders.status == "Completed") &
 
 (df_orders.amount > 1000)
)

Q9: Explain the concept of Predicate Pushdown in Parquet and how it affects the amount of data loaded into memory.

Predicate Pushdown allows Spark to send filter conditions directly to the Parquet file reader. Only rows matching the filter are read 
from disk, reducing memory usage, disk I/O, and improving query speed.

Q10: Write a code snippet to add a new column final_price which is the base_price multiplied by 1.18 (18% tax).

from pyspark.sql.functions import col
df = df.withColumn("final_price", col("base_price") * 1.18)

Q11: What is the difference between Transformations and Actions? Provide two examples of each.

Transformations	 

-Create a new DataFrame/RDD	  

-Lazy evaluation	

Actions  

-Trigger execution   

-Return results 

Transformation Examples:

filter()

select()

Action Examples:

show()

collect()

Q12: Write the Spark command to load a Parquet file from "path/to/input", filter out any rows where user_id is null, and save the result 
as a CSV at "path/to/output".

df = spark.read.parquet("path/to/input")

df.filter(df.user_id.isNotNull()) /

  .write /
  
  .option("header", "true") /
  
  .csv("path/to/output")

Q13: In Spark Architecture, what is the difference between Client Mode and Cluster Mode?

Client Mode

-Driver runs on the local machine	

-Client must remain connected	

-Suitable for development/testing  

Cluster Mode 

-Driver runs inside the cluster

-Client can disconnect after submission

-Suitable for production workloads

Q14: Write a query to filter a dataset for rows where the region is 'North' OR the priority is 'High'.

df.filter(
    (df.region == "North") |
    (df.priority == "High")
)

Q15: When exploring a dataset, why is it safer to use .show(5) instead of .collect() on a multi-terabyte dataset?

.collect() on a multi-terabyte dataset?
.show(5) retrieves and displays only the first 5 rows, making it memory-efficient.
.collect() loads all data into the driver's memory, which can cause OutOfMemory (OOM) errors or crash the application for very
large datasets.
Therefore,.show(5) is much safer for exploring large datasets.

