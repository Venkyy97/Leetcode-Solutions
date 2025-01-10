with cte as(
    select *, hour(call_time) as hour,
    count(*) as cnt 
    from calls 
    group by city, hour(call_time)
),
cte2 as (
    select *, dense_rank() over (partition by city order by cnt desc) rnk from cte
)
select city, hour as peak_calling_hour, cnt as number_of_calls from cte2
where rnk = 1
order by peak_calling_hour desc, city desc
