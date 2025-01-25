# Write your MySQL query statement below
with cte as (
    select first_col,
    row_number() over (order by first_col) as rnk 
    from data 
    ),
cte2 as (
    select second_col,
    row_number() over (order by second_col desc) as rnk 
    from data
)
select first_col, second_col from cte
join cte2
where cte.rnk =cte2.rnk