-- Xom Data · Regional payroll with shares
-- Problem: https://xomdata.com/practice/medium-winagg-010
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
with pre as (
    SELECT region, staff_name, salary, 
    sum(salary) OVER(PARTITION BY region) as region_total
    from payroll
)

select region, staff_name, salary, region_total,
ROUND(salary * 100.0 / region_total, 2) as pct_of_region
from pre
order by region, salary desc, staff_name;
