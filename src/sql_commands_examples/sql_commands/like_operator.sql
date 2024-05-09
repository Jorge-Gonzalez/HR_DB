-- Find all employees whose first names start with 'Da'.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE 'Da%'
ORDER BY
    first_name;

-- Find all employees whose first names end with 'er'.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE '%er'
ORDER BY
    first_name;

-- Find employees whose last names contain the string 'an'.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%an%'
ORDER BY
    last_name;

-- Retrieve the employees whose first names start with Jo and are followed by at most 2 characters.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE 'Jo__'
ORDER BY
    first_name;

-- Find employees whose first names start with any number of characters and are followed by at most one character.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE '%are_'
ORDER BY
    first_name;

-- Find all employees whose first names start with the letter 'S' but not start with 'Sh'.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE 'S%'
    AND first_name NOT LIKE 'Sh%'
ORDER BY
    first_name;
