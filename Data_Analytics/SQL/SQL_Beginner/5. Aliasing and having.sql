-- having 
select occupation,avg(salary)
from employee_salary
where occupation like '% manager%'
group by occupation 
having avg(salary)>70000
limit 3;

select * 
from employee_demographics
order by age desc
limit 0,1;

-- aliasing
select gender , avg(age) as age_avg
from employee_demographics
group by gender
having age_avg > 40;