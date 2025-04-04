# Write your MySQL query statement below
with cte as (
    select *,
    round(avg(activity_duration),2)  as trial_avg_duration
    from useractivity 
    where activity_type = 'free_trial'
    group by user_id

), cte2 as 
(
    select *,
    round(avg(activity_duration),2) as paid_avg_duration
    from useractivity 
    where activity_type = 'paid'
    group by user_id 
)
select p.user_id, f.trial_avg_duration, p.paid_avg_duration
from cte2 p 
join cte f 
using(user_id)
order by 1
