-- Null values cannot be compared using the = operator.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    phone_number = NULL;

-- The IS NULL operator is used to determine if an expression is NULL.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    phone_number IS NULL;

-- Find all employees who have phone numbers.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    phone_number IS NOT NULL;
