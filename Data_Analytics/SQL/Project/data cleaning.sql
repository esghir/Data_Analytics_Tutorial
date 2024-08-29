-- data cleaning

select * 
from layoffs;

-- 1. Remove duplicate
-- 2. standarlize the data 
-- 3. Null values or blasnk values
-- 4. Remove any columns
create table layoffs_statgin
like layoffs;

insert into layoffs_statgin
select * 
from layoffs;
select * from layoffs_statgin;
-- 1. Remove duplicate
with duplicate_cte as
(
select *,
ROW_NUMBER() over(
partition by company , location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_statgin
)
select * 
from duplicate_cte
where row_num >1;

CREATE TABLE `layoffs_statgin2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_statgin2
select *,
ROW_NUMBER() over(
partition by company , location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_statgin;
SET SQL_SAFE_UPDATES = 0; -- disable the safe mode to delete and update the tables

delete 
from layoffs_statgin2
where row_num >1;

select * from layoffs_statgin2;

-- 2. standarlize the data 
select company,trim(company)
from layoffs_statgin2;

update layoffs_statgin2
set company = trim(company);

select *
from layoffs_statgin2
where industry like 'Crypto%';

update layoffs_statgin2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct location 
from layoffs_statgin2
order by 1 asc;

SELECT DISTINCT country, 
       TRIM(TRAILING '.' FROM country) AS trimmed_country
FROM layoffs_statgin2
ORDER BY 1;

update layoffs_statgin2
set country = TRIM(TRAILING '.' FROM country);
select * 
from layoffs_statgin2;

select * from layoffs_statgin2;
update layoffs_statgin2
set `date` = str_to_date(`date`,'%m/%d/%Y') ;

alter table layoffs_statgin2
modify column `date` date;

select * 
from layoffs_statgin2
where total_laid_off is null
and percentage_laid_off is null;


select * 
from layoffs_statgin2
where industry is null 
or industry = '';

-- 3. Null values or blasnk values
select t1.industry,t2.industry
from layoffs_statgin2 t1
join layoffs_statgin2 t2
on t1.company = t2.company
where (t1.industry is null or t1.industry ='')
and t2.industry is not null;

update layoffs_statgin2
set industry = null
where industry = '';
update layoffs_statgin2 t1 
join layoffs_statgin2 t2
on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null )
and t2.industry is not null;

select * 
from layoffs_statgin2
where company = 'Airbnb';

delete 
from layoffs_statgin2
where total_laid_off is null and percentage_laid_off is null;

alter table layoffs_statgin2
drop column row_num;
select * 
from layoffs_statgin2;