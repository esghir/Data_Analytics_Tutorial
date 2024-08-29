-- procedure 
use parks_and_recreation;


call large_slaries();


delimiter $$
create procedure large_slaries3()
begin 
	select * 
	from employee_salary
	where salary >= 50000;
	select * 
	from employee_salary
	where salary >= 10000;
end  $$
delimiter ;
call large_slaries3();

delimiter $$
create procedure large_slaries4(p_employee_id int)
begin 
	select salary 
	from employee_salary
	where employee_id=p_employee_id;

end  $$
delimiter ;
call large_slaries4(1);