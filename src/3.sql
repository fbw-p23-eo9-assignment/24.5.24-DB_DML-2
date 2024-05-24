-- 1. Create database
CREATE DATABASE orders_db;

-- 2. Create user and grant privileges
CREATE USER order_manager WITH PASSWORD 'order_pass';
GRANT ALL PRIVILEGES ON DATABASE orders_db TO order_manager;

-- Connect to orders_db
\c orders_db;

-- 3. Create schema
CREATE SCHEMA orders;

-- 4. Create table customers
CREATE TABLE orders.customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- 5. Create table orders
CREATE TABLE orders.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    total_amount NUMERIC CHECK (total_amount > 0)
);

-- 6. Insert data into customers
INSERT INTO orders.customers (name, email) VALUES
('David Johnson', 'david@example.com'),
('Sara Parker', 'sara@example.com'),
('Mike Lee', 'mike@example.com');

-- 7. Insert data into orders
INSERT INTO orders.orders (customer_id, order_date, total_amount) VALUES
(1, '2024-05-01', 250.75),
(2, '2024-05-02', 150.50),
(3, '2024-05-03', 300.00);

-- 8. Select data to verify
SELECT * FROM orders.customers;
SELECT * FROM orders.orders;

-- 9. Drop orders table
DROP TABLE orders.orders;

-- 10. Drop database
\c postgres;
DROP DATABASE orders_db;
