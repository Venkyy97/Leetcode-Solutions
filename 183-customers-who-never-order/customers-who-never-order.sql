# Write your MySQL query statement below
select name as customers  from Customers 
where id not in (
select c.id from customers c
join orders o on c.id = o.customerID)
