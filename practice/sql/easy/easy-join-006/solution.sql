-- Xom Data · Customers who ever bought skincare
-- Problem: https://xomdata.com/practice/easy-join-006
-- Solved: 2026-08-28

-- Viết SQL của bạn ở đây
SELECT customer_name
from customers
where id in (
    select customer_id
    from purchases
    where category = 'Skincare'
)
