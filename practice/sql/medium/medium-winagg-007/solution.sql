-- Xom Data · Above or below the department norm
-- Problem: https://xomdata.com/practice/medium-winagg-007
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
WITH pre as (
    SELECT department, full_name, salary,
    avg(salary) over(PARTITION BY department) as avg_sal
    from employees
)

SELECT department, full_name, salary,
CASE WHEN salary > avg_sal then 'Above'
     when salary < avg_sal then 'Below'
     else 'Equal'
     END AS position_label
from pre
order by department, full_name;
