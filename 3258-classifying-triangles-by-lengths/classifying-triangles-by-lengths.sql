# Write your MySQL query statement below
select case
    when (A+B <= C)
    or (B + C <= A)
    or (C + A <= B)
        then "Not A Triangle"
    when (A=B and B<>C)
    or (B=C and B <> A)
    or (C=A and C <> B)
        then "Isosceles"
    when (A=B and B = C)
        Then 'Equilateral'
    else 'Scalene'
    end as triangle_type
from triangles