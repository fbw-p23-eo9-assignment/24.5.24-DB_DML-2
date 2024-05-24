# 24.5.24-DB_DML-2
# SQL's Data Definition and Data Manipulation

## Description

In this exercise, you will focus on data manipulation query set on the the tables in its respective database.


## Exercise 1: Setting Up a Sales Database
**Scenario**:
You are the database administrator for a company that needs a new database to track product sales. You will create the database, schemas, tables, and populate them with initial data. Additionally, you will create users with different roles to manage the database.

**Tasks:**

- Create a new database named `sales_db`.
- Create a user named `sales_admin` with the password `admin_pass`, and grant them ***all privileges*** on the `sales_db` database.
- Create a schema named `inventory`.
- Create a table named `products` in the `inventory` schema with the following columns:
    - `product_id` (serial, primary key)
    - `product_name` (varchar(100), not null, unique)
    - `price` (numeric, check that price is greater than 0)
    - `stock` (integer, default 0)
- Insert the following products into the products table:
    - ('Laptop', 1200.50, 10)
    - ('Smartphone', 800.00, 25)
    - ('Tablet', 450.00, 15)
- Create a table named `sales` in the `inventory` schema with the following columns:
    - `sale_id` (serial, primary key)
    - `product_id` (integer, not null)
    - `quantity` (integer, not null)
    - `sale_date` (date, not null)
- Insert the following sales records:
    - (1, 2, '2024-05-01')
    - (2, 1,  '2024-05-02')
    - (3, 3, '2024-05-03')
- Select  all products and sales to verify the data insertion.
- Drop the `sales` table.
- Drop the `sales_db` database.


## Exercise 2: Employee Management System
**Scenario:**
You need to set up a database to manage employee records for your company. This includes creating tables, inserting data, updating records, and managing user roles.

**Tasks:**

- Create a new database named `employee_db`.
- Create a user named `hr_manager` with the password `hr_pass`, and grant them all privileges on the `employee_db` database.
- Create a table named `employees` with the following columns:
    - `employee_id` (serial, primary key)
    - `name` (varchar(100), not null)
    - `position` (varchar(50))
    - `salary` (integer, check that salary is greater than 30000)
    - `hire_date` (date, not null)
- Insert the following `employee` records:
    - ('John Doe', 'Manager', 60000, '2022-01-15')
    - ('Alice Smith', 'Developer', 50000, '2021-03-22')
    - ('Bob Brown', 'Analyst', 55000, '2020-11-10')
- Update the `salary` of '***Alice Smith***' to 55000.
- Select all employees to verify the update.
- Delete the record of '***Bob Brown***'.
- Truncate the `employees` table.
- Drop the `employees` table.
- Drop the `employee_db` database.


## Exercise 3: Customer Orders System
**Scenario:**
You need to set up a database for managing customer orders. This involves creating tables with various constraints, inserting data, and managing schemas.

**Tasks:**

- Create a new database named `orders_db`.
- Create a user named `order_manager` with the password `order_pass`, and grant them *all privileges* on the `orders_db` database.
- Create a schema named `orders`.
- Create a table named `customers` in the `orders` schema with the following columns:
    - `customer_id`(serial, primary key)
    - `name` (varchar(100), not null)
    - `email` (varchar(100), not null, unique)
- Create a table named `orders` in the `orders` schema with the following columns:
    - `order_id` (serial, primary key)
    - `customer_id` (integer, not null)
    - `order_date` (date, not null)
    - `total_amount` (numeric, check that total_amount > 0)
- Insert the following `customers`:
    - ('David Johnson', 'david@example.com')
    - ('Sara Parker', 'sara@example.com')
    - ('Mike Lee', 'mike@example.com')
- Insert the following `orders`:
    - (1, '2024-05-01', 250.75)
    - (2, '2024-05-02', 150.50)
    - (3, '2024-05-03', 300.00)
- Select all customers and orders to verify the data.
- Drop the `orders` table.
- Drop the `orders_db` database.


## Exercise 4: Inventory Management System
**Scenario:**
You need to create an inventory management system that tracks items and their stock levels. This involves creating tables, inserting data, and managing constraints.

**Tasks:**

- Create a new database named `inventory_db`.
- Create a user named `inventory_manager` with the password `inventory_pass`, and grant them *all privileges* on the `inventory_db` database.
- Create a table named `items` with the following columns:
    - `item_id` (serial, primary key)
    - `item_name `(varchar(100), not null, unique)
    - `quantity` (integer, not null, check that quantity >= 0)
    - `price` (numeric, not null, check that price > 0)
- Insert the following `items`:
    - ('Laptop', 10, 1200.50)
    - ('Smartphone', 25, 800.00)
    - ('Tablet', 15, 450.00)
- Update the quantity of '***Smartphone***' to 20.
- Select all items to verify the update.
- Truncate the `items` table.
- Drop the `items` table.
- Drop the `inventory_db` database.

## Exercise 5: Comprehensive E-commerce Database Setup
**Scenario:**
You are tasked with setting up an e-commerce database that will track products, customers, orders, and payments. This exercise will involve creating multiple tables with various constraints, inserting and updating data, and managing different users with specific roles. This task will challenge your ability to handle complex database operations.

**Tasks:**

- Create a new database named `ecommerce_db`.
- Create a user named `db_admin` with the password `admin123`, and grant them *all privileges* on the `ecommerce_db` database.
- Create another user named `data_entry` with the password `entry123`, and grant them *INSERT* privileges on all tables in the `ecommerce_db` database.
- Create a schema named `store`.
- Create the following tables in the `store` schema:
    - `products` with columns:
        - `product_id` (serial, primary key)
        - `product_name` (varchar(100), not null, unique)
        - `price` (numeric, check (price > 0))
        - `stock` (integer, check (stock >= 0))
    - `customers` with columns:
        - `customer_id `(serial, primary key)
        - `customer_name` (varchar(100), not null)
        - `email` (varchar(100), not null, unique)
        - `phone` (varchar(15))
    - `orders` with columns:
        - `order_id` (serial, primary key)
        - `customer_id` (integer, not null)
        - `order_date` (date, not null)
        - `total_amount` (numeric, check (total_amount > 0))
    - `payments` with columns:
        - `payment_id` (serial, primary key)
        - `order_id `(integer, not null)
        - `payment_date` (date, not null)
        - `amount` (numeric, check (amount > 0))
- Insert the following data into the `products` table:
    - ('Laptop', 1500.00, 30)
    - ('Smartphone', 800.00, 50)
    - ('Headphones', 200.00, 100)
- Insert the following data into the `customers` table:
    - ('John Doe', 'john@example.com', '123-456-7890')
    - ('Jane Smith', 'jane@example.com', '234-567-8901')
    - ('Alice Johnson', 'alice@example.com', '345-678-9012')
- Insert the following orders and corresponding payments:
    -  `Orders`:
        - (1, '2024-05-10', 3000.00)
        - (2, '2024-05-11', 800.00)
        - (3, '2024-05-12', 400.00)
    - `Payments`:
        - (1, '2024-05-11', 3000.00)
        - (2, '2024-05-12', 800.00)
        - (3, '2024-05-13', 400.00)
- Update the `stock` of **'*Laptop'*** to 27 after the orders.
- Select all products, customers, orders, and payments to verify the data.
- Drop the `payments` table.
- Drop the `ecommerce_db` database.