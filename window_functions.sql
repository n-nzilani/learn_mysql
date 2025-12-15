/*  SQL window functions allow performing calculations across a set of rows that are related to the current row, without collapsing the result
 

<window_function>() OVER (
    [PARTITION BY column1, column2, ...]
    [ORDER BY column3, ...]
)

PARTITION BY: splits rows into groups 

ORDER BY: defines the order within each partition


*/
-- ROW_NUMBER() -- Gives a unique number to each row (no ties).

CREATE TABLE test_scores (
    student_name VARCHAR(20),
    score INT
);

INSERT INTO test_scores (student_name, gender, score) VALUES
('Alice', 'F', 90),
('Brian', 'M', 90),
('Carol', 'F', 80),
('David', 'M', 70),
('Eve', 'F', 70),
('Frank', 'M', 85),
('Grace', 'F', 95),
('Henry', 'M', 60),
('Ivy', 'F', 88),
('Jack', 'M', 75);
select 
s._name,
s.last_name,
s.gender,
e.grade,
row_number() over( partition by s.gender order by e.grade DESC)
from enrollments e
left join students s on e.student_id = s.student_id;


drop table if exists test_scores ;

alter table test_scores
add column gender varchar(1);

alter table test_scores
add column student_id int;

alter table test_scores
add primary key (student_id);

alter table test_scores
modify student_id int auto_increment;

select * from  test_scores;


ALTER TABLE test_scores DROP COLUMN student_id;

--  add the column as AUTO_INCREMENT PRIMARY KEY
ALTER TABLE test_scores
ADD COLUMN student_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

select *,
row_number () over ( partition by gender order by score desc)
from test_scores;

-- RANK() Ranks rows but leaves gaps when there are ties. 224
select *,
rank () over (  order by score desc) Ranking
from test_scores;

-- DENSE_RANK()  Ranks rows but NO gaps. 223
select *,
dense_rank () over (  order by score desc) Ranking 
from test_scores;

-- =======NTILE(n)  Divides rows into n equal groups
select *,
ntile (3) over (  order by score desc) AS  category
from test_scores;


-- aggregates
select *,
avg(score )over (partition by gender) AS  category
from test_scores;

select *,
sum(score )over (partition by gender) AS  category
from test_scores;

select *,
min(score )over (partition by gender) AS  min,
max(score )over (partition by gender) AS  max
from test_scores;
