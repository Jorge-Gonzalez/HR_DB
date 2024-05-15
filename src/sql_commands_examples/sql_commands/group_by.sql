-- Group the values in department_id column of the employees table.
SELECT department_id
FROM
    employees
GROUP BY
    department_id;

-- Without an aggregate function, the GROUP BY behaves like the DISTINCT keyword.
SELECT DISTINCT department_id
FROM
    employees
ORDER BY
    department_id;

-- The GROUP BY clause is useful when used with an aggregate function.
-- For example, find the number of employees in each department.
SELECT
    department_id,
    COUNT(employee_id) AS headcount
FROM
    employees
GROUP BY
    department_id;

-- SQL GROUP BY with INNER JOIN example.
-- Returns the number of employees by department, and include the department name.
SELECT
    d.department_name,
    COUNT(e.employee_id) AS headcount
FROM
    employees AS e
INNER JOIN departments AS d ON e.department_id = e.department_id
GROUP BY
    d.department_name;

-- SQL GROUP BY with ORDER BY example.
-- Sort the departments by headcount.
SELECT
    d.department_name,
    COUNT(e.employee_id) AS headcount
FROM
    employees AS e
INNER JOIN departments AS d ON e.department_id = e.department_id
GROUP BY
    d.department_name
ORDER BY
    headcount;

-- SQL GROUP BY with HAVING example.
-- Find departments with headcounts are greater than 5.
SELECT
    d.department_name,
    COUNT(e.employee_id) AS headcount
FROM
    employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
GROUP BY
    d.department_name
HAVING
    COUNT(e.employee_id) > 5
ORDER BY
    headcount DESC;

-- SQL GROUP BY with MIN, MAX, and AVG example.
-- Find the minimum, maximum, and average salary of each department.
SELECT
    d.department_name,
    MIN(e.salary) AS min_salary,
    MAX(e.salary) AS max_salary,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM
    employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
GROUP BY
    d.department_name;

-- SQL GROUP BY with SUM function example.
-- Find the total salary of each department.
SELECT
    d.department_name,
    SUM(e.salary) AS total_salary
FROM
    employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
GROUP BY
    d.department_name;

-- SQL GROUP BY multiple columns example.
-- Grouping employees by both department and job.
SELECT
    d.department_name,
    j.job_title,
    COUNT(e.employee_id) AS headcount
FROM
    employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
INNER JOIN jobs AS j ON e.job_id = j.job_id
GROUP BY
    d.department_name,
    j.job_title;
