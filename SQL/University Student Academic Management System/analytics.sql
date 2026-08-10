-- ============================================================
-- UniversityAcademicDB - analytics.sql
-- 50 Analytical SQL queries (Basic, Intermediate, Advanced)
-- ============================================================

-- =========================
-- BASIC QUERIES (Q1 - Q20)
-- =========================

-- Q1. Display all records from the Departments table.
SELECT * FROM Departments;

-- Q2. Display StudentID, StudentName, City, and CGPA of all students.
SELECT StudentID, StudentName, City, CGPA FROM Students;

-- Q3. Display all female students.
SELECT * FROM Students WHERE Gender = 'Female';

-- Q4. Find students whose CGPA is greater than 8.5.
SELECT StudentID, StudentName, CGPA FROM Students WHERE CGPA > 8.5;

-- Q5. Find students who were admitted in 2024.
SELECT StudentID, StudentName, AdmissionYear FROM Students WHERE AdmissionYear = 2024;

-- Q6. Display students who belong to Chennai.
SELECT StudentID, StudentName, City FROM Students WHERE City = 'Chennai';

-- Q7. Display all students in ascending order of their names.
SELECT StudentID, StudentName, City, CGPA FROM Students ORDER BY StudentName ASC;

-- Q8. Display the top 10 students based on CGPA.
SELECT StudentID, StudentName, CGPA FROM Students ORDER BY CGPA DESC LIMIT 10;

-- Q9. Display professors whose designation is Professor.
SELECT ProfessorID, ProfessorName, Specialization, Designation FROM Professors WHERE Designation = 'Professor';

-- Q10. Display courses having 4 credits.
SELECT CourseID, CourseCode, CourseName, Credits FROM Courses WHERE Credits = 4;

-- Q11. Find the total number of students.
SELECT COUNT(*) AS TotalStudents FROM Students;

-- Q12. Find the total number of professors.
SELECT COUNT(*) AS TotalProfessors FROM Professors;

-- Q13. Find the average CGPA of all students.
SELECT ROUND(AVG(CGPA),2) AS AverageCGPA FROM Students;

-- Q14. Find the highest CGPA among students.
SELECT MAX(CGPA) AS HighestCGPA FROM Students;

-- Q15. Find the lowest CGPA among students.
SELECT MIN(CGPA) AS LowestCGPA FROM Students;

-- Q16. Find the total number of courses.
SELECT COUNT(*) AS TotalCourses FROM Courses;

-- Q17. Find the total scholarship amount given to students.
SELECT SUM(Amount) AS TotalScholarshipAmount FROM Scholarships;

-- Q18. Find the total fee amount recorded in the Fees table.
SELECT SUM(Amount) AS TotalFeeAmount FROM Fees;

-- Q19. Display all fee records where the payment status is Paid.
SELECT * FROM Fees WHERE PaymentStatus = 'Paid';

-- Q20. Display all exam results where the result status is Pass.
SELECT * FROM ExamResults WHERE ResultStatus = 'Pass';

-- ==============================
-- INTERMEDIATE QUERIES (Q21 - Q40)
-- ==============================

-- Q21. Find the number of students in each department.
SELECT DepartmentID, COUNT(*) AS TotalStudents
FROM Students
GROUP BY DepartmentID;

-- Q22. Find the average CGPA of students in each department.
SELECT DepartmentID, ROUND(AVG(CGPA),2) AS AverageCGPA
FROM Students
GROUP BY DepartmentID;

-- Q23. Display department name along with the number of students in each department.
SELECT D.DepartmentID, D.DepartmentName, COUNT(S.StudentID) AS TotalStudents
FROM Departments D
LEFT JOIN Students S ON D.DepartmentID = S.DepartmentID
GROUP BY D.DepartmentID, D.DepartmentName;

-- Q24. Display each department and the number of professors working in it.
SELECT D.DepartmentID, D.DepartmentName, COUNT(P.ProfessorID) AS TotalProfessors
FROM Departments D
LEFT JOIN Professors P ON D.DepartmentID = P.DepartmentID
GROUP BY D.DepartmentID, D.DepartmentName;

-- Q25. Display each department and the number of courses offered by it.
SELECT D.DepartmentID, D.DepartmentName, COUNT(C.CourseID) AS TotalCourses
FROM Departments D
LEFT JOIN Courses C ON D.DepartmentID = C.DepartmentID
GROUP BY D.DepartmentID, D.DepartmentName;

-- Q26. Display departments whose average CGPA is greater than 8.5.
SELECT D.DepartmentID, D.DepartmentName, ROUND(AVG(S.CGPA),2) AS AverageCGPA
FROM Departments D
JOIN Students S ON D.DepartmentID = S.DepartmentID
GROUP BY D.DepartmentID, D.DepartmentName
HAVING AVG(S.CGPA) > 8.5;

-- Q27. Display each student's name along with their department name.
SELECT S.StudentID, S.StudentName, D.DepartmentName
FROM Students S
LEFT JOIN Departments D ON S.DepartmentID = D.DepartmentID;

