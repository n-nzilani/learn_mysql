-- An event in MySQL is like a scheduled task. It runs automatically at a specified time or repeatedly at a set interval.

select * from students;
SHOW VARIABLES LIKE 'event_scheduler';



CREATE EVENT weekly_bonus
ON SCHEDULE EVERY 1 WEEK
STARTS '2025-12-16 09:00:00'
DO
  UPDATE enrollments
  SET grade = grade + 5
  WHERE grade + 5 <= 100;
  
  -- delete age older then 27
DELIMITER $$
CREATE EVENT oldest_out
ON SCHEDULE EVERY 10 SECOND
DO
BEGIN
     DELETE 
     FROM students
     WHERE age >= 27;
END $$ 
DELIMITER ;    


SELECT * FROM students;