-- Xom Data · Stock exchanges
-- Problem: https://xomdata.com/practice/easy-distinct-007
-- Solved: 2026-07-16

select DISTINCT(exchange) as "exchange"
from stocks
order by exchange;
