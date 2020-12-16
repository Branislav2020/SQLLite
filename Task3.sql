--TASK 3-	
-- As you found out, there are some duplicated order which are incorrect, adjust query from previous task so shows following:
-- Shows first name, last name, email, order id and item
-- Does not show duplicates.
-- Order result by customer last name

--Was not 100% sure what is meant by "Does not show duplicates". So I write two solutions.
--This Query returns only orders that have one record in the orders table. So without orders that have some duplicated records.
SELECT xx.order_id, 
xx.item,
xx.first_name,
xx.last_name,
xx.email
FROM
(
SELECT o.order_id, 
o.item,
cus.first_name,
cus.last_name,
con.email,
COUNT(order_id) AS num_of_records_in_orders
FROM orders o
INNER JOIN customers cus ON cus.customer_id = o.order_id
INNER JOIN contacts con ON con.customer_id = o.customer_id
GROUP BY o.order_id,
o.item,
cus.first_name,
cus.last_name,
con.email
HAVING COUNT(order_id) =1
)xx
ORDER BY xx.last_name

--The second query returns only one record for each order - records without duplicates.
SELECT xx.order_id, 
xx.item,
xx.first_name,
xx.last_name,
xx.email
FROM
(
SELECT o.order_id, 
o.item,
cus.first_name,
cus.last_name,
con.email,
ROW_NUMBER () OVER (PARTITION BY o.order_id Order BY o.order_id) AS row_num
FROM orders o
INNER JOIN customers cus ON cus.customer_id = o.order_id
INNER JOIN contacts con ON con.customer_id = o.customer_id
)xx
WHERE xx.row_num = 1
ORDER BY xx.last_name