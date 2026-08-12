-- Xom Data · Customer spending per order
-- Problem: https://xomdata.com/practice/medium-join-001
-- Solved: 2026-08-12

SELECT full_name, 
count(o.id) as order_count,
COALESCE(sum(total_amount), 0) as total_spending,
COALESCE(ROUND(avg(total_amount),0), 0) as avg_order_value,
DENSE_RANK() over(order by sum(total_amount) desc, full_name asc) as spending_rank
from customers c
join orders o on c.id = o.customer_id
group by full_name;
