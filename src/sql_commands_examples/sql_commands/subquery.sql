-- Imagine that we need to find all employees who locate in the location with the id 1700.
-- An attemp could be find all departments at the location with the 1700 id.
SELECT *
FROM
    departments
WHERE
    location_id = 1700;

-- And then with that preovious result find all employees that belong to the location 1700.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    department_id IN (1, 3, 9, 10, 11)
ORDER BY
    first_name, last_name;

-- A subquery is a query nested inside another query.
-- In this case we can use a subquery to gather the data required for de second request.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    department_id IN (
        SELECT department_id
        FROM
            departments
        WHERE
            location_id = 1700
    )
ORDER BY
    first_name, last_name;

-- SQL subquery with the NOT IN operator.
-- Find all employees who do not locate at the location 1700.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    department_id NOT IN (
        SELECT department_id
        FROM
            departments
        WHERE
            location_id = 1700
    )
ORDER BY
    first_name, last_name;

-- SQL subquery with the comparison operator.
-- Find the employees who have the highest salary.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary = (
        SELECT MAX(salary)
        FROM
            employees
    );

-- SQL subquery with the comparison operator.
-- Finds all employees who salaries are greater than the average salary of all employees.
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
    )
ORDER BY
    first_name, last_name;

-- SQL subquery with the EXISTS and NOT EXISTS operator.
-- Find all departments which have at least one employee with the salary is greater than 10,000.
SELECT department_name
FROM
    departments AS d
WHERE
    EXISTS (
        SELECT 1
        FROM
            employees AS e
        WHERE
            e.department_id = d.department_id
            AND e.salary > 10000
    )
ORDER BY
    department_name;

-- Find all departments which have no employees with the salary is greater than 10,000.
SELECT department_name
FROM
    departments AS d
WHERE
    NOT EXISTS (
        SELECT 1
        FROM
            employees AS e
        WHERE
            e.department_id = d.department_id
            AND e.salary > 10000
    )
ORDER BY
    department_name;

-- SQL subquery with the ALL operator.
-- Let's have a look at the lowest salary by department.
SELECT MIN(salary) AS min_salary
FROM
    employees
GROUP BY
    department_id
ORDER BY
    min_salary DESC;

-- So now let's list all employees whose salaries are greater than the lowest salary by department.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > ALL(
        SELECT MIN(salary)
        FROM
            employees
        GROUP BY
            department_id
    )
ORDER BY
    first_name, last_name;

-- SQL subquery with the ANY operator, SOME is an alias for ANY.
-- Find all employees whose salary is greater than or equal to the highest salary by department.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary >= ANY(
        SELECT MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
    );

-- SQL subquery in the FROM clause.
-- First let's find the average salary on every department.
SELECT AVG(salary) AS avg_salary
FROM
    employees
GROUP BY
    department_id;

-- We can use the previous result to find out the average salary accross all departments.
SELECT ROUND(AVG(avg_salary), 0) AS global_avg_salary
FROM (
    SELECT AVG(salary) AS avg_salary
    FROM
        employees
    GROUP BY
        department_id
) AS department_salary;

-- SQL Subquery in the SELECT clause.
-- Find the salaries of all employees, their average salary, and the difference between the salary of each employee and the average salary.
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    (
        SELECT ROUND(AVG(e2.salary), 0)
        FROM
            employees AS e2
    ) AS average_salary,
    salary - (
        SELECT ROUND(AVG(e3.salary), 0)
        FROM
            employees AS e3
    ) AS difference
FROM
    employees
GROUP BY
    first_name, last_name, employee_id;
