-- Despite that LIMIT is widely supported, it is not in the SQL standard.
-- SQL:2008 intoduced the OFFSET FETCH clause, to skip N first rows.
-- It is handy when pagination is needed; and is best used with ORDER BY.
-- Return the first employee who has the highest salary:
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

-- Sort by salary, skips the first 5 highest salaries rows, and fetches the next 5.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;
