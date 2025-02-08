/* Write your T-SQL query statement below */
WITH cte AS
(
    SELECT
        o.seller_id,
        COUNT(DISTINCT i.item_id) AS num_items,
        RANK() OVER(ORDER BY COUNT(DISTINCT i.item_id) DESC) AS rnk
    FROM
        Orders o
        LEFT JOIN
        Users u
        ON o.seller_id = u.seller_id
        LEFT JOIN
        Items i
        ON i.item_id = o.item_id AND i.item_brand != u.favorite_brand
    GROUP BY
        o.seller_id
)


SELECT
    seller_id,
    num_items
FROM 
    cte 
WHERE 
    rnk = 1
ORDER BY
    seller_id 