# 🎬 IMDB Top Movies Analysis Using SQL

This project demonstrates the power of SQL in exploring and analyzing a structured dataset of top-rated IMDB movies. It includes exploratory queries, aggregations, conditional logic, string and date manipulations, and runtime categorization — making it a great reference for SQL practice and real-world data analysis tasks.

---

## 📌 Problem Statement

The goal is to perform SQL-based analysis on a dataset containing the top movies listed on IMDB. The analysis aims to:

- Explore movie metadata like genre, ratings, certification, and runtime.
- Uncover insights around actors, directors, and certification types.
- Aggregate information such as total gross revenue, average ratings, and distribution of genres.
- Categorize movies based on runtime and release period.
- Demonstrate SQL proficiency across a range of business-oriented questions.

---

## 📊 Insights Uncovered

- 🎓 **Highest-rated movies**: Identified the movie(s) with the top IMDB rating.
- 🕵️ **Top Directors**: Analyzed films directed by *Christopher Nolan*, *Quentin Tarantino*, *Steven Spielberg*, and *Rajkumar Hirani*.
- 🧑‍🎤 **Actor-Specific Revenue**: Summed up the total gross of movies featuring **Aamir Khan**.
- 🎭 **Genre Trends**: Found total number of movies in the **Drama** genre and listed distinct genres used.
- 🕒 **Runtime-Based Categorization**: Classified movies into **Short Films**, **Good Watch Time**, and **Longer Movies** based on runtime.
- 🔖 **Certification Analysis**: Listed distinct certificates (e.g., UA, PG, etc.) and analyzed ratings by certification.
- 📅 **Recent Trends**: Analyzed movie characteristics released in the last 10 years.
- ⏱️ **Runtime Conversions**: Converted runtime from string format to hours and minutes using SQL string and casting functions.

---

## 🛠️ SQL Functions & Concepts Used

| Category               | SQL Techniques Used                                                                 |
|------------------------|-------------------------------------------------------------------------------------|
| **Filtering**          | `WHERE`, `IN`, `LIKE`, `UPPER()`, `LOWER()`                                        |
| **Aggregations**       | `COUNT()`, `SUM()`, `MAX()`, `MIN()`                                               |
| **String Operations**  | `REPLACE()`, `||` (concatenation)                                                  |
| **Type Casting**       | `CAST()` or `::DECIMAL` to convert string to number                                |
| **Date Functions**     | `EXTRACT(YEAR FROM CURRENT_DATE)`                                                  |
| **Conditionals**       | `CASE WHEN ... THEN ... ELSE ... END`                                              |
| **Combining Results**  | `UNION`                                                                             |
| **Ordering & Sorting** | `ORDER BY`                                                                          |
| **Runtime Conversion** | `ROUND(REPLACE(runtime, ' min', '')::DECIMAL / 60, 2)`                             |



