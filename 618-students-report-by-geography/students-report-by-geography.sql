with cte as (
    select case 
            when continent = "America" then name else null end as "America",
        case when continent = "Asia" then name else null end as "Asia",
         case when continent = "Europe" then name else null end as "Europe",
         row_number() over (partition by continent order by name) as rnk
    from student

)
select min(America) as America,
min(Asia) as Asia,
min(Europe) as Europe
from cte
group by rnk
