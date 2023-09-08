SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 255
SET PAGESIZE 999

--CREATE TABLE SCRIPT
DROP TABLE Training   CASCADE CONSTRAINTS;
DROP TABLE Class      CASCADE CONSTRAINTS;
DROP TABLE Instructor CASCADE CONSTRAINTS;
DROP TABLE Course     CASCADE CONSTRAINTS;
DROP TABLE Employee   CASCADE CONSTRAINTS;
DROP TABLE Department CASCADE CONSTRAINTS;

CREATE TABLE Course
(Crs_ID        Varchar2(9),
 Crs_Title     Varchar2(25),
 Crs_Type      Varchar2(7),
 College_Name  Varchar2(20),
 Tuition       Number(6,2),
 CONSTRAINT Course_CrsID_PK PRIMARY KEY (Crs_ID));

CREATE TABLE Instructor 
(Instr_ID  Number(3),
 Lname     Varchar2(25),
 Fname     Varchar2(25),
 Phone     Char(12),
 Specialty Varchar2(25),
 CONSTRAINT Instructor_InstrID_PK PRIMARY KEY (Instr_ID));

CREATE TABLE Class
(Crs_ID     Varchar2(9),
 Section    Char(1),
 Sem_Cmpltd Varchar2(9),
 Day        Varchar2(20),
 Time       Varchar2(20),
 Instr_ID   Number(3),
 CONSTRAINT Class_PK PRIMARY KEY (Crs_ID, Section, Sem_Cmpltd), 
 CONSTRAINT Class_CrsID_FK   FOREIGN KEY (Crs_ID)   REFERENCES Course (Crs_ID),
 CONSTRAINT Class_InstrID_FK FOREIGN KEY (Instr_ID) REFERENCES Instructor (Instr_ID) );

CREATE TABLE Department
(Dept_ID         Number(4),
 Dept_Name       Varchar2(25),
 Phone           Char(12),
 Training_Budget Number(10,2),
 Dept_Mngr       Number(3),
 CONSTRAINT Department_DeptID_PK PRIMARY KEY (Dept_ID));

CREATE TABLE Employee
(Emp_ID    Number(3),
 Lname     Varchar2(25),
 Fname     Varchar2(25),
 Email     Varchar2(25), 
 Position  Varchar2(20),
 DOB       Date,
 Hire_Date Date DEFAULT SYSDATE, 
 Allowance Number(8,2),
 Street    Varchar2(25),
 city      Varchar2(25),
 State     Char(2),
 Zip_Code  Char(5),
 Dept_ID   Number(4),
 Sup_ID    Number(3),
 CONSTRAINT Employee_EmpID_PK  PRIMARY KEY (Emp_ID),
 CONSTRAINT Employee_DeptID_FK FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID));

CREATE TABLE Training
(TID        Number(5),
 Emp_ID     Number(3),
 Appr_Date  Date,
 Crs_ID     Varchar2(9),
 Section    Char(1),
 Sem_Cmpltd Varchar2(9),
 Grade      Char(2), 
 Score      Number(4,2), 
 ApprovedBy Number(3),
 CONSTRAINT Training_TID_PK PRIMARY KEY (TID),
 CONSTRAINT Training_EmpID_FK      FOREIGN KEY (Emp_ID)     REFERENCES Employee (Emp_ID),
 CONSTRAINT Training_ApprovedBy_FK FOREIGN KEY (ApprovedBy) REFERENCES Employee (Emp_ID));


INSERT INTO instructor VALUES (501, 'Codd',   'Jim',   '700-121-4126', 'Normalization');
INSERT INTO instructor VALUES (502, 'Chen',   'Peter', '700-121-5689', 'Database Design');
INSERT INTO instructor VALUES (503, 'Miller', 'Adam',  '700-389-1289', 'Analytics');
INSERT INTO instructor VALUES (510, 'Smith',  'Joe',   '700-121-1323', 'Big Data');
INSERT INTO instructor VALUES (521, 'Hall',   'Steve', '700-555-4532', 'Data Mining');
INSERT INTO instructor VALUES (533, 'Jones',  'Carol', '700-389-8933', 'Cloud Computing');
INSERT INTO instructor VALUES (545, 'McCarthy', 'Chris','700-689-1339', 'Distributed Systems');
INSERT INTO instructor VALUES (602, 'Jones',  'John',   '700-151-5687', 'Blockchain');

