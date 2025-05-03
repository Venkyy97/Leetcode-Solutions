
with cte1 as (
select
m.member_id,
m.name,
v.visit_id,
v.visit_date,
p.charged_amount
from Members m
left join Visits v
on m.member_id = v.member_id
left join Purchases p
on v.visit_id = p.visit_id
order by member_id, visit_date
),cte2 as (
    select  member_id, name,
    100 *(count(charged_amount)/count(distinct visit_id )) as score
    from cte1 
    group by member_id
)
select member_id, name,
case 
    when score is null then "Bronze"
    when score >=80 then "Diamond"
    when score >= 50 then "Gold"
    else "Silver"
    end as category
from cte2
order by 1 