-- Xom Data · Intake sequence per warehouse
-- Problem: https://xomdata.com/practice/medium-rownum-002
-- Solved: 2026-08-27

-- Viết SQL của bạn ở đây
SELECT warehouse,
ROW_NUMBER() over(PARTITION BY warehouse order by entry_date asc, product) as entry_no,
product, entry_date
from stock_entries
order by warehouse, entry_no asc;
