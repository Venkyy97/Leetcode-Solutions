# Write your MySQL query statement below
select team_id, team_name,
    ((wins * 3) + (draws * 1)) as points,
rank() over (order by ((wins * 3) + (draws * 1)) desc) as position
from teamstats
group by 1
order by points desc, team_name asc