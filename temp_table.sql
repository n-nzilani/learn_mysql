
-- TEMP TABLES last as long as we are in that session ,if you exit you cant use it again 
 create temporary table  members(
  name varchar(20),
  gender varchar(1));
  
   insert into members values(
   'Beatrice ','F'
   );
   select * from members;
   
   create temporary table grade_over_80(
   select * from enrollments 
   where grade >80);
   select * from grade_over_80;