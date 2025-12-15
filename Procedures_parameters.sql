-- A stored procedure is a predefined set of SQL statements stored in the database that you can execute repeatedly.

DELIMITER $$ 
-- OR USE //
CREATE PROCEDURE top_grades()
-- CASE SENSITIVE USE CAPITAL
begin 
    select * from enrollments
    where grade >= 90;
    
    select * from enrollments
    where grade >= 80;
end $$
DELIMITER ;    
 CALL top_grades();
 
 
 
 
-- PARAMETER

DELIMITER $$

CREATE PROCEDURE top_students(IN min_grade INT)
BEGIN
    SELECT * FROM enrollments
    WHERE grade >= min_grade;
END $$

DELIMITER ;
CALL  top_students(85);