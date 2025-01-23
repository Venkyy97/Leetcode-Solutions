# Write your MySQL query statement below
with cte as (
    select *,
    lead(visit_date,1,'2021-1-1') over (partition by user_id order by visit_date) as prev
    from uservisits
)
select user_id,
max(datediff(prev,visit_date)) as biggest_window
from cte
group by user_id
order by 1,2