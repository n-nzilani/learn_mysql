-- A JOIN combines rows from two or more tables based on a related column.

-- =======
-- INNER JOIN-
/*
Definition: Returns only rows that have matching values in both tables.
If there’s no match, the row is not included.*/

select s.first_name,c.course_name
 from students s
 inner join courses c
 on s.course_code =c.course_code;
 
 /*
 Requirement: Only the left table must have data.
Rows in the left table will appear even if there’s no matching course_code in the right table.
The columns from the right table will show NULL for unmatched rows.

*/
select s.age,c.course_name
 from students s
 left join courses c
 on s.course_code =c.course_code;
 


SELECT s.first_name, c.course_name
FROM students s
right JOIN courses c
ON s.course_code = c.course_code;


 /*
 JOIN Practice Questions (No Specified Join Type)

7️⃣ High Scorers
List students, units, and grades, including students who have not been graded yet.
8️⃣ Multiple Tables
Show students, unit names, grades, classroom names, and day of the week. Include all students, even if they are not enrolled in any units.
9️⃣ Advanced Challenge
List all units, the students enrolled, their grades, and the lecturer assigned to the unit, including units with no students yet.
🔟 Aggregation Bonus
List each unit with the total number of students enrolled and the average grade, including units with no students.*/


-- ========
-- List all students along with the units they are enrolled in and their grades.
select 
	s.first_name,
    s.last_name,
	u.unit_name,
	e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN units u ON e.unit_code = u.unit_code
ORDER BY s.last_name, s.first_name;

-- =======
-- List student names, unit names, day of the week, start time, and end time of the class.
select 
	s.first_name,
    s.last_name,
	u.unit_name,
	t.day_of_week,
    t.start_time,
    t.end_time
FROM students s
inner join units u ON s.course_code = u.course_code
inner join timetable t ON u.unit_code =t.unit_code
ORDER BY s.last_name, s.first_name;

-- ========
-- List all students, unit names, grades, classroom names, and day of the week.
select 
	s.first_name,
    s.last_name,
	u.unit_name,
	e.grade,
    c.room_name,
    t.day_of_week
FROM students s
join enrollments e ON s.student_id = e.student_id
join units u ON e.unit_code = u.unit_code
join timetable t ON e.unit_code = t.unit_code
join classrooms c ON t.room_id = c.room_id
ORDER BY s.last_name, s.first_name;

-- =========
-- List all units and the students enrolled in them. If a unit has no students yet, still show the unit name.
-- To ensure all units appear, even if no students are enrolled, you should start with units as the main table and LEFT JOIN enrollments and students.
select
    u.unit_name,
    s.first_name,
    s.last_name  
From  units u
left join enrollments e ON u.unit_code = e.unit_code
left join students s ON e.student_id = s.student_id
ORDER BY u.unit_name, s.last_name, s.first_name;

-- =========
-- List all students and the units they are enrolled in, including any units that do not have a timetable yet.
select 
 s.first_name,
 s.last_name,
 e.unit_code,
 u.unit_name,
 t.day_of_week,
 t.start_time,
 t.end_time
 from units u 
  join students  s on s.course_code = u.course_code
  join enrollments e on u.unit_code = e.unit_code
 left join timetable t on t.unit_code =u.unit_code
 order by  u.unit_name, s.last_name, s.first_name;
 


-- =========
-- List all classrooms and all units scheduled in them, including classrooms that have no units yet scheduled.


select * from students;
select * from enrollments;
select * from units;
select * from timetable;
select * from lectures;
select * from courses;
select * from classrooms;