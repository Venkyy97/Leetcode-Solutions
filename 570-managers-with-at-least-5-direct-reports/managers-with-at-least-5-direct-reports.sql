select m.name
from employee e 
join employee m 
on e.managerID = m.id
group by m.id
having count(*) > 4