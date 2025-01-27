# Write your MySQL query statement below
WITH ranked_original AS (
    SELECT 
        team_id, 
        name,
        points,
        DENSE_RANK() OVER (ORDER BY points DESC, name ASC) as original_rank
    FROM teampoints
),
updated_rank AS (
    SELECT 
        teampoints.team_id, 
        name,
        points,
        points_change,
        points+points_change AS new_points,
        DENSE_RANK() OVER (ORDER BY (points+points_change) DESC, name ASC) as updated_rank
    FROM teampoints
    JOIN PointsChange ON PointsChange.team_id = teampoints.team_id
)

SELECT 
    updated_rank.team_id,
    updated_rank.name,
    CAST(original_rank AS SIGNED) - CAST(updated_rank AS SIGNED) rank_diff
FROM updated_rank
JOIN ranked_original ON ranked_original.team_id = updated_rank.team_id

