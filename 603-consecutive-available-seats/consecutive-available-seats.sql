# Write your MySQL query statement below
# Write your MySQL query statement below
select distinct t1.seat_id from cinema t1
join cinema t2 
on abs(t1.seat_id - t2.seat_id) = 1 
and t1.free = 1 and t2.free = 1
order by 1 