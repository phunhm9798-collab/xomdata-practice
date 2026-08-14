-- Xom Data · Orders with customer names
-- Problem: https://xomdata.com/practice/easy-join-001
-- Solved: 2026-08-14

-- Viết SQL của bạn ở đây
select order_code, customer_name, amount
from customers
join orders on customers.id = orders.customer_id;
