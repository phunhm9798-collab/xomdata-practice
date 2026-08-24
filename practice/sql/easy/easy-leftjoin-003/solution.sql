-- Xom Data · Booking count per branch
-- Problem: https://xomdata.com/practice/easy-leftjoin-003
-- Solved: 2026-08-24

-- Viết SQL của bạn ở đây
SELECT branch_name, count(bo.id) as num_bookings
from branches br
left join bookings bo on br.id = bo.branch_id
group by branch_name
ORDER BY branch_name;
