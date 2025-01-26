with cte as (
    select *,
    count(department_id) over (partition by employee_id) as cnt
    from employee
)
select employee_id, department_id
from cte
where cnt = 1 or primary_flag = 'Y'
