-- Xom Data · Ticket statuses guests can read
-- Problem: https://xomdata.com/practice/easy-join-005
-- Solved: 2026-08-24

-- Viết SQL của bạn ở đây
select ticket_code, status_name
from tickets t
join statuses s on t.status_code = s.code
