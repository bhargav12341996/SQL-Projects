# 📦 Sales Order Analysis Using SQL

This project demonstrates how to analyze a typical sales database using SQL. It covers real-world scenarios related to order processing, customer information, inventory management, pricing discrepancies, and time-based sales analysis.

---

## 📌 Problem Statement

Sales and operations teams need consistent reporting and insights into product performance, customer behavior, and order health. This SQL project simulates such business queries and analysis from raw sales data to help:

- Detect inconsistencies in sales orders and customer records
- Understand product line-level performance
- Track shipping timelines and pricing anomalies
- Audit customer activity by geography
- Support operational KPIs like total revenue, average order value, and product demand

---


### 🔗 Relationships

- **sales_order.customer** → **customers.customer_id**
- **sales_order.product** → **products.product_code**

Each order belongs to a customer and involves a specific product.

---

## 📊 Insights Uncovered

| # | Insight |
|---|---------|
| 1 | Small shipped orders from Aug–Dec 2003 |
| 2 | Orders from non-USA customers still in process |
| 3 | Unshipped and unresolved orders for vehicles (trains/ships/planes) |
| 4 | Customers with phone numbers containing `+`, `()`, or no spaces (data audit) |
| 5 | Even-quantity orders between Feb–May 2003 |
| 6 | Orders where product was sold above base price |
| 7 | Average sales order value |
| 8 | Total orders and quantity sold |
| 9 | First and last order dates |
|10 | Quarter-wise revenue summaries |
|11 | Inventory breakdown by product lines |
|12 | Countries with most Motorcycle orders |
|13 | Highest & lowest sold vehicle types (same query) |

---

## 🧠 SQL Functions & Concepts Used

| Concept              | Examples |
|----------------------|----------|
| **Filtering**        | `WHERE`, `LIKE`, `NOT LIKE`, `IN`, `<>`, `LOWER()` |
| **Aggregations**     | `SUM()`, `COUNT()`, `AVG()`, `MIN()`, `MAX()` |
| **Conditional Logic**| `CASE WHEN` |
| **Date Functions**   | `TO_DATE()`, `AGE()`, `BETWEEN`, `EXTRACT(YEAR...)` |
| **Joins**            | `JOIN` to connect customer, product, and order data |
| **Mathematics**      | `MOD()`, comparisons (`price_each > price`) |
| **Grouping & Sorting** | `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT` |

---

### Dataset: Click [here](https://github.com/bhargav12341996/SQL-Projects/blob/main/Sales%20order%20Analysis%20using%20SQL/Dataset%20File/Sales_Order_Dataset_PostgreSQL.txt)

### Project File: Click [here](https://github.com/bhargav12341996/SQL-Projects/blob/main/Sales%20order%20Analysis%20using%20SQL/Sales_Order_Analysis.sql)