# Write your MySQL query statement below
with cte1 as (
    select home_team_id as thisTeam, away_team_id as otherTeam, 
    home_team_goals as thisTeamGoal, away_team_goals as otherTeamgoals
    from matches m 
    union all 
    select away_team_id as thisTeam, home_team_id as otherTeam,
    away_team_goals as thisTeamGoal, home_team_goals as otherTeamgoals
    from matches m 
),
cte2 as (
    select c.*,
    case when thisTeamGoal> otherTeamgoals then 3 
    when thisTeamGoal < otherTeamgoals then 0 
    else 1 end as points
    from cte1 c

)
select t.team_name ,
count(*) as matches_played,
sum(points) as points,
sum(thisTeamGoal) as goal_for,
sum(otherTeamgoals) as goal_against,
sum(thisTeamGoal) - sum(otherTeamgoals) as goal_diff
from cte2 a, Teams t 
where a.thisTeam = t.team_id
group by team_name
order by points desc, goal_diff desc, team_name