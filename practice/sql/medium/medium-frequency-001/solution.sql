-- Xom Data · Khách năng ghé trong nửa năm qua
-- Problem: https://xomdata.com/practice/medium-frequency-001
-- Solved: 2026-08-30

select customer_id, count(customer_id) as order_count
from orders
WHERE order_date BETWEEN '2024-01-01' and '2024-06-30'
group by customer_id
order by order_count desc, customer_id asc;
