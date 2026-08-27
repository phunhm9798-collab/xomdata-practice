-- Xom Data · Top three sellers per category
-- Problem: https://xomdata.com/practice/medium-topn-002
-- Solved: 2026-08-27

-- Viết SQL của bạn ở đây
with pre as (
    SELECT category, product_name,
    RANK() over(PARTITION BY category order by units_sold desc, product_name) as rn,
    units_sold
    from menu_sales
)

select category, product_name, units_sold
from pre
where rn <=3
order by category, units_sold desc, product_name;
