# Write your MySQL query statement below
with cte as (
    select customer_id, 
    
    round(sum(amount),2) as total_amount, 
    count(transaction_id) as transaction_count,
    count(distinct p.category) as unique_categories,
    round((sum(amount)/count(transaction_id)),2) as avg_transaction_amount,
     round(((count(transaction_id) * 10) + (sum(amount) / 100)), 2) as loyalty_score 
    from transactions t
    join products p 
    on t.product_id = p.product_id
    group by customer_id
), cte2 as (
    select customer_id,category,
    dense_rank() over (partition by customer_id order by count(*) desc, max(transaction_date) desc) as rn 
    from transactions t
    join products p 
    on t.product_id = p.product_id
    group by customer_id,category
    
)
select c.customer_id, c.total_amount,c.transaction_count, 
        c.unique_categories, c.avg_transaction_amount,
        c2.category as top_category,
        c.loyalty_score
from 
    cte c
join cte2 c2
on c.customer_id = c2.customer_id
where c2.rn = 1
order by c.loyalty_score desc, c.customer_id asc
