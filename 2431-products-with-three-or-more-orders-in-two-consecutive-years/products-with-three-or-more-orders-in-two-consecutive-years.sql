# Write your MySQL query statement below
with cte as (
    select product_id, year(purchase_date) as yr 
    from orders
    group by 1,2
    having count(order_id) >= 3
)
select distinct c1.product_id from cte c1, cte c2 
where c1.product_id = c2.product_id and c2.yr = c1.yr + 1

