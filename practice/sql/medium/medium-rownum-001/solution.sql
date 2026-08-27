-- Xom Data · Interview call numbers
-- Problem: https://xomdata.com/practice/medium-rownum-001
-- Solved: 2026-08-27

-- Viết SQL của bạn ở đây
SELECT  ROW_NUMBER() over(order by score desc, candidate_name) as call_no, 
candidate_name, score
from candidates
ORDER BY call_no asc;
