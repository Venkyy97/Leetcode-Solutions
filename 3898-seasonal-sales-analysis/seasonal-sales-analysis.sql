# Write your MySQL query statement below
with cte  as(
    select   sum(s.quantity * s.price) as total_revenue, sum(quantity) as total_quantity, category,
    case when
        month(sale_date) in( 12,1,2) then 'Winter'
        when month(sale_date) in (3,4,5) then 'Spring'
        when month(sale_date) in (6,7,8) then 'Summer'
        else 'Fall' end as 'season'
    from sales s 
    join products p using (product_id)
    group by season, category ),
cte2 as (
    select season, category, total_quantity,total_revenue,
    rank() over(partition by season order by total_quantity desc, total_revenue desc) as rnk 
    from cte 
)
select season, category, total_quantity, total_revenue
from cte2
where rnk = 1 
order by season asc
  

   


