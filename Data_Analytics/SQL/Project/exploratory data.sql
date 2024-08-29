-- exploratory data analytics

select * from layoffs_statgin2;

select max(total_laid_off)
from layoffs_statgin2;

select *
from layoffs_statgin2
where percentage_laid_off = 1
order by total_laid_off desc;

select company , sum(total_laid_off)/2
from layoffs_statgin2
group by company 
order by 2 desc;

select year(`date`) , sum(total_laid_off)/2
from layoffs_statgin2
group by year(`date`)
order by 1 desc;

select substring(`date`,1,7) as `MOUNTH` , sum(total_laid_off)
from layoffs_statgin2
where substring(`date`,1,7) is not null
group by `MOUNTH`
order by 1;

with roliing_total as 
(
select substring(`date`,1,7) as `MOUNTH` , sum(total_laid_off) as total_off
from layoffs_statgin2
where substring(`date`,1,7) is not null
group by `MOUNTH`
order by 1 asc
)
select `MOUNTH` , sum(total_off) over(order by `MOUNTH`) as rolling_total
from roliing_total;

with company_year(company, years , total_laid_off) as
(
select company,year(`date`),sum(total_laid_off)
from layoffs_statgin2
group by company,year(`date`)
),company_year_rank as (
select * , dense_rank() over (partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select * 
from company_year_rank
where ranking<=5;
