-- Xom Data · Sales champion of each region
-- Problem: https://xomdata.com/practice/medium-topn-001
-- Solved: 2026-08-27

-- Viết SQL của bạn ở đây
with pre as (
    select region, rep_name,
    RANK() over(PARTITION BY region order by sales_amount desc, rep_name) as rn,
    sales_amount
    from reps
)

select region, rep_name, sales_amount
from pre
where rn = 1
ORDER BY region;
