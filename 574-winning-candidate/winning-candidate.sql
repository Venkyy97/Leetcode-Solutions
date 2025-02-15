# Write your MySQL query statement below
with cte as (
    select *, count(candidateId) as cnt 
    from vote
    group by candidateId
    order by count(candidateId) desc
    limit 1
)
select c.name from candidate c
join cte on c.id = cte.candidateId
