/* Write your T-SQL query statement below */
select e.name as Employee
from employee e
inner join employee e1 on
e.managerID = e1.id
where e.salary > e1.salary