📘 Sales Management System using MySQL
A complete SQL‑based Sales Management & Analytics System built using MySQL.
This project includes full database design, Python‑generated sample data, stored procedures, triggers, and 50 analytical SQL queries covering all major sales operations.

📌 Project Overview
This project simulates a real‑world retail sales environment with modules for:

Customer Management

Product Catalog (Categories & Subcategories)

Supplier Management

Orders & Order Details

Payments & Refunds

Returns Processing

Inventory Management

Employee & Department Management

Regional & Shipping Operations

Business Analytics & Reporting


The database is populated with large‑scale realistic data generated using Python, making it ideal for:

SQL practice

Data analytics learning

Portfolio projects

Academic submissions

End‑to‑end database design demonstrations

🛠️ Technologies Used
Technology	      Purpose
MySQL	            Database engine
SQL	              Querying, analytics, procedures, triggers
MySQL Workbench	  Modeling & execution
Python	          Automated data generation for INSERT statements


🗂️ Database Schema
This project contains the following fully‑normalized tables:

Categories

SubCategories

Suppliers

Customers

Departments

Employees

Regions

Shippers

PaymentMethods

Products

Orders

OrderDetails

Payments

Returns

Inventory

PaymentAudit (trigger‑based logging)

All tables are connected using foreign keys with cascading rules and validation constraints.


🔗 Entity Relationship Highlights
One category → many subcategories

One supplier → many products

One customer → many orders

One order → many order details

One product → many order details

One order → one payment

One product → one inventory record

One return → one product

One employee → many orders

One region → many orders

🔧 Data Generation (Python Scripts)
All INSERT statements in this project were generated using custom Python data generators, not manually typed.

✔ Number of records generated using Python:
Table	Approx. Count
Customers	~500 records
Suppliers	50 records
Categories	10 records
SubCategories	30 records
Regions	10 records
Shippers	8 records
PaymentMethods	5 records
Products	Python‑generated 
Employees	Python‑generated
Orders	Python‑generated
OrderDetails	Python‑generated
Payments	Python‑generated
Returns	Python‑generated
Inventory	Python‑generated


These Python scripts ensured:

Realistic Indian names, cities, states

Valid email/phone formats

Randomized dates

Controlled ENUM values

Foreign‑key consistency

Large‑scale dataset suitable for analytics

🧩 Stored Procedures (Q41–Q45)
Retrieve customer orders

Retrieve products by category

Calculate customer total sales

Retrieve orders between dates

Get low‑stock products

🔥 Triggers (Q46–Q50)
Reduce inventory after order

Increase inventory after return

Prevent negative order amount

Auto‑update inventory timestamp

Log payment transactions into PaymentAudit

📊 Analytical SQL Queries (Q1–Q50)
Includes:

🔹 Basic Retrieval
Customers, products, employees, orders, returns, inventory

🔹 Joins
Customer–orders, product–supplier, employee–department

🔹 Aggregations
Revenue, quantity sold, monthly sales, category counts

🔹 Subqueries
Products never ordered, customers without orders

🔹 Window Functions
Ranking products by sales amount

🔹 CTEs
Category‑wise product counts

🔹 Stored Procedure Execution
CALL statements for Q41–Q45

📁 Recommended Folder Structure
Code
SalesManagementDB/
│── schema.sql
│── analytics.sql
│── README.md


🚀 How to Run the Project
1️⃣ Install MySQL & MySQL Workbench
2️⃣ Create the database
Code
CREATE DATABASE SalesManagementDB;
USE SalesManagementDB;
3️⃣ Execute analytical queries
Run queries from analytics.sql to generate insights.

📈 Sample Insights
Top‑selling products

Highest revenue region

Most active customers

Payment method distribution

Monthly sales trends

Inventory shortage alerts

Supplier contribution analysis

👩‍💻 Author
Ritika  
SQL Developer | Data Analyst | MySQL Enthusiast
Chennai, Tamil Nadu, India
