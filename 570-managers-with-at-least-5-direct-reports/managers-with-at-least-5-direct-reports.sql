select e.name from employee e
join employee m
where e.id = m.managerID
group by m.managerID
having count(*) > 4
