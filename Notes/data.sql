-- =========================================================
-- COMPANY EMPLOYEE DATABASE
-- MySQL 8.x
-- 69 unique employee records: original 62 + 7 new records
-- Department, gender, and location are stored in master tables.
-- Salary / department / location are sample values where not supplied.
-- =========================================================

CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- Drop tables in child-to-parent order so this script can be rerun.
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS gender;
DROP TABLE IF EXISTS location;

CREATE TABLE department (
    empdepartmentid INT PRIMARY KEY,
    empdepartment VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE gender (
    empgenderid INT PRIMARY KEY,
    empgender VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE location (
    locationid INT PRIMARY KEY AUTO_INCREMENT,
    emplocation VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO department (empdepartmentid, empdepartment) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Sales'),
(105, 'Admin');

INSERT INTO gender (empgenderid, empgender) VALUES
(1, 'Male'),
(2, 'Female');

INSERT INTO location (emplocation) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Mumbai'),
('Delhi');

-- Normalized employee table: names are retrieved using JOINs.
CREATE TABLE employee (
    empid INT PRIMARY KEY,
    empname VARCHAR(100) NOT NULL,
    empmobile VARCHAR(15) NOT NULL,
    empgmail VARCHAR(150) NOT NULL UNIQUE,
    empdepartmentid INT NOT NULL,
    empgenderid INT NOT NULL,
    empsalary DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    locationid INT NOT NULL,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (empdepartmentid) REFERENCES department(empdepartmentid),
    CONSTRAINT fk_employee_gender
        FOREIGN KEY (empgenderid) REFERENCES gender(empgenderid),
    CONSTRAINT fk_employee_location
        FOREIGN KEY (locationid) REFERENCES location(locationid),
    CONSTRAINT chk_employee_salary CHECK (empsalary >= 0)
);

INSERT INTO employee
(empid, empname, empmobile, empgmail, empdepartmentid, empgenderid, empsalary, locationid)
VALUES
(1, 'Hafil A', '8925288126', 'hafilbari449@gmail.com', 101, 1, 45000, 1),
(2, 'Vinitha', '6383528294', 'vinitha.silent@gmail.com', 102, 2, 42000, 2),
(3, 'Deepshika', '6379175619', 'hellotodeepshikas@gmail.com', 103, 2, 40000, 3),
(4, 'Santhana Akshaya', '9150599613', 'akshayaram85@gmail.com', 101, 2, 43000, 1),
(5, 'Lakshmi Kanth R', '9025247069', 'lakshmikanth072005@gmail.com', 104, 1, 41000, 4),
(6, 'Vidhubala P', '7550084348', 'p.vidhubala93@gmail.com', 102, 2, 44000, 2),
(7, 'Parthes Waran', '9994820328', 'parthes445@gmail.com', 103, 1, 45000, 3),
(8, 'Hansika S', '6369123156', 'hansika.s@company.com', 101, 2, 45000, 1),
(9, 'Nisha V', '9626284578', 'nisha.v@company.com', 102, 2, 48000, 2),
(10, 'S. Thoufika', '9655924316', 's.thoufika@company.com', 103, 2, 47000, 3),
(11, 'Sharveshvar P', '6379179384', 'sharveshvar.p@company.com', 101, 1, 52000, 1),
(12, 'Veeramurugan V', '8754240907', 'veeramurugan.v@company.com', 104, 1, 50000, 4),
(13, 'Mahendra Babu K', '8940053320', 'mahendra.babu.k@company.com', 105, 1, 55000, 5),
(14, 'Saravana Selvan P', '6385500984', 'saravana.selvan.p@company.com', 102, 1, 46000, 2),
(15, 'Gunaseelan D', '8489035029', 'gunaseelan.d@company.com', 101, 1, 49000, 1),
(16, 'V. Surya Prakash', '9345554762', 'v.surya.prakash@company.com', 103, 1, 47000, 3),
(17, 'Jerosin RV', '6385928011', 'jerosin.rv@company.com', 104, 1, 53000, 4),
(18, 'Madhan S', '7397352262', 'madhan.s@company.com', 105, 1, 51000, 5),
(19, 'Wazil A', '9360591760', 'wazil.a@company.com', 102, 1, 48000, 2),
(20, 'Naveen P', '9344337287', 'naveen.p@company.com', 103, 1, 49500, 3),
(21, 'Tamil Selvan K', '9944522034', 'tamil.selvan.k@company.com', 101, 1, 47000, 1),
(22, 'Pratheeban KS', '8072254798', 'pratheeban.ks@company.com', 105, 1, 52000, 5),
(23, 'Tamizhselvan S', '8754773205', 'tamizhselvan.s@company.com', 104, 1, 50000, 4),
(24, 'Mohamed Azarudeen K', '7810095109', 'mohamed.azarudeen.k@company.com', 102, 1, 48000, 2),
(25, 'Vasanth', '9884311155', 'vasanth@company.com', 101, 1, 49000, 1),
(26, 'Paripoorani', '9566971277', 'paripoorani@company.com', 103, 2, 46000, 3),
(27, 'Priya', '6369910922', 'priya@company.com', 102, 2, 47000, 2),
(28, 'Sangeetha', '7660944984', 'sangeetha@company.com', 104, 2, 48000, 4),
(29, 'Vendharasan Raja', '7397280043', 'vendharasan.raja@company.com', 101, 1, 50000, 1),
(30, 'Sachin Raj A', '9566971277', 'sachin.raj.a@company.com', 105, 1, 53000, 5),
(31, 'Madhan Kumar', '8248599071', 'madhan.kumar@company.com', 104, 1, 49500, 4),
(32, 'Thavamuniselvam B', '9786909512', 'thavamuniselvam.b@company.com', 103, 1, 52000, 3),
(33, 'Sasipriya J', '6374903302', 'sasipriya.j@company.com', 102, 2, 47000, 2),
(34, 'N Balasubramani', '7806877686', 'n.balasubramani@company.com', 101, 1, 51000, 1),
(35, 'Sathish S', '9940638023', 'sathish.s@company.com', 103, 1, 49000, 3),
(36, 'Dhanyashree', '7339501104', 'dhanyashree@company.com', 102, 2, 46000, 2),
(37, 'Dinesh Kumar', '8098649265', 'dineshsurya9597@gmail.com', 102, 1, 48000, 1),
(38, 'Nandhinu', '8807805935', 'nandhulakshmanan@gmail.com', 101, 2, 45000, 2),
(39, 'Seshathiri N', '9025162169', 'seshathirin@gmail.com', 103, 1, 47000, 3),
(40, 'Kiruthika', '8682969844', 'kiruthikakumar2410@gmail.com', 102, 2, 46000, 2),
(41, 'Nitheesh T', '7010455960', 'nitheesh2803@gmail.com', 104, 1, 44000, 4),
(42, 'HAFIZULLAH K', '9150840213', 'hafizullahh716@gmail.com', 105, 1, 50000, 5),
(43, 'Divya D', '6369557003', 'divyadayalan2000@gmail.com', 103, 2, 45000, 3),
(44, 'Manusha B.M', '8190081724', 'manumanusha860@gmail.com', 102, 2, 45000, 1),
(45, 'Indhumathi', '9698340090', 'indhumathimatheswaran76@gmail.com', 101, 2, 44000, 2),
(46, 'Harini S', '7010835248', 'buttuharini314@gmail.com', 103, 2, 43000, 3),
(47, 'Swetha V', '9159294116', 'swethavijayakumar1819@gmail.com', 102, 2, 46000, 2),
(48, 'JAGATH RATCHAGAN', '9342484338', 'thejagath07@gmail.com', 104, 1, 45000, 4),
(49, 'SK TAMILARASU', '9940485525', 'arasusktamil37@gmail.com', 105, 1, 48000, 5),
(50, 'Monisha Y', '9551561774', 'moniyuva2622@gmail.com', 102, 2, 45000, 2),
(51, 'Kirubashini C', '6380626996', 'ckirubashini@gmail.com', 101, 2, 44000, 1),
(52, 'Rexi Gabrilla G', '8489999041', 'rexigabri@gmail.com', 103, 2, 46000, 3),
(53, 'Manikandan S', '8248468426', 'manimanitg42@gmail.com', 102, 1, 47000, 1),
(54, 'M VENKATESWARAN', '6383555709', 'venkatesh31oct@gmail.com', 104, 1, 46000, 4),
(55, 'Suriya Prakash S', '8610973433', 'suriyaprakash130706@gmail.com', 103, 1, 47000, 3),
(56, 'Ragash S', '8220944981', 'ragash202@gmail.com', 101, 1, 45000, 1),
(57, 'Rohith S', '9345081839', 'rohithsruthi392@gmail.com', 102, 1, 46000, 2),
(58, 'Lavanya B', '8148521067', 'lavanyabaskar067@gmail.com', 103, 2, 44000, 3),
(59, 'NAVEEN KUMAR G', '9360268206', 'naveenguru011@gmail.com', 105, 1, 49000, 5),
(60, 'Ragul Kannan E', '9629370343', 'raguleswaran2005@gmail.com', 102, 1, 45000, 1),
(61, 'Tejaswini J', '09042246524', 'jaykumartejaswini@gmail.com', 101, 2, 44000, 2),
(62, 'V. AKASH', '9751716356', 'vkash1607@gmail.com', 104, 1, 46000, 4),
-- Newly supplied records. V. AKASH was already present as empid 62,
-- so it is not duplicated. The following seven records receive IDs 63-69.
(63, 'Kishore S', '9003683880', 'kishoresakthi880@gmail.com', 102, 1, 42000, 1),
(64, 'LEVON RAJ D', '9176331191', 'levonraj2004@gmail.com', 104, 1, 43000, 4),
(65, 'Mahavarshini M S', '8754772769', 'mahavarshini1710@gmail.com', 103, 2, 44000, 3),
(66, 'Muhidhadevi S', '8072694935', 'muhidhadevi53@gmail.com', 101, 2, 43000, 2),
(67, 'R Vishal', '6383089889', 'vishalanalyst16@gmail.com', 103, 1, 46000, 3),
(68, 'Pavithra T', '7708685397', 'tpavithra0710@gmail.com', 102, 2, 44000, 2),
(69, 'Aswini', '6379043258', 'aswinideeps@gmail.com', 101, 2, 42000, 1);

-- =========================================================
-- VERIFY THE DATA
-- =========================================================

-- Show every employee with department, gender, and location names.
SELECT
    e.empid,
    e.empname,
    e.empmobile,
    e.empgmail,
    d.empdepartment,
    g.empgender,
    e.empsalary,
    l.emplocation
FROM employee AS e
JOIN department AS d ON e.empdepartmentid = d.empdepartmentid
JOIN gender AS g ON e.empgenderid = g.empgenderid
JOIN location AS l ON e.locationid = l.locationid
ORDER BY e.empid;

-- Expected employee count: 69
SELECT COUNT(*) AS total_employees FROM employee;

-- Department-wise employee count
SELECT d.empdepartment, COUNT(*) AS total_employees
FROM employee e
JOIN department d ON e.empdepartmentid = d.empdepartmentid
GROUP BY d.empdepartment;

-- Gender-wise employee count
SELECT g.empgender, COUNT(*) AS total_employees
FROM employee e
JOIN gender g ON e.empgenderid = g.empgenderid
GROUP BY g.empgender;

-- Location-wise employee count
SELECT l.emplocation, COUNT(*) AS total_employees
FROM employee e
JOIN location l ON e.locationid = l.locationid
GROUP BY l.emplocation;

-- Employees earning more than 45000
SELECT empid, empname, empsalary
FROM employee
WHERE empsalary > 45000
ORDER BY empsalary DESC;
