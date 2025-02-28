# Write your MySQL query statement below
with cte as (
    select *, 
    sum(amount) as balance
    from transactions 
    group by account
)
select name as NAME, balance as BALANCE
from users u 
join cte c 
on c.account = u.account
where balance > 10000