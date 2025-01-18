
select abs(max(case when department = 'Engineering' then salary else 0 end)
            -max(case when department = 'Marketing' then salary else 0 end) ) as salary_difference 
from salaries
