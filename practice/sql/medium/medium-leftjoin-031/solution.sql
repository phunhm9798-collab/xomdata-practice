-- Xom Data · Candidates not yet interviewed
-- Problem: https://xomdata.com/practice/medium-leftjoin-031
-- Solved: 2026-08-20

with not_interviewed as (
    select id, full_name, email, application_date
    from candidates c
    where not exists (
        select 1 
        from interviews i
        where i.candidate_id = c.id
    )
),

queue as (
    select id, full_name, email, application_date,
    ROW_NUMBER() over(order by application_date asc, full_name) as queue_position,
    count(*) over() as total_waiting
    from not_interviewed
)

SELECT full_name, email, application_date, queue_position,
round(COALESCE((queue_position - 1) * 100.0 / (total_waiting - 1),0), 2) as older_than_pct
from queue
order by queue_position asc;
