create database employee_expenses;
use employee_expenses;
CREATE TABLE expenses (
    expense_id INT PRIMARY KEY,
    employee VARCHAR(50),
    department VARCHAR(50),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    expense_date DATE,
    city VARCHAR(50)
);
select *from employee_expenses;

-- total expense
select sum(amount) as total_expenses
from employee_expenses;

-- average expense
select avg(amount) as average_expenses
from employee_expenses;

-- department spends
SELECT
    department,
    SUM(amount) AS total_expenses
FROM employee_expenses
GROUP BY department
ORDER BY total_expenses DESC;

-- category costs
SELECT
    category,
    SUM(amount) AS total_expenses
FROM employee_expenses
GROUP BY category
ORDER BY total_expenses DESC;

-- employee spent
SELECT
    employee,
    SUM(amount) AS total_expenses
FROM employee_expenses
GROUP BY employee
ORDER BY total_expenses DESC;

-- expenses by city
SELECT
    city,
    SUM(amount) AS total_expenses
FROM employee_expenses
GROUP BY city
ORDER BY total_expenses DESC;