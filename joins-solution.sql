1. Get all customers and their addresses.

SELECT * from "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

2. Get all orders and their line items (orders, quantity and product).

SELECT "orders".id as "order_id", "line_items".quantity, "products".description from "orders"
JOIN "line_items" ON "line_items".order_id = "orders".id
JOIN "products" ON "products".id = "line_items".product_id;

3. Which warehouses have cheetos?
SELECT * from "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id WHERE "products".description = 'cheetos' AND "warehouse_product".on_hand != 0;

4. Which warehouses have diet pepsi?
SELECT * from "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id WHERE "products".description = 'diet pepsi' AND "warehouse_product".on_hand != 0;

5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT count("customers".id), "customers".first_name, "customers".last_name FROM "customers"
JOIN "addresses" on "addresses".customer_id = "customers".id
JOIN "orders" on "orders".address_id = "addresses".id
GROUP BY "customers".first_name, "customers".last_name;

6. How many customers do we have?
SELECT count(*) FROM "customers";

7. How many products do we carry?
SELECT count(*) FROM "products";

8. What is the total available on-hand quantity of diet pepsi?
