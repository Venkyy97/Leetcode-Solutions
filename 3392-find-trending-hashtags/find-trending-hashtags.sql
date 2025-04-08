# Write your MySQL query statement below
select REGEXP_SUBSTR(tweet, '\#[a-zA-Z]+') as hashtag,
count(*) as hashtag_count
from tweets
where substring(tweet_date,1,7) = '2024-02'
group by 1
order by 2 desc, 1 desc
limit 3