INSERT INTO course VALUES ('20 325', 'Social Networks', 'Mngt', 'Morris', 2000);
INSERT INTO course VALUES ('20 451', 'Systems A. and D.', 'IT', 'Morris', 2000);
INSERT INTO course VALUES ('20 542', 'Java',              'IT', 'Morris', 2000);
INSERT INTO course VALUES ('20 612', 'Marketing',       'Mngt', 'Morris', 2000);
INSERT INTO course VALUES ('20 721', 'Data Visualization', 'BI','Morris', 2750);

INSERT INTO course VALUES ('201 ACC', 'Accounting',        'Fin', 'Oakland', 2500);
INSERT INTO course VALUES ('205 ACC', 'Corporate Finance', 'Fin', 'Oakland', 2500);
INSERT INTO course VALUES ('211 CIS', 'C++',               'IT', 'Oakland', 2500);
INSERT INTO course VALUES ('302 CIS', 'Database Management', 'IT', 'Oakland', 3000);
INSERT INTO course VALUES ('423 CIS', 'Mobile Computing',    'IT', 'Oakland', 2500);
INSERT INTO course VALUES ('425 CIS', 'Cloud Computing',     'IT', 'Oakland', 3000);
INSERT INTO course VALUES ('445 CIS', 'Hadoop and MapReduce','IT', 'Oakland', 2500);

INSERT INTO course VALUES ('IS 350', 'Database Management',   'IT', 'Chatham', 3000);
INSERT INTO course VALUES ('IS 540', 'Internet Technologies', 'IT', 'Chatham', 3000);
INSERT INTO course VALUES ('IS 700', 'Internet Marketing',  'Mngt', 'Chatham', 3000);
INSERT INTO course VALUES ('IS 750', 'Web Applications',      'IT', 'Chatham', 3000);
INSERT INTO course VALUES ('IS 800', 'Text Analytics',        'BI', 'Chatham', 3000);
INSERT INTO course VALUES ('IS 810', 'Big Data Analytics',    'BI', 'Chatham', 3000);
INSERT INTO course VALUES ('IS 833', 'Intro to Blockchain',   'BI', 'Chatham', 3500);

INSERT INTO class VALUES ('IS 350', 'A', 'Spr 2017', 'Mon/Wed', '4:30pm', 502);
INSERT INTO class VALUES ('IS 350', 'B', 'Spr 2017', 'Tue', '6:00pm', 501); 
INSERT INTO class VALUES ('20 542', 'A', 'Spr 2017', 'Wed', '4:00pm', 521);
INSERT INTO class VALUES ('20 542', 'B', 'Spr 2017', 'Wed', '6:00pm', 602);
INSERT INTO class VALUES ('211 CIS','C', 'Spr 2017', 'Thur', '6:00pm', 521);
INSERT INTO class VALUES ('211 CIS','B', 'Fall 2017','Fri', '5:00pm', 521);
INSERT INTO class VALUES ('201 ACC','A', 'Spr 2018', 'Mon', '6:00pm', 503);
INSERT INTO class VALUES ('423 CIS','A', 'Spr 2018', 'Tue', '6:00pm', 533);
INSERT INTO class VALUES ('IS 350', 'A', 'Fall 2018','Mon/Wed', '4:30pm', 502);
INSERT INTO class VALUES ('IS 540', 'B', 'Fall 2018','Tue', '6:00pm', 545);
INSERT INTO class VALUES ('423 CIS','A', 'Spr 2019', 'Tue', '6:00pm', 533);
INSERT INTO class VALUES ('IS 700', 'A', 'Spr 2019', 'Wed', '6:00pm', 545);
INSERT INTO class VALUES ('205 ACC','A', 'Fall 2019','Fri', '5:00pm', 503);
INSERT INTO class VALUES ('IS 540', 'A', 'Fall 2019','Tue', '4:30pm', 545);
INSERT INTO class VALUES ('IS 350', 'A', 'Spr 2020', 'Mon/Wed', '4:30pm', 502);
INSERT INTO class VALUES ('20 325', 'B', 'Spr 2020', 'Mon/Wed', '4:00pm', 510);
INSERT INTO class VALUES ('20 451', 'A', 'Spr 2020', 'Wed', '5:30pm', 521);
INSERT INTO class VALUES ('20 612', 'A', 'Spr 2020', 'Tue', '5:30pm', 503); 
INSERT INTO class VALUES ('20 325', 'B', 'Fall 2020', 'Mon/Wed', '4:00pm', 510);
INSERT INTO class VALUES ('IS 700', 'A', 'Fall 2020', 'Mon/Wed', '3:00pm', 545);
INSERT INTO class VALUES ('205 ACC','B', 'Fall 2020', 'Fri', '5:00pm', 503);
INSERT INTO class VALUES ('205 ACC','A', 'Spr 2021', 'Tue', '6:00pm', 503);
INSERT INTO class VALUES ('IS 350', 'A', 'Spr 2021', 'Mon/Wed', '4:30pm', 502);
INSERT INTO class VALUES ('IS 750', 'A', 'Spr 2021', 'Tue/Thur', '3:00pm', 545);
INSERT INTO class VALUES ('IS 810', 'B', 'Fall 2021','Thur', '6:00pm', 510);
INSERT INTO class VALUES ('20 721', 'A', 'Spr 2022', 'Wed', '5:30pm', 510);
INSERT INTO class VALUES ('IS 350', 'A', 'Spr 2022', 'Mon/Wed', '4:30pm', 501);
INSERT INTO class VALUES ('IS 833', 'B', 'Spr 2022', 'Fri', '6:00pm', 602);
INSERT INTO class VALUES ('425 CIS','A', 'Spr 2022', 'Mon', '6:00pm', 533);
INSERT INTO class VALUES ('445 CIS','A', 'Spr 2022', 'Wed', '6:00pm', 533);

