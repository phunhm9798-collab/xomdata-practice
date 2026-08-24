-- Xom Data · Employees paid above their department average
-- Problem: https://xomdata.com/practice/medium-subquery-110
-- Solved: 2026-08-24

with pre as (
    select full_name, dept_name, salary,
    round(avg(salary) over(PARTITION BY dept_name),0) as dept_avg_salary
    from departments d
    join employees e on d.id = e.department_id
    group by full_name,dept_name
)

select full_name, dept_name, salary, dept_avg_salary,
ROUND((salary - dept_avg_salary) * 100.0 / dept_avg_salary,2) as premium_pct
from pre
where salary > dept_avg_salary
order by premium_pct desc, dept_name, full_name;
