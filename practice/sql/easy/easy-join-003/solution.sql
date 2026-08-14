-- Xom Data · Line totals from the price list
-- Problem: https://xomdata.com/practice/easy-join-003
-- Solved: 2026-08-14

-- Viết SQL của bạn ở đây
select product_name, quantity, quantity * price as line_total
from products
join sale_items on products.id = sale_items.product_id
