# Write your MySQL query statement below
select distinct a.num as consecutiveNums
from logs a 
join logs b on b.id = a.id + 1 and b.num = a.num
join logs c on c.id = a.id + 2 and c.num = a.num 