# Write your MySQL query statement below
select ceil(minute/6) as interval_no,
sum(order_count) as total_orders
from orders 
group by ceil(minute/6) 
order by 1 asc