-- Xom Data · Names printed on staff badges
-- Problem: https://xomdata.com/practice/easy-concat-001
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select first_name, last_name, concat(first_name, ' ', last_name) as badge_name
from staff
;
