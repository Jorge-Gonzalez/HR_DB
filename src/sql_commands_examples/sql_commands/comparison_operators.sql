-- Finds the employee whose last name **is equal** to Himuro.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    last_name = 'Himuro';

-- Note that null values are not equal to each other.
-- Lets try to find the employees that have no phone number.
-- Using the equal orperator will return an empty result.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    phone_number = NULL;

-- In order to compare null values, use the IS NULL operator.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    phone_number IS NULL;

-- Return all employees whose department id is not 8.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id <> 8
ORDER BY
    first_name, last_name;

-- The AND operator to combine two expressions.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id <> 8
    AND department_id <> 10
ORDER BY
    first_name, last_name;

-- Find the employees whose salary is **greater than** 10,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 10000
ORDER BY
    salary DESC;

-- Combining the AND and OR operators.
-- Find the employees in dep. 8 with salary greater than 10,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    department_id = 8
    AND salary > 10000
ORDER BY
    salary DESC;

-- Return all employees whose salaries are less than 10,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary < 10000
ORDER BY
    salary DESC;

-- Finds employees whose salaries are greater than or equal 9,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 9000
ORDER BY
    salary;

-- Finds employees whose salaries are less than or equal to 9,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary <= 9000
ORDER BY
    salary DESC;
