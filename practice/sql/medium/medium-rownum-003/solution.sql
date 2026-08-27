-- Xom Data · Visit number within each day
-- Problem: https://xomdata.com/practice/medium-rownum-003
-- Solved: 2026-08-27

-- Viết SQL của bạn ở đây
with pre as (
    SELECT checkin_date, 
    ROW_NUMBER() over(PARTITION BY checkin_date order by checkin_time asc, member_name) as visit_no,
    member_name, checkin_time
    from checkins
)

SELECT checkin_date, visit_no, member_name, checkin_time
from pre
order by checkin_date asc, visit_no asc;
