# Write your MySQL query statement below
with vote_weight as (
    select voter, 1/count(*) as value
    from votes
    group by voter
), vote_sum as (
    select candidate, sum(value) as total,
    dense_rank() over ( order by sum(value) desc) as rnk
    from votes v 
        join vote_weight v1 on v.voter = v1.voter
    group by candidate
    having candidate is not null
)
select candidate from vote_sum
where rnk = 1
order by 1