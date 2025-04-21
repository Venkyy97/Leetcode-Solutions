# Write your MySQL query statement below
with cte as (
    select c.salesperson_id, c.customer_id, sum(price) as totalsum
    from customer c 
    left join sales s on s.customer_id = c.customer_id
    group by salesperson_id
    )
select p.salesperson_id, p.name, ifnull(cte.totalsum, 0) as total
from salesperson p 
left join cte using(salesperson_id)

