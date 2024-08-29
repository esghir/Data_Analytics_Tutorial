-- CTE Common table expression
with CTE_example(gender,avg_sal,max_sal,min_sal,count_sal) as
(
select gender ,
avg(salary) ,
max(salary) ,
min(salary) ,
count(salary) 
from employee_demographics dem 
join employee_salary sal
on sal.employee_id = dem.employee_id
group by gender
)
select *
from CTE_example;


-- CTE Common table expression
with CTE_example as
(
select employee_id,gender,birth_date
from employee_demographics 
where birth_date > '1985-01-01'
),
CTE_example2 as (
select employee_id,salary
from employee_salary
where salary > 50000

)
select * 
from CTE_example2
join CTE_example
on CTE_example2.employee_id = CTE_example.employee_id
;