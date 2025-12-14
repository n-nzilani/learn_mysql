-- UNION and UNION ALL are used to combine results from multiple SELECT queries into one result set.
/*
Key Rules of UNION / UNION ALL
same number of columns in both queries
Same data types
Same order of columns

*/

-- union -removes duplicate rows . if a name apperas in bot h tables it will show only one.

select student_id,first_name, gender from students
WHERE gender = 'M'
UNION 
select lecture_id,first_name, gender from lectures
WHERE gender = 'M';
 

-- union all - keeps the duplicates . if a name apperas in both  tables it will show all

select student_id,first_name, gender from students
WHERE gender = 'M'
UNION ALL
select lecture_id,first_name, gender from lectures
WHERE gender = 'M';
 
 
 select student_id,first_name, last_name from students
WHERE gender = 'F'
UNION 
select lecture_id,first_name, last_name from lectures
WHERE gender = 'F';
 
