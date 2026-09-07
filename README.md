# 🛒 E-Commerce Sales & Revenue Analytics (SQL Portfolio Project)

**Author:** Muhammad Mujtaba Hassan  
**Domain:** E-Commerce / Retail Analytics  
**Tech Stack:** MySQL / PostgreSQL

## 📝 Project Overview
This project is an end-to-end relational database design and data analysis solution for a fictional e-commerce business. It demonstrates the ability to build a database from scratch (DDL/DML) and write advanced SQL queries to solve real-world business problems and extract actionable revenue insights.

## 🛠️ Technical Skills Demonstrated
- **Database Design:** Entity-Relationship (ER) modeling, Primary/Foreign Key constraints.
- **Data Wrangling:** Multi-table `INNER JOIN`s (up to 4 tables).
- **Aggregations & Grouping:** `GROUP BY`, `HAVING`, and aggregate functions (`SUM`, `COUNT`, `AVG`).
- **Advanced SQL:** Common Table Expressions (CTEs), Window Functions (`DENSE_RANK()`), Scalar Subqueries.
- **Conditional Logic:** `CASE WHEN` statements for data segmentation.

## 🗄️ Database Schema
The database (`sales_analytics`) consists of 5 related tables:
1. **`categories`**: Stores product categories (Electronics, Clothing, etc.).
2. **`customers`**: Stores user demographic and contact information.
3. **`products`**: Stores product details, pricing, and maps to categories (FK).
4. **`orders`**: Tracks individual orders placed by customers (FK).
5. **`order_items`**: The bridge table detailing quantities and prices of specific products within each order.

*The schema follows a standard e-commerce transaction flow: Customers ➔ Orders ➔ Order Items ➔ Products ➔ Categories.*

## 📊 Business Problems Solved

**1. Targeted Marketing Campaigns**
> **Scenario:** The marketing team needs a list of early-adopter customers using Gmail accounts to send targeted promotional offers.
> **Solution:** Utilized wildcard filtering (`LIKE '%@gmail.com'`) to extract and sort specific customer contact details.

**2. High-Performing Category Analysis**
> **Scenario:** Leadership wants to identify which product categories have generated over $100,000 in total revenue from completed orders.
> **Solution:** Connected 4 tables using a primary/foreign key chain and applied `GROUP BY` with a `HAVING` clause to filter aggregated revenue.

**3. Order Value Segmentation**
> **Scenario:** The CRM team needs orders categorized into 'High', 'Medium', and 'Low' value tiers to personalize post-purchase customer service.
> **Solution:** Implemented `CASE WHEN` conditional logic to dynamically segment order totals into strategic business tiers.

**4. Premium Product Identification**
> **Scenario:** The merchandising team wants a list of premium products priced strictly above the global catalog average.
> **Solution:** Wrote a scalar subquery in the `WHERE` clause to dynamically calculate the overall average price and filter the product list accordingly.

**5. Top Performers per Category**
> **Scenario:** The sales department needs to know the top 3 highest-revenue generating products within each individual category.
> **Solution:** Developed a Common Table Expression (CTE) and applied the `DENSE_RANK()` window function partitioned by category name to accurately rank products by revenue.

## 🚀 How to Run the Code
1. Clone this repository to your local machine.
2. Open your preferred SQL environment (MySQL Workbench, pgAdmin, DBeaver, etc.).
3. Execute the `ecommerce_sales_analysis.sql` script.
   - *Phase 1* will create the database and tables.
   - *Phase 2* will populate the tables with sample transaction data.
   - *Phase 3* contains the advanced analytical queries.