INSERT INTO Department VALUES (1000, 'Administration', '412-126-1234', 15000, 225);
INSERT INTO Department VALUES (1001, 'Sales', '412-126-5678', 50000, 203);
INSERT INTO Department VALUES (1002, 'IT',    '412-126-9812', 150000, 214);
INSERT INTO Department VALUES (1003, 'Executive', '412-126-9876', 30000, 400);

INSERT INTO Employee VALUES (400, 'Jones', 'Amelia', 'aj400@firm.com', 'President', '17-MAY-1977', '01-OCT-2005', 0, '212 Bellefonte St.', 'Pittsburgh', 'PA', '15232', 1003, NULL);
INSERT INTO Employee VALUES (401, 'Harris', 'Scott', 'sh401@firm.com', 'Vice President','28-MAR-1975', '02-DEC-2006', 0, '2225 S. Negley Ave.', 'Pittsburgh', 'PA', '15232', 1003, 400);
INSERT INTO Employee VALUES (203, 'Getz', 'Bill', 'bg13@firm.com', 'Manager', '08-Oct-1978', '05-Apr-2008', 4000, '1184 Craig, Apt.9', 'Pittsburgh', 'PA', '15213', 1001, 401);
INSERT INTO Employee VALUES (214, 'Ramos', 'Ana', 'ag2t@firm.com', 'Manager', '09-Mar-1978', '12-Apr-2008', 4000, '1000 Liberty Ave. Apt.12', 'Pittsburgh', 'PA', '15222', 1002, 401);
INSERT INTO Employee VALUES (225, 'Evans', 'Stan', 'se7v@firm.com', 'Manager','14-Jul-1979', '01-Jun-2008', 3000, '223 Centre', 'Pittsburgh', 'PA', '15232', 1000, 401);
INSERT INTO Employee VALUES (100, 'Krall', 'Mary', 'mk11@firm.com', 'Sales Rep', '11-Feb-1991', '18-May-2013', 10000, '5045 Howe, Apt.3', 'Pittsburgh', 'PA', '15232', 1001, 203);
INSERT INTO Employee VALUES (128, 'Boon', 'Pat', 'pb5x@firm.com', 'Executive Assistant', '23-Nov-1987', '20-Oct-2012', 5000, '330 Woodland Road', 'Pittsburgh', 'PA', '15233', 1003, 400);
INSERT INTO Employee VALUES (137, 'Hall', 'Jim', 'jh22@firm.com', 'DBA', '6-Aug-1983', '10-Nov-2012', 15000, '123 Main', 'Johnstown', 'PA', '15901', 1002, 214);
INSERT INTO Employee VALUES (153, 'Roditi', 'Adam', 'ar30@firm.com', 'System Administrator', '5-Mar-1991', '19-Mar-2012', 15000,'504 Walnut, Apt.4', 'Pittsburgh', 'PA', '15232', 1002, 214);
INSERT INTO Employee VALUES (162, 'Nelson', 'Ray', 'nr12@firm.com', 'Senior Programmer', '24-SEP-1994', '20-Oct-2014', 7000, '5825 Fifth Ave. Apt.22', 'Pittsburgh', 'PA', '15232', 1002, 214);
INSERT INTO Employee VALUES (168, 'Corman', 'Chris', 'cc44@firm.com', 'Senior Sales Rep', '11-AUG-1993', '20-Oct-2014', 8000, '5422 Wilkins', 'Pittsburgh', 'PA', '15232', 1001, 203);
INSERT INTO Employee VALUES (171, 'Belli', 'Willam', 'wb21@firm.com', 'Sales Rep', '28-MAY-1995', '01-NOV-2016', 10000, '4000 Forbes Ave.', 'Pittsburgh', 'PA', '15214', 1001, 203);
INSERT INTO Employee VALUES (172, 'Swift', 'Lisa', 'ls23@firm.com', 'Sales Rep', '17-FEB-1992', '01-NOV-2016', 10000, '100 Broad Str.', 'Indiana', 'PA', '15701', 1001, 203);
INSERT INTO Employee VALUES (173, 'Milton', 'Kelly', 'km24@firm.com', 'Sales Rep', '16-DEC-1991', '07-NOV-2016', 10000, '200 Charlotte Drive', 'Altoona', 'PA', '16601', 1001, 203);
INSERT INTO Employee VALUES (312, 'Carter', 'Henry', 'hc123@firm.com', 'Sales Rep', '22-Apr-1998', '09-Jan-2017', 10000, '125 Melbourne Lane', 'Pittsburgh', 'PA', '15234', 1001, 168);
INSERT INTO Employee VALUES (313, 'Bertram', 'Jill', 'jb239@firm.com', 'Sales Rep', '06-Jul-1995', '09-Jan-2017', 10000, '275 Brisbane Street', 'Pittsburgh', 'PA', '15231', 1001, 168);
INSERT INTO Employee VALUES (314, 'Gates', 'Bob', 'bg972@firm.com', 'Accountant', '26-Dec-1996', '04-Jun-2018', 5000, '464 Beachwood Blvd', 'Pittsburgh', 'PA', '15232', 1000, 225);
INSERT INTO Employee VALUES (315, 'Wheeler', 'Howard', 'hw476@firm.com', 'Analyst', '11-Jun-1996', '04-Jun-2017', 5000, '88 Ocean Road', 'Pittsburgh', 'PA', '15231', 1000, 225);
INSERT INTO Employee VALUES (316, 'Whitestar', 'Mary', 'mw392@firm.com', 'Programmer', '24-Mar-1998', '25-Feb-2018', 10000, '33 Sydney Avenue', 'Pittsburgh', 'PA', '15232', 1002, 162);
INSERT INTO Employee VALUES (317, 'Newton', 'Steve', 'sn536@firm.com', 'Programmer', '29-Jan-2000', '03-Jun-2019', 10000, '8 Marlborough Road', 'Pittsburgh', 'PA', '15233', 1002, 162);

