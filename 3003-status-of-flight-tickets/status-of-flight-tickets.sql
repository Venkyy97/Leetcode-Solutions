# Write your MySQL query statement below
with cte as (
    select p.*, f.capacity,
    dense_rank() over ( partition by p.flight_id order by booking_time asc) as rnk 
    from passengers p 
    join flights f 
    on p.flight_id = f.flight_id
)
select passenger_id,
    case when rnk <= capacity then "Confirmed"
        else "Waitlist" end as "Status"
from cte
order by 1