-- CTE Common Table Expression is like a temporary named result set that you can use in a query. used immediatly after the main query
with high_grade(Gender,Max_age,Min_age) /* <<---THIS BECOMES LIKE THE ALIAS */ as (
select gender,max(age),min(age) 
from students
group by gender)

select * from high_grade;

-- ctes last as long as we are in that session



select * from enrollments;
select * from students;