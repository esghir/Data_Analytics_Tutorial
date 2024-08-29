-- temporary table
create temporary table temp_table
(first_name varchar(25),
last_name varchar(25),
favorite_movie varchar(25)

);
select * from temp_table;
insert into temp_table
values('alex','esghir','spongebob');

select * from temp_table;

create temporary table salary_over_50k
select * 
from employee_salary
where salary >=50000;

select * from salary_over_50k;