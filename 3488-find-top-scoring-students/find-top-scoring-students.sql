# Write your MySQL query statement below
with major_courses as (
    select major, count(distinct course_id) as course_count
    from courses
    group by major

),
student_grades as (
    select s.student_id, s.major, e.course_id, e.grade 
    from students s 
    join enrollments e on s.student_id = e.student_id
    join courses c on e.course_id = c.course_id
    where s.major = c.major

),
student_a_grades as (
    select student_id, major, count(course_id) as a_courses
    from student_grades
    where grade = 'A'
    group by student_id,major
)

select sa.student_id from student_a_grades sa
join major_courses mc on sa.major = mc.major
where sa.a_courses =mc.course_count
order by 1


