University Student Academic Management System (USAMS)
A complete SQL‑based University Academic Management & Analytics System built using MySQL.

This project includes full database design, 10 CSV datasets (3,070 records), 50 SQL queries (Basic → Intermediate → Advanced), views, stored procedures, and triggers — covering all major university academic operations.

📌 Project Overview
The University Student Academic Management System (USAMS) simulates a real university environment with modules for:

Student Information Management

Department & Professor Management

Course Catalog & Academic Structure

Enrollments & Academic Tracking

Exams & Exam Results

Attendance Monitoring

Scholarships & Financial Aid

Fee Management

Academic Analytics & Reporting

The database is fully normalized, uses primary & foreign keys for integrity, and supports complex analytical queries for academic insights.

🛠️ Technologies Used
Technology	Purpose
MySQL	Database engine
SQL	Querying, analytics, procedures, triggers
MySQL Workbench	Modeling & execution
CSV datasets	Bulk import of academic records


🗂️ Dataset Overview (10 CSV Files)
Table	Records
departments	10
students	500
professors	80
courses	100
enrollments	900
exams	250
exam_results	600
attendance	400
scholarships	80
fees	150
Total	3,070 records


📥 Recommended Import Order
To maintain foreign‑key consistency:

departments

students

professors

courses

enrollments

exams

exam_results

attendance

scholarships

fees

🔗 Entity Relationship Highlights
Department Relationships
departments → students

departments → professors

departments → courses

Course & Teaching
professors → courses

Student Academic Flow
students → enrollments

courses → enrollments

courses → exams

exams → exam_results

students → exam_results

students → attendance

courses → attendance

Financial & Aid
students → scholarships

students → fees

🎯 Project Objective
“The main objective of this project is to design and implement a University Student Academic Management System database using MySQL.
The system efficiently manages student records, departments, professors, courses, enrollments, examinations, results, attendance, scholarships, and fee records — ensuring data integrity, reducing redundancy, and enabling powerful academic analytics.”

📘 SQL Coverage (Q1–Q50)
BASIC SQL (Q1–Q20)
Covers:

Student, professor, department retrieval

Filtering (CGPA, gender, city, admission year)

Sorting & limiting

Aggregations (COUNT, SUM, AVG, MAX, MIN)

Fee & scholarship queries

Exam result filtering

INTERMEDIATE SQL (Q21–Q40)
Includes:

Department‑wise student/professor/course counts

Average CGPA by department

Joins across Students, Departments, Professors, Courses

Enrollment analytics

Scholarship & fee summaries

Exam performance metrics

Attendance filtering

Subqueries (CGPA > overall average)

ADVANCED SQL (Q41–Q50)
Includes:

Window functions (RANK, DENSE_RANK)

CTEs for ranking & department averages

Course enrollment ranking

Student performance classification

Academic performance aggregation

Views (StudentAcademicSummary)

Stored procedure (GetStudentPerformance)

Trigger (prevent invalid fee insert)

Overall performance score & ranking

🔧 Stored Procedures
GetStudentPerformance
Returns:

Student details

Department

Courses enrolled

Average exam marks

Average attendance

🔥 Triggers
BeforeFeeInsert
Prevents inserting fee records with amount ≤ 0.

🧩 Views
StudentAcademicSummary
Summarizes:

Student details

Department

CGPA

Average marks

Average attendance

📊 Analytical Insights You Can Generate
Top students by CGPA

Department‑wise academic strength

Course enrollment trends

Exam performance distribution

Attendance‑based risk alerts

Scholarship allocation patterns

Fee payment status analysis

Overall student performance ranking

📁 Recommended Folder Structure
Code
UniversityAcademicDB/
│── schema.sql
│── analytics.sql
│── procedures.sql
│── triggers.sql
│── README.md
│── data/
│     ├── departments.csv
│     ├── students.csv
│     ├── professors.csv
│     ├── courses.csv
│     ├── enrollments.csv
│     ├── exams.csv
│     ├── exam_results.csv
│     ├── attendance.csv
│     ├── scholarships.csv
│     └── fees.csv
🚀 How to Run the Project
1️⃣ Install MySQL & MySQL Workbench
2️⃣ Create the database
sql
CREATE DATABASE UniversityAcademicDB;
USE UniversityAcademicDB;
3️⃣ Import CSV files
Follow the recommended order.

4️⃣ Execute schema.sql
Creates all tables with foreign keys.

5️⃣ Run analytics.sql
Generates academic insights.

👩‍💻 Author
Ritika  
SQL Developer | Data Analyst | MySQL Enthusiast
Chennai, Tamil Nadu, India
