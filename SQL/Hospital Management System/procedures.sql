-- ============================================
-- PROCEDURE: GeneratePatients (2000 patients)
-- ============================================

DELIMITER $$

CREATE PROCEDURE GeneratePatients()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 2000 DO
        INSERT INTO patients
        (
            first_name,
            last_name,
            gender,
            date_of_birth,
            blood_group,
            phone,
            email,
            address,
            city
        )
        VALUES
        (
            CONCAT('Patient', i),
            CONCAT('LN', i),
            ELT(FLOOR(1 + RAND()*3), 'Male','Female','Other'),
            DATE_ADD('1970-01-01', INTERVAL FLOOR(RAND()*18000) DAY),
            ELT(FLOOR(1 + RAND()*8), 'A+','A-','B+','B-','AB+','AB-','O+','O-'),
            CONCAT('9', LPAD(i,9,'0')),
            CONCAT('patient',i,'@gmail.com'),
            CONCAT(FLOOR(1+RAND()*999), ' Main Street'),
            ELT(FLOOR(1 + RAND()*10),
                'Chennai','Coimbatore','Madurai','Salem','Trichy',
                'Erode','Vellore','Tirunelveli','Thoothukudi','Karur')
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


-- ============================================
-- PROCEDURE: GenerateNurses (250 nurses)
-- ============================================

DELIMITER $$

CREATE PROCEDURE GenerateNurses()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 250 DO
        INSERT INTO nurses
        (
            first_name,
            last_name,
            gender,
            phone,
            department_id
        )
        VALUES
        (
            CONCAT('Nurse', i),
            CONCAT('LN', i),
            ELT(FLOOR(1 + RAND()*3), 'Male','Female','Other'),
            CONCAT('8', LPAD(i,9,'0')),
            FLOOR(1 + RAND()*10)
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


-- ============================================
-- PROCEDURE: GenerateAppointments (1200 appointments)
-- ============================================

DELIMITER $$

CREATE PROCEDURE GenerateAppointments()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 1200 DO
        INSERT INTO appointments
        (
            patient_id,
            doctor_id,
            appointment_date,
            appointment_time,
            status
        )
        VALUES
        (
            FLOOR(1 + RAND()*2000),
            FLOOR(1 + RAND()*100),
            DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND()*365) DAY),
            MAKETIME(FLOOR(9 + RAND()*9), FLOOR(RAND()*60), 0),
            ELT(FLOOR(1 + RAND()*3), 'Scheduled','Completed','Cancelled')
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


-- ============================================
-- PROCEDURE: GenerateAdmissions (350 admissions)
-- ============================================

DELIMITER $$

CREATE PROCEDURE GenerateAdmissions()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE adm_date DATE;
    DECLARE stay_days INT;

    WHILE i <= 350 DO
        SET adm_date = DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND()*365) DAY);
        SET stay_days = FLOOR(2 + RAND()*9);

        INSERT INTO admissions
        (
            patient_id,
            room_id,
            admission_date,
            discharge_date
        )
        VALUES
        (
            FLOOR(1 + RAND()*2000),
            FLOOR(1 + RAND()*20),
            adm_date,
            DATE_ADD(adm_date, INTERVAL stay_days DAY)
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


-- ============================================
-- PROCEDURE: GenerateTreatments (700 treatments)
-- ============================================

DELIMITER $$

CREATE PROCEDURE GenerateTreatments()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 700 DO
        INSERT INTO treatments
        (
            appointment_id,
            diagnosis,
            treatment_description,
            treatment_cost
        )
        VALUES
        (
            FLOOR(1 + RAND()*1200),
            ELT(FLOOR(1 + RAND()*10),
                'Fever','Diabetes','Hypertension','Asthma','Migraine',
                'Fracture','Skin Allergy','COVID-19','Gastritis','Viral Infection'),
            ELT(FLOOR(1 + RAND()*10),
                'Medication Prescribed','Physiotherapy','Surgery Recommended',
                'Blood Test','X-Ray','MRI Scan','Diet Plan','Regular Checkup',
                'Injection Given','Observation'),
            ROUND(500 + RAND()*19500,2)
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


-- ============================================
-- PROCEDURE: GeneratePrescriptions (900 prescriptions)
-- ============================================

DELIMITER $$

CREATE PROCEDURE GeneratePrescriptions()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 900 DO
        INSERT INTO prescriptions
        (
            treatment_id,
            medicine_id,
            dosage,
            duration_days
        )
        VALUES
        (
            FLOOR(1 + RAND()*700),
            FLOOR(1 + RAND()*50),
            ELT(FLOOR(1 + RAND()*8),
                '1 Tablet Once Daily','1 Tablet Twice Daily','2 Tablets Daily',
                '5 ml Twice Daily','10 ml Once Daily','1 Capsule Daily',
                'Injection Once','Apply Twice Daily'),
            FLOOR(3 + RAND()*12)
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


-- ============================================
-- PROCEDURE: GenerateBills (800 bills)
-- ============================================

DELIMITER $$

CREATE PROCEDURE GenerateBills()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 800 DO
        INSERT INTO bills
        (
            patient_id,
            bill_date,
            total_amount,
            payment_status
        )
        VALUES
        (
            FLOOR(1 + RAND()*2000),
            DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND()*365) DAY),
            ROUND(1000 + RAND()*49000,2),
            ELT(FLOOR(1 + RAND()*2), 'Paid','Pending')
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


-- ============================================
-- PROCEDURE: GeneratePayments (800 payments)
-- ============================================

DELIMITER $$

CREATE PROCEDURE GeneratePayments()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 800 DO
        INSERT INTO payments
        (
            bill_id,
            payment_date,
            payment_method,
            amount_paid
        )
        VALUES
        (
            FLOOR(1 + RAND()*800),
            DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND()*365) DAY),
            ELT(FLOOR(1 + RAND()*4), 'Cash','Card','UPI','Net Banking'),
            ROUND(1000 + RAND()*49000,2)
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;


-- ============================================
-- PROCEDURE: GenerateLabTests (700 lab tests)
-- ============================================

DELIMITER $$

CREATE PROCEDURE GenerateLabTests()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 700 DO
        INSERT INTO lab_tests
        (
            patient_id,
            doctor_id,
            test_name,
            test_date,
            result,
            test_cost
        )
        VALUES
        (
            FLOOR(1 + RAND()*2000),
            FLOOR(1 + RAND()*100),
            ELT(FLOOR(1 + RAND()*10),
                'Blood Test','Urine Test','X-Ray','MRI Scan','CT Scan',
                'ECG','Lipid Profile','Liver Function Test',
                'Kidney Function Test','COVID-19 Test'),
            DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND()*365) DAY),
            ELT(FLOOR(1 + RAND()*5),
                'Normal','Abnormal','Positive','Negative','Under Observation'),
            ROUND(500 + RAND()*9500,2)
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;
