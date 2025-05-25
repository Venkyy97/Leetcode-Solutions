# Write your MySQL query statement below
with a as(
    select N, 'Root' as type from tree where P is null
),
b as (
    select N, 'Inner' as type from tree where N in (select P from tree) and P is not null
),
c as (
    select N, "Leaf" as type from  tree where N not in ( Select N from A union select N from B)

)
(select N, type from a
union
select N, type from b
union
select N, type from C ) 
order by N