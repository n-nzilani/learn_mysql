-- subquery
-- A subquery is a query inside another query.

SELECT *
FROM students
WHERE course_code = (
    SELECT course_code
    FROM students
    WHERE first_name = 'James'
      AND last_name = 'Mwangi'
); -- This query lists all students in the same course as James Mwangi.


select * from students
where age > (select age from students 
  WHERE first_name = 'Sarah'
      AND last_name = 'Mutheu');


select first_name,age,
(select avg(age) from  students)
from  students;


