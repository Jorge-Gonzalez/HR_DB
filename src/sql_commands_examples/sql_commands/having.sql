-- With HAVING clause you specify conditions on groups.
-- In constrast to WHERE in which conditions are applied to each row,
-- HAVING allows conditions to be applied to groups.
-- Get the managers and their direct reports.
SELECT
    manager_id,
    first_name,
    last_name,
    COUNT(employee_id) AS direct_reports
FROM
    employees
WHERE
    manager_id IS NOT NULL
GROUP BY
    manager_id, first_name, last_name
ORDER BY
    direct_reports;

-- SQL HAVING with SUM function example.
-- Find the managers who have at least five direct reports.
SELECT
    manager_id,
    first_name,
    last_name,
    COUNT(employee_id) AS direct_reports
FROM
    employees
WHERE
    manager_id IS NOT NULL
GROUP BY
    manager_id, first_name, last_name
HAVING
    COUNT(employee_id) >= 5;

-- Calculates the sum of salary that the company pays for each department and selects only the departments with the sum of salary between 20000 and 30000.
SELECT
    department_id,
    SUM(salary) AS total_salary
FROM
    employees
GROUP BY
    department_id
HAVING
    SUM(salary) BETWEEN 20000 AND 30000
ORDER BY
    total_salary;

-- SQL HAVING with MIN example.
-- Find the department that has employees with the lowest salary greater or equal than 10000.
SELECT
    e.department_id,
    d.department_name,
    MIN(e.salary) AS lowest_salary
FROM
    employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
GROUP BY
    e.department_id, d.department_name
HAVING
    MIN(e.salary) >= 10000
ORDER BY
    lowest_salary;

-- SQL HAVING clause with AVG function example.
-- Find the departments that have the average salaries of employees between 5000 and 7000.
SELECT
    e.department_id,
    d.department_name,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM
    employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
GROUP BY
    e.department_id, d.department_name
HAVING
    ROUND(AVG(e.salary), 2) BETWEEN 5000 AND 7000
ORDER BY
    avg_salary;
