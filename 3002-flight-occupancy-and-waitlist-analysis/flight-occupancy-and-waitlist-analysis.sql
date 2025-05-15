# Write your MySQL query statement below
SELECT flight_id, 
       IF(COUNT(passenger_id)< capacity, COUNT(passenger_id), capacity) AS booked_cnt,
       IF(COUNT(passenger_id)< capacity, 0, COUNT(passenger_id) - capacity) AS waitlist_cnt
FROM Flights f
LEFT JOIN Passengers p USING (flight_id)
GROUP BY flight_id
ORDER BY flight_id