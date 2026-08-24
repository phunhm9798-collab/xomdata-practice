-- Xom Data · Suppliers that deliver late frequently
-- Problem: https://xomdata.com/practice/medium-having-162
-- Solved: 2026-08-24

with stats1 as(
    select supplier_name, material_type,
    count(p.id) as purchase_count,
    sum(total_value) as total_purchase_value,
    round(avg(julianday(actual_receipt) - julianday(expected_receipt)), 2) as avg_late_days,
    ROUND(AVG(CASE WHEN actual_receipt <= expected_receipt THEN 100.0 ELSE 0 END), 2) AS on_time_rate
    FROM suppliers s
    join purchase_orders p on s.id = p.supplier_id
    GROUP BY supplier_name, material_type
),

stats2 as (
    SELECT supplier_name, material_type, purchase_count, total_purchase_value, avg_late_days, on_time_rate,
    rank() OVER(order by avg_late_days desc) as late_rank, 
    NTILE(4) over(ORDER BY avg_late_days desc) as risk_tier
    from stats1
    where purchase_count >= 3 and avg_late_days > 0
)

select supplier_name, material_type, purchase_count, total_purchase_value, avg_late_days, on_time_rate, late_rank, risk_tier
from stats2
ORDER BY late_rank asc, supplier_name;
