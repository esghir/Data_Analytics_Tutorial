-- group by 
select gender,avg(age),max(age),count(*) 
from employee_demographics
group by gender ;

select occupation,salary
from employee_salary
group by occupation , salary;

-- order by asc desc
select * 
from employee_demographics
order by first_name desc,age desc;

