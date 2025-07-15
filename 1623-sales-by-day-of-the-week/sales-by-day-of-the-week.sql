# Write your MySQL query statement below
select item_category as category,
    sum(case when dayofweek(order_date)=2 then quantity else 0 end) 'Monday',
    sum(case when dayofweek(order_date)=3 then quantity else 0 end) 'Tuesday',
    sum(case when dayofweek(order_date)=4 then quantity else 0 end) 'Wednesday',
    sum(case when dayofweek(order_date)=5 then quantity else 0 end) 'Thursday',
    sum(case when dayofweek(order_date)=6 then quantity else 0 end) 'Friday',
    sum(case when dayofweek(order_date)=7 then quantity else 0 end) 'Saturday',
    sum(case when dayofweek(order_date)=1 then quantity else 0 end) 'Sunday'
from orders o
right join items i
on o.item_id = i.item_id
group by item_category
order by 1 