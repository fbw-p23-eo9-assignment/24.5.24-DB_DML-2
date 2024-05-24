-- 1. Create database
CREATE DATABASE inventory_db;

-- 2. Create user and grant privileges
CREATE USER inventory_manager WITH PASSWORD 'inventory_pass';
GRANT ALL PRIVILEGES ON DATABASE inventory_db TO inventory_manager;

-- Connect to inventory_db
\c inventory_db;

-- 3. Create table items
CREATE TABLE items (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL UNIQUE,
    quantity INTEGER NOT NULL CHECK (quantity >= 0),
    price NUMERIC NOT NULL CHECK (price > 0)
);

-- 4. Insert data into items
INSERT INTO items (item_name, quantity, price) VALUES
('Laptop', 10, 1200.50),
('Smartphone', 25, 800.00),
('Tablet', 15, 450.00);

-- 5. Update quantity
UPDATE items
SET quantity = 20
WHERE item_name = 'Smartphone';

-- 6. Select data to verify
SELECT * FROM items;

-- 7. Truncate table
TRUNCATE TABLE items;

-- 8. Drop table
DROP TABLE items;

-- 9. Drop database
\c postgres;
DROP DATABASE inventory_db;
