# Write your MySQL query statement below
select round(min(sqrt((a.x-b.x)*(a.x-b.x) + (a.y-b.y)*(a.y-b.y))),2) as shortest
from Point2D a, Point2D b
where (a.x,a.y) != (b.x,b.y)