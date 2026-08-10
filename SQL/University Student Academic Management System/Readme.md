🎓 University Student Academic Management System (USAMS)
A complete SQL‑based University Academic & Analytics System built using MySQL.

This project includes full database design, 10 CSV datasets (3,070 records), stored procedures, triggers, and 50 analytical SQL queries covering all major academic operations.

📌 Project Overview
This project simulates a real‑world university academic environment with modules for:

Student Management

Professor & Department Management

Course Catalog

Enrollments & Academic Records

Exams & Results

Attendance Tracking

Scholarships & Financial Aid

Fee Management

Academic Analytics & Reporting

The database is populated with 3,070 realistic records across 10 CSV files, making it ideal for:

SQL practice

Data analytics learning

Portfolio projects

Academic submissions

End‑to‑end database design demonstrations

🛠️ Technologies Used
Technology	Purpose
MySQL	Database engine
SQL	Querying, analytics, procedures, triggers
MySQL Workbench	Modeling & execution
CSV datasets	Bulk data import for realistic academic records


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
To maintain foreign‑key consistency, import CSVs in this order:

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
Department‑based relationships
departments.DepartmentID → students.DepartmentID

departments.DepartmentID → professors.DepartmentID

departments.DepartmentID → courses.DepartmentID

Course & Teaching relationships
professors.ProfessorID → courses.ProfessorID

Student Academic Flow
students.StudentID → enrollments.StudentID

courses.CourseID → enrollments.CourseID

courses.CourseID → exams.CourseID

exams.ExamID → exam_results.ExamID

students.StudentID → exam_results.StudentID

students.StudentID → attendance.StudentID

courses.CourseID → attendance.CourseID

Financial & Scholarship relationships
students.StudentID → scholarships.StudentID

students.StudentID → fees.StudentID

🧩 Database Modules
1. Academic Structure
Departments

Professors

Courses

2. Student Lifecycle
Student registration

Course enrollments

Attendance tracking

Exam participation

Result generation

3. Financial & Aid
Scholarships

Fee payments

4. Analytics
Academic performance

Department‑wise metrics

Course popularity

Attendance trends

Scholarship distribution

🔧 Stored Procedures (Q41–Q45)
Includes procedures for:

Retrieving student academic history

Fetching courses offered by a department

Calculating student GPA / total marks

Listing exams within a date range

Identifying students with low attendance

🔥 Triggers (Q46–Q50)
Includes triggers for:

Auto‑updating attendance percentage

Preventing duplicate exam entries

Validating fee payments

Logging exam result updates

Scholarship eligibility checks

📊 Analytical SQL Queries (Q1–Q50)
Basic Retrieval
Students, professors, courses, departments

Exam schedules, attendance records

Joins
Student–department

Professor–course

Course–enrollment

Exam–result

Aggregations
Department‑wise student count

Course enrollment statistics

Exam performance summaries

Attendance averages

Subqueries
Students not enrolled in any course

Courses with no exams

Students without scholarships

Window Functions
Ranking students by GPA

Ranking courses by enrollment count

CTEs
Department‑wise course distribution

Semester‑wise academic performance

Stored Procedure Execution
CALL statements for Q41–Q45

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

📈 Sample Insights You Can Generate
Top‑performing students

Most enrolled courses

Department with highest pass percentage

Students with perfect attendance

Scholarship distribution by department

Fee payment trends

Professor teaching load

Course difficulty analysis (based on exam results)

👩‍💻 Author
Ritika  
SQL Developer | Data Analyst | MySQL Enthusiast
Chennai, Tamil Nadu, India
