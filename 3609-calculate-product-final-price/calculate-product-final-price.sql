# Write your MySQL query statement below
with cte as (
    select p.product_id, p.category, p.price, coalesce (d.discount * 1.0 /100,0) as discount

    from products p 
    left join discounts d 
    on p.category = d.category
)

    select product_id, (price - (discount * price)) as final_price, category
    from cte
