Azure Data Factory 

Objective

Understand Azure cloud concepts and build an end-to-end data pipeline using Azure Storage Account and Azure Data Factory (ADF). The project demonstrates how to store data in Azure Blob Storage, connect it to ADF, retrieve file metadata, copy data to a destination container, and monitor pipeline execution.

 Prerequisites

* Azure for Students Subscription
* Azure Portal access
* Superstore CSV dataset
* Basic knowledge of Azure services

 Services Used

* Azure Resource Group
* Azure Storage Account
* Azure Blob Storage
* Azure Data Factory (ADF)

Steps Performed

1. Created Resource Group

* Resource Group: **Week4-RG**
* Region: **East Asia**

2. Created Storage Account

* Storage Account: **week4storage21377**
* Performance: Standard
* Replication: LRS

3. Created Blob Container

* Container Name: **superstore**
* Uploaded **Sample - Superstore.csv**

4. Created Azure Data Factory

* Data Factory Name: **week4-adf-21377**
* Version: V2

5. Created Linked Service

 Connected Azure Data Factory to the Azure Storage Account.

6. Created Datasets

* Source Dataset: Superstore CSV in Blob Storage
* Destination Dataset: Destination Blob Container

7. Built Pipeline

Added:

* Get Metadata activity to retrieve file information.
* Copy Data activity to copy the CSV file from the source container to the destination container.

8. Executed Pipeline

Executed the pipeline using **Debug** and **Trigger Now** and monitored the execution in the **Monitor** tab.


Output

* Resource Group created successfully.
* Storage Account and Blob Containers created.
* Superstore CSV uploaded.
* Azure Data Factory connected to Blob Storage.
* Pipeline executed successfully.
* File copied from source to destination.


Conclusion

This project demonstrates an end-to-end Azure Data Engineering pipeline using Azure Blob Storage and Azure Data Factory. It covers storage, data integration, metadata retrieval, data movement, monitoring, and access management.


