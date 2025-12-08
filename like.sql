
-- Like statement
-- % anything
-- _ specific value
SELECT * FROM students
where first_name LIKE "Jam%";

SELECT * FROM students
where first_name LIKE "Jam%" AND last_name LIKE  "Mwa__%";

