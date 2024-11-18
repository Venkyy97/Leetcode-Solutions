# Write your MySQL query statement below

select d.name as Department, e.name as Employee,Salary

from department d join employee e
on e.departmentID = d.id
where (departmentID, Salary) in (
    select departmentID, Max(salary) as Salary
    from employee
    group by departmentID
)