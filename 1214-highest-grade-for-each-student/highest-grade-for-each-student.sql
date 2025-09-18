# Write your MySQL query statement below

with cte as (
    select *,
    dense_rank() over (partition by student_id order by grade desc, course_id asc) as rn 
    from enrollments
)
select student_id, course_id, grade from cte 
where rn = 1