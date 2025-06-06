# Write your MySQL query statement below
with cte as (
    select *, (likes + dislikes) as total
    from problems
)
select problem_id 
from cte
where (likes/total * 100.00) < 60
order by 1 asc
