# Write your MySQL query statement below
with cte as (
    select s.*, p.price, s.quantity * p.price as total
    from sales s 
    join product p using (product_id)
)
select user_id, sum(total) as spending
from cte
group by 1 
order by 2 desc, 1 asc
