-- Xom Data · High-rated sellers with many orders
-- Problem: https://xomdata.com/practice/medium-having-019
-- Solved: 2026-08-24

with stats as (
    SELECT store_name, reputation_score,
    count(o.id) as order_count,
    DENSE_RANK() over(order by count(o.id) desc) as rank_by_orders
    from sellers s
    join orders o on s.id = o.seller_id
    where reputation_score >= 4.5
    GROUP BY store_name, reputation_score
    HAVING count(o.id) >= 3
)

SELECT store_name, reputation_score, order_count, rank_by_orders,
SUM(order_count) OVER (ORDER BY order_count DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_orders
from stats
order by rank_by_orders asc, store_name;
