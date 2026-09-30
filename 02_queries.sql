-- =====================================================
-- Employee Workforce Management & Analysis using SQL
-- File 2: Solutions to all 23 questions
-- Run 01_schema_and_data.sql first.
-- =====================================================
USE employee_db;

-- Q1. Retrieve all employee details
SELECT * FROM employees;

-- Q2. Employees who work in the IT department
SELECT * FROM employees WHERE department = 'IT';

-- Q3. Employees with salary greater than 60,000
SELECT * FROM employees WHERE salary > 60000;

-- Q4. Distinct department names
SELECT DISTINCT department FROM employees;

-- Q5. Employees from Mumbai
SELECT * FROM employees WHERE location = 'Mumbai';

-- Q6. Sort employees by salary in descending order
SELECT * FROM employees ORDER BY salary DESC;

-- Q7. Names starting with 'A'
SELECT * FROM employees WHERE full_name LIKE 'A%';

-- Q8. Average salary of each department
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department;

-- Q9. Department with the highest number of employees
-- (ties are handled by comparing against the maximum count)
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) = (SELECT MAX(cnt)
                   FROM (SELECT COUNT(*) AS cnt
                         FROM employees
                         GROUP BY department) AS t);

-- Q10. Total salary paid per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Q11. Minimum and maximum salary in the IT department
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employees
WHERE department = 'IT';

-- Q12. Employees with more than 10 years of experience
SELECT * FROM employees WHERE experience_years > 10;

-- Q13. Junior / Mid / Senior level using CASE on age
SELECT employee_id, full_name, age,
       CASE
           WHEN age BETWEEN 22 AND 30 THEN 'Junior'
           WHEN age BETWEEN 31 AND 40 THEN 'Mid-Level'
           WHEN age BETWEEN 41 AND 55 THEN 'Senior'
           ELSE 'Out of range'
       END AS level_category
FROM employees;

-- Q14. Salary range category based on designation
--      Shows the allowed range and checks whether each salary falls inside it
SELECT employee_id, full_name, designation, salary,
       CASE designation
           WHEN 'HR Associate'       THEN '25,000 - 40,000'
           WHEN 'Software Engineer'  THEN '50,000 - 90,000'
           WHEN 'Senior Developer'   THEN '90,000 - 140,000'
           WHEN 'Sales Executive'    THEN '30,000 - 55,000'
           WHEN 'Finance Analyst'    THEN '45,000 - 80,000'
           WHEN 'Operations Manager' THEN '80,000 - 120,000'
       END AS salary_range,
       CASE
           WHEN designation = 'HR Associate'       AND salary BETWEEN 25000 AND 40000  THEN 'Within range'
           WHEN designation = 'Software Engineer'  AND salary BETWEEN 50000 AND 90000  THEN 'Within range'
           WHEN designation = 'Senior Developer'   AND salary BETWEEN 90000 AND 140000 THEN 'Within range'
           WHEN designation = 'Sales Executive'    AND salary BETWEEN 30000 AND 55000  THEN 'Within range'
           WHEN designation = 'Finance Analyst'    AND salary BETWEEN 45000 AND 80000  THEN 'Within range'
           WHEN designation = 'Operations Manager' AND salary BETWEEN 80000 AND 120000 THEN 'Within range'
           ELSE 'Outside range'
       END AS range_check
FROM employees;

-- Q15. Salary between 50,000 and 1,00,000
SELECT * FROM employees WHERE salary BETWEEN 50000 AND 100000;

-- Q16. Female employees in the Sales department
SELECT * FROM employees WHERE gender = 'Female' AND department = 'Sales';

-- Q17. Experience between 2 and 8 years
SELECT * FROM employees WHERE experience_years BETWEEN 2 AND 8;

-- Q18. Self join: higher-paid vs lower-paid employees (same department)
SELECT e1.full_name  AS higher_paid_employee,
       e1.salary     AS higher_salary,
       e2.full_name  AS lower_paid_employee,
       e2.salary     AS lower_salary,
       e1.department,
       e1.salary - e2.salary AS salary_gap
FROM employees e1
JOIN employees e2
  ON e1.department = e2.department
 AND e1.salary > e2.salary
ORDER BY e1.department, salary_gap DESC;

-- Q19. View: employees earning more than 80,000
CREATE OR REPLACE VIEW high_salary_employees AS
SELECT * FROM employees WHERE salary > 80000;

-- Q20. Query the view: more than 5 years of experience
SELECT * FROM high_salary_employees WHERE experience_years > 5;

-- Q21. Rank employees by salary (highest to lowest)
SELECT employee_id, full_name, department, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q22. Each employee's salary with the department-wise average salary
SELECT employee_id, full_name, department, salary,
       ROUND(AVG(salary) OVER (PARTITION BY department), 2) AS dept_avg_salary,
       ROUND(salary - AVG(salary) OVER (PARTITION BY department), 2) AS diff_from_avg
FROM employees;

-- Q23. DENSE_RANK of employees by experience within each department
SELECT employee_id, full_name, department, experience_years,
       DENSE_RANK() OVER (PARTITION BY department
                          ORDER BY experience_years DESC) AS experience_rank
FROM employees;
