-- Xom Data · Nhịp mua hàng và tín hiệu rời bỏ
-- Problem: https://xomdata.com/practice/hard-gap-001
-- Solved: 2026-08-30

with pre as (
    select customer_id,
    LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) as prev_date, 
    order_date
    from orders
), 

pre2 as (
    select customer_id, prev_date,
    (julianday(order_date) - julianday(prev_date)) * 1.0 as gap_days
    from pre
),

pre3 as (
    select customer_id, prev_date,
    round(avg(gap_days), 1) as avg_gap_days
    from pre2
    group by customer_id
)

select customer_id, avg_gap_days, 
CASE when avg_gap_days IS NULL then 'single'
     when avg_gap_days <= 30 then 'fast'
     when avg_gap_days > 30 then 'slow'
end as pace
from pre3
