-- Retrieve all employees who work in the department id 5.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    department_id = 5
ORDER BY
    salary DESC;

-- Get the employees who work in the department id 5 and with a salary not greater than 5000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    department_id = 5
    AND NOT salary > 5000
ORDER BY
    salary;

-- Get all the employees who are not working in the departments 1, 2, or 3.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id NOT IN (1, 2, 3)
ORDER BY
    first_name;

-- Retrieves all the employees whose first names do not start with the letter D.
SELECT
    first_name,
    last_name
FROM
    employees
WHERE
    first_name NOT LIKE 'D%'
ORDER BY
    first_name;

-- Get employees whose salaries are not between 3,000 and 5,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 3000 AND 5000
ORDER BY
    salary;

-- Get the employees who do not have any dependents.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees e
WHERE
    NOT EXISTS (
        SELECT employee_id
        FROM
            dependents d
        WHERE
            d.employee_id = e.employee_id
    );
