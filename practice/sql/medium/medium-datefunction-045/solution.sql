-- Xom Data · Transaction count and amount by month
-- Problem: https://xomdata.com/practice/medium-datefunction-045
-- Solved: 2026-08-18

WITH monthly AS (
    SELECT 
        strftime('%Y-%m', transaction_date) AS month,
        COUNT(id) AS transaction_count,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY strftime('%Y-%m', transaction_date)
)

select month, transaction_count, total_amount,
total_amount - lag(total_amount,1) over(order by month) as mom_delta
from monthly
order by month asc;
