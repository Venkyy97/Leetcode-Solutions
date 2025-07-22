# Write your MySQL query statement below
with cte as (
    select *,
    sum(salary) over (partition by experience order by salary) as rnk
    from candidates
), hired_seniors as 
(
select * from cte
where experience = "Senior" and rnk <=70000),
remaining_budget as (
    select 70000 - ifnull(max(rnk),0) as budget
    from hired_seniors
    #group by employee_id
),
hired_juniors as (
    select * 
    from cte
    where experience = "Junior" and
    rnk < (select budget from remaining_budget)
)
select employee_id from hired_seniors
union 
select employee_id from hired_juniors
