
# MakeOfWelding Database & Analysis

This repository contains SQL scripts for managing and analyzing sales and product data for the fictional company **MakeOfWelding**.

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

