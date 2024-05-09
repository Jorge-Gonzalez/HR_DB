-- The department_id column in the employees table is the foreign key column that links the employees to the departments table.
-- Get the information of the department id 1,2, and 3.
SELECT
    department_id,
    department_name
FROM
    departments
WHERE
    department_id IN (1, 2, 3);

-- Get the information of employees who work in the department id 1, 2 and 3.
SELECT
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (1, 2, 3)
ORDER BY
    department_id;

-- Combine previous two queries from different tables into a single query.
-- In inner join only the rows that matched are returned from both tables.
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_id AS department_id2,
    d.department_name
FROM
    employees AS e
INNER JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.department_id IN (1, 2, 3);

-- Get the first name, last name, job title, and department name of
-- employees who work in department id 1, 2, and 3.
SELECT
    e.first_name,
    e.last_name,
    j.job_title,
    d.department_name
FROM
    employees AS e
INNER JOIN
    jobs AS j ON e.job_id = j.job_id
INNER JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.department_id IN (1, 2, 3);
