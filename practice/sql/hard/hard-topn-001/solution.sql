-- Xom Data · Top 3 products by sales in each category
-- Problem: https://xomdata.com/practice/hard-topn-001
-- Solved: 2026-08-14

WITH pre as (
    select category, 
    name as product_name,
    units_sold,
    DENSE_RANK() over(PARTITION BY category order by units_sold desc) as rn
    from products
)
select category, product_name, units_sold, rn as rank_in_cat
from pre
where rank_in_cat <= 3
ORDER BY category, rank_in_cat, product_name;
