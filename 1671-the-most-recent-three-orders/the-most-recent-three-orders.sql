# Write your MySQL query statement below
with cte as (select c.*, o.order_id, o.order_date,
rank() over (partition by customer_id order by order_date desc) as rnk 
from customers c 
join orders o using (customer_id))

select name as customer_name, customer_id, order_id, order_date
from cte
where rnk < 4
order by 1 asc, 2 asc, 4 desc

