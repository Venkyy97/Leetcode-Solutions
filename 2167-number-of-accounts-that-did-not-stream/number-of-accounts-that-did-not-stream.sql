select count(account_id) as accounts_count
from subscriptions
where 2021 between year(start_date) and year(end_date)
and account_id not in
(
select account_id
from streams
where year(stream_date) = 2021
)


