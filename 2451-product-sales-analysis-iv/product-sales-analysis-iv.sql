# Write your MySQL query statement below
with cte as (
    select user_id, s.product_id,sum(quantity * price) as total,
    dense_rank() over (partition by user_id order by sum(quantity * price) desc) as rnk
    from sales s 
    join product p on
    s.product_id = p.product_id
    group by user_id, product_id
)
select user_id,product_id from cte
where rnk = 1
