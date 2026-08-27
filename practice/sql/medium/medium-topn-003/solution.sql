-- Xom Data · Shift bonus for every top performer
-- Problem: https://xomdata.com/practice/medium-topn-003
-- Solved: 2026-08-27

-- Viết SQL của bạn ở đây
with pre as (
    select
    staff_name, store, orders_served,
    DENSE_RANK() over(PARTITION BY store order by orders_served desc) as rn
    from shift_stats
)

select store, staff_name, orders_served
from pre 
where rn = 1
ORDER BY store, staff_name;
