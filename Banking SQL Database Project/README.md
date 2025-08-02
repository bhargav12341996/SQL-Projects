# Banking SQL Database Project

A comprehensive SQL-based banking system that simulates real-world entities like Customers, Accounts, Employees, Transactions, and Products. This project showcases relational database design, data population, and analytical queries used to extract insights from banking data.

---

## 🧩 Problem Statement

Banks operate across various lines of business — savings, loans, current accounts, and more. A well-designed relational database is critical to manage:

- Customer information and their account-product mappings.
- Daily credit/debit transactions.
- Balance summaries and status tracking.
- Employee data with salaries and roles.
- Business insights to support reporting, auditing, and decision-making.

This project replicates a simplified banking system using SQL to model data relationships, load sample data, and uncover useful patterns via queries.

---

## 📦 Features

- **Relational Schema** with foreign key constraints and normalization
- **Sample Dataset** for:
  - Products (Savings, Loans)
  - Customers (with multiple cities and DOBs)
  - Accounts (with statuses and balances)
  - Transactions (credit/debit with timestamps)
  - Employees (salary, gender)
- **Insightful SQL Queries** for:
  - Business intelligence
  - Customer segmentation
  - Transaction analysis
  - Data quality checks

---

## 🏗️ Schema Design Overview

### Tables:
| Table Name          | Description                                  |
|---------------------|----------------------------------------------|
| `products`          | Types of financial products                  |
| `employees`         | Bank employees                               |
| `customers`         | Bank clients with personal info              |
| `accounts`          | Financial accounts with balances             |
| `transactions`      | Credit/Debit activity tied to accounts       |
| `customer_accounts` | Links customers to products and accounts     |

### Relationships:
- One customer ↔ multiple accounts
- One account ↔ one or more transactions
- One product ↔ multiple customer accounts

---

## 📊 Key Insights Uncovered

### ✅ Customer & Product Analysis
- Found customers with multiple products (e.g., Satya Sharma with savings, home loan, personal loan).
- Identified customers from specific locations like Bangalore or Chennai.
- Detected customers who didn’t provide phone numbers (missing data flags).

### 💳 Account Management
- Segregated accounts into:
  - Low Balance (< ₹1,000)
  - Average Balance (₹1,000–₹2,000)
  - High Balance (> ₹2,000)
- Retrieved balances across account types (e.g., total in Savings and Current accounts).

### 💸 Transaction Monitoring
- Listed 5 oldest transactions (for auditing).
- Isolated debit transactions for fraud/cash flow analysis.
- Counted all transactions during Feb 2023 (monthly KPI).

### 🧑‍💼 Employee Queries
- Filtered male employees earning > ₹5,000.
- Found employees starting with "J" or having salary ≥ ₹70,000.

### 📚 Data Consolidation
- Unified employee and customer names for directory view.
- Categorized customers by age using date of birth filtering.


## 🛠 Technologies Used

- SQL (DDL, DML, DQL)
- PostgreSQL (syntax mostly compatible)
- Relational Data Modeling
