WITH cte AS (
    SELECT player_id,
           event_date,
           ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn,
           LEAD(event_date, 1) OVER (PARTITION BY player_id ORDER BY event_date) AS next_event_date
    FROM Activity
)
-- Select players where the next event date is the day after the current event date
, consecutive_logins AS (
    SELECT player_id
    FROM cte
    WHERE rn = 1
      AND next_event_date = event_date + INTERVAL '1' DAY
)
-- Calculate the fraction of players with consecutive logins
SELECT ROUND(COUNT(DISTINCT consecutive_logins.player_id) * 1.0 / COUNT(DISTINCT cte.player_id), 2) AS fraction
FROM cte
LEFT JOIN consecutive_logins
ON cte.player_id = consecutive_logins.player_id;
