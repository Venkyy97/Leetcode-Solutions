# Write your MySQL query statement below
with cte as (
    
    select pc.invoice_id, pc.product_id, pc.quantity, Sum((quantity * price)) as total, price,
    rank() over (order by Sum((quantity * price)) desc, invoice_id asc) as rn
    from products p
    join purchases pc
    using(product_id)
    group by 1 
    limit 1
)
select product_id , quantity, price * quantity as price 
from purchases 
join products 
using(product_id)
where invoice_id in (select invoice_id from cte )