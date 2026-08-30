-- Xom Data · Ai nhập hội đúng mùa khuyến mãi
-- Problem: https://xomdata.com/practice/medium-cohort-007
-- Solved: 2026-08-30

WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
    HAVING first_order_date BETWEEN '2024-03-01' AND '2024-03-31'
)
SELECT 
    fo.customer_id,
    fo.first_order_date,
    COUNT(o.order_id) AS campaign_orders
FROM first_orders fo
JOIN orders o 
    ON fo.customer_id = o.customer_id 
    AND o.order_date BETWEEN '2024-03-01' AND '2024-03-31'
GROUP BY fo.customer_id, fo.first_order_date;
