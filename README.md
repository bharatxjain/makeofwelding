
# MakeOfWelding Database & Analysis

This repository contains SQL scripts for managing and analyzing sales and product data for the fictional company **MakeOfWelding**.

## 🔍 Project Overview
MakeOfWelding is a relational database project designed to simulate and analyze product and sales data for a welding equipment business. The project focuses on building a scalable and query-optimized SQL schema, and provides deep business insights through advanced SQL queries, including profitability analysis, trend tracking, and return rate evaluations.

## 📘 Project Description
This project consists of two main tables: products and sales, representing a simplified e-commerce scenario for a welding products company. The database captures essential details such as product pricing, categories, materials, sales volumes, customer cities, and product return flags.

The SQL queries included in this project enable:
- 📈 Profitability Analysis
Identify most and least profitable products based on price-cost margins multiplied by quantity sold.

- 🛒 Popularity & Sales Trends
Discover best-selling products and analyze average price trends over months, grouped by materials.

- 🚩 Returns Monitoring
Calculate return rates per product to highlight quality or satisfaction issues.

- 🎯 Category Insights
Examine which product categories are most frequently marked as "featured" to gauge marketing or inventory focus.

- 📊 Temporal Analysis
Evaluate price history and group sales data over time to track business seasonality or inflation impact.

## 🧰 Technologies Used
- MySQL (or MariaDB)
- SQL DDL and DML
- Aggregations, Joins, GROUP BY, ORDER BY
- Conditional logic and analytical filtering


## 📂 Files

- `analysis.sql`: Contains schema definitions, table creation, and multiple SQL queries for insights like:
  - Most and least profitable products
  - Most popular product
  - Return rate analysis
  - Featured categories
  - Pricing trends by month and material

## 🧠 Key Analyses

- **Profitability**: Identify top- and bottom-line products based on price-cost margins.
- **Product Trends**: Track average prices and material trends monthly.
- **Returns**: Get return percentages by product to monitor product performance.
- **Category Insights**: Understand how often each product category is featured.

## 🛠️ Setup

```sql
-- Run this SQL file inside your MySQL or MariaDB environment
SOURCE analysis.sql;
```

> Note: Ensure your DBMS supports `ENUM`, `BOOLEAN`, and `DATE_FORMAT()` (MySQL or MariaDB recommended).

## DataSet

https://www.kaggle.com/datasets/bharatxjain/makeofwelding-data-set/

