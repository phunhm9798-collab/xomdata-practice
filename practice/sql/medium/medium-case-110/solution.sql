-- Xom Data · Classify products by sales velocity
-- Problem: https://xomdata.com/practice/medium-case-110
-- Solved: 2026-07-16

SELECT
    p.name,
    p.categories,
    SUM(t.quantity) AS total_sold,   
    CASE
        WHEN SUM(t.quantity) >= 100 THEN "Best Seller"
        WHEN SUM(t.quantity) >= 50 AND SUM(t.quantity) < 100 THEN "Average"
        WHEN SUM(t.quantity) < 50 THEN "Slow Mover"
    END AS classification,
    DENSE_RANK() OVER (
        PARTITION BY p.categories 
        ORDER BY SUM(t.quantity) DESC   
    ) AS rank_in_cat,
    ROUND(
        (SUM(t.quantity) * 100.0) / 
        NULLIF(SUM(SUM(t.quantity)) OVER (PARTITION BY p.categories), 0), 
        2
    ) AS pct_of_cat_total   
FROM products p
JOIN transactions t ON p.id = t.product_id
GROUP BY p.id, p.name, p.categories  
ORDER BY 
    p.categories, 
    rank_in_cat, 
    p.name;
