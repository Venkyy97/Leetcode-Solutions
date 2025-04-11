# Write your MySQL query statement below
with cte as (
    select r.ride_id, u.user_id, r.distance, u.name
    from users u
    left join rides r  
    using(user_id)
)
select user_id, name, ifnull(sum(distance), 0) as 'traveled distance'
from cte
group by user_id
order by user_id