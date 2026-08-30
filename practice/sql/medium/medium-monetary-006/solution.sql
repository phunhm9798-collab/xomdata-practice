-- Xom Data · Sức chi mỗi tháng hoạt động
-- Problem: https://xomdata.com/practice/medium-monetary-006
-- Solved: 2026-08-30

WITH pre as (
    select customer_id, count(DISTINCT strftime('%m',order_date)) as active_months,
    sum(amount) as total_spent
    from orders
    group by customer_id
)

SELECT customer_id, total_spent, active_months,
round(total_spent * 1.0 / active_months,2) as spend_per_month
from pre
order by spend_per_month desc, customer_id asc;
