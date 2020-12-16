--order with value more than 25 euro but less or equal to 100 euro is marked as MEDIUM
--order with value more than 100 euro is marked as BIG
--Write query which shows only three columns: full_name (first and last name divided by space), order_id and order_size
--Make sure the duplicated values are not shown


SELECT DISTINCT o.order_id,
--CONCAT(cus.first_name,cus.last_name) AS full_name, --doesn't work here
cus.first_name || ' ' || cus.last_name AS full_name,
CASE 
	WHEN o.order_value <=25 THEN "SMALL"
    WHEN o.order_value BETWEEN 25 AND 100 THEN "MEDIUM"
    ELSE "BIG"
END 
AS order_size
FROM orders o
INNER JOIN customers cus ON cus.customer_id = o.customer_id