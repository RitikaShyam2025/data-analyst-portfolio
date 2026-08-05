-- ============================================
-- ANALYTICAL SQL QUERIES (Q1 – Q50)
-- ============================================


-- ============================
-- Q1: List all patients
-- ============================
SELECT * FROM patients;

-- Q2: List all doctors
SELECT * FROM doctors;

-- Q3: List all departments
SELECT * FROM departments;

-- Q4: List all medicines
SELECT * FROM medicines;

-- Q5: Male patients
SELECT * FROM patients WHERE gender = 'Male';

-- Q6: Doctors with >10 years experience
SELECT * FROM doctors WHERE experience_years > 10;

-- Q7: Available rooms
SELECT * FROM rooms WHERE status = 'Available';

-- Q8: Paid bills
SELECT * FROM bills WHERE payment_status = 'Paid';

-- Q9: Doctors sorted by experience
SELECT * FROM doctors ORDER BY experience_years DESC;

-- Q10: First 10 patients
SELECT * FROM patients LIMIT 10;

-- Q11: Total patients count
SELECT COUNT(*) AS TotalPatients FROM patients;

-- Q12: Total doctors count
SELECT COUNT(*) AS TotalDoctors FROM doctors;

-- Q13: Distinct patient cities
SELECT DISTINCT city FROM patients;

-- Q14: Medicines priced above 500
SELECT * FROM medicines WHERE price > 500;

-- Q15: Appointments in 2025
SELECT * FROM appointments
WHERE appointment_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Q16: ICU room type details
SELECT * FROM room_types WHERE room_type_name = 'ICU';

-- Q17: Patients with blood group O+
SELECT * FROM patients WHERE blood_group = 'O+';

-- Q18: Pending bills
SELECT * FROM bills WHERE payment_status = 'Pending';

-- Q19: Medicines with low stock (<200)
SELECT * FROM medicines WHERE stock_quantity < 200;

-- Q20: Positive lab test results
SELECT * FROM lab_tests WHERE result = 'Positive';

-- Q21: Doctors with their departments
SELECT d.first_name, d.last_name, dp.department_name
FROM doctors d
JOIN departments dp ON d.department_id = dp.department_id;

-- Q22: Rooms with room type details
SELECT r.room_number, rt.room_type_name, rt.daily_charge
FROM rooms r
JOIN room_types rt ON r.room_type_id = rt.room_type_id;

-- Q23: Patient appointment details
SELECT p.first_name, p.last_name, a.appointment_date, a.status
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id;

-- Q24: Patient + Doctor + Appointment
SELECT p.first_name, p.last_name, d.first_name AS Doctor_Name, a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- Q25: Doctor count per department
SELECT department_id, COUNT(*) AS Total_Doctors
FROM doctors GROUP BY department_id;

-- Q26: Bills grouped by payment status
SELECT payment_status, COUNT(*) AS Total_Bills
FROM bills GROUP BY payment_status;

-- Q27: Patient count per city
SELECT city, COUNT(*) AS Total_Patients
FROM patients GROUP BY city
ORDER BY Total_Patients DESC;

-- Q28: Patient count per blood group
SELECT blood_group, COUNT(*) AS Total_Patients
FROM patients GROUP BY blood_group;

-- Q29: Room count by status
SELECT status, COUNT(*) AS Total_Rooms
FROM rooms GROUP BY status;

-- Q30: Medicine count per supplier
SELECT supplier_id, COUNT(*) AS Total_Medicines
FROM medicines GROUP BY supplier_id;

-- Q31: Average treatment cost
SELECT AVG(treatment_cost) AS Average_Treatment_Cost
FROM treatments;

-- Q32: Highest bill amount
SELECT MAX(total_amount) AS Highest_Bill
FROM bills;

-- Q33: Lowest medicine price
SELECT MIN(price) AS Lowest_Medicine_Price
FROM medicines;

