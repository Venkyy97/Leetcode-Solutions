# Write your MySQL query statement below
with cte as (
    select *, count(record_id) as current_borrowers
    from borrowing_records
    where return_date is NULL 
    group by book_id
    )
select c.book_id, l.title, l.author, l.genre, l.publication_year, c.current_borrowers
from cte c 
inner join library_books l on 
l.book_id = c.book_id
where current_borrowers = total_copies
order by current_borrowers desc, title asc