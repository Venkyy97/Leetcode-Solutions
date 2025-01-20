# Write your MySQL query statement below
with cte as (
    select *,
    rank() over (partition by department_id order by mark desc ) as student_rank_in_the_department,
    count(student_id) over (partition by department_id) as  the_number_of_students_in_the_department
    from students

),
cte2 as (
    select student_id, department_id,
    ifnull(round((student_rank_in_the_department - 1) * 100 / (the_number_of_students_in_the_department - 1), 2),0) as percentage
    from cte
)
select * from cte2