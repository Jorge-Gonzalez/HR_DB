-- First let's find the employees whose salary is greater than the globalaverage salary.
-- In this case the subquery is independent of the outer query.
-- This is known as a plain subquery.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT AVG(salary)
        FROM
            employees
    );

-- A correlated subquery is a subquery that uses the values from the outer query.
-- For this reason it may be evaluated for each row of the outer query and hence it may be slow.
-- A correlated subquery is also known as a repeating subquery or a synchronized subquery.
-- SQL correlated subquery in the WHERE clause example.
-- Find all employees whose salary is higher than the average salary of the employees in their departments.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    department_id
FROM
    employees AS e
WHERE
    salary > (
        SELECT AVG(e2.salary)
        FROM
            employees AS e2
        WHERE
            e.department_id = e2.department_id
    )
ORDER BY
    department_id, first_name, last_name;

