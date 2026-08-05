-- ============================
-- INSERT: Departments
-- ============================

INSERT INTO departments (department_name, location, phone) VALUES
('Cardiology','Block A','044-4001001'),
('Neurology','Block B','044-4001002'),
('Orthopedics','Block C','044-4001003'),
('Pediatrics','Block D','044-4001004'),
('Dermatology','Block E','044-4001005'),
('General Medicine','Block F','044-4001006'),
('Gynecology','Block G','044-4001007'),
('ENT','Block H','044-4001008'),
('Oncology','Block I','044-4001009'),
('Radiology','Block J','044-4001010');

-- ============================
-- INSERT: Room Types
-- ============================

INSERT INTO room_types (room_type_name, daily_charge) VALUES
('General Ward',1000),
('Semi Private',2500),
('Private',5000),
('ICU',10000),
('Deluxe',8000);

-- ============================
-- INSERT: Suppliers
-- ============================

INSERT INTO suppliers (supplier_name, phone, city) VALUES
('MediLife Pharma','9876500001','Chennai'),
('Apollo Medical','9876500002','Chennai'),
('HealthCare Pharma','9876500003','Coimbatore'),
('CureMed Suppliers','9876500004','Madurai'),
('LifeLine Pharma','9876500005','Salem'),
('Prime Medical','9876500006','Trichy'),
('WellCare Pharma','9876500007','Erode'),
('Global Medics','9876500008','Vellore'),
('Sri Pharma','9876500009','Tirunelveli'),
('Sun Healthcare','9876500010','Chennai'),
('Elite Medical','9876500011','Madurai'),
('City Pharma','9876500012','Coimbatore'),
('CarePlus','9876500013','Trichy'),
('Healthy Life','9876500014','Salem'),
('Nova Medics','9876500015','Erode'),
('Apex Pharma','9876500016','Chennai'),
('Good Health','9876500017','Vellore'),
('Royal Medical','9876500018','Madurai'),
('BioCare','9876500019','Chennai'),
('Medi World','9876500020','Trichy'),
('Trust Pharma','9876500021','Coimbatore'),
('Vision Healthcare','9876500022','Erode'),
('Best Medics','9876500023','Salem'),
('Max Pharma','9876500024','Chennai'),
('Evergreen Pharma','9876500025','Madurai'),
('Unity Medical','9876500026','Trichy'),
('Life Cure','9876500027','Vellore'),
('Hope Pharma','9876500028','Salem'),
('Secure Medics','9876500029','Coimbatore'),
('Care Pharma','9876500030','Chennai');

-- ============================
-- INSERT: Doctors (Batch 1)
-- ============================

INSERT INTO doctors
(first_name, last_name, gender, specialization, experience_years, phone, email, department_id)
VALUES
('Arun','Kumar','Male','Cardiology',12,'9876000001','arun.kumar@hospital.com',1),
('Priya','Sharma','Female','Neurology',10,'9876000002','priya.sharma@hospital.com',2),
('Rahul','Verma','Male','Orthopedics',8,'9876000003','rahul.verma@hospital.com',3),
('Sneha','Reddy','Female','Pediatrics',6,'9876000004','sneha.reddy@hospital.com',4),
('Vikram','Singh','Male','Dermatology',15,'9876000005','vikram.singh@hospital.com',5),
('Anitha','Raj','Female','General Medicine',9,'9876000006','anitha.raj@hospital.com',6),
('Karthik','Narayan','Male','Gynecology',11,'9876000007','karthik.narayan@hospital.com',7),
('Meena','Joseph','Female','ENT',7,'9876000008','meena.joseph@hospital.com',8),
('Suresh','Babu','Male','Oncology',14,'9876000009','suresh.babu@hospital.com',9),
('Divya','Krishnan','Female','Radiology',5,'9876000010','divya.krishnan@hospital.com',10);

-- ============================
-- INSERT: Doctors (Batch 2)
-- ============================

