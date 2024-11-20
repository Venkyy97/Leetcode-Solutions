# Write your MySQL query statement below
with cte as (
    select *, count(*) as cnt
    from person
    group by email
)
select email as Email
from cte 
where cnt> 1