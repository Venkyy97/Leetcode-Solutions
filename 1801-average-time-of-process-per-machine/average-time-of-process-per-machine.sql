with  c1 as (select machine_id, process_id, sum(timestamp) as t1
from activity 
where activity_type = 'start'
group by 1, 2 ),
c2 as (select machine_id, process_id, sum(timestamp) as t2
from activity 
where activity_type = 'end'
group by 1, 2 )

select c1.machine_id, round(avg((t2 - t1)),3) as processing_time
from c1 join c2 
on c1.machine_id = c2.machine_id and c1.process_id = c2.process_id
group by 1 


