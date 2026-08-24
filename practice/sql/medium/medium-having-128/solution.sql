-- Xom Data · Employees averaging over 5 overtime hours
-- Problem: https://xomdata.com/practice/medium-having-128
-- Solved: 2026-08-24

with stats as (
    SELECT full_name, employee_code,
    avg(work_days) as avg_work_days,
    avg(overtime_hours) as avg_overtime_hours,
    avg(net_salary) as avg_salary,
    ROUND(avg(overtime_hours) / avg(work_days), 4) as overtime_intensity
    FROM employees e
    join attendance a on e.id = a.employee_id
    join payroll p on e.id = p.employee_id
    group by full_name, employee_code
    HAVING avg(overtime_hours) > 5 AND avg(work_days) >= 18
)

SELECT full_name, employee_code, avg_work_days, avg_overtime_hours, avg_salary, overtime_intensity,
RANK() over(order by overtime_intensity desc) as intensity_rank,
NTILE(4) over(order by overtime_intensity desc) as workload_quartile
from stats
order by intensity_rank, employee_code;
