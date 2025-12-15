/*
A trigger is SQL that runs automatically when something happens to a table. You DO NOT call a trigger,MySQL calls it by itself.
-- There are 2 timings:
		BEFORE
		AFTER

-- There are 3 events:
		INSERT
		UPDATE
		DELETE

-- So valid combinations are:
		BEFORE INSERT
		AFTER INSERT
		BEFORE UPDATE
		AFTER UPDATE
		BEFORE DELETE
		AFTER DELETE
*/
--   Create a trigger that prevents inserting a grade greater than 100 into the enrollments table.

DELIMITER $$

CREATE TRIGGER before_insert_enrollment
BEFORE INSERT ON enrollments
FOR EACH ROW
BEGIN
    IF NEW.grade > 100 THEN
        SET NEW.grade = 100;
    END IF;
END $$

DELIMITER ;
 
select * from enrollments;
 

-- Create a trigger that prevents inserting a negative grade into the enrollments table.
DELIMITER $$

CREATE TRIGGER no_negative_grades
BEFORE INSERT ON enrollments
FOR EACH ROW
BEGIN
    IF NEW.grade < 0 THEN
        SET NEW.grade = 0;
    END IF;
END $$

DELIMITER ;

INSERT INTO enrollments (student_id, unit_code, grade)
VALUES (13, 'U103', -20);


-- Create a trigger that automatically sets the grade to 0 if a new enrollment is inserted with NULL grade.
DELIMITER $$

CREATE TRIGGER null_grades
BEFORE INSERT ON enrollments
FOR EACH ROW
BEGIN
    IF NEW.grade is null THEN
        SET NEW.grade = 0;
    END IF;
END $$

DELIMITER ;

INSERT INTO enrollments (student_id, unit_code, grade)
VALUES (14, 'U102', NULL);

SELECT * 
FROM enrollments 
WHERE student_id = 14 AND unit_code = 'U102';

select * from enrollments;
select * from students;

SHOW TRIGGERS LIKE 'enrollments';

-- TO INSERT BY USING TRIGGERS
DELIMITER $$
CREATE TRIGGER insert_new_values
AfTER INSERT ON students
FOR EACH ROW
BEGIN 

	INSERT INTO enrollments (student_id)
	values(New.student_id);
END $$
DELIMITER ;

INSERT INTO students (first_name, last_name, registration_no, phone_no, gender, DOB, course_code) VALUES
('James', 'Kariuki', 'REG011', 719000011, 'M', '2000-05-03', 'CS01');

