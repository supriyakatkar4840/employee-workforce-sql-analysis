# Employee Workforce Management & Analysis using SQL

A SQL mini project that analyses employee demographic and employment data (age, department, designation, salary, experience, location) using MySQL.

## Objective
Build an `employees` table with 15 records and answer 23 business questions covering filtering, aggregation, `CASE`, self join, views and window functions.

## Tools
- MySQL 8.0+ (MySQL Workbench)
- SQL

## Dataset
Table `employees` (15 records)

| Column | Type | Description |
|---|---|---|
| employee_id | INT (PK) | Unique employee ID |
| full_name | VARCHAR(100) | Employee name |
| age | INT | Age |
| gender | VARCHAR(10) | Male / Female |
| department | VARCHAR(50) | HR / IT / Finance / Sales / Operations |
| designation | VARCHAR(50) | Job title |
| salary | DECIMAL(10,2) | Monthly salary |
| experience_years | DECIMAL(4,1) | Work experience |
| location | VARCHAR(50) | Office location |

**Data rules followed**
- Age bands: Junior 22-30, Mid-Level 31-40, Senior 41-55
- Salary ranges per designation: HR Associate 25k-40k, Software Engineer 50k-90k, Senior Developer 90k-140k, Sales Executive 30k-55k, Finance Analyst 45k-80k, Operations Manager 80k-120k

## Repository structure
```
employee-workforce-sql-analysis/
├── 01_schema_and_data.sql   # database, table, 15 inserts
├── 02_queries.sql           # solutions to Q1-Q23
├── output/
│   ├── query_results.txt    # every query with its result
│   ├── screenshots/         # result tables as images (Q1-Q23, no image for Q19)
│   └── csv/                 # result of each query as CSV
└── README.md
```

## How to run
1. Open MySQL Workbench (or the `mysql` CLI).
2. Run `01_schema_and_data.sql`.
3. Run `02_queries.sql` (or individual queries).

## Sample output
Q9 - department with the most employees:

![Q9](output/screenshots/Q9.png)

Q23 - DENSE_RANK of experience within each department:

![Q23](output/screenshots/Q23.png)

All 23 outputs are in [`output/query_results.txt`](output/query_results.txt).

## SQL concepts covered
| Concept | Questions |
|---|---|
| SELECT, WHERE, DISTINCT, ORDER BY, LIKE, BETWEEN | 1-7, 12, 15-17 |
| GROUP BY, HAVING, aggregate functions | 8-11 |
| CASE expressions | 13, 14 |
| Self join | 18 |
| Views | 19, 20 |
| Window functions (RANK, DENSE_RANK, AVG OVER) | 21-23 |

## Key insights
- **IT is the largest department** with 5 of 15 employees and the highest payroll (₹4,04,000 per month).
- **Highest paid:** Vikram Patil (Senior Developer, IT, ₹1,32,000). **Lowest paid:** Priya Nair (HR Associate, ₹32,000).
- **Only 4 employees earn above ₹80,000**, and all four have more than 5 years of experience.
- All salaries sit within the band defined for their designation (verified in Q14).
- Senior-level staff (41-55) are concentrated in IT, Operations and Finance.

## Author
Supriya Narayan Katkar
