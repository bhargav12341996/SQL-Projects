# 📊 SQL Portfolio Project – Advanced Window Functions & Data Manipulation:

## 🧾 Objective:

This SQL project demonstrates practical usage of advanced SQL window functions and data manipulation techniques using two sample datasets: `employee` and `students`. The objective is to showcase the ability to solve real-world business problems like identifying top performers, departmental segmentation, and row-wise conditional transformations using powerful SQL constructs.

---

## 🧱 Database Schema:

### 🔹 `employee` Table
Stores employee information such as ID, name, department, and salary.

| Column     | Data Type   | Description                |
|------------|-------------|----------------------------|
| emp_ID     | INT         | Unique identifier          |
| emp_NAME   | VARCHAR(50) | Name of the employee       |
| DEPT_NAME  | VARCHAR(50) | Department name            |
| SALARY     | INT         | Monthly salary in USD      |

### 🔹 `students` Table
Stores sequential student names to demonstrate row-based transformation.

| Column        | Data Type   | Description                |
|---------------|-------------|----------------------------|
| id            | INT         | Unique sequential ID       |
| student_name  | VARCHAR(50) | Name of the student        |

---

## 📌 Problem Statements & Queries:

### ✅ Q1: Fetch the first 2 employees who joined in each department
- **Goal**: Identify earliest employees per department based on `emp_ID`.
- **Function Used**: `ROW_NUMBER() OVER(PARTITION BY ...)`

### ✅ Q2: Get top 3 highest-paid employees from each department
- **Goal**: Rank employees by salary within each department.
- **Functions Used**: 
  - `RANK() OVER(PARTITION BY ...)`
  - `ROW_NUMBER() OVER(...)` for alternative comparison

### ✅ Q3: Understanding difference between `ROW_NUMBER`, `RANK`, and `DENSE_RANK`
- **Goal**: Learn how these functions behave with duplicate salary values.

### ✅ Q4: Swap adjacent student names (interchange odd-even rows)
- **Goal**: Create a transformed column swapping adjacent names.
- **Functions Used**: 
  - `LEAD()` 
  - `LAG()` 
  - `CASE WHEN` condition

---

## 🧠 SQL Concepts Covered:

- ✅ Common Table Expressions (CTEs)
- ✅ `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` for ranking and ordering
- ✅ `PARTITION BY` and `ORDER BY` in window functions
- ✅ `LEAD()` and `LAG()` for accessing next/previous rows
- ✅ Conditional logic using `CASE WHEN`
- ✅ Table creation and `INSERT` statements for reproducible demos

---