-- Find employees with the job id is 8, 9, or 10.
SELECT
    employee_id,
    first_name,
    last_name,
    job_id
FROM
    employees
WHERE
    job_id IN (8, 9, 10)
ORDER BY
    job_id;

-- Find employees whose job’s id is neither 7, 8, nor 9.
SELECT
    employee_id,
    first_name,
    last_name,
    job_id
FROM
    employees
WHERE
    job_id NOT IN (7, 8, 9)
ORDER BY
    job_id;

-- Returns the department id of the Marketing and Sales departments.
SELECT department_id
FROM
    departments
WHERE
    department_name = 'Marketing'
    OR department_name = 'Sales'
ORDER BY
    department_id;

-- Pass the id list to the IN operator to find employees who work in the Marketing and Sales departments.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (2, 8);

-- The first query can be nested inside the IN operator.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (
        SELECT department_id
        FROM
            departments
        WHERE
            department_name = 'Marketing'
            OR department_name = 'Sales'
    )
ORDER BY
    department_id;
