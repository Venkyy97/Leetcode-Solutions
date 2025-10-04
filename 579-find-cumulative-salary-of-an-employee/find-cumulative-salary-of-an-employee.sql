# Write your MySQL query statement below
select id, month,
sum(salary) over (partition by id order by month range between 2 preceding and current row) as salary
from employee 
where (id, month) not in (select id, max(month) from employee group by 1 )
order by id, month desc