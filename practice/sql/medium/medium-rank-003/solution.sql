-- Xom Data · Revenue rank of each category
-- Problem: https://xomdata.com/practice/medium-rank-003
-- Solved: 2026-08-27

-- Viết SQL của bạn ở đây
with pre as (
    select category, 
    sum(amount) as total_revenue
    from sales
    group by category
)

select category, total_revenue, 
rank() over(order by total_revenue desc) as revenue_rank
from pre
order by revenue_rank asc, category;
