/* Write your T-SQL query statement below */
select e.name as employee
from employee e
join employee m on e.managerID = m.id
where 
e.salary > m.salary