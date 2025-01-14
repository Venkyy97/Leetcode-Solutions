# Write your MySQL query statement below
with cte as (
    select *,
    rank() over (partition by customer_id order by order_date asc) as rnk 
    from delivery
   ), 
cte2 as (
    select * from cte
    where datediff(order_date,customer_pref_delivery_date) = 0 and rnk = 1)
select 
    round((select count(*) from cte2) * 100 / (select count(*) from cte
   where rnk = 1),2) as immediate_percentage
