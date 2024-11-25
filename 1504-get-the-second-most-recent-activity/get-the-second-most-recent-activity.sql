# Write your MySQL query statement below
with cte as (
    select *,
    row_number() over( partition by username order by startDate desc) as rnk,
    count(*) over(partition by username) as actcnt
    from UserActivity
)
select username, activity, startDate, endDate from cte where rnk = 2
union
select username, activity, startDate, endDate from cte where actcnt = 1
