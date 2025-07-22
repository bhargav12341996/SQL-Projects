🎨 Painting Sales Analysis - SQL Portfolio Project

📌 Problem Statement
An art gallery maintains a database of its paintings, artists, collectors, and sales. The goal of this analysis is to:

* Identify trends and insights from sales transactions.

* Monitor artist performance.

* Detect data quality issues such as duplicates.

* Answer common business questions using SQL.

🗂️ Database Schema
This project consists of four core tables:

1. paintings

* id (int): Unique painting ID

* name (varchar): Title of the painting

* artist_id (int): Foreign key to artists.id

* listed_price (float): Price listed for sale

2. artists
* id (int): Unique artist ID

* first_name, last_name (varchar): Artist name

3. collectors
* id (int): Unique collector ID

* first_name, last_name (varchar): Collector name

4. sales
* id (int): Unique sale ID

* sale_date (date): Date of transaction

* painting_id, artist_id, collector_id: Foreign keys

* sales_price (float): Final sale amount

🧠 Key Business Questions & SQL Solutions
1. Which paintings are listed above the average price?

2. Which collectors have purchased paintings?

3. Total sales amount per artist

4. Artists with zero sales

5. Identify and remove duplicate artists


📈 Insights Uncovered:

* High-value paintings are clearly identified for pricing strategy improvements.

* Collector behavior analysis helps identify repeat buyers.

* Artist sales trends enable prioritization and promotion efforts.

* Data quality routines help maintain integrity in the artists table.

🛠️ SQL Functions and Techniques Used:

* Aggregation:	SUM, AVG, COUNT, GROUP BY, HAVING
* Joins:	INNER JOIN
* Subqueries:	Scalar & Correlated subqueries
* String Functions:	Concat function used
* DML Functions:	INSERT, DELETE, SELECT
* DDL Functions:	CREATE TABLE AS, Backup tables
* Other Functions: Deduplication, GROUP BY, MIN, NOT IN