-- Q28. Display professor name, specialization, and department name.
SELECT P.ProfessorID, P.ProfessorName, P.Specialization, D.DepartmentName
FROM Professors P
LEFT JOIN Departments D ON P.DepartmentID = D.DepartmentID;

-- Q29. Display course name along with the professor teaching the course.
SELECT C.CourseID, C.CourseName, P.ProfessorName
FROM Courses C
LEFT JOIN Professors P ON C.ProfessorID = P.ProfessorID;

-- Q30. Display course code, course name, and department name.
SELECT C.CourseCode, C.CourseName, D.DepartmentName
FROM Courses C
LEFT JOIN Departments D ON C.DepartmentID = D.DepartmentID;

-- Q31. Display student name, course name, academic year, semester, and enrollment status.
SELECT S.StudentName, C.CourseName, E.AcademicYear, E.Semester, E.Status
FROM Enrollments E
JOIN Students S ON E.StudentID = S.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;

-- Q32. Display students along with their scholarship details.
SELECT S.StudentName, SC.ScholarshipType, SC.Amount, SC.AwardYear, SC.Status
FROM Scholarships SC
JOIN Students S ON SC.StudentID = S.StudentID;

-- Q33. Display student name, fee type, amount, and payment status.
SELECT S.StudentName, F.FeeType, F.Amount, F.PaymentStatus
FROM Fees F
JOIN Students S ON F.StudentID = S.StudentID;

-- Q34. Find the total fee amount recorded for each student.
SELECT S.StudentID, S.StudentName, IFNULL(SUM(F.Amount),0) AS TotalFeeAmount
FROM Students S
LEFT JOIN Fees F ON S.StudentID = F.StudentID
GROUP BY S.StudentID, S.StudentName;

-- Q35. Find the total scholarship amount for each scholarship type.
SELECT ScholarshipType, SUM(Amount) AS TotalScholarshipAmount
FROM Scholarships
GROUP BY ScholarshipType;

-- Q36. Find the average marks obtained for each exam.
SELECT ExamID, ROUND(AVG(Marks),2) AS AverageMarks
FROM ExamResults
GROUP BY ExamID;

-- Q37. Find the number of students in each grade.
SELECT Grade, COUNT(*) AS TotalStudents
FROM ExamResults
GROUP BY Grade
ORDER BY TotalStudents DESC;

-- Q38. Display students whose attendance percentage is below 75%.
SELECT S.StudentID, S.StudentName, A.AttendancePercentage
FROM Students S
JOIN Attendance A ON S.StudentID = A.StudentID
WHERE A.AttendancePercentage < 75;

-- Q39. Find courses having more than 8 enrollments.
SELECT C.CourseID, C.CourseName, COUNT(E.EnrollmentID) AS TotalEnrollments
FROM Courses C
JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseID, C.CourseName
HAVING COUNT(E.EnrollmentID) > 8;

-- Q40. Find students whose CGPA is greater than the overall average CGPA.
SELECT StudentID, StudentName, CGPA
FROM Students
WHERE CGPA > (SELECT AVG(CGPA) FROM Students)
ORDER BY CGPA DESC;

-- ===========================
-- ADVANCED QUERIES (Q41 - Q50)
-- ===========================

-- Q41. Rank students within each department based on their CGPA.
SELECT
  S.StudentID,
  S.StudentName,
  D.DepartmentName,
  S.CGPA,
  DENSE_RANK() OVER (PARTITION BY S.DepartmentID ORDER BY S.CGPA DESC) AS DepartmentRank
FROM Students S
LEFT JOIN Departments D ON S.DepartmentID = D.DepartmentID
ORDER BY D.DepartmentName, DepartmentRank;

-- Q42. Find the top 3 students from each department based on CGPA.
WITH StudentRanking AS (
  SELECT
    S.StudentID,
    S.StudentName,
    S.DepartmentID,
    S.CGPA,
    DENSE_RANK() OVER (PARTITION BY S.DepartmentID ORDER BY S.CGPA DESC) AS StudentRank
  FROM Students S
)
SELECT SR.StudentID, SR.StudentName, D.DepartmentName, SR.CGPA, SR.StudentRank
FROM StudentRanking SR
LEFT JOIN Departments D ON SR.DepartmentID = D.DepartmentID
WHERE SR.StudentRank <= 3
ORDER BY D.DepartmentName, SR.StudentRank;

-- Q43. Rank courses based on the number of students enrolled.
SELECT
  C.CourseID,
  C.CourseName,
  COUNT(E.EnrollmentID) AS TotalEnrollments,
  DENSE_RANK() OVER (ORDER BY COUNT(E.EnrollmentID) DESC) AS EnrollmentRank
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseID, C.CourseName
ORDER BY EnrollmentRank;

-- Q44. Find students whose CGPA is higher than their department's average CGPA.
WITH DepartmentAverage AS (
  SELECT DepartmentID, AVG(CGPA) AS AverageCGPA
  FROM Students
  GROUP BY DepartmentID
)
SELECT S.StudentID, S.StudentName, D.DepartmentName, S.CGPA, ROUND(DA.AverageCGPA,2) AS DepartmentAverage
FROM Students S
JOIN DepartmentAverage DA ON S.DepartmentID = DA.DepartmentID
LEFT JOIN Departments D ON S.DepartmentID = D.DepartmentID
WHERE S.CGPA > DA.AverageCGPA
ORDER BY D.DepartmentName, S.CGPA DESC;

