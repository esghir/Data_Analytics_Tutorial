
select gender,avg(salary)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender;

-- windows 
select dem.first_name,dem.last_name,gender,salary ,sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;


-- row number vs rank
select dem.first_name,dem.last_name,gender,salary ,
row_number() over(partition by gender order by salary desc) as row_numb,
rank() over(partition by gender order by salary desc) as rank_numb,
dense_rank() over(partition by gender order by salary desc) as dense_rank_numb 
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;