INSERT INTO Training VALUES (1,  137, '02-Dec-16', 'IS 350', 'B', 'Spr 2017', 'B', 3, 214);
INSERT INTO Training VALUES (2,  153, '02-Dec-16', 'IS 350', 'B', 'Spr 2017', 'B', 3, 214);
INSERT INTO Training VALUES (3,  137, '02-Dec-16', '211 CIS','B', 'Fall 2017','A+', 4.33, 214);
INSERT INTO Training VALUES (4,  153, '02-Dec-16', '211 CIS','B', 'Fall 2017','A+', 4.33, 214);
INSERT INTO Training VALUES (5,  128, '03-Dec-16', '211 CIS','C', 'Spr 2017', 'R', 0 , 400);
INSERT INTO Training VALUES (6,  128, '03-Dec-16', 'IS 350', 'B', 'Spr 2017', 'B-', 2.67, 400);
INSERT INTO Training VALUES (7,  100, '09-Jan-17', '20 542', 'A', 'Spr 2017', 'B+', 3.33, 203);
INSERT INTO Training VALUES (8,  100, '09-Jan-17', 'IS 350', 'A', 'Spr 2017', 'C', 2, 203);
INSERT INTO Training VALUES (9,  128, '06-Aug-17', '211 CIS','B', 'Fall 2017','B', 3, 400);

