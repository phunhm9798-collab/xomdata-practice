-- Xom Data · Types of bank accounts
-- Problem: https://xomdata.com/practice/easy-distinct-006
-- Solved: 2026-07-16

select DISTINCT(account_type) as "account_type" 
from accounts
order by account_type;
