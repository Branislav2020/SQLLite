--TASK 6--
-- Please find out if some customer was referred by already existing customer
-- Return results in following format "Customer Last name Customer First name" "Last name First name of customer who recomended the new customer"
SELECT cus1.last_name || ' ' || cus1.first_name AS new_customer,
cus2.last_name || ' ' || cus2.first_name AS referred_by_customer
FROM customers cus1
INNER JOIN customers cus2 ON cus1.referred_by_id = CAST(cus2.customer_id AS varchar(50))-- ON CAST(cus1.referred_by_id AS INT) = cus2.customer_id