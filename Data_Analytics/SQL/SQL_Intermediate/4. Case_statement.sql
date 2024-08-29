-- case statement
select first_name,
last_name,
age,
case
	when age <=30 then 'Young'
    when age between 31 and 50 then 'old'
    when age >= 50 then "on the death's door"
end as age_bracket
from employee_demographics;

select first_name,last_name,salary,department_name,
case
	when salary < 50000 then salary + salary*5/100
    when salary >= 50000 then salary + salary*7/100
    when department_name = 'Finance' then salary + salary*10/100
end as bonus
from employee_salary
join parks_departments
on dept_id = department_id ;


