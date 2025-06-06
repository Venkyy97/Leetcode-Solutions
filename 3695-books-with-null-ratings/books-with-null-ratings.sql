# Write your MySQL query statement below
select book_id, title, author, published_year from books
where rating is null
order by 1 asc