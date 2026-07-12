📊 HR Analytics Dashboard | Power BI
📌 Project Overview
---------------------
The HR Analytics Dashboard is an end-to-end Power BI project designed to analyze workforce data and provide actionable insights into employee performance, attrition, salaries, and workforce demographics. The dashboard enables HR professionals and business leaders to make data-driven decisions through interactive reports and key performance indicators (KPIs).

🎯 Project Objectives
-----------------------
Analyze employee attrition trends.
Monitor workforce distribution across departments.
Evaluate salary distribution and employee demographics.
Track job satisfaction and work-life balance.
Provide interactive insights using filters and slicers.

🛠️ Tools & Technologies
------------------------
Power BI Desktop
Power Query
DAX (Data Analysis Expressions)
Data Modeling
Star Schema
Microsoft Excel (Dataset)

📂 Data Model
--------------
The project follows a Star Schema data model.
Fact Table
Fact_Employee
Dimension Tables
Dim_Date
Dim_Department
Dim_JobRole
Dim_AgeGroup
Dim_SalaryBand
Dim_Performance

Relationships are created using One-to-Many (1:*) relationships with Single Cross Filter Direction.

📈 Dashboard Pages
📄 Page 1 – Executive Summary
------------------------------
This page provides an overview of the organization's workforce through high-level KPIs and summary visualizations.

KPIs
----
Total Employees
Attrition Count
Attrition Rate
Average Salary

Visuals
-------
Attrition by Department
Average Salary by Salary Band
Employee Attrition Distribution
Department & Month Slicers

📄 Page 2 – Workforce Insights
------------------------------
This page focuses on detailed HR analytics and workforce performance.

KPIs
----
Active Employees
Average Experience
Average Job Satisfaction
Average Work-Life Balance

Visuals
-------
Attrition by Job Role
Attrition by Age Group
Performance Rating Distribution
Overtime vs Attrition

📊 DAX Measures Used
---------------------
Total Employees
Attrition Count
Attrition Rate
Active Employees
Average Salary
Average Experience
Average Job Satisfaction
Average Work-Life Balance
Employees with Overtime

✨ Key Features
-------------------
Interactive Dashboard
Dynamic KPIs
Star Schema Data Model
Power Query Data Transformation
DAX Calculations
Department & Month Slicers
Business-Oriented HR Insights
