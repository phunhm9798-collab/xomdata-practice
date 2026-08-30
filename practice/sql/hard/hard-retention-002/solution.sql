-- Xom Data · Sau một tháng, còn lại bao nhiêu phần
-- Problem: https://xomdata.com/practice/hard-retention-002
-- Solved: 2026-08-30

WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_date,
        strftime('%Y-%m', MIN(order_date)) AS cohort_month,
        strftime('%Y-%m', date(MIN(order_date), '+1 month')) AS next_month
    FROM orders
    GROUP BY customer_id
),
customer_months AS (
    SELECT DISTINCT
        customer_id,
        strftime('%Y-%m', order_date) AS order_month
    FROM orders
),
retention_check AS (

    SELECT 
        fo.cohort_month,
        fo.customer_id,
        CASE 
            WHEN cm.order_month IS NOT NULL THEN 1 
            ELSE 0 
        END AS retained
    FROM first_orders fo
    LEFT JOIN customer_months cm 
        ON fo.customer_id = cm.customer_id 
        AND cm.order_month = fo.next_month
)

SELECT 
    cohort_month,
    COUNT(*) AS cohort_size,
    SUM(retained) AS retained_m1,
    ROUND(SUM(retained) * 100.0 / COUNT(*), 2) AS retention_pct
FROM retention_check
GROUP BY cohort_month
ORDER BY cohort_month ASC;
