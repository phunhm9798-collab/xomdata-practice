-- Xom Data · Delivery performance by size class
-- Problem: https://xomdata.com/practice/medium-case-160
-- Solved: 2026-08-24

WITH truck_stats AS (
    SELECT
        t.id,
        t.vehicle_type,
        t.capacity_tons,
        COUNT(DISTINCT s.id) AS shipment_count,
        COUNT(CASE WHEN d.results = 'success' THEN 1 END) AS delivered,
        CASE
            WHEN t.capacity_tons >= 10 THEN 'Large Truck'
            WHEN t.capacity_tons >= 5 AND t.capacity_tons < 10 THEN 'Medium Truck'
            ELSE 'Small Truck'
        END AS size_class
    FROM trucks t
    LEFT JOIN shipments s ON t.id = s.truck_id
    LEFT JOIN deliveries d ON s.id = d.shipment_id
    GROUP BY t.id, t.vehicle_type, t.capacity_tons
)
SELECT
    vehicle_type,
    capacity_tons,
    shipment_count,
    size_class,
    delivered,
    ROUND(COALESCE(delivered * 100.0 / NULLIF(shipment_count, 0), 0), 2) AS delivery_rate,
    RANK() OVER (
        PARTITION BY size_class
        ORDER BY COALESCE(delivered * 100.0 / NULLIF(shipment_count, 0), 0) DESC
    ) AS rank_in_size
FROM truck_stats
ORDER BY size_class ASC, rank_in_size ASC, vehicle_type ASC;
