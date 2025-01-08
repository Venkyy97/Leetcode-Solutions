# Write your MySQL query statement below
with cte as (
    select first_name, type , duration,
    dense_rank() over ( partition by type order by duration desc) as rnk 
    from contacts
    join calls on contacts.id = calls.contact_id
    order by type desc, duration desc, first_name desc
)
select first_name, type, 
            CONCAT(
            LPAD(FLOOR(duration / 3600), 2, '0'), ':',
            LPAD(FLOOR((duration % 3600) / 60), 2, '0'), ':',
            LPAD(duration % 60, 2, '0')) AS duration_formatted
from cte
where rnk in (1,2,3);


 