-- Find all employees who have both job id 9 and salary greater than 5,000.
SELECT
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id = 9
    AND salary > 5000;

-- Find all the employees who joined the company between 1997 and 1998.
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) >= '1997'
    AND EXTRACT(YEAR FROM hire_date) <= '1998';
