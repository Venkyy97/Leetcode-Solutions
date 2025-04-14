with cte as  
(select *,
    count(*) over (partition by salary) as cnt 
from employees)
,
cte2 as (
    select * 
    from cte
    where cnt > 1 
)
select employee_id,name, salary,
dense_rank() over (order by salary) as team_id
from cte2 
order by dense_rank() over (order by salary) , employee_id asc



    
