# Write your MySQL query statement below# Write your MySQL query statement below
with cte as (select *, row_number() over (partition by company order by salary) rnk,
count(id) over (partition by company) as n
from employee)
select id, company, salary
from cte
where rnk between n/2 and n/2 + 1