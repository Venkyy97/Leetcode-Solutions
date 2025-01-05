# Write your MySQL query statement below
select ifnull(round((count(distinct r.requester_id,accepter_id) * 1.0 /count(distinct f.sender_id,send_to_id)), 2),0.00) as accept_rate
from FriendRequest f, RequestAccepted r