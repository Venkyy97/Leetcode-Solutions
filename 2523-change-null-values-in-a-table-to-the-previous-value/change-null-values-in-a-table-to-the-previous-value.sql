# Write your MySQL query statement below
# Write your MySQL query statement below
with t1 as (
    select *, 
    row_number() over () rnk,
    case when drink is null then 0 else 1 end as flag
    from coffeeshop
), t2 as (
select *, 
sum(flag) over (order by rnk rows between unbounded preceding and current row ) as rs
from t1)
select id , first_value(drink) over (partition by rs order by rnk) as drink
from t2