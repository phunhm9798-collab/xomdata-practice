-- Xom Data · Classify student academic performance
-- Problem: https://xomdata.com/practice/medium-case-124
-- Solved: 2026-07-16

SELECT full_name, student_code, round(AVG(final_score), 2) as "avg_score",
    CASE 
    WHEN round(AVG(final_score), 2) >= 9 THEN "Excellent"
    WHEN round(AVG(final_score), 2) < 9 AND round(AVG(final_score), 2) >=8 THEN "Good"
    WHEN round(AVG(final_score), 2) < 8 AND round(AVG(final_score), 2) >= 7 THEN "Fair"
    WHEN round(AVG(final_score), 2) < 7 AND round(AVG(final_score), 2) >= 5 THEN "Average"
    WHEN round(AVG(final_score), 2) < 5 THEN "Poor"
    END as "grade"
, DENSE_RANK() OVER(ORDER BY round(avg(final_score),2) desc) as "class_rank"
from students s 
join scores c on s.id = c.student_id
GROUP BY full_name, student_code
ORDER BY avg_score DESC, c.student_id ASC;
