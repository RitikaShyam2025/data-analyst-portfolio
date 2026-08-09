📘 Sales Management System using MySQL
A complete relational database project designed to manage customers, products, orders, payments, returns, inventory, suppliers, employees, and logistics.
This project demonstrates database design, SQL queries, stored procedures, triggers, and analytics for real‑world sales operations.

📌 Project Overview
The Sales Management System is built to streamline and automate core sales processes:

Customer management

Product catalog & categories

Supplier management

Order processing

Payment tracking

Returns & refunds

Inventory control

Employee & department management

Regional & shipping operations

The database is normalized, fully relational, and includes constraints, foreign keys, triggers, and stored procedures.

🎯 Project Objective
To develop a robust MySQL‑based Sales Management System capable of:

Efficiently storing and retrieving sales‑related data

Ensuring data accuracy using constraints, triggers, and procedures

Supporting analytical queries for business insights

Demonstrating advanced SQL concepts for academic or professional use

🏗️ Database Structure
Main Entities
Customers

Products

Categories & SubCategories

Suppliers

Orders

OrderDetails

Payments

Returns

Inventory

Employees

Departments

Regions

Shippers

PaymentMethods

PaymentAudit (trigger‑based logging)

Key Features
Fully normalized schema

Strong referential integrity

CHECK constraints for data validation

ENUM fields for controlled values

Auto‑update triggers

Stored procedures for reusable operations

## 🔧 Data Generation

All INSERT statements in this project were generated using custom Python data generators. 
These scripts automatically produced realistic sample data for Customers, Suppliers, Products, 
Orders, Payments, Returns, and Inventory. The generators ensured valid formats, randomized values, 
and consistency with all foreign key constraints.

This automated approach allowed the creation of a large, high‑quality dataset suitable for 
testing, analytics, and demonstration purposes.


📂 Project Files
File	Description
schema.sql	All CREATE TABLE statements with constraints & relationships
analytics.sql	50 analytical SQL queries (basic → advanced)


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

📊 Analytics (Q1–Q50)
Includes:

Basic Queries
Customer lists

Product filters

Salary, price, stock analytics

Intermediate Queries
Joins (customer–orders, product–supplier, employee–department)

Grouping & aggregation

Best‑selling products

Revenue by payment method

Monthly sales summary

Advanced Queries
Subqueries

Window functions (RANK)

CTEs

Stored procedure execution

👩‍💻 Author
Name: Ritika
College: [Add your college name]  
GitHub: [Add your GitHub URL]
