# Write your MySQL query statement below
select distinct p1.user_id
from purchases p1, purchases p2
where p1.user_id = p2.user_id
and p1.purchase_id <> p2.purchase_id
and abs(datediff(p2.purchase_date,p1.purchase_date)) <= 7
order by user_id