# Write your MySQL query statement below



select c.*
from customers c 
join orders o 
using (customer_id)
group by customer_id
having sum(product_name='A') > 0 and sum(product_name="B") > 0 and sum(product_name="C")=0
