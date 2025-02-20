# Write your MySQL query statement below
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY server_id ORDER BY status_time) AS rn 
    FROM Servers 
    WHERE session_status="start"
)

,CTE2 AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY server_id ORDER BY status_time) AS rn 
    FROM Servers 
    WHERE session_status="stop"
)

SELECT FLOOR(SUM(TIMESTAMPDIFF(SECOND, CTE.status_time, CTE2.status_time)) / (60 * 60 * 24)) AS total_uptime_days
FROM CTE JOIN CTE2 ON CTE.server_id=CTE2.server_id AND CTE.rn=CTE2.rn