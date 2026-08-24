-- Xom Data · Accounts that must be renamed
-- Problem: https://xomdata.com/practice/easy-length-001
-- Solved: 2026-08-24

-- Viết SQL của bạn ở đây
SELECT username, level
from players
where length(username) < 6
