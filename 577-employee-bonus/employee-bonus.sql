# Write your MySQL query statement below
select e.name, b.bonus
from employee e 
left join bonus b on e.empId = b.empid
where bonus is null or bonus < 1000