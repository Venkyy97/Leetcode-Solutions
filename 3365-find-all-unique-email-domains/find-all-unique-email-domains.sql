# Write your MySQL query statement below
with cte as (SELECT SUBSTRING(email, INSTR(email, '@')+ 1) AS email_domain
           FROM   Emails
           WHERE  email LIKE '%.com')
select email_domain,
count(email_domain) as count 
from cte
group by email_domain
order by 1