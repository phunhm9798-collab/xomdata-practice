-- Xom Data · Each category's slice of revenue
-- Problem: https://xomdata.com/practice/medium-winagg-009
-- Solved: 2026-08-30

WITH category_revenue AS (
    SELECT 
        category,
        SUM(amount) AS total_revenue
    FROM sales
    GROUP BY category
),
overall_total AS (
    SELECT SUM(amount) AS total FROM sales
)
SELECT 
    category,
    total_revenue,
    ROUND(total_revenue * 100.0 / (SELECT total FROM overall_total), 2) AS pct_share
FROM category_revenue
ORDER BY total_revenue DESC, category;
