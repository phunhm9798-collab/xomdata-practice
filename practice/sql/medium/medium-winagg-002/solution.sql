-- Xom Data · Product share within its store
-- Problem: https://xomdata.com/practice/medium-winagg-002
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
with pre as(
    select store, product, amount,
    sum(amount) over(PARTITION BY store) as store_total
    from store_sales
)

select store, product, amount,
round(amount * 100.0 /store_total, 2) as pct_of_store
from pre
order by store, product;
