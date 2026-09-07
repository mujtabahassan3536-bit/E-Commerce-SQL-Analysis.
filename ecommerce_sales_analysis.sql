-- ==============================================================================
-- PROJECT: E-Commerce Sales & Revenue Analytics
-- AUTHOR: Muhammad Mujtaba Hassan (Data Analyst Portfolio Project)
-- SKILLS DEMONSTRATED: DDL, DML, Multi-Table JOINs, Aggregations, 
--                      Subqueries, CTEs, Window Functions, Conditional Logic.
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- PHASE 1: DATABASE & SCHEMA SETUP (DDL)
-- ------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS sales_analytics;
USE sales_analytics;

-- Drop tables if they already exist to avoid errors during re-runs
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS categories;

-- 1. Categories Table
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    city VARCHAR(100),
    signup_date DATE
);

-- 3. Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 4. Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 5. Order Items Table (Bridge Table for Many-to-Many Relationship)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- ------------------------------------------------------------------------------
-- PHASE 2: DATA INGESTION (DML)
-- ------------------------------------------------------------------------------

INSERT INTO categories (category_name) VALUES
('Electronics'), ('Clothing'), ('Home & Kitchen'), ('Sports'), ('Books');

INSERT INTO customers (customer_name, email, city, signup_date) VALUES
('Ali Khan', 'ali.khan@gmail.com', 'Lahore', '2025-01-15'),
('Sara Ahmed', 'sara.ahmed@gmail.com', 'Karachi', '2025-02-10'),
('Hamza Malik', 'hamza.malik@gmail.com', 'Islamabad', '2025-02-22'),
('Ayesha Noor', 'ayesha.noor@gmail.com', 'Lahore', '2025-03-05'),
('Bilal Shah', 'bilal.shah@gmail.com', 'Faisalabad', '2025-03-18'),
('Hina Tariq', 'hina.tariq@gmail.com', 'Rawalpindi', '2025-04-02'),
('Usman Ali', 'usman.ali@gmail.com', 'Karachi', '2025-04-20'),
('Zainab Hassan', 'zainab.hassan@gmail.com', 'Multan', '2025-05-11'),
('Omar Farooq', 'omar.farooq@gmail.com', 'Lahore', '2025-06-01'),
('Fatima Raza', 'fatima.raza@gmail.com', 'Islamabad', '2025-06-15');

INSERT INTO products (product_name, category_id, price) VALUES
('Laptop', 1, 150000), ('Wireless Headphones', 1, 12000), ('Smartphone', 1, 85000),
('T-Shirt', 2, 3000), ('Jeans', 2, 6000),
('Coffee Maker', 3, 15000), ('Blender', 3, 8000),
('Football', 4, 5000), ('Running Shoes', 4, 12000),
('Data Science Book', 5, 4500);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2025-07-01', 'Completed'), (2, '2025-07-03', 'Completed'), (3, '2025-07-05', 'Completed'),
(1, '2025-07-10', 'Completed'), (4, '2025-07-12', 'Completed'), (5, '2025-07-15', 'Cancelled'),
(6, '2025-07-18', 'Completed'), (7, '2025-07-21', 'Completed'), (8, '2025-07-25', 'Completed'),
(9, '2025-08-01', 'Completed'), (10, '2025-08-03', 'Completed'), (2, '2025-08-05', 'Completed'),
(3, '2025-08-08', 'Cancelled'), (4, '2025-08-10', 'Completed'), (1, '2025-08-15', 'Completed'),
(5, '2025-08-18', 'Completed'), (6, '2025-08-20', 'Completed'), (7, '2025-08-22', 'Completed'),
(8, '2025-08-25', 'Completed'), (9, '2025-08-28', 'Completed');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 150000), (1, 2, 2, 12000), (2, 4, 3, 3000), (2, 5, 1, 6000),
(3, 3, 1, 85000), (3, 9, 1, 12000), (4, 6, 1, 15000), (4, 7, 2, 8000),
(5, 10, 2, 4500), (6, 1, 1, 150000), (7, 8, 2, 5000), (7, 9, 1, 12000),
(8, 2, 1, 12000), (8, 3, 1, 85000), (9, 5, 2, 6000), (10, 1, 1, 150000),
(10, 10, 1, 4500), (11, 4, 4, 3000), (11, 8, 1, 5000), (12, 3, 1, 85000),
(12, 2, 1, 12000), (13, 6, 1, 15000), (14, 9, 2, 12000), (14, 5, 1, 6000),
(15, 1, 1, 150000), (15, 7, 1, 8000), (16, 10, 3, 4500), (17, 4, 2, 3000),
(17, 5, 1, 6000), (18, 8, 3, 5000), (19, 2, 2, 12000), (19, 9, 1, 12000),
(20, 3, 1, 85000), (20, 10, 2, 4500);


