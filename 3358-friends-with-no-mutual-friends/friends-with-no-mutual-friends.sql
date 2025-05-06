# Write your MySQL query statement below
with cte as (
    select user_id1 as user, user_id2 as friend
    from friends 
    union all 
    select user_id2, user_id1
    from friends
), cte2 as (
select c1.*,c2.friend as f1, c3.friend as f2
from cte c1
left join cte c2 on c1.user = c2.user
left join cte c3 on c1.friend = c3.user
where c2.friend = c3.friend)

select user_id1, user_id2
from friends 
where (user_id1,user_id2) not in (select user, friend from cte2)
order by 1, 2

