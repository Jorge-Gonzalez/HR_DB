-- Create the employee contacts view based on the data of the employees and departments tables.
CREATE VIEW employee_contacts AS
SELECT
    e.first_name,
    e.last_name,
    e.email,
    e.phone_number,
    d.department_name
FROM
    employees AS e
INNER JOIN
    departments AS d
    ON e.department_id = d.department_id
ORDER BY
    e.first_name;

-- Creates a view whose column names are not the same as the column names of the base tables.
CREATE VIEW payroll (first_name, last_name, job, compensation) AS
SELECT
    e.first_name,
    e.last_name,
    j.job_title,
    e.salary
FROM
    employees AS e
INNER JOIN
    jobs AS j ON e.job_id = j.job_id
ORDER BY
    e.first_name;

-- Selects data from the employee_contacts view.
SELECT
    *
FROM
    employee_contacts;

-- Apply filtering or grouping.
SELECT
    job,
    MIN(compensation) AS min_compensation,
    MAX(compensation) AS max_compensation,
    AVG(compensation) AS avg_compensation
FROM
    payroll
WHERE
    job LIKE 'A%'
GROUP BY
    job;

-- Changes the payroll view by adding the department column and rename the compensation column to salary column.
CREATE OR REPLACE VIEW payroll (first_name, last_name, job, department, salary) AS
SELECT
    e.first_name,
    e.last_name,
    j.job_title,
    d.department_name,
    e.salary
FROM
    employees AS e
INNER JOIN
    jobs AS j
    ON e.job_id = j.job_id
INNER JOIN
    departments AS d
    ON e.department_id = d.department_id
ORDER BY
    e.first_name;
SELECT
    *
FROM
    payroll;