INSERT INTO Training VALUES (10, 128, '03-Dec-17', '201 ACC','A', 'Spr 2018', 'A', 4, 400);
INSERT INTO Training VALUES (11, 128, '03-Dec-17', 'IS 350', 'A', 'Fall 2018','A', 4, 400);
INSERT INTO Training VALUES (12, 100, '08-Dec-17', '423 CIS','A', 'Spr 2018', 'C-', 1.67, 203);
INSERT INTO Training VALUES (13, 137, '08-Dec-17', '423 CIS','A', 'Spr 2018', 'B', 3, 214);
INSERT INTO Training VALUES (14, 153, '08-Dec-17', '423 CIS','A', 'Spr 2018', 'B+', 3.33, 214);
INSERT INTO Training VALUES (15, 137, '06-Jul-18', 'IS 540', 'B', 'Fall 2018','C', 2, 214);
INSERT INTO Training VALUES (16, 153, '06-Jul-18', 'IS 540', 'B', 'Fall 2018','B', 3, 214);

INSERT INTO Training VALUES (17, 162, '30-Nov-18', '423 CIS','A', 'Spr 2019', 'B', 3, 214);
INSERT INTO Training VALUES (18, 100, '30-Nov-18', 'IS 700', 'A', 'Spr 2019', 'A+', 4.33, 203);
INSERT INTO Training VALUES (19, 168, '30-Nov-18', 'IS 700', 'A', 'Spr 2019', 'A', 4.33, 203);
INSERT INTO Training VALUES (20, 128, '07-Dec-18', 'IS 700', 'A', 'Spr 2019', 'B', 3, 400); 
INSERT INTO Training VALUES (21, 137, '07-Dec-18', 'IS 700', 'A', 'Spr 2019', 'B+', 3.33, 214);
INSERT INTO Training VALUES (22, 153, '07-Dec-18', 'IS 700', 'A', 'Spr 2019', 'A-', 3.67, 214);

INSERT INTO Training VALUES (23, 168, '01-Jul-19', '205 ACC','A', 'Fall 2019','R', 0, 203);
INSERT INTO Training VALUES (24, 128, '01-Jul-19', '205 ACC','A', 'Fall 2019','A', 4, 400);
INSERT INTO Training VALUES (25, 162, '01-Jul-19', 'IS 540', 'A', 'Fall 2019','B+', 3.33, 214);

INSERT INTO Training VALUES (26, 100, '12-Dec-19', 'IS 350', 'A', 'Spr 2020', 'A+', 4.33, 203);
INSERT INTO Training VALUES (27, 168, '12-Dec-19', '20 325', 'B', 'Spr 2020', 'A-', 3.67, 203);
INSERT INTO Training VALUES (28, 162, '12-Dec-19', '20 325', 'B', 'Spr 2020', 'B+', 3.33, 214);
INSERT INTO Training VALUES (29, 171, '09-Jan-20', '20 612', 'A', 'Spr 2020', 'B', 3, 203);
INSERT INTO Training VALUES (30, 172, '09-Jan-20', '20 612', 'A', 'Spr 2020', 'C+', 2.33, 203);
INSERT INTO Training VALUES (31, 100, '09-Jan-20', '20 451', 'A', 'Spr 2020', 'A-', 3.67, 203);

INSERT INTO Training VALUES (32, 137, '17-Jul-20', '20 325', 'B', 'Fall 2020','A', 4, 214);
INSERT INTO Training VALUES (33, 171, '14-Aug-20', 'IS 700', 'A', 'Fall 2020','B', 3, 203);
INSERT INTO Training VALUES (34, 172, '14-Aug-20', 'IS 700', 'A', 'Fall 2020','B+', 3.44, 203);
INSERT INTO Training VALUES (35, 173, '14-Aug-20', 'IS 700', 'A', 'Fall 2020','B-', 2.67, 203);
INSERT INTO Training VALUES (36, 168, '14-Aug-20', '205 ACC','B', 'Fall 2020','A-', 3.67, 203);