-- Q45. Classify students based on their attendance percentage.
SELECT
  S.StudentID,
  S.StudentName,
  A.AttendancePercentage,
  CASE
    WHEN A.AttendancePercentage >= 90 THEN 'Excellent'
    WHEN A.AttendancePercentage >= 75 THEN 'Good'
    WHEN A.AttendancePercentage >= 60 THEN 'Warning'
    ELSE 'Critical'
  END AS AttendanceCategory
FROM Students S
JOIN Attendance A ON S.StudentID = A.StudentID;

-- Q46. Display each student's academic performance including courses enrolled, average exam marks, and average attendance.
SELECT
  S.StudentID,
  S.StudentName,
  S.CGPA,
  COUNT(DISTINCT E.CourseID) AS CoursesEnrolled,
  ROUND(AVG(ER.Marks),2) AS AverageExamMarks,
  ROUND(AVG(A.AttendancePercentage),2) AS AverageAttendance
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
LEFT JOIN ExamResults ER ON S.StudentID = ER.StudentID
LEFT JOIN Attendance A ON S.StudentID = A.StudentID
GROUP BY S.StudentID, S.StudentName, S.CGPA
ORDER BY AverageExamMarks DESC;

-- Q47. Create a view named StudentAcademicSummary containing student academic performance details.
CREATE OR REPLACE VIEW StudentAcademicSummary AS
SELECT
  S.StudentID,
  S.StudentName,
  D.DepartmentName,
  S.CGPA,
  ROUND(AVG(ER.Marks),2) AS AverageMarks,
  ROUND(AVG(A.AttendancePercentage),2) AS AverageAttendance
FROM Students S
LEFT JOIN Departments D ON S.DepartmentID = D.DepartmentID
LEFT JOIN ExamResults ER ON S.StudentID = ER.StudentID
LEFT JOIN Attendance A ON S.StudentID = A.StudentID
GROUP BY S.StudentID, S.StudentName, D.DepartmentName, S.CGPA;

-- Q48. Create a stored procedure to display the performance of a specific student.
-- Procedure definition (run once)
DELIMITER $$
CREATE PROCEDURE GetStudentPerformance(IN p_StudentID INT)
BEGIN
  SELECT
    S.StudentID,
    S.StudentName,
    D.DepartmentName,
    S.CGPA,
    COUNT(DISTINCT E.CourseID) AS CoursesEnrolled,
    ROUND(AVG(ER.Marks),2) AS AverageExamMarks,
    ROUND(AVG(A.AttendancePercentage),2) AS AverageAttendance
  FROM Students S
  LEFT JOIN Departments D ON S.DepartmentID = D.DepartmentID
  LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
  LEFT JOIN ExamResults ER ON S.StudentID = ER.StudentID
  LEFT JOIN Attendance A ON S.StudentID = A.StudentID
  WHERE S.StudentID = p_StudentID
  GROUP BY S.StudentID, S.StudentName, D.DepartmentName, S.CGPA;
END$$
DELIMITER ;

-- Example call:
-- CALL GetStudentPerformance(1);

-- Q49. Create a trigger to prevent inserting a fee record with an amount less than or equal to zero.
DELIMITER $$
CREATE TRIGGER BeforeFeeInsert
BEFORE INSERT ON Fees
FOR EACH ROW
BEGIN
  IF NEW.Amount <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fee amount must be greater than zero';
  END IF;
END$$
DELIMITER ;

-- Q50. Calculate an overall performance score for each student using CGPA, average exam marks, and average attendance, and rank the students.
WITH StudentPerformance AS (
  SELECT
    S.StudentID,
    S.StudentName,
    COALESCE(S.CGPA,0) AS CGPA,
    ROUND(COALESCE(AVG(ER.Marks),0),2) AS AverageMarks,
    ROUND(COALESCE(AVG(A.AttendancePercentage),0),2) AS AverageAttendance
  FROM Students S
  LEFT JOIN ExamResults ER ON S.StudentID = ER.StudentID
  LEFT JOIN Attendance A ON S.StudentID = A.StudentID
  GROUP BY S.StudentID, S.StudentName, S.CGPA
),
PerformanceScore AS (
  SELECT
    StudentID,
    StudentName,
    CGPA,
    AverageMarks,
    AverageAttendance,
    ROUND(
      (CGPA * 10 * 0.40) + (AverageMarks * 0.40) + (AverageAttendance * 0.20),
      2
    ) AS PerformanceScore
  FROM StudentPerformance
)
SELECT
  StudentID,
  StudentName,
  CGPA,
  AverageMarks,
  AverageAttendance,
  PerformanceScore,
  DENSE_RANK() OVER (ORDER BY PerformanceScore DESC) AS OverallRank
FROM PerformanceScore
ORDER BY OverallRank;

-- ============================================================
-- End of analytics.sql
-- ============================================================
