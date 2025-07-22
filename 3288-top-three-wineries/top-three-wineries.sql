WITH ranked AS (
  SELECT
    country,
    CONCAT(winery, ' (', SUM(points), ')') AS winery_with_pts,
    RANK() OVER (
      PARTITION BY country
      ORDER BY SUM(points) DESC, winery
    ) AS rnk
  FROM wineries
  GROUP BY country, winery
)
SELECT
  country,
  MAX(CASE WHEN rnk = 1 THEN winery_with_pts END)                   AS top_winery,
  COALESCE(
    MAX(CASE WHEN rnk = 2 THEN winery_with_pts END),
    'No second winery'
  )                                                                  AS second_winery,
  COALESCE(
    MAX(CASE WHEN rnk = 3 THEN winery_with_pts END),
    'No third winery'
  )                                                                  AS third_winery
FROM ranked
GROUP BY country
ORDER BY country;
