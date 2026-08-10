-- Xom Data · Which sales channel leads in orders
-- Problem: https://xomdata.com/practice/easy-groupby-004
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select channel, count(id) as num_orders
from orders
group by channel
order by num_orders desc, channel;
