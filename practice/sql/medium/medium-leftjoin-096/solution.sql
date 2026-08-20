-- Xom Data · Accounts with no posts
-- Problem: https://xomdata.com/practice/medium-leftjoin-096
-- Solved: 2026-08-20

with pre as (
    select full_name, username, account_type, created_at
    from users u
    where not exists (
        select 1 
        from posts p
        where p.user_id = u.id
    )   
),

mid as(
    select full_name, username, account_type, created_at,
    ROW_NUMBER() over(ORDER BY created_at asc, username) as signup_order
    from pre
)

select full_name, username, account_type, signup_order,
NTILE(4) OVER (ORDER BY created_at ASC, username ASC) AS tenure_quartile
from mid
order by signup_order asc;
