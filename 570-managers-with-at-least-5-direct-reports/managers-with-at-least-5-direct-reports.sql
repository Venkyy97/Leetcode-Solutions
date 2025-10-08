select  m.name as name
from employee e 
join employee m 
on e.managerId = m.id
group by m.id
having count(*) > 4