INSERT INTO Training VALUES (37, 162, '01-Dec-20', 'IS 750', 'A', 'Spr 2021', 'A', 4, 214);
INSERT INTO Training VALUES (38, 314, '04-Dec-20', '205 ACC','A', 'Spr 2021', 'B', 3, 225);
INSERT INTO Training VALUES (39, 315, '04-Dec-20', '205 ACC','A', 'Spr 2021', 'B-', 2.67, 225);
INSERT INTO Training VALUES (40, 171, '09-Jul-21', 'IS 810', 'B', 'Fall 2021','A-', 3.67, 203);
INSERT INTO Training VALUES (41, 172, '09-Jul-21', 'IS 810', 'B', 'Fall 2021','B', 3, 203);
INSERT INTO Training VALUES (42, 173, '09-Jul-21', 'IS 810', 'B', 'Fall 2021','A', 4, 203);

INSERT INTO Training VALUES (43, 171, '07-Dec-21', '20 721', 'A', 'Spr 2022', 'A', 4, 203);
INSERT INTO Training VALUES (44, 172, '07-Dec-21', '20 721', 'A', 'Spr 2022', 'A', 4, 203);
INSERT INTO Training VALUES (45, 173, '09-Jul-21', '20 721', 'A', 'Spr 2022', 'A', 4, 203);
INSERT INTO Training VALUES (46, 153, '09-Jul-21', '445 CIS','A', 'Spr 2022', 'C+', 2.33, 214);
INSERT INTO Training VALUES (47, 162, '09-Jul-21', '425 CIS','A', 'Spr 2022', 'B+', 3.33, 214);
INSERT INTO Training VALUES (48, 316, '09-Jul-21', 'IS 833', 'B', 'Spr 2022', 'C', 2, 162);
INSERT INTO Training VALUES (49, 317, '09-Jul-21', 'IS 833', 'B', 'Spr 2022', 'B+', 3.33, 162);

--Check Current tables
SELECT  table_name
FROM    user_tables;

--Part I 

ALTER TABLE Employee
ADD CONSTRAINT Employee_Sup_ID_FK 
FOREIGN KEY (Sup_ID) 
REFERENCES Employee (Emp_ID);

ALTER TABLE Employee
MODIFY (Dept_ID CONSTRAINT Employee_Dept_ID_nn NOT NULL);

ALTER TABLE Department
ADD CONSTRAINT Department_Dept_Mngr_FK 
FOREIGN KEY (Dept_Mngr) 
REFERENCES Employee (Emp_ID);

ALTER TABLE Department
MODIFY (Dept_mngr CONSTRAINT Department_Dept_mngr_nn NOT NULL);

ALTER TABLE Training
ADD CONSTRAINT Training_Crs_Section_Sem_FK 
FOREIGN KEY (Crs_ID, Section, Sem_Cmpltd) 
REFERENCES CLASS (Crs_ID, Section, Sem_Cmpltd);

ALTER TABLE Training
MODIFY (Emp_ID CONSTRAINT Training_Emp_ID_nn NOT NULL);

ALTER TABLE Training
MODIFY (Appr_Date CONSTRAINT Training_Appr_Date_nn NOT NULL);

ALTER TABLE Training
MODIFY (Crs_ID CONSTRAINT Training_Crs_ID_nn NOT NULL);

ALTER TABLE Training
MODIFY (Section CONSTRAINT Training_Section_nn NOT NULL);

ALTER TABLE Training
MODIFY (Sem_Cmpltd CONSTRAINT Training_Sem_Cmpltd_nn NOT NULL);

ALTER TABLE Training
MODIFY (ApprovedBy CONSTRAINT Training_ApprovedBy_nn NOT NULL);

ALTER TABLE Class
MODIFY (Instr_ID CONSTRAINT Training_Instr_ID_nn NOT NULL);


--CHECK SYNTAX
ALTER TABLE Training
ADD CONSTRAINT Training_Appr_Cmpltd_ck 
CHECK ((Sem_Cmpltd - Appr_Date) > 1 YEAR);

--FORMAT
COLUMN Dept_name FORMAT A30
COLUMN EMPLOYEES FORMAT A40
COLUMN Grade FORMAT A6
COLUMN Sem_Cmpltd FORMAT A15
COLUMN Section FORMAT A10


