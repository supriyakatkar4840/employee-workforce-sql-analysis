-- =====================================================
-- Employee Workforce Management & Analysis using SQL
-- File 1: Database, table structure and sample data
-- Dialect: MySQL 8.0+
-- =====================================================

CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

DROP VIEW  IF EXISTS high_salary_employees;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id      INT PRIMARY KEY,
    full_name        VARCHAR(100),
    age              INT,
    gender           VARCHAR(10),
    department       VARCHAR(50),
    designation      VARCHAR(50),
    salary           DECIMAL(10,2),
    experience_years DECIMAL(4,1),
    location         VARCHAR(50)
);

-- Data follows the brief:
--   Age bands  : Junior 22-30, Mid 31-40, Senior 41-55
--   Salary band: each designation is inside its allowed range
INSERT INTO employees VALUES
(1,  'Aarav Sharma',  28, 'Male',   'IT',         'Software Engineer',  62000.00,  4.5, 'Mumbai'),
(2,  'Priya Nair',    26, 'Female', 'HR',         'HR Associate',       32000.00,  2.5, 'Pune'),
(3,  'Rohan Mehta',   35, 'Male',   'IT',         'Senior Developer',  105000.00, 11.0, 'Mumbai'),
(4,  'Sneha Kulkarni',30, 'Female', 'Sales',      'Sales Executive',    42000.00,  6.0, 'Mumbai'),
(5,  'Amit Verma',    42, 'Male',   'Operations', 'Operations Manager', 98000.00, 18.0, 'Delhi'),
(6,  'Neha Iyer',     29, 'Female', 'Finance',    'Finance Analyst',    52000.00,  5.0, 'Bengaluru'),
(7,  'Karan Singh',   24, 'Male',   'IT',         'Software Engineer',  50000.00,  1.5, 'Delhi'),
(8,  'Anjali Desai',  38, 'Female', 'Finance',    'Finance Analyst',    76000.00, 13.0, 'Mumbai'),
(9,  'Vikram Patil',  45, 'Male',   'IT',         'Senior Developer',  132000.00, 21.0, 'Pune'),
(10, 'Pooja Joshi',   33, 'Female', 'HR',         'HR Associate',       38000.00,  9.0, 'Mumbai'),
(11, 'Rahul Gupta',   27, 'Male',   'IT',         'Software Engineer',  55000.00,  3.0, 'Hyderabad'),
(12, 'Meera Reddy',   41, 'Female', 'Operations', 'Operations Manager',115000.00, 16.5, 'Hyderabad'),
(13, 'Arjun Rao',     31, 'Male',   'Sales',      'Sales Executive',    48000.00,  8.0, 'Bengaluru'),
(14, 'Divya Menon',   36, 'Female', 'Sales',      'Sales Executive',    53000.00, 12.0, 'Mumbai'),
(15, 'Suresh Kumar',  50, 'Male',   'Finance',    'Finance Analyst',    79000.00, 24.0, 'Delhi');
