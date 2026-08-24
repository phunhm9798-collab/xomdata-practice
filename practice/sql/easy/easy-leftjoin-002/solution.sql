-- Xom Data · Total spend per member
-- Problem: https://xomdata.com/practice/easy-leftjoin-002
-- Solved: 2026-08-24

-- Viết SQL của bạn ở đây
SELECT member_name, COALESCE(sum(amount) ,0) as total_spent
from members m
full join bills b on m.id = b.member_id
group by m.id
order by member_name
