-- Find all employees whose salaries are between 2,500 and 2,900.
-- Notice that both end points are included.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 2500 AND 2900
ORDER BY
    salary DESC;

-- Using comparison operators the same result can be achieved.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 2500
    AND salary <= 2900
ORDER BY
    salary DESC;

-- Find all employees whose salaries are not in the range of 2,500 and 2,900.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 2500 AND 2900
ORDER BY
    salary DESC;

-- Find all employees who joined the company between January 1, 1999, and December 31, 2000.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '1999-01-01' AND '2000-12-31'
ORDER BY
    hire_date;

-- Find employees who have not joined the company from January 1, 1989 to December 31, 1999.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31'
ORDER BY
    hire_date;

-- Find employees who joined the company between 1990 and 1993.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) BETWEEN 1990 AND 1993
ORDER BY
    hire_date;
