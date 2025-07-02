
-- Create Database and Use It
CREATE DATABASE IF NOT EXISTS makeofwelding;
USE makeofwelding;

-- Drop Tables If Exist
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;

-- Create Products Table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    material VARCHAR(100),
    price DECIMAL(10,2),
    cost_price DECIMAL(10,2),
    is_featured BOOLEAN
);

-- Create Sales Table
CREATE TABLE sales (
    order_id VARCHAR(10) PRIMARY KEY,
    product_id VARCHAR(10),
    quantity INT,
    order_date DATE,
    customer_city VARCHAR(100),
    return_flag ENUM('Yes', 'No'),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Query: Most Profitable Product
SELECT 
  product_name, 
  SUM((price - cost_price) * quantity) AS total_profit
FROM sales
JOIN products USING (product_id)
GROUP BY product_id, product_name
ORDER BY total_profit DESC
LIMIT 1;

-- Query: Most Popular Product
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY s.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 1;

-- Query: Most Featured Category
SELECT 
  category, 
  COUNT(*) AS featured_count
FROM products
WHERE is_featured = TRUE
GROUP BY category
ORDER BY featured_count DESC
LIMIT 1;

-- Query: Most Profitable Product (Detailed)
SELECT 
  p.product_id,
  p.product_name, 
  SUM((p.price - p.cost_price) * s.quantity) AS total_profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_profit DESC
LIMIT 1;

-- Query: Lowest Profitable Product
SELECT 
  p.product_id,
  p.product_name, 
  SUM((p.price - p.cost_price) * s.quantity) AS total_profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_profit ASC
LIMIT 1;

-- Query: Lowest Featured Category
SELECT 
  category, 
  COUNT(*) AS featured_count
FROM products
WHERE is_featured = TRUE
GROUP BY category
ORDER BY featured_count ASC
LIMIT 1;

-- Query: Return Rate by Product
SELECT 
  p.product_id,
  p.product_name,
  COUNT(CASE WHEN s.return_flag = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS return_rate
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY return_rate DESC;

-- Query: Price History Filtered by Order Date
SELECT 
  s.order_date, 
  p.product_id,
  p.product_name, 
  p.price
FROM sales s
JOIN products p ON s.product_id = p.product_id
ORDER BY s.order_date;

-- Query: Group Average Price Over Months
SELECT 
  DATE_FORMAT(s.order_date, '%Y-%m') AS month,
  ROUND(AVG(p.price), 2) AS avg_price
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY DATE_FORMAT(s.order_date, '%Y-%m')
ORDER BY month;

-- Query: Compare Trends Among Materials
SELECT 
  DATE_FORMAT(s.order_date, '%Y-%m') AS month,
  p.material,
  ROUND(AVG(p.price), 2) AS avg_price
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY DATE_FORMAT(s.order_date, '%Y-%m'), p.material
ORDER BY month, p.material;
