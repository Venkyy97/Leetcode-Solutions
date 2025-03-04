# Write your MySQL query statement below
select concat(t1.topping_name, ',', t2.topping_name, ',', t3.topping_name) as pizza,
round(t1.cost + t2.cost + t3.cost, 2) as total_cost
from toppings t1
inner join toppings t2 on t1.topping_name < t2.topping_name
inner join toppings t3 on t2.topping_name < t3.topping_name
order by total_cost desc, pizza