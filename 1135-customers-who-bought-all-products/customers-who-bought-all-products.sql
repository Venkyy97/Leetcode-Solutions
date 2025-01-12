WITH cte AS (
    SELECT 
        customer_id, 
        product_key,
        COUNT(distinct product_key)  as num
        from customer group by customer_id
    
), cte2 as
(select count(distinct product_key) as num from product  )
select a.customer_id from cte a inner join cte2 b 
on a.num = b.num