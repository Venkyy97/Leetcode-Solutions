
with cte as (
    select p.project_id , c.candidate_id, 100 + sum(case 
    when c.proficiency > p.importance then 10
    when c.proficiency < p.importance then -5
    else 0
    end) as score, 
    count(c.skill) as skill_count
    from projects p
    left join candidates c
    using (skill)
    group by p.project_id , c.candidate_id
), cte2 as (
select *, 
dense_rank() over ( partition by project_id order by score desc, candidate_id ) as rnk
from cte
where (project_id,skill_count) in (select project_id, count(skill)
from projects group by project_id)
)
select project_id,candidate_id, score 
from cte2 
where rnk = 1 
