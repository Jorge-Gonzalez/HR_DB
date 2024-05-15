-- Clear script changes.
-- DROP TABLE IF EXISTS salary_changes;
-- DROP TRIGGER IF EXISTS before_update_salary ON employees;
-- DROP FUNCTION IF EXISTS LOG_SALARY_CHANGES() CASCADE;
--
-- Create a new table called salary_changes.
DROP TABLE IF EXISTS salary_changes;
CREATE TABLE salary_changes (
    employee_id INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_salary NUMERIC(8, 2),
    new_salary NUMERIC(8, 2),
    PRIMARY KEY (employee_id, changed_at)
);

-- Create a function to insert data into the salary_changes table
-- to use with the evet trigger before_update_employee.
CREATE OR REPLACE FUNCTION LOG_SALARY_CHANGES()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO salary_changes
        (employee_id, old_salary, new_salary)
    VALUES
        (OLD.employee_id, OLD.salary, NEW.salary);
    RETURN NEW;
END;
$$;

-- Create a trigger to update the salary_changes table
-- when an employee's salary is updated.
CREATE OR REPLACE TRIGGER before_update_salary
BEFORE UPDATE ON employees
FOR EACH ROW
EXECUTE PROCEDURE LOG_SALARY_CHANGES();

-- Check the current salary of the employee 110
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    employee_id = 102;

-- Raise the salary of employee 110 by 5%.
UPDATE employees
SET
    salary = salary * 1.05
WHERE
    employee_id = 102;

-- Check the salary_changes table to see the trigger changes.
SELECT
    *
FROM
    salary_changes;
