-- WHERE clause to filter rows based on specified conditions.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary > 14000
ORDER BY
    salary DESC;

-- Find all employees who work in the department id 5.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id = 5
ORDER BY
    first_name;

-- SQL is case-insensitive,
-- but it is case-sensitive for the values in the comparison.
-- below using 'chen' or 'CHEN' will not return any results.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    last_name = 'Chen';

-- Get all employees who joined the company after January 1st, 1999
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date >= '1999-01-01'
ORDER BY
    hire_date DESC;

-- To find the employees who joined the company in 1999, you can use
-- the EXTRACT(YEAR FROM date) function, or the two expressions with the AND operator,
-- or the BETWEEN operator.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1999
ORDER BY
    hire_date DESC;
