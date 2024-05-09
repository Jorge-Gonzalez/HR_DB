-- Selects all employees salaries and sort them
SELECT salary
FROM employees
ORDER BY salary DESC;

-- Selects unique values in salary column, discarting repetitions.
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC;

-- Selects the job id and salary from the employees table
SELECT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id ASC,
    salary DESC;

-- The DISTINCT operator to remove the duplicate values in job id and salary.
SELECT DISTINCT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id ASC,
    salary DESC;

-- DISTINCT treat NULL values as the same; only one NULL is returned.
SELECT DISTINCT phone_number
FROM employees
ORDER BY phone_number;
