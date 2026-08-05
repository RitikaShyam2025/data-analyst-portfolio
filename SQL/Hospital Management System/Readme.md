🏥 Hospital Database Management & Analytics System

A comprehensive SQL-based Hospital Management & Analytics System built using MySQL.
This project includes complete database design, data generation using stored procedures, and 50+ analytical SQL queries covering all major hospital operations.

📌 Project Overview
This project simulates a real-world hospital environment with modules for:

Patient Management

Doctor & Department Management

Appointments

Admissions & Rooms

Treatments & Prescriptions

Pharmacy & Suppliers

Billing & Payments

Laboratory Tests

Analytics & Reporting

The database is populated with thousands of realistic records using stored procedures, making it ideal for:

SQL practice

Data analytics learning

Portfolio projects

Academic submissions

🛠️ Technologies Used

Technology	          Purpose
MySQL	Database        engine
SQL	                  Querying & analytics
MySQL Workbench	      Modeling & execution


🗂️ Database Schema
This project contains the following tables:

departments

doctors

patients

nurses

room_types

rooms

appointments

admissions

treatments

suppliers

medicines

prescriptions

bills

payments

lab_tests

These tables are fully normalized and connected using foreign keys.

🔗 Entity Relationship Highlights
One department → many doctors

One patient → many appointments

One appointment → one treatment → many prescriptions

One patient → many lab tests

One room type → many rooms

One bill → one payment

One supplier → many medicines

🧪 Data Generation (Stored Procedures)
This project includes auto‑data‑generation procedures:

GeneratePatients() → 2000 patients

GenerateNurses() → 250 nurses

GenerateAppointments() → 1200 appointments

GenerateAdmissions() → 350 admissions

GenerateTreatments() → 700 treatments

GeneratePrescriptions() → 900 prescriptions

GenerateBills() → 800 bills

GeneratePayments() → 800 payments

GenerateLabTests() → 700 lab tests

These procedures create realistic, randomized data for analytics.

📊 Analytical SQL Queries (50+)
This project includes 50 categorized SQL queries, such as:

🔹 Basic Retrieval
List all patients, doctors, medicines

Filter by gender, experience, stock, blood group

🔹 Joins
Patient–Appointment details

Doctor–Department mapping

Room–RoomType mapping

🔹 Aggregations
Count patients, doctors, rooms

Group by city, blood group, payment status

Average treatment cost

Highest bill, lowest medicine price

🔹 Subqueries
Bills above average

Doctors with maximum experience

🔹 Window Functions
Rank doctors by experience

Row numbers partitioned by city

🔹 CTEs
Department-wise doctor count

🔹 Views
PatientAppointmentSummary

DoctorDepartmentSummary

📁 Folder Structure (Recommended)
Code
HospitalDB/
│── schema.sql               # All CREATE TABLE statements
│── data_inserts.sql         # Insert statements
│── procedures.sql           # Stored procedures for data generation
│── analytics.sql            # 50+ analytical queries
│── README.md                # Project documentation
🚀 How to Run the Project
1️⃣ Install MySQL & MySQL Workbench
2️⃣ Create the database
sql
CREATE DATABASE HospitalDB;
USE HospitalDB;
3️⃣ Import SQL files
Load schema, inserts, and procedures.

4️⃣ Run stored procedures
Example:

sql
CALL GeneratePatients();
CALL GenerateAppointments();
5️⃣ Execute analytical queries
Run queries from analytics.sql to generate insights.

📈 Sample Insights
Most experienced doctor

Most common diagnosis

Highest revenue month

Most prescribed medicine

City with highest patient count

Payment method distribution

Room occupancy analytics

👩‍💻 Author
Ritika  
SQL Developer | Data Analyst | MySQL Enthusiast
Chennai, Tamil Nadu, India

🎯 Conclusion
This Hospital Database Management & Analytics System is a complete SQL project demonstrating:

Strong database design

Realistic data generation

Advanced SQL analytics

Practical healthcare domain modeling
