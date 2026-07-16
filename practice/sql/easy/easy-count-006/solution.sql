-- Xom Data · Total number of bank accounts
-- Problem: https://xomdata.com/practice/easy-count-006
-- Solved: 2026-07-16

select count(account_number) as "total_accounts"
FROM accounts;
