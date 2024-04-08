----------------------------------- 1 ---------------------------------------
SELECT *,
(SELECT customer_id FROM orders WHERE id = od.order_id) as customer_id
FROM order_details od;

----------------------------------- 2 ---------------------------------------

SELECT
FROM order_details od
WHERE order_id in (SELECT id FROM orders WHERE shipper_id=3):|

----------------------------------- 3 ---------------------------------------

SELECT order_id, AVG(quantity) AS avg_quantity
FROM order_details
WHERE quantity > 10
GROUP BY order_id;

----------------------------------- 4 ---------------------------------------

WITH temp AS (
SELECT *
FROM  order_details
WHERE quantity> 10)
SELECT order_id, avg(quantity) as avg_quantity
FROM temp
GROUP BY order_id;

----------------------------------- 5 ---------------------------------------

DROP FUNCTION IF EXISTS divide_float;
CREATE OR REPLACE FUNCTION divide_float(first_numb FLOAT, second_numb FLOAT)
RETURNS FLOAT AS
$$
BEGIN
   RETURN first_numb / second_numb;
END;
$$
LANGUAGE plpgsql;
SELECT id, order_id, product_id, divide_float(quantity, 2) AS divided_quantity FROM order_details;