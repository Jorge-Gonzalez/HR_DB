---
title: TRIGGER
description: A trigger is a piece of code executed automatically in response to a specific event occurred on a table in the database.
tags:
  - modyfying data
  - events
---


```sql
-- Clear script changes.
-- DROP TABLE IF EXISTS salary_changes;
-- DROP TRIGGER IF EXISTS before_update_salary ON employees;
-- DROP FUNCTION IF EXISTS LOG_SALARY_CHANGES() CASCADE;
--
-- Create a new table called salary_changes.
CREATE TABLE salary_changes (
    employee_id INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_salary NUMERIC(8, 2),
    new_salary NUMERIC(8, 2),
    PRIMARY KEY (employee_id, changed_at)
);
```

|CREATE FUNCTION
|CREATE TRIGGER
|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|102 | Lex        | De Haan   | 37108.88
(1 row)

```sql
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
```

|UPDATE 1
|employee_id |         changed_at         | old_salary | new_salary 
|------------|----------------------------|------------|------------
|102 | 2024-05-08 00:26:17.034189 |   35341.79 |   37108.88
|102 | 2024-05-08 23:34:41.666916 |   37108.88 |   38964.32
(2 rows)