-- ------------------------------------------------------------------------------
-- PHASE 3: BUSINESS DATA ANALYSIS (DQL)
-- ------------------------------------------------------------------------------

-- Query 1: Customer Segmentation & Filtering
-- Objective: Retrieve early-access customers using Gmail for targeted marketing.
SELECT 
    customers.customer_id,
    customers.customer_name,
    customers.email AS customer_email
FROM customers
WHERE customers.email LIKE '%@gmail.com'
ORDER BY customers.customer_id ASC
LIMIT 10;


-- Query 2: Multi-Table JOINs & Aggregations
-- Objective: Identify top-performing product categories crossing the 100k revenue threshold.
SELECT 
    categories.category_name,
    COUNT(orders.order_id) AS total_orders,
    SUM(order_items.quantity * order_items.unit_price) AS total_revenue
FROM categories
INNER JOIN products 
    ON categories.category_id = products.category_id
INNER JOIN order_items 
    ON products.product_id = order_items.product_id
INNER JOIN orders 
    ON order_items.order_id = orders.order_id
WHERE orders.status = 'Completed'
GROUP BY categories.category_name
HAVING SUM(order_items.quantity * order_items.unit_price) > 100000
ORDER BY total_revenue DESC;


-- Query 3: Conditional Logic & Order Categorization
-- Objective: Segment completed orders into High, Medium, and Low value tiers for CRM.
SELECT 
    orders.order_id,
    SUM(order_items.quantity * order_items.unit_price) AS order_total,
    CASE 
        WHEN SUM(order_items.quantity * order_items.unit_price) > 100000 THEN 'High Value'
        WHEN SUM(order_items.quantity * order_items.unit_price) BETWEEN 20000 AND 100000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_tier
FROM orders
INNER JOIN order_items 
    ON orders.order_id = order_items.order_id
WHERE orders.status = 'Completed'
GROUP BY orders.order_id;


-- Query 4: Scalar Subqueries
-- Objective: Identify premium products priced strictly above the global catalog average.
SELECT 
    products.product_id,
    products.product_name,
    products.price
FROM products
WHERE products.price > (
    SELECT AVG(products.price) 
    FROM products
)
ORDER BY products.price DESC;


-- Query 5: Common Table Expressions (CTEs) & Window Functions
-- Objective: Rank the Top 3 highest-revenue generating products within each category.
WITH category_rankings AS (
    SELECT 
        categories.category_name,
        products.product_name,
        SUM(order_items.quantity * order_items.unit_price) AS product_revenue,
        DENSE_RANK() OVER (
            PARTITION BY categories.category_name 
            ORDER BY SUM(order_items.quantity * order_items.unit_price) DESC
        ) AS rank_in_category
    FROM categories
    INNER JOIN products 
        ON categories.category_id = products.category_id
    INNER JOIN order_items 
        ON products.product_id = order_items.product_id
    INNER JOIN orders 
        ON order_items.order_id = orders.order_id
    WHERE orders.status = 'Completed'
    GROUP BY categories.category_name, products.product_name
)
SELECT 
    category_rankings.category_name,
    category_rankings.product_name,
    category_rankings.product_revenue,
    category_rankings.rank_in_category
FROM category_rankings
WHERE category_rankings.rank_in_category <= 3;