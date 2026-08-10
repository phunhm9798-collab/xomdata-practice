-- Xom Data · Safety training results
-- Problem: https://xomdata.com/practice/easy-case-001
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select trainee_name, score,
CASE WHEN score >= 70 then 'Pass'
ELSE 'Fail'
end as result
from trainees;
