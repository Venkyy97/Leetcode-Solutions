# Write your MySQL query statement below
WITH CTE AS (
    Select *, case 
                when gender='female' then 0
                when gender='other' then 1
                else 2 end as status,
            dense_rank() over(partition by gender order by user_id) as rnk
    from Genders
)

select user_id,gender
from CTE
order by rnk,status
