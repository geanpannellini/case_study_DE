# Case Study 8️⃣🟣♾️

This repository contains the code to connect to a **SQL Server** database, create and execute queries using **DBeaver**, export results to **AWS S3**, and an Extra script to execute SQL on VSCode.

---

## 📋 Project Steps

### 1️⃣ **Environment Setup & Database Connection**
Before developing the solution, we set up the environment to access the case study database using **DBeaver**.

<img width="811" alt="image" src="https://github.com/user-attachments/assets/13b3618a-ffc3-41eb-8c44-dd0febac3290" />

#### **📌 Column Analysis (Diagram)**
After connecting, I explored the existing tables to understand their structure and define the queries correctly.

<img width="592" alt="image" src="https://github.com/user-attachments/assets/8ff497bc-327c-4c38-8d1b-8b7a3d910b01" />

### 2️⃣ **Query Creation - Business Requirements**

I created the query based on the given requirements, highlighting potential issues that might arise and explaining the decision-making process.

**Query File**: [business_requirements_query](query_counts_burrito_taco.sql)

To ensure data quality, we conducted a **data quality check**:

```
(1) SELECT DISTINCT menus_name FROM menu_options_prices;
(2) Understand the variations in menu names related to burritos and tacos.
(3) Refine our filtering criteria to improve accuracy in the final query.
```

Then, I analyzed the presence of "burrito" and "taco" in the column, considering two possible approaches:

(1) Detailed-oriented approach: Exclude items that are not standalone burritos or tacos, such as bowls, wraps, combos, salads, and flatbreads (with the possibility of refining further).

(2) General approach: Only adjust for plural variations and include all relevant entries in the count.

📌 Conclusion: For this case, I chose the detailed-oriented approach (1) to demonstrate the importance of thoroughly investigating the data after understanding the business requirements.

Finally, I downloaded the results as a [CSV File](menu_counts_202503110939.csv)

### 3️⃣ **Uploading the CSV File to AWS S3**

To automate the file transfer, I configured the connection to **AWS S3** using `boto3`, securely reading AWS credentials and uploading the file to the target bucket.

📌 **Upload Script**: [Upload_to_S3](upload_to_s3.py)

## 🔹 **EXTRA: Running Queries in VSCode**

### 4️⃣ **Using VSCode to Execute Queries**
I set up a **Python environment** to connect to the **SQL Server** database using `pyodbc`, allowing query execution directly in **VSCode**.  

To ensure compatibility, I installed the **ODBC Driver 17**:

```bash
brew tap microsoft/mssql-release https://github.com/Microsoft/homebrew-mssql-release
brew update
brew install msodbcsql17
```

📌 **Connection Script**: [Connect SQL Server to VS Code](connect_read_sql.py)
