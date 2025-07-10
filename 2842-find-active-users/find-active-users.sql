# Write your MySQL query statement below
with cte as (
    select 
        user_id,
        item,
        amount,
        created_at,
        case
            when lead(created_at) over (partition by user_id order by created_at) <= date_add(created_at, interval 7 day ) then "yes"
            else "No"
            end as consecP
            from users

)
select distinct user_id from cte where consecP = "yes"
order by 1 