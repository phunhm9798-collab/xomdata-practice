-- Xom Data · Vùng cảnh báo vàng trước khi mất khách
-- Problem: https://xomdata.com/practice/medium-churn-005
-- Solved: 2026-08-30

with pre as (
    select customer_id,
    max(order_date) as last_order_date
    from orders
    GROUP BY customer_id
)

select customer_id, last_order_date,
julianday('2024-06-30') - julianday(last_order_date) as days_silent
from pre
where julianday('2024-06-30') - julianday(last_order_date) BETWEEN 60 and 89
order by days_silent desc, customer_id
