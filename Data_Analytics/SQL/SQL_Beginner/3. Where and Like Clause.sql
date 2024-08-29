-- where clause 
select * 
from employee_salary
where salary> 50000 ;

select * 
from employee_demographics
where gender != 'Female'
and birth_date > '1987-03-04';


-- like statement 
SELECT * FROM parks_and_recreation.employee_demographics
where (first_name like 'Leslie' AND age = 44) OR age >20;

-- like statement % means anything and _ means a value 
SELECT * FROM parks_and_recreation.employee_demographics
where first_name like 'a___' ;
