-- Xom Data · Second-highest-paid employee per department
-- Problem: https://xomdata.com/practice/expert-final-subq-003
-- Solved: 2026-08-14

with pre as (
    select department, full_name,
    DENSE_RANK() over(PARTITION BY department ORDER BY salary desc) as rn, 
    salary
    from employees
)
select department, full_name, salary
from pre
where rn = 2
order by department, full_name;
