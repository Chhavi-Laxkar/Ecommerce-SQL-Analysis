CREATE DATABASE ecommerce_sql_project ;

-- STEP 1 — Basic Data Exploration

USE ecommerce_sql_project ;

SHOW DATABASES ;
SHOW TABLES ;

SELECT COUNT(*) AS total_rows
FROM customers;
USE ecommerce_sql_project;

SELECT *
FROM customers
LIMIT 10;

DESCRIBE customers ;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE geolocation;
DESCRIBE products;
DESCRIBE reviews;
DESCRIBE sellers;
DESCRIBE order_payments;
DESCRIBE product_category_name_translation;

SELECT COUNT(*) AS total_customers
FROM customers;
SELECT COUNT(*) AS total_orders
FROM orders;
SELECT COUNT(*) AS total_products
FROM products;
SELECT COUNT(*) AS total_sellers
FROM sellers;
SELECT COUNT(*) AS total_reviews
FROM reviews;
SELECT COUNT(*) AS total_order_payments
FROM order_payments;
SELECT COUNT(*) AS total_order_items
FROM order_items;
SELECT COUNT(*) AS total_geolocation
FROM geolocation;


-- STEP 2 — Customer Analysis 👥

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM customers;
SELECT customer_city , COUNT(*) AS customer_count
FROM customers
GROUP BY customer_city
ORDER BY customer_count DESC 
LIMIT 10 ;
SELECT customer_state, COUNT(*) AS customer_count
FROM customers
GROUP BY customer_state 
ORDER BY customer_count DESC;


-- STEP 3 — Order Analysis 📦

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;

SELECT order_status, COUNT(*) AS order_count 
FROM orders
GROUP BY  order_status 
ORDER BY order_count DESC ;


-- STEP 4 — Sales & Revenue Analysis 💰

SELECT 
    ROUND(SUM(price), 2) AS total_revenue
FROM order_items; 

SELECT 
    ROUND(AVG(price) , 2) AS average_price
FROM order_items; 

SELECT
	MAX(price) AS highest_price
FROM order_items;

SELECT 
	MIN(price) AS lowest_price
FROM order_items;


-- STEP 5 — Product Analysis 🛍️

SELECT COUNT(*) AS total_products
FROM products;

SELECT 
     product_category_name,
     COUNT(*) AS product_count
FROM products
GROUP BY product_category_name
ORDER BY product_count;


-- STEP 6 — Seller Analysis 🏪

SELECT COUNT(*) AS total_sellers
FROM sellers;

SELECT seller_state , COUNT(*) AS seller_count
FROM sellers
GROUP BY seller_state
ORDER BY seller_count DESC;


-- STEP 7 — Payment Analysis 💳 

SELECT 
     payment_type , COUNT(*) AS payment_count
FROM order_payments
GROUP BY payment_type
ORDER BY payment_count DESC;

SELECT 
     ROUND(SUM(payment_value) ,2) AS total_payment_value
FROM order_payments;

SELECT
	 ROUND(AVG(payment_value) , 2) AS average_value
FROM order_payments;

SELECT 
     payment_installments,
     COUNT(*) AS number_of_payments
FROM order_payments
GROUP BY payment_installments
ORDER BY payment_installments;


-- STEP 8 — Review Analysis ⭐

SELECT 
     ROUND(AVG(review_score)) AS average_review_score
FROM reviews;

SELECT 
	review_score ,
	COUNT(*) AS review_count
FROM reviews 
GROUP BY review_score
ORDER BY review_score;


-- STEP 9 — Advanced SQL 🔥
SELECT 
		o.order_id,
        o.customer_id,
        oi.product_id,
        oi.price
FROM orders o
JOIN order_items oi
     ON o.order_id = oi.order_id
LIMIT 10;

SELECT
     c.customer_id ,
     COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o 
     ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC 
LIMIT 10;

SELECT
     order_status ,
	 CASE
         WHEN order_status = 'delivered'THEN 'Completed'
         WHEN order_status = 'cancelled' THEN 'Cancelled'
         ELSE 'In Progress'
	 END AS order_category ,
     COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;