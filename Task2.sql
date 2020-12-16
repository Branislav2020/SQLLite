--TASK 2--
-- There is  suspision that some orders were wrongly inserted more times. Check if there are any duplicated orders. If so, return duplicates with the following details:
-- first name, last name, email, order id and item

--Checking duplicates in orderscontacts
SELECT o.order_id, 
COUNT(order_id) AS num_of_records_in_orders
FROM orders o 
GROUP BY o.order_id

--Returning  duplicates
WITH duplicated_orders AS
(
SELECT o.order_id, 
COUNT(order_id) AS num_of_records_in_orders
FROM orders o 
GROUP BY o.order_id
HAVING COUNT(order_id) >1
)
SELECT o.order_id,
o.item,
cus.first_name,
cus.last_name,
con.email
FROM orders o
INNER JOIN customers cus ON cus.customer_id = o.customer_id
INNER JOIN contacts con ON con.customer_id = o.customer_id
INNER JOIN duplicated_orders do ON do.order_id = o.order_id