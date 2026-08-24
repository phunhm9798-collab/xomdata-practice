-- Xom Data · Players with 3 or more goals
-- Problem: https://xomdata.com/practice/medium-having-187
-- Solved: 2026-08-24

WITH player_goals AS (
    SELECT 
        player_id,
        COUNT(*) AS goal_count,
        COUNT(DISTINCT match_id) AS scoring_matches
    FROM goals
    GROUP BY player_id
),
player_penalties AS (
    SELECT 
        player_id,
        COUNT(*) AS cards_received
    FROM penalties
    GROUP BY player_id
),
player_stats AS (
    SELECT 
        p.id,
        p.full_name,
        p.positions,
        t.team_name,
        COALESCE(pg.goal_count, 0) AS goal_count,
        COALESCE(pg.scoring_matches, 0) AS scoring_matches,
        COALESCE(pp.cards_received, 0) AS cards_received,
        ROUND(
            COALESCE(pg.goal_count, 0) * 1.0 / NULLIF(COALESCE(pg.scoring_matches, 0), 0), 
            2
        ) AS goals_per_match
    FROM players p
    JOIN teams t ON p.team_id = t.id
    LEFT JOIN player_goals pg ON p.id = pg.player_id
    LEFT JOIN player_penalties pp ON p.id = pp.player_id
),
filtered AS (
    SELECT 
        full_name,
        positions AS positions,   -- ✅ rename if needed
        team_name,
        goal_count,
        scoring_matches,
        cards_received,
        goals_per_match
    FROM player_stats
    WHERE goal_count >= 3 AND cards_received < 5
)
SELECT 
    full_name,
    positions,
    team_name,
    goal_count,
    scoring_matches,
    cards_received,
    goals_per_match,
    DENSE_RANK() OVER (ORDER BY goals_per_match DESC) AS efficiency_rank,
    RANK() OVER (ORDER BY goal_count DESC) AS volume_rank
FROM filtered
ORDER BY efficiency_rank, full_name;
