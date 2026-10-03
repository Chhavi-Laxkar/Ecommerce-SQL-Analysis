# 🛒 E-Commerce SQL Analysis

## 📌 Project Overview

This project focuses on analyzing an E-Commerce dataset using **MySQL**.

The main objective of this project is to understand customer behavior, orders, products, payments, sellers, reviews, and geographical information using SQL queries.

The project covers SQL concepts from basic data exploration to advanced SQL analysis.

---

## 🎯 Objectives

The main objectives of this project are:

- Explore the E-Commerce database and its tables
- Understand customers and their locations
- Analyze orders and order items
- Analyze product categories
- Analyze payment methods and payment values
- Study sellers and seller performance
- Analyze customer reviews
- Use SQL JOINs to combine information from multiple tables
- Perform aggregation and grouping
- Use advanced SQL techniques for deeper analysis

---

## 🗂️ Database Information

**Database Name:**

`ecommerce_sql_project`

The database contains multiple tables related to the E-Commerce business.

### Main Tables

- `customers`
- `geolocation`
- `order_items`
- `order_payments`
- `orders`
- `product_category_name`
- `products`
- `reviews`
- `sellers`

---

## 🔍 Project Structure

The SQL analysis is divided into different levels.

### Step 1 — Database Setup

Created the database and selected it for analysis.

```sql
CREATE DATABASE ecommerce_sql_project;
USE ecommerce_sql_project ;