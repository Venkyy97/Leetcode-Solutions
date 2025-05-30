with cte as (
    select lot_id, car_id,
    sum(fee_paid) over (partition by car_id) as total_fee_paid,
    sum(timestampdiff(second, entry_time, exit_time)) over(partition by car_id) as hours_spent,
    sum(timestampdiff(second,entry_time,exit_time)) over(partition by car_id,lot_id) as hours_spent_lot
    from parkingtransactions
)


select distinct car_id,total_fee_paid, round(total_fee_paid/(hours_spent/(60*60)),2) as avg_hourly_fee,lot_id as most_time_lot 
from cte
where (car_id,hours_spent_lot) in (select car_id,max(hours_spent_lot) from cte group by 1)



