-- Xom Data · Stock-in history by supplier
-- Problem: https://xomdata.com/practice/medium-join-014
-- Solved: 2026-08-12

select w.warehouse_name,
COUNT(s.id) as import_count,
COUNT(DISTINCT s.product_id) as distinct_product_count,
count(DISTINCT s.suppliers) as distinct_supplier_count,
max(s.import_date) as last_import_date,
rank() over(order by count(s.warehouse_id) desc) as activity_rank,
lag(w.warehouse_name) over(order by count(s.warehouse_id) DESC) as prev_warehouse
from warehouses w
join stock_imports s on w.id = s.warehouse_id
join products p on s.product_id = p.id
group by warehouse_name
order by activity_rank asc, warehouse_name;
