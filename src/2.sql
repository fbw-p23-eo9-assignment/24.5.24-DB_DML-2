-- 1. Create database
CREATE DATABASE employee_db;

-- 2. Create user and grant privileges
CREATE USER hr_manager WITH PASSWORD 'hr_pass';
GRANT ALL PRIVILEGES ON DATABASE employee_db TO hr_manager;

-- Connect to employee_db
\c employee_db;

-- 3. Create table employees
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    salary INTEGER CHECK (salary > 30000),
    hire_date DATE NOT NULL
);

-- 4. Insert data into employees
INSERT INTO employees (name, position, salary, hire_date) VALUES
('John Doe', 'Manager', 60000, '2022-01-15'),
('Alice Smith', 'Developer', 50000, '2021-03-22'),
('Bob Brown', 'Analyst', 55000, '2020-11-10');

-- 5. Update salary
UPDATE employees
SET salary = 55000
WHERE name = 'Alice Smith';

-- 6. Select data to verify
SELECT * FROM employees;

-- 7. Delete employee record
DELETE FROM employees
WHERE name = 'Bob Brown';

-- 8. Truncate table
TRUNCATE TABLE employees;

-- 9. Drop table
DROP TABLE employees;

-- 10. Drop database
\c postgres;
DROP DATABASE employee_db;
