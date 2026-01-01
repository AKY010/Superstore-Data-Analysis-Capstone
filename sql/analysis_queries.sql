-- Data Validation & Integrity Checks

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;

SELECT COUNT(DISTINCT customer_id) FROM customers;
SELECT COUNT(DISTINCT product_id) FROM products;
SELECT COUNT(DISTINCT order_id) FROM orders;


-- How is the business performing overall?
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(profit) AS avg_profit
FROM orders;

-- Which regions perform best and worst?
SELECT 
    c.region,
    SUM(o.sales) AS total_sales,
    SUM(o.profit) AS total_profit
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_profit DESC;

-- Category-wise Sales & Profit
SELECT 
    p.category,
    SUM(o.sales) AS total_sales,
    SUM(o.profit) AS total_profit
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;

-- Which products cause losses?
SELECT 
    p.sub_category,
    SUM(o.profit) AS total_profit
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.sub_category
HAVING SUM(o.profit) < 0
ORDER BY total_profit;

-- Top 10 Customers by Sales
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Which customer segment is most profitable?
SELECT 
    c.segment,
    SUM(o.sales) AS total_sales,
    SUM(o.profit) AS total_profit
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY total_profit DESC;

-- Does delivery speed impact profit?
SELECT 
    o.delivery_day,
    AVG(o.profit) AS avg_profit
FROM orders o
GROUP BY o.delivery_day
ORDER BY o.delivery_day;


-- Monthly Sales Trend
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS monthly_sales
FROM orders
GROUP BY year, month
ORDER BY year, month;

-- Yearly Performance
SELECT 
    YEAR(order_date) AS year,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders
GROUP BY year
ORDER BY year;

-- Do discounts reduce profit?
SELECT 
    discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders
GROUP BY discount
ORDER BY discount;