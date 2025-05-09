# Write your MySQL query statement below
select * 
from products 
where name regexp '^[^0-9]*[0-9]{3}[^0-9]*$'