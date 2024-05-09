SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees;

-- Order by first name
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    first_name;

-- Order by multiple columns
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    first_name ASC,
    last_name DESC;

-- Sort values in a numeric column
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    salary DESC;

-- Sort dates
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    hire_date DESC;
