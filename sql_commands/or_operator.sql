-- Finds all employees who joined the company in 1997 or 1998.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1997
    OR EXTRACT(YEAR FROM hire_date) = 1998
ORDER BY
    first_name,
    last_name;

-- find all employees who joined the company  in 1997 or 1998 and worked in the department id 3.
-- Note that logical operators are evaluated from left to right, hence the need of parentheses.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id = 3
    AND (
        EXTRACT(YEAR FROM hire_date) = 1997
        OR EXTRACT(YEAR FROM hire_date) = 1998
    )
ORDER BY
    first_name,
    last_name;

-- If a query uses many OR operators, it will become difficult to read.
-- Find all employees who joined the company in 1990 or 1999 or 2000.
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1990
    OR EXTRACT(YEAR FROM hire_date) = 1999
    OR EXTRACT(YEAR FROM hire_date) = 2000
ORDER BY
    hire_date;

-- The OR operator can be substituted with the IN operator.
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) IN (1990, 1999, 2000)
ORDER BY
    hire_date;
