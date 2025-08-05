with cte as (
    select e.id, e.name as Employee, salary, departmentId, d.name as dept,
    dense_rank() over (partition by d.id order by salary desc) as rnk
     from employee e 
    join department d on e.departmentId = d.id
)

select dept as department, employee, salary
from cte 
where rnk < 4