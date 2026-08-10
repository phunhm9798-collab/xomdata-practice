-- Xom Data · Countries our students come from
-- Problem: https://xomdata.com/practice/easy-distinct-008
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select count(DISTINCT country) as num_countries
from students;
