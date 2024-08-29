-- triggers and events
delimiter $$
create trigger employee_insert
	AFTER INSERT ON employee_salary
    for each row
begin 
insert into employee_demographics(employee_id,first_name,last_name)
values (new.employee_id,new.first_name,new.last_name);
end $$

delimiter ;


insert into employee_salary(employee_id,first_name,last_name,salary,occupation,dept_id)
values (13,"Amine",'Esghir',100000,'Engineer',Null);

select * 
from employee_salary;


select * 
from employee_demographics;

-- events
delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin 
delete 
from employee_demographics
where age >= 60;
end $$

delimiter ;

show variables like 'event%'

