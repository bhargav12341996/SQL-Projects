# 👥 Employee Hierarchy Analysis Using Recursive SQL:

## 📌 Problem Statement:

In many organizations, employees report to managers, and managers in turn report to higher-level executives, creating a hierarchical structure. Given a flat table of employee data with self-referencing manager relationships, the challenge is to:

> 🔍 **Identify all employees (direct and indirect) under a specific manager (e.g., "Asha") and visualize/report the full hierarchy.**

This project solves the above problem using recursive Common Table Expressions (CTEs) in SQL to dynamically traverse the organizational tree.

---

## 🧱 Schema Design:

### Table: `emp_details`

| Column        | Type         | Description                          |
|---------------|--------------|--------------------------------------|
| `id`          | INT (PK)     | Unique employee identifier           |
| `name`        | VARCHAR(100) | Employee name                        |
| `manager_id`  | INT          | ID of the employee's direct manager |
| `salary`      | INT          | Salary                               |
| `designation` | VARCHAR(100) | Job title                            |

Self-referencing relationship: `manager_id` refers back to `id` within the same table.

---

## 🧠 Recursive SQL Logic Explained:

SQL doesn't support traditional recursion (like Python or C), but recursive CTEs provide a way to simulate it for tree-like data structures.

### 🔄 What is a Recursive CTE?

A **Recursive Common Table Expression** (`WITH RECURSIVE`) allows a query to repeatedly apply a logic until no more rows are returned — ideal for hierarchies and graph traversals.

---

## 🔍 Use Case 1: Find full hierarchy under a specific manager (e.g., Asha)

```sql
WITH RECURSIVE cte AS (
    SELECT * FROM emp_details WHERE name = 'Asha'  -- Anchor member
    UNION
    SELECT e.* FROM cte
    JOIN emp_details e ON e.manager_id = cte.id     -- Recursive member
)
SELECT * FROM cte;

---

## 🔍 Use Case 2: Show emp_id, emp_name, and their manager_name in hierarchy


WITH RECURSIVE cte AS (
    SELECT emp.id AS emp_id, emp.name AS emp_name, mng.name AS manager_name, 1 AS iteration
    FROM emp_details emp
    JOIN emp_details mng ON emp.manager_id = mng.id
    WHERE emp.name = 'Asha'

    UNION

    SELECT e.id, e.name, cte.emp_name, iteration + 1
    FROM cte
    JOIN emp_details e ON e.manager_id = cte.emp_id
)
SELECT * FROM cte;

---

🧮 SQL Functions & Concepts Used
WITH RECURSIVE CTE

Self JOIN for hierarchy resolution

Aliases (AS)

UNION to combine anchor and recursive logic

Basic DDL & DML (CREATE TABLE, INSERT, COMMIT)

---

