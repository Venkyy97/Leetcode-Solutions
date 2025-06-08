# Write your MySQL query statement below

with cte as 
(select interview_id, sum(score) as total
from rounds 
group by interview_id
having sum(score) > 15)

select distinct c.candidate_id
from candidates c
join cte on c.interview_id = cte.interview_id
where years_of_exp >= 2
