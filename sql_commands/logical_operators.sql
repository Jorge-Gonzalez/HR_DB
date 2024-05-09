-- Find all employees whose salaries are greater than 5,000 and less than 7,000.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 5000
    AND salary < 7000
ORDER BY
    salary;
-- Find all employees whose salary is either 7,000 or 8,000.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary = 7000
    OR salary = 8000
ORDER BY
    salary;

-- Find all employees who do not have a phone number.
SELECT
    first_name,
    last_name,
    phone_number
FROM
    employees
WHERE
    phone_number IS NULL
ORDER BY
    first_name, last_name;

-- Find all employees whose salaries are between 9,000 and 12,000.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 9000 AND 12000
ORDER BY
    salary;

-- Find all employees who work in the department id 8 or 9.
SELECT
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (8, 9)
ORDER BY
    department_id;

-- Find all employees whose first name starts with the string 'jo'.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE 'jo%'
ORDER BY
    first_name;

-- Find all employees with the first names whose the second character is 'h'.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE '_h%'
ORDER BY
    first_name;

-- Find all employees whose salaries are greater than all salaries of employees in the department 8.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > ALL(
        SELECT salary
        FROM
            employees
        WHERE
            department_id = 8
    )
ORDER BY
    salary;

-- Find all employees whose salaries are greater than the average salary of every department.   
-- Note that SOME is an alias for ANY.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > ANY(
        SELECT AVG(salary)
        FROM
            employees
        GROUP BY
            department_id
    )
ORDER BY
    first_name, last_name;

-- Find all employees who have dependents.
SELECT
    first_name,
    last_name
FROM
    employees e
WHERE
    EXISTS (
        SELECT 1
        FROM
            dependents d
        WHERE
            d.employee_id = e.employee_id
    );
