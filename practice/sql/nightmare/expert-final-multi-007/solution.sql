-- Xom Data · Top 2 salespeople by sales each month
-- Problem: https://xomdata.com/practice/expert-final-multi-007
-- Solved: 2026-08-14

with pre as(
    select month,
    DENSE_RANK() OVER(PARTITION BY month order by sum(revenue) desc) as hang,
    employee_id,
    full_name,
    sum(revenue) as total_sales
    from employees e
    join sales s on e.id = s.employee_id
    GROUP BY month, e.id, e.full_name
)

select month, hang, employee_id, full_name, total_sales
from pre
where hang <= 2
order by month, hang, employee_id;
