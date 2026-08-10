-- Xom Data · Headcount per membership plan
-- Problem: https://xomdata.com/practice/easy-groupby-001
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select plan, count(member_name) as num_members
from members
group by plan
order by plan;
