CREATE DATABASE SUPERSTORE;
USE SUPERSTORE;

CREATE TABLE orders (
    Row_ID INT,
    Order_ID VARCHAR(30),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(20),
    Customer_ID VARCHAR(20),
    Product_ID VARCHAR(20),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(4,2),
    Profit DECIMAL(10,2),
    Delivery_Day INT
);

CREATE TABLE customers (
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id VARCHAR(20),
    product_name VARCHAR(150),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);


















