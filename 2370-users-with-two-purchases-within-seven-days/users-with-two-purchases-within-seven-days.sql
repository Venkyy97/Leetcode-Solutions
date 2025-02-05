with cte as (select *,
lag(purchase_date) over (partition by user_id order by purchase_date) as prev
from purchases)

select distinct user_id
from cte
where datediff(purchase_date,prev) <= 7