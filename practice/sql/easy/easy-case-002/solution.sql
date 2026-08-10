-- Xom Data · Sizing parcels by weight
-- Problem: https://xomdata.com/practice/easy-case-002
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select parcel_code, weight_kg,
case when weight_kg > 20 then 'Large'
     when weight_kg <= 20 and weight_kg >= 5 then 'Medium'
     when weight_kg < 5 then 'Small'
     end as size_label
from parcels
