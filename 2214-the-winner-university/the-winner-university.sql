with nye as (
    select count(student_id) as cnt 
    from Newyork
    where score >= 90
), 
cali as  (
    select count(student_id) as cnt
    from California
    where score >=90
)
select 
    case 
        when n.cnt > c.cnt then "New York University"
        when n.cnt < c.cnt then "California University"
        else "No Winner"
        end as Winner
from nye n, cali c