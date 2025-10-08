# Write your MySQL query statement below
select project_id,
    round(avg(experience_years),2) as average_years
from project p
join employee e using (employee_id) 
group by 1