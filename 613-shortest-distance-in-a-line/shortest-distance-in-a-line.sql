# Write your MySQL query statement below
with cte as (
    select (p2.x - p1.x) as dist
    from point p1, point p2
    where p2.x> p1.x

)
select min(dist) as shortest
from cte