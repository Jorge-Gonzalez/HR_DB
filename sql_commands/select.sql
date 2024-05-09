-- selecting data from all columns
SELECT * FROM employees;

-- selecting specific columns
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees;

-- performing a simple calculation
SELECT
    employee_id,
    first_name,
    last_name,
    salary * 1.05 AS new_salary
FROM
    employees;
