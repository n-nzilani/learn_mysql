/*
Categories of SQL Commands

CREATE → Data Definition Language (DDL)
Purpose: Define or change the structure of the database, tables, indexes, etc.
Examples: CREATE, ALTER, DROP, TRUNCATE, RENAME

INSERT → Data Manipulation Language (DML)
Purpose: Add, modify, delete, or retrieve data stored in the database tables.
Examples: INSERT, UPDATE, DELETE, SELECT

GRANT → Data Control Language (DCL)
Purpose: Control access, permissions, and privileges for database users.
Examples: GRANT, REVOKE

COMMIT → Transaction Control Language (TCL)
Purpose: Manage transactions to ensure that a group of operations either completes fully or can be undone if needed.
Examples: COMMIT, ROLLBACK, SAVEPOINT

*/


create database university;
use university;


CREATE TABLE courses(
course_code  varchar(10) primary key not null,
course_name varchar(15)

);
CREATE TABLE students(
student_id INT auto_increment PRIMARY KEY NOT NULL,
first_name VARCHAR(20),
last_name varchar(20),
registration_no varchar(15),
phone_no int,
gender varchar(1),
DOB  varchar(15),
course_code  varchar(10),
constraint fk_crs foreign key(course_code) references courses(course_code)

);

CREATE TABLE lectures(
lecture_id INT auto_increment PRIMARY KEY NOT NULL,
first_name VARCHAR(20),
last_name varchar(20),
phone_no int,
gender varchar(1)

);



create table units(
unit_code varchar(20) primary key not null,
unit_name varchar(20),
course_code  varchar(10) ,
constraint fk_courses foreign key(course_code) references courses(course_code),
lecture_id  int,
constraint fk_lec foreign key(lecture_id) references lectures(lecture_id)

);




-- populating the tables

INSERT INTO courses (course_code, course_name) VALUES
('CS01', 'ComputerSci'),
('ICT01', 'ICT'),
('ENG01', 'Engineering'),
('BS01', 'Business'),
('MATH01', 'Mathematics'),
('MED01', 'Medicine'),
('LAW01', 'Law'),
('EDU01', 'Education'),
('FIN01', 'Finance'),
('HR01', 'HumanRes');


INSERT INTO lectures (first_name, last_name, phone_no, gender) VALUES
('John', 'Kamau', 712345001, 'M'),
('Mary', 'Wambui', 712345002, 'F'),
('Peter', 'Otieno', 712345003, 'M'),
('Grace', 'Mutiso', 712345004, 'F'),
('Brian', 'Kiptoo', 712345005, 'M'),
('Linda', 'Naliaka', 712345006, 'F'),
('Joseph', 'Mwangi', 712345007, 'M'),
('Ann', 'Chebet', 712345008, 'F'),
('Kevin', 'Mutua', 712345009, 'M'),
('Mercy', 'Achieng', 712345010, 'F');


INSERT INTO students (first_name, last_name, registration_no, phone_no, gender, DOB, course_code) VALUES
('James', 'Mwangi', 'REG001', 719000001, 'M', '2000-03-12', 'CS01'),
('Sarah', 'Mutheu', 'REG002', 719000002, 'F', '2001-06-21', 'ICT01'),
('Daniel', 'Omondi', 'REG003', 719000003, 'M', '1999-09-02', 'ENG01'),
('Agnes', 'Njeri', 'REG004', 719000004, 'F', '2002-01-29', 'BS01'),
('Brian', 'Kiprotich', 'REG005', 719000005, 'M', '2001-04-14', 'MATH01'),
('Lydia', 'Wanjiku', 'REG006', 719000006, 'F', '2000-12-09', 'MED01'),
('Paul', 'Njoroge', 'REG007', 719000007, 'M', '1998-11-05', 'LAW01'),
('Faith', 'Akinyi', 'REG008', 719000008, 'F', '2002-08-17', 'EDU01'),
('Dennis', 'Mulwa', 'REG009', 719000009, 'M', '1999-07-11', 'FIN01'),
('Ruth', 'Makena', 'REG010', 719000010, 'F', '2001-02-26', 'HR01');


INSERT INTO units (unit_code, unit_name, course_code, lecture_id) VALUES
('U101', 'IntroProg', 'CS01', 1),
('U102', 'DataStruct', 'CS01', 2),
('U103', 'Networking', 'ICT01', 3),
('U104', 'WebDev', 'ICT01', 4),
('U105', 'Calculus', 'MATH01', 5),
('U106', 'Physics', 'ENG01', 6),
('U107', 'Accounting', 'FIN01', 7),
('U108', 'Marketing', 'BS01', 8),
('U109', 'Ethics', 'LAW01', 9),
('U110', 'Anatomy', 'MED01', 10);


drop table students;
commit;

INSERT INTO students (first_name, last_name, registration_no, phone_no, gender, DOB, course_code) VALUES
('James', 'Kariuki', 'REG011', 719000011, 'M', '2000-05-03', 'CS01'),
('Grace', 'Wanjiku', 'REG012', 719000012, 'F', '2001-09-15', 'ICT01'),
('Mark', 'Otieno', 'REG013', 719000013, 'M', '1999-12-22', 'ENG01'),
('Esther', 'Chebet', 'REG014', 719000014, 'F', '2002-03-10', 'BS01'),
('Kevin', 'Mutua', 'REG015', 719000015, 'M', '2001-07-08', 'MATH01');

drop table students;
commit;

show tables;

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    unit_code VARCHAR(20),
    grade INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (unit_code) REFERENCES units(unit_code)
);
INSERT INTO enrollments (student_id, unit_code, grade) VALUES
(1, 'U101', 78),
(1, 'U102', 85),
(2, 'U101', 60),
(3, 'U103', 90),
(4, 'U104', 72),
(5, 'U105', 88),
(6, 'U106', 95),
(7, 'U107', 70),
(8, 'U108', 82),
(9, 'U109', 77),
(10,'U110', 91);

CREATE TABLE classrooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(50),
    capacity INT
);
INSERT INTO classrooms (room_name, capacity) VALUES
('Lab 1', 30),
('Lab 2', 25),
('Room A', 40),
('Room B', 35);
CREATE TABLE timetable (
    timetable_id INT AUTO_INCREMENT PRIMARY KEY,
    unit_code VARCHAR(20),
    room_id INT,
    day_of_week VARCHAR(10),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (unit_code) REFERENCES units(unit_code),
    FOREIGN KEY (room_id) REFERENCES classrooms(room_id)
);
INSERT INTO timetable (unit_code, room_id, day_of_week, start_time, end_time) VALUES
('U101', 1, 'Monday', '09:00:00', '11:00:00'),
('U102', 2, 'Tuesday', '10:00:00', '12:00:00'),
('U103', 1, 'Wednesday', '08:00:00', '10:00:00'),
('U104', 3, 'Thursday', '09:00:00', '11:00:00'),
('U105', 4, 'Friday', '11:00:00', '13:00:00');
show tables;