-- Q34: Total payment received
SELECT SUM(amount_paid) AS Total_Payment_Received
FROM payments;

-- Q35: Appointment count per doctor
SELECT doctor_id, COUNT(*) AS Total_Appointments
FROM appointments
GROUP BY doctor_id
ORDER BY Total_Appointments DESC;

-- ============================
-- Q36: Patients with more than 1 visit
-- ============================
SELECT patient_id, COUNT(*) AS Total_Visits
FROM appointments
GROUP BY patient_id
HAVING COUNT(*) > 1;

-- ============================
-- Q37: Average doctor experience per department
-- ============================
SELECT department_id, AVG(experience_years) AS Average_Experience
FROM doctors
GROUP BY department_id;

-- ============================
-- Q38: Room count per room type
-- ============================
SELECT room_type_id, COUNT(*) AS Total_Rooms
FROM rooms
GROUP BY room_type_id;

-- ============================
-- Q39: Lab test count by result
-- ============================
SELECT result, COUNT(*) AS Total_Tests
FROM lab_tests
GROUP BY result;

-- ============================
-- Q40: Total collection by payment method
-- ============================
SELECT payment_method, SUM(amount_paid) AS Total_Collection
FROM payments
GROUP BY payment_method;

-- ============================
-- Q41: Total appointments per patient
-- ============================
SELECT p.patient_id, p.first_name, p.last_name,
       COUNT(a.appointment_id) AS Total_Appointments
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
ORDER BY Total_Appointments DESC;

-- ============================
-- Q42: Doctor count per department (with names)
-- ============================
SELECT d.department_id, dp.department_name,
       COUNT(d.doctor_id) AS Total_Doctors
FROM doctors d
JOIN departments dp ON d.department_id = dp.department_id
GROUP BY d.department_id, dp.department_name;

-- ============================
-- Q43: Bills above average amount (SUBQUERY)
-- ============================
SELECT *
FROM bills
WHERE total_amount > (SELECT AVG(total_amount) FROM bills);

-- ============================
-- Q44: Doctor with highest experience (SUBQUERY)
-- ============================
SELECT first_name, last_name, experience_years
FROM doctors
WHERE experience_years = (SELECT MAX(experience_years) FROM doctors);

-- ============================
-- Q45: Bill category using CASE
-- ============================
SELECT bill_id, total_amount,
       CASE
           WHEN total_amount >= 30000 THEN 'High Bill'
           WHEN total_amount >= 15000 THEN 'Medium Bill'
           ELSE 'Low Bill'
       END AS Bill_Category
FROM bills;

-- ============================
-- Q46: Rank doctors by experience (WINDOW)
-- ============================
SELECT doctor_id, first_name, experience_years,
       RANK() OVER (ORDER BY experience_years DESC) AS Experience_Rank
FROM doctors;

-- ============================
-- Q47: Row number per city (WINDOW)
-- ============================
SELECT patient_id, first_name, city,
       ROW_NUMBER() OVER (PARTITION BY city ORDER BY patient_id) AS Row_Num
FROM patients;

-- ============================
-- Q48: Department doctor count (CTE)
-- ============================
WITH DepartmentDoctorCount AS (
    SELECT department_id, COUNT(*) AS Total_Doctors
    FROM doctors
    GROUP BY department_id
)
SELECT * FROM DepartmentDoctorCount;

-- ============================
-- Q49: View - Patient Appointment Summary
-- ============================
CREATE VIEW PatientAppointmentSummary AS
SELECT p.patient_id, p.first_name,
       COUNT(a.appointment_id) AS Total_Appointments
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.first_name;

-- ============================
-- Q50: View - Doctor Department Summary
-- ============================
CREATE VIEW DoctorDepartmentSummary AS
SELECT d.doctor_id,
       CONCAT(d.first_name,' ',d.last_name) AS Doctor_Name,
       dp.department_name,
       d.experience_years
FROM doctors d
JOIN departments dp ON d.department_id = dp.department_id;
