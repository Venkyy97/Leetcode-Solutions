select
    m.member_id,
    name,
    case 
        when count(v.visit_id) = 0 then "Bronze"
        when ifnull(count(distinct p.visit_id),0) * 100 / count(v.visit_id) >= 80 Then "Diamond"
        when ifnull(count(distinct p.visit_id),0) * 100 / count(v.visit_id) >= 50 Then "Gold"
        else 'Silver'
    end as category
    from members m 
    left join visits V using (member_id)
    left join purchases p using (visit_id)
    group by 1, 2
    order by 1 asc 
    