-- ============================================================
-- UNIVERSITY STUDENT ACADEMIC MANAGEMENT SYSTEM - SCHEMA.SQL
-- ============================================================

-- Create Database
CREATE DATABASE IF NOT EXISTS UniversityAcademicDB;
USE UniversityAcademicDB;

-- ============================================================
-- 1. DEPARTMENTS
-- ============================================================
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- ============================================================
-- 2. STUDENTS
-- ============================================================
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    City VARCHAR(100),
    AdmissionYear INT,
    CGPA DECIMAL(3,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- ============================================================
-- 3. PROFESSORS
-- ============================================================
CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    ProfessorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Designation VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- ============================================================
-- 4. COURSES
-- ============================================================
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseCode VARCHAR(20) UNIQUE,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT,
    DepartmentID INT,
    ProfessorID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- ============================================================
-- 5. ENROLLMENTS
-- ============================================================
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    AcademicYear INT,
    Semester VARCHAR(20),
    Status VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ============================================================
-- 6. EXAMS
-- ============================================================
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    CourseID INT,
    ExamDate DATE,
    ExamType VARCHAR(50),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ============================================================
-- 7. EXAM RESULTS
-- ============================================================
CREATE TABLE ExamResults (
    ResultID INT PRIMARY KEY,
    ExamID INT,
    StudentID INT,
    Marks DECIMAL(5,2),
    Grade VARCHAR(5),
    ResultStatus VARCHAR(20),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ============================================================
-- 8. ATTENDANCE
-- ============================================================
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    AttendancePercentage DECIMAL(5,2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ============================================================
-- 9. SCHOLARSHIPS
-- ============================================================
CREATE TABLE Scholarships (
    ScholarshipID INT PRIMARY KEY,
    StudentID INT,
    ScholarshipType VARCHAR(100),
    Amount DECIMAL(10,2),
    AwardYear INT,
    Status VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ============================================================
-- 10. FEES
-- ============================================================
CREATE TABLE Fees (
    FeeID INT PRIMARY KEY,
    StudentID INT,
    FeeType VARCHAR(100),
    Amount DECIMAL(10,2),
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ============================================================
-- END OF SCHEMA
-- ============================================================
