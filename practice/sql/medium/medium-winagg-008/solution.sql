-- Xom Data · Category price range next to each item
-- Problem: https://xomdata.com/practice/medium-winagg-008
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
SELECT category, product_name, price,
MIN(price) over(PARTITION BY category) as cat_min,
MAX(price) over(PARTITION BY category) as cat_max
from products
order by category, price, product_name;
