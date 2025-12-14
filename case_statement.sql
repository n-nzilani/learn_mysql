-- CASE STATEMENTS
select first_name, gender,
    case 
		when gender='F' then "Female"
        when gender='M' then "Male"
		else "others"
	 end  AS gender_category
FROM students;


select * from students;


select first_name,age ,
    case
		when age <25 then 'young'
		else 'old'
    end AS AGE_GROUP
    from students