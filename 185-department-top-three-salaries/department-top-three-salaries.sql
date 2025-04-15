with cte as (select e.*,   d.name as dname,
dense_rank() over (partition by d.name order by salary desc) as rnk 
from employee e 
left join department d
on e.departmentId = d.id  )

select dname as Department,
name as employee,
salary
from cte 
where rnk < 4 
