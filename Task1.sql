--TASK 1--
--Write query which will match contacts and orders to our customers

--Records in orders are duplicated. It doesn't bring us any extra info, therefore I try to select distinct records of orders and contacts.contacts
--First option is doing it by DISTINCT.contacts

SELECT DISTINCT
cus.customer_id,
cus.first_name,
cus.last_name,
o.order_id,
con.phone_number,
con.email,
con.address,
con.city
FROM customers cus
INNER JOIN orders o ON o.customer_id = cus.customer_id
INNER JOIN contacts con ON con.customer_id = cus.customer_id

--Second option how to handle duplicates can be using ROW_NUMBER -> to make orders having unique records +contacts
WITH unique_orders AS
(
  SELECT xx.*
  FROM
  (
SELECT o.*,
row_number () over(PARTITION BY o.customer_id, o.order_id ORDER BY o.customer_id) As row_num
FROM orders o
    )xx
  WHERE xx.row_num =1
)
SELECT cus.customer_id,
cus.first_name,
cus.last_name,
uo.order_id,
con.address,
con.city,
con.phone_number,
con.email
FROM customers cus
INNER JOIN contacts con on con.customer_id = cus.customer_id
INNER JOIN unique_orders uo ON uo.customer_id = cus.customer_id