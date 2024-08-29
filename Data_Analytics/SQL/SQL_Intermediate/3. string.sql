-- length 
select first_name , length(first_name) as length
from employee_demographics
order by length;

-- upper lower
select upper('sky');
select lower('SKY');
select first_name , upper(first_name) as upper
from employee_demographics
order by upper;

-- trim left/right
select trim('                  sky     ');
select ltrim('                  sky     ');
select rtrim('                  sky     ');

-- left() / right()/ substring   string starts by 1 in position 
select first_name,
left(first_name,4),
right(first_name,4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2)
from employee_demographics;

-- replace
select first_name , replace(first_name,'a','z')
from employee_demographics;
-- locate 
select locate('A','Esghir Amine');
select first_name , locate('An',first_name)
from employee_demographics;
-- concat
select first_name,last_name,
concat(first_name,' ',last_name) as full_name
from employee_demographics;







