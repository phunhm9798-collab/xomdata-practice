-- Xom Data · Sales rankings with department names
-- Problem: https://xomdata.com/practice/medium-winjoin-001
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
SELECT dept_name,
rank() over(PARTITION BY dept_id order by sales_amount desc) as dept_rank,
staff_name, sales_amount
from departments d
join staff s on d.id = s.dept_id
order by dept_name, dept_rank asc, staff_name;
