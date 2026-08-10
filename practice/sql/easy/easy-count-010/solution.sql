-- Xom Data · Tickets still valid
-- Problem: https://xomdata.com/practice/easy-count-010
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select count(status)  as valid_tickets
from tickets
where status = 'Valid';
