
-- GROUP BY Practice Questions

-- Count the number of students in each course.
SELECT course_code ,count(course_code)  AS Ttl_student_Per_course
FROM students
group by course_code;

-- ============
-- Find the maximum age of students in each gender.

select gender ,min(DOB) -- earlier age
from students 
group by gender;

-- to find by exact age 
-- first add a new column of age 

alter table  students 
add column age int;


UPDATE students
SET age = NULL; -- to set values to null

-- to fill the column we use update
set sql_safe_updates =0;

update students
set age = timestampdiff(YEAR ,DOB, curdate());

set sql_safe_updates=1;

select gender, max(age) from students
group by gender;


-- ==========
-- List each course_code and the number of units associated with it.
select course_code ,count(unit_code) from units
group by course_code;

-- =====
-- Find the youngest student  in each course.
select course_code, max(DOB),min(age) from students
group by course_code;

-- =====
-- Count the number of male and female lectures in the lectures table.
select gender, count(gender) from lectures
group by gender;


-- ====
-- Find the longest first name  of students in each course.
select course_code ,max(length(first_name)) from students
group by course_code;

-- ==== 
-- Find the minimum and maximum registration number for students in each gender
select gender ,min(registration_no),max(registration_no) from students
group by gender;

-- =====
-- Count the number of students in each course who are older than 20.
select course_code ,count(*) AS total_students_over_20 from students
where age>24
group by course_code;

-- ======
--  List lecture_id and the number of units they teach.

select lecture_id, count(unit_code) from units
group by lecture_id;





/* group by  -groups the rows thet have same values in one or more column  and apply aggreration 
When you use GROUP BY, all columns in the SELECT that are not aggregated must either be in the GROUP BY clause 
or wrapped in an aggregate function (COUNT, MAX, MIN, etc.).

*/
select * from students;

SELECT gender,count(gender) FROM students
group by gender;

SELECT gender, MIN(first_name)  first_in_group -- AS used for aliasing
FROM students
GROUP BY gender;

-- HAVING is used to filter groups after aggregation.
select  course_code,avg(age) from students 
group by course_code
having avg(age) > 25;








