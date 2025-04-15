# Write your MySQL query statement below
with cte as 
    (select *,
    case when 
        amount % 2 = 0 then 'even'
        else 'odd' end as 'type' 
    from transactions)
select  transaction_date,
sum(case when type = 'odd' then amount else 0 end ) as odd_sum,
sum(case when type = 'even' then amount else 0 end ) as even_sum
from cte 
group by 1 
order by 1
 

