-- Active: 1695105342139@@127.0.0.1@5432@northwind@public

-- BSD TEST ELIYA DUEK 09.21.2023

-- 1
SELECT First_Name , Last_Name, Employee_ID
FROM employees;

-- 2 
SELECT count(Product_ID) AS total_SUM
FROM products;

-- 4
SELECT product_Name , Unit_Price
from products
ORDER BY unit_price DESC 
LIMIT 3;

-- 7
SELECT category_name AS Category , avg(unit_price) as AVG_products_Price
FROM categories INNER JOIN products
ON categories.category_id = products.category_id
GROUP BY Category
ORDER BY AVG_products_Price DESC;

-- 8

WITH Territory_by_ID AS (
    SELECT employee_territories.territory_id , employees.employee_id 
    FROM employee_territories INNER JOIN employees
    ON employee_territories.employee_id = employees.employee_id
)
SELECT employees.first_name , last_name ,territories.territory_description 
FROM employees INNER JOIN Territory_by_ID
ON employees.employee_id = Territory_by_ID.employee_id
INNER JOIN territories
ON Territory_by_ID.territory_id = territories.territory_id;

--9

WITH nine as (
    SELECT employees.first_name , employees.last_name , count(orders.employee_id) as total_orders
    FROM employees INNER JOIN orders
    ON employees.employee_id = orders.employee_id
    GROUP BY employees.first_name , employees.last_name
    ORDER BY total_orders DESC
)
SELECT first_name , last_name , total_orders
FROM nine
WHERE total_orders>100;

--i know i did it complicated for no reason... have good week
