# E-Commerce Sales & Revenue Analytics (SQL Portfolio Project)

**Author:** Muhammad Mujtaba Hassan  
**Domain:** E-Commerce / Retail Analytics  
**Tech Stack:** MySQL / PostgreSQL

## Project Overview
This repository contains an end-to-end SQL project I built to analyze e-commerce sales data. I designed a custom relational database from scratch, populated it with sample data, and wrote a series of advanced queries to extract actionable business insights. 

The goal of this project was to showcase my ability to solve practical business questions using standard e-commerce transaction data.

## Technical Skills Used
- **Database Design:** Entity-Relationship modeling and enforcing Primary/Foreign Key constraints.
- **Data Wrangling:** Writing multi-table INNER JOINs (connecting up to 4 tables in a single query).
- **Aggregations:** Using GROUP BY, HAVING, and aggregate functions (SUM, COUNT, AVG).
- **Advanced SQL:** Implementing Common Table Expressions (CTEs), Window Functions (DENSE_RANK), and Scalar Subqueries.
- **Conditional Logic:** Using CASE WHEN statements for custom data segmentation.

## Database Schema
The database (`sales_analytics`) consists of 5 related tables:
1. `categories`: Stores product categories (Electronics, Clothing, etc.).
2. `customers`: Stores user demographic and contact information.
3. `products`: Stores product details and pricing, mapped to categories.
4. `orders`: Tracks individual orders placed by customers.
5. `order_items`: The bridge table detailing quantities and prices of specific products within each order.

The schema is structured to reflect a realistic e-commerce flow: Customers place Orders, and Order Items link those orders to specific Products and Categories.

## Business Problems Solved
To demonstrate how this data can be used in a real business environment, I wrote queries to answer the following questions:

**1. Targeted Marketing Campaigns**
I wrote a query to filter and extract specific customer contact details (using LIKE wildcards) to help a marketing team build an email list for early-adopter promotions.

**2. High-Performing Category Analysis**
By joining four tables across the database, I aggregated revenue data to identify exactly which product categories generated over $100,000 in completed sales.

**3. Order Value Segmentation**
I implemented CASE WHEN logic to dynamically categorize total order values into High, Medium, and Low tiers. This kind of segmentation is typically used to guide personalized customer service and CRM efforts.

**4. Premium Product Identification**
Using a scalar subquery in the WHERE clause, I built a query that dynamically calculates the overall average product price and returns only the premium products priced strictly above that average.

**5. Top Performers per Category**
To find the top 3 highest-revenue generating products within every single category, I developed a Common Table Expression (CTE) and applied the DENSE_RANK() window function to partition and rank the data accurately.

## How to Run the Code
If you want to run this project yourself, clone this repository and open your preferred SQL environment (such as MySQL Workbench or DBeaver). 

Simply run the `ecommerce_sales_analysis.sql` script. The file is self-contained: it will automatically drop and recreate the database, build the tables, insert the sample data, and run the analytical queries.
