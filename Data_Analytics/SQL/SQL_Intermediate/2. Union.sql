

SELECT first_name,last_name,'old man' as label
from employee_demographics
where age > 50 and gender = 'Male'
union 
SELECT first_name,last_name,'old lady' as label
from employee_demographics
where age > 40 and gender = 'Female'
union 
select first_name,last_name,'High paid employee' as label
from employee_salary
where salary > 70000

order by first_name,last_name
;