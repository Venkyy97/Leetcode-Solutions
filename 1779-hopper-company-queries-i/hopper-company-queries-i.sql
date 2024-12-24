# Write your MySQL query statement below
with recursive months as(
    select 1 as month
    union all 
    select month + 1
    from months 
    where month < 12
)
select m.month,
    count(distinct driver_id) as active_drivers,
    count(distinct ride_id) as accepted_rides 

from months m
    left join (
        select d.driver_id,
        month(join_date) as d_month,
        year(join_date) as d_year
        from drivers d 
        where year(join_date) < 2021
    ) d on d.d_month <= m.month or d_year < 2020 
    left join (
        select r.ride_id,
        month(requested_at) as r_month
        from rides r inner join acceptedRides ar on ar.ride_id = r.ride_id
        where year(r.requested_at) = 2020
    ) r on m.month = r.r_month
    group by m.month