-- Xom Data · How far from the server's top
-- Problem: https://xomdata.com/practice/medium-winagg-004
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
with pre as (
    select server, player_name, points,
    max(points) over(PARTITION BY server) as max_points
    from players
)

SELECT server, player_name, points, 
(max_points - points) as gap_to_top
from pre
order by server, gap_to_top asc ,player_name;
