select m.name from employee m
join employee e on
m.id = e.managerID
group by e.managerID
having count(*) >= 5
