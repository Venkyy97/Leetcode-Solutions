with cte as (select v.fuel_type, d.driver_id, round(avg(t.rating),2) as rating, avg(d.accidents) as accidents,
sum(t.distance) as distance
from trips t
left join vehicles v 
on t.vehicle_id = v.vehicle_id
left join drivers d 
on v.driver_id = d.driver_id
group by v.fuel_type, d.driver_id),
cte2 as (
    select *,
    rank() over (partition by fuel_type order by rating desc, distance desc, accidents asc) as rnk
    from cte
)
select fuel_type, driver_id, rating, distance
from cte2 
where rnk = 1 