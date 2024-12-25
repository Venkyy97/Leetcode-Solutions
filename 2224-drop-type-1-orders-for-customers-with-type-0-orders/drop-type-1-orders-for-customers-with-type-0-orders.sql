# Write your MySQL query statement below
select * from orders where order_type = 0
union
select * from orders 
where order_type = 1 and customer_id not in (select customer_id from orders where order_type = 0)