INSERT INTO doctors
(first_name, last_name, gender, specialization, experience_years, phone, email, department_id)
VALUES
('Ramesh','Iyer','Male','Cardiology',18,'9876000011','ramesh.iyer@hospital.com',1),
('Lakshmi','Menon','Female','Neurology',9,'9876000012','lakshmi.menon@hospital.com',2),
('Ajith','Kumar','Male','Orthopedics',13,'9876000013','ajith.kumar@hospital.com',3),
('Nisha','Patel','Female','Pediatrics',7,'nisha.patel@hospital.com',4),
('Ganesh','Rao','Male','Dermatology',16,'9876000015','ganesh.rao@hospital.com',5),
('Keerthana','Mohan','Female','General Medicine',11,'9876000016','keerthana.mohan@hospital.com',6),
('Praveen','Das','Male','Gynecology',8,'9876000017','praveen.das@hospital.com',7),
('Shalini','Nair','Female','ENT',12,'9876000018','shalini.nair@hospital.com',8),
('Harish','Balan','Male','Oncology',10,'9876000019','harish.balan@hospital.com',9),
('Pooja','Srinivasan','Female','Radiology',6,'9876000020','pooja.srinivasan@hospital.com',10);

-- ============================
-- INSERT: Doctors (Batch 3)
-- ============================

INSERT INTO doctors
(first_name, last_name, gender, specialization, experience_years, phone, email, department_id)
VALUES
('Sathish','Kumar','Male','Cardiology',14,'9876000021','sathish.kumar@hospital.com',1),
('Anjali','Ravi','Female','Neurology',9,'9876000022','anjali.ravi@hospital.com',2),
('Vignesh','Prasad','Male','Orthopedics',11,'9876000023','vignesh.prasad@hospital.com',3),
('Kavya','Suresh','Female','Pediatrics',7,'kavya.suresh@hospital.com',4),
('Manoj','Krishnan','Male','Dermatology',15,'9876000025','manoj.krishnan@hospital.com',5),
('Deepa','Raman','Female','General Medicine',10,'9876000026','deepa.raman@hospital.com',6),
('Saravanan','Bose','Male','Gynecology',13,'9876000027','saravanan.bose@hospital.com',7),
('Revathi','Kannan','Female','ENT',8,'revathi.kannan@hospital.com',8),
('Dinesh','Rajan','Male','Oncology',17,'9876000029','dinesh.rajan@hospital.com',9),
('Aarthi','Selvam','Female','Radiology',6,'9876000030','aarthi.selvam@hospital.com',10);

-- ============================
-- INSERT: Medicines (Batch 1)
-- ============================

INSERT INTO medicines
(medicine_name, supplier_id, price, stock_quantity, expiry_date)
VALUES
('Paracetamol 500mg',1,25.50,500,'2028-12-31'),
('Amoxicillin 250mg',2,85.00,300,'2028-11-30'),
('Metformin 500mg',3,120.00,250,'2029-01-15'),
('Aspirin 75mg',4,40.00,400,'2028-10-20'),
('Cetirizine 10mg',5,35.00,350,'2028-09-25'),
('Azithromycin 500mg',6,180.00,200,'2029-03-31'),
('Ibuprofen 400mg',7,65.00,450,'2028-08-15'),
('Pantoprazole 40mg',8,95.00,320,'2029-05-10'),
('Vitamin C 500mg',9,55.00,600,'2029-07-01'),
('Dolo 650mg',10,30.00,550,'2028-12-15');

-- ============================
-- INSERT: Rooms
-- ============================

INSERT INTO rooms (room_number, room_type_id, status)
VALUES
('R101',1,'Available'),
('R102',1,'Occupied'),
('R103',1,'Available'),
('R104',2,'Occupied'),
('R105',2,'Available'),
('R106',3,'Maintenance'),
('R107',3,'Available'),
('R108',4,'Occupied'),
('R109',5,'Available'),
('R110',5,'Occupied'),
('R111',1,'Available'),
('R112',1,'Occupied'),
('R113',2,'Available'),
('R114',2,'Occupied'),
('R115',3,'Available'),
('R116',3,'Occupied'),
('R117',4,'Available'),
('R118',4,'Occupied'),
('R119',5,'Available'),
('R120',5,'Maintenance');
