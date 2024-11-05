# Write your MySQL query statement below
SELECT c.name
FROM candidate c
JOIN (
  SELECT candidateid
  FROM vote
  GROUP BY candidateid
  ORDER BY COUNT(id) DESC
  LIMIT 1
) AS v
ON c.id = v.candidateid;
