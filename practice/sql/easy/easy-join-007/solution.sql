-- Xom Data · Deal count per client
-- Problem: https://xomdata.com/practice/easy-join-007
-- Solved: 2026-08-28

-- Viết SQL của bạn ở đây
select client_name, count(d.id) as num_deals
from clients c
join deals d on c.id = d.client_id
group by client_name
HAVING num_deals >= 1
order by count(d.id) desc, client_name
