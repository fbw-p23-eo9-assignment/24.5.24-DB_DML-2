-- 1. Create database
CREATE DATABASE ecommerce_db;

-- 2. Create user and grant privileges
CREATE USER db_admin WITH PASSWORD 'admin123';
GRANT ALL PRIVILEGES ON DATABASE ecommerce_db TO db_admin;

CREATE USER data_entry WITH PASSWORD 'entry123';
GRANT CONNECT ON DATABASE ecommerce_db TO data_entry;

-- Connect to ecommerce_db
\c ecommerce_db;

-- 3. Grant privileges to data_entry user
GRANT INSERT ON ALL TABLES IN SCHEMA store TO data_entry;

-- 4. Create schema
CREATE SCHEMA store;

-- 5. Create tables
CREATE TABLE store.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    price NUMERIC CHECK (price > 0),
    stock INTEGER CHECK (stock >= 0)
);

CREATE TABLE store.customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE store.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    total_amount NUMERIC CHECK (total_amount > 0)
);

CREATE TABLE store.payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    payment_date DATE NOT NULL,
    amount NUMERIC CHECK (amount > 0)
);

-- 6. Insert data into products
INSERT INTO store.products (product_name, price, stock) VALUES
('Laptop', 1500.00, 30),
('Smartphone', 800.00, 50),
('Headphones', 200.00, 100);

-- 7. Insert data into customers
INSERT INTO store.customers (customer_name, email, phone) VALUES
('John Doe', 'john@example.com', '123-456-7890'),
('Jane Smith', 'jane@example.com', '234-567-8901'),
('Alice Johnson', 'alice@example.com', '345-678-9012');

-- 8. Insert data into orders and payments
INSERT INTO store.orders (customer_id, order_date, total_amount) VALUES
(1, '2024-05-10', 3000.00),
(2, '2024-05-11', 800.00),
(3, '2024-05-12', 400.00);

INSERT INTO store.payments (order_id, payment_date, amount) VALUES
(1, '2024-05-11', 3000.00),
(2, '2024-05-12', 800.00),
(3, '2024-05-13', 400.00);

-- 9. Update stock of Laptop
UPDATE store.products
SET stock = 27
WHERE product_name = 'Laptop';

-- 10. Select data to verify
SELECT * FROM store.products;
SELECT * FROM store.customers;
SELECT * FROM store.orders;
SELECT * FROM store.payments;

-- 11. Drop payments table
DROP TABLE store.payments;

-- 12. Drop database
\c postgres;
DROP DATABASE ecommerce_db;
