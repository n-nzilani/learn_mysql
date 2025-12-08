-- LOGICAL OPERATORS

SELECT * FROM students
where first_name ="James" AND registration_no ="REG011" ; -- BOTH CONDITIONS MUST BE TRUE

SELECT * FROM students
where first_name ="James" or registration_no ="REG011" ; -- ONE CAN BE TRUE

SELECT * FROM students
where  NOT registration_no ="REG011" ;-- INVERTER

