# Write your MySQL query statement below
select  avg(n.Num) median
from Numbers n
where n.Frequency >= abs((select sum(Frequency) from Numbers where Num<=n.Num) -
                         (select sum(Frequency) from Numbers where Num>=n.Num))