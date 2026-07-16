-- Xom Data · Active menu sorted by price
-- Problem: https://xomdata.com/practice/easy-orderby-001
-- Solved: 2026-07-16

select dish_name, price
from menu
WHERE status = "Active"
order by price asc, dish_name ASC;
