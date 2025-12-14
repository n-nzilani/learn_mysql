-- ======
-- STRING FUNCTIONS
-- concat
select concat(first_name,  '  ',last_name)  AS Full_name 
from lectures;

-- =====
-- upper
select upper(first_name) from lectures;

-- =====
-- lower
select lower(first_name) from lectures;

-- ====
-- length
select first_name ,length(first_name) AS LENGTH from lectures;

-- === 
-- TRIM -removes space
SELECT trim(first_name) Trimmed from lectures;

-- ====
-- SUBSTRING() – Extract part of a string
-- 2 -starting index 
-- 3 -number of letters

select  first_name,substring(first_name,1,3) from students;

-- =====
-- LEFT() and RIGHT()
-- First 3 letters & last 2 letters. 
select  first_name,left(first_name,3),right(first_name, 2) from students;

-- ======
-- replace -the values
select replace(first_name,"a","@") from lectures;

-- =====
-- locate -the "values we are  finding" must come first
select first_name, locate("a",first_name) from lectures;
select last_name, locate("a",last_name) from students;

-- ========================
-- cast -change datatype
-- string  to date
select cast('2020-9-21' AS date) AS Date;

-- char to number 
select cast(age AS char )AS Age from students;

-- ========================
-- reverse
select first_name ,reverse(first_name) first_name from students;

select first_name ,reverse(last_name) last_name from students;


-- ========================
-- repeat

select repeat(concat( first_name, ' ') , 3) first_name from students;

-- ========================
-- masking
select phone_no,concat('*****',right(phone_no,3)) from lectures;

-- ========================
-- multiple functions
select upper(concat(first_name, ' ',last_name)) as full_name from students;







