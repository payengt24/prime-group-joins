--1. Get all customers and their addresses.

--JOINING ONLY SPECIFIC INFORMATION ON
SELECT * FROM "customers";
SELECT * FROM "addresses"; -- ADDRESS (MANY) HAVE THE LINE CONNECTION ID THAT CAN CONNECT TO THE CUSTOMERS (1)

SELECT
	"customers"."first_name",
	"customers"."last_name",
	"addresses"."street",
	"addresses"."city",
	"addresses"."state",
	"addresses"."zip" 
FROM
	"customers" 
	JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";
	
-- JOINING EVERYTING LISTED ON THE CUSTOMERS TABLE TO THE ADDRESSES TABLE	
SELECT * FROM "customers" 
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";
	

--2. Get all orders and their line items.

SELECT * FROM "orders"; --ORDERS(1) TABLE HAVE ID CONNECTION TO LINE ITEMS(MANY)
SELECT * FROM "line_items";

SELECT
"orders"."order_date",
"orders"."total",
"orders"."address_id",
"line_items"."unit_price",
"line_items"."quantity",
"line_items"."order_id",
"line_items"."product_id"
FROM
"orders"
JOIN "line_items"
ON "orders"."id" = "line_items"."order_id";


--3. Which warehouses have cheetos? 

SELECT * FROM "warehouse"; --warehouse have many
SELECT * FROM "products";

--SPECIFY AND SHOW WHICH WAREHOUSE HAVE CHEETOS
SELECT 
"warehouse"."warehouse", 
"products"."description"
FROM 
"warehouse" 
JOIN 
"warehouse_product" 
ON 
"warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN 
"products" 
ON "products"."id" = "warehouse_product"."product_id"
WHERE 
"description" = 'cheetos';

--FINDING WHICH WAREHOUSE_ID HAVE CHEETOS

SELECT * FROM "warehouse_product" 
WHERE "warehouse_product"."product_id" = 5;



--4. Which warehouses have diet pepsi? --alpha, delta, and gamma have diet pepsi 

SELECT * FROM "warehouse_product"
WHERE "warehouse_product"."product_id" = 6;

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT "customers"."first_name", count("orders"."id")
FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "first_name";

--6. How many customers do we have?
SELECT count(*) from "customers";
--7. How many products do we carry?
SELECT count(*) from "products";
--8. What is the total available on-hand quantity of diet pepsi?


SELECT sum("warehouse_product"."on_hand"), "products"."description"
FROM "products" JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
WHERE "description" = 'diet pepsi'
GROUP BY "description";




