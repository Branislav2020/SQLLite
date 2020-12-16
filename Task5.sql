--TASK 5--
-- Filter out all items from orders table which containt in their name 'ea' or start with 'Key'

SELECT DISTINCT o.item
FROM orders o
WHERE o.item LIKE '%ea%' OR SUBSTRING(o.item,1,3) = 'Key'