-- Xom Data · Products more expensive than the category average
-- Problem: https://xomdata.com/practice/medium-subquery-103
-- Solved: 2026-08-24

with pre as (
    SELECT product_name, category, price,
    avg(price) over(PARTITION BY category) as avg_price
    from products
    GROUP BY product_name, category
)

select product_name, category, price,
round(price - avg_price, 0) as diff_from_avg,
round((price - avg_price) * 100.0 / avg_price, 2) as pct_above
from pre
where price > avg_price
group by product_name, category
order by pct_above desc, product_name;
