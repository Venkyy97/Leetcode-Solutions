# Write your MySQL query statement below
with cte as (
    select *,
    rank() over (partition by user_id order by transaction_date asc) as rnk,
    lag(spend, 1) over (partition by user_id order by transaction_date asc) as prev1,
    lag(spend, 2) over (partition by user_id order by transaction_date asc) as prev2
        from transactions
)
select user_id, 
    spend as third_transaction_spend, 
    transaction_date as third_transaction_date
from cte
where rnk = 3 and 
spend > prev1
and spend > prev2
order by 1 
