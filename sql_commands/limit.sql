-- Selects all rows from the employees table sorted by first name.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
ORDER BY
    first_name;

-- Limits the returned rows to 5.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
ORDER BY
    first_name
LIMIT 5;

-- Limits the returned rows to 5 starting from the 4th row.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
ORDER BY
    first_name
LIMIT 5 OFFSET 3;

-- Get the top N rows with the highest or lowest value.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
LIMIT 5;

-- Get employees who have the 2nd highest salary in the company.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
LIMIT 1 OFFSET 1;

-- The previous query only returns the first of the employees with the second highest salary.
-- In order to get the list of all employees with the second highest salary.
-- First get the second highest salary:
SELECT salary
FROM
    employees
ORDER BY
    salary DESC
LIMIT 1 OFFSET 1;

-- And pass the result to another query.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary = 17000;

-- A more straightforward method is using subqueries.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary = (
        SELECT salary
        FROM
            employees
        ORDER BY
            salary DESC
        LIMIT 1 OFFSET 1
    );
