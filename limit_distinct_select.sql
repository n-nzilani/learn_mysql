use university;
select * from students;

select * from students
limit 3; -- limits number of rows

select first_name ,last_name from students 
where student_id=1;  -- specify id / one row

select registration_no from university.students; -- specifies the database.table

select first_name from lectures; -- one column


-- DISTINCT USED TO  REMOVE DUPLICATE ROWS
select distinct gender from lectures;

-- specific condition
select * from lectures
where gender="M";

select registration_no from students
where gender="F";
 
 
 SELECT first_name FROM students WHERE gender = 'M'
UNION
SELECT first_name FROM lectures WHERE gender = 'M';

