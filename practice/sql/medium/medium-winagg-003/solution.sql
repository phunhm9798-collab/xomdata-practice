-- Xom Data · Distance from the class average
-- Problem: https://xomdata.com/practice/medium-winagg-003
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
with pre as (
    select class_name, student_name, score,
    avg(score) over(PARTITION BY class_name) as avg_score
    from scores
)

select class_name, student_name, score,
round((score - avg_score), 2) as diff_from_avg
from pre
order by class_name, student_name;
