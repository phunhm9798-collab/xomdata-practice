-- Xom Data · Display names on profile pages
-- Problem: https://xomdata.com/practice/easy-coalesce-001
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select real_name, nickname, 
case when nickname IS NULL then real_name
     when nickname is not null then nickname
     end as display_name
from profiles;
