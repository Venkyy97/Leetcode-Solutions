# Write your MySQL query statement below
with cte as(
    select *,
    count(*) over (partition by tiv_2015) as cnt_2015,
    count(*) over (partition by lat,lon) as cnt_lat_lon
    from insurance
)
select round(sum(tiv_2016),2) as tiv_2016
from cte
where cnt_2015> 1 and cnt_lat_lon = 1
