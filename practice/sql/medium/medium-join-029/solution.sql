-- Xom Data · Instructor teaching load
-- Problem: https://xomdata.com/practice/medium-join-029
-- Solved: 2026-08-12

select l.full_name, l.academic_degree,
COALESCE(COUNT(lecturer_id),0) as subjects_taught,
rank() over(order by COALESCE(COUNT(lecturer_id),0) desc) as workload_rank,
sum(count(lecturer_id)) over(order by count(lecturer_id) desc ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as cumulative_subjects
from lecturers l
left join subjects s on l.id = s.lecturer_id
GROUP BY l.full_name, l.academic_degree
order by workload_rank asc, full_name;
