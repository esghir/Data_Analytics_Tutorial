SELECT * FROM employee_demographics ;
SELECT * FROM employee_salary ;

-- inner join is a default statement 
select dem.employee_id,occupation,age
from employee_demographics   dem 
inner join employee_salary   sal
on dem.employee_id = sal.employee_id;

-- outer join  left and right
select *
from employee_demographics as dem 
right join employee_salary as sal
on dem.employee_id = sal.employee_id;

-- self join
select *
from employee_salary as emp1 
join employee_salary as emp2
on emp1.employee_id +1 = emp2.employee_id ;

-- multi joining tables
select *
from employee_demographics   dem 
inner join employee_salary   sal
on dem.employee_id = sal.employee_id
join parks_departments dep
on sal.dept_id = dep.department_id;

select * 
from parks_departments;