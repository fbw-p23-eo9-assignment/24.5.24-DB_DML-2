-- 1. Create database
CREATE DATABASE sales_db;

-- 2. Create user and grant privileges
CREATE USER sales_admin WITH PASSWORD 'admin_pass';
GRANT ALL PRIVILEGES ON DATABASE sales_db TO sales_admin;

-- Connect to sales_db
\c sales_db;

-- 3. Create schema
CREATE SCHEMA inventory;

-- 4. Create table products
CREATE TABLE inventory.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    price NUMERIC CHECK (price > 0),
    stock INTEGER DEFAULT 0
);

-- 5. Insert data into products
INSERT INTO inventory.products (product_name, price, stock) VALUES
('Laptop', 1200.50, 10),
('Smartphone', 800.00, 25),
('Tablet', 450.00, 15);

-- 6. Create table sales
CREATE TABLE inventory.sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    sale_date DATE NOT NULL
);

-- 7. Insert data into sales
INSERT INTO inventory.sales (product_id, quantity, sale_date) VALUES
(1, 2, '2024-05-01'),
(2, 1, '2024-05-02'),
(3, 3, '2024-05-03');

-- 8. Select data to verify
SELECT * FROM inventory.products;
SELECT * FROM inventory.sales;

-- 9. Drop sales table
DROP TABLE inventory.sales;

-- 10. Drop database
\c postgres;
DROP DATABASE sales_db;