--Part II
--Q1
SELECT DISTINCT Emp_ID || ' - ' || Fname || ' - ' || Lname AS EMPLOYEES
FROM Employee e
JOIN Training t
USING (Emp_ID)
WHERE Grade IS NOT NULL
MINUS
SELECT DISTINCT Emp_ID || ' - ' || Fname || ' - ' || Lname AS EMPLOYEES
FROM Employee 
JOIN Training
USING (Emp_ID)
WHERE Grade = ANY('C+','C','C-','B-','R');

--=======
--Q2
SELECT e.Emp_ID, e.Fname, e.Lname
FROM Employee s 
JOIN Employee e
ON s.Sup_ID = e.Emp_ID
MINUS 
SELECT s.Emp_ID, s.Fname, s.Lname
FROM Employee s
JOIN TRAINING t
ON s.Emp_ID = t.ApprovedBy
Where t.Appr_Date LIKE '%21%';

--======
--Q3
SELECT Employee.Emp_ID, Fname, Lname, Course.Crs_Title, TRAINING.Sem_Cmpltd
FROM Employee,TRAINING, Class, Course
WHERE  Employee.Emp_ID = TRAINING.Emp_ID
AND TRAINING.Crs_ID = Class.Crs_ID
AND TRAINING.Section = Class.Section
AND TRAINING.Sem_Cmpltd = Class.Sem_Cmpltd
AND Class.Crs_ID = Course.Crs_ID
AND GRADE = 'R';

--======
--Q4

SELECT e.Emp_ID || ' - ' || e.Fname || ' - ' || e.Lname AS EMPLOYEES, Crs_Title, Tuition, Dept_name
FROM  Employee e,TRAINING, CLASS, Course, DEPARTMENT
WHERE DEPARTMENT.Dept_ID = e.Dept_ID
AND e.Emp_ID = TRAINING.Emp_ID
AND TRAINING.Crs_ID = Class.Crs_ID
AND TRAINING.Section = Class.Section
AND TRAINING.Sem_Cmpltd = Class.Sem_Cmpltd
AND CLASS.Crs_ID = Course.Crs_ID
AND Crs_Title LIKE '%ing%' 
AND Tuition < 3000
ORDER BY Dept_name, e.Lname;

--======
--Q5
SELECT DISTINCT Instructor.Instr_ID, Instructor.Lname, Instructor.Fname, Specialty, College_Name
FROM Course, CLASS, Instructor
WHERE CLASS.Crs_ID = Course.Crs_ID
AND CLASS.Instr_ID = Instructor.Instr_ID
AND(College_Name = 'Oakland'
OR Specialty = '%Promgramming%');

--======
--Q6
SELECT e.Fname, e.Lname, TRAINING.Section, TRAINING.Sem_Cmpltd, Grade
FROM  Employee e,TRAINING, CLASS, Course
WHERE e.Emp_ID = TRAINING.Emp_ID
AND TRAINING.Crs_ID = Class.Crs_ID
AND TRAINING.Section = Class.Section
AND TRAINING.Sem_Cmpltd = Class.Sem_Cmpltd
AND CLASS.Crs_ID = Course.Crs_ID
AND Crs_Title = 'Database Management'
AND TRAINING.Sem_Cmpltd LIKE '%Spr%'
AND Grade = ANY('A+','A','A-','B+','B')
ORDER BY Sem_Cmpltd DESC, e.Lname;

--======
--Q7
SELECT DISTINCT Crs_Title, TRAINING.Sem_Cmpltd
FROM  Employee e,TRAINING, CLASS, Course, DEPARTMENT
WHERE DEPARTMENT.Dept_ID = e.Dept_ID
AND e.Emp_ID = TRAINING.Emp_ID
AND TRAINING.Crs_ID = CLASS.Crs_ID
AND TRAINING.Section = CLASS.Section
AND TRAINING.Sem_Cmpltd = CLASS.Sem_Cmpltd
AND CLASS.Crs_ID = Course.Crs_ID
AND (TRAINING.Sem_Cmpltd LIKE'%2020%' OR TRAINING.Sem_Cmpltd LIKE'%2021%')
AND Dept_name = 'IT'
ORDER BY TRAINING.Sem_Cmpltd DESC, Crs_Title;

