---
title: Logical Operators
description: Enable the combination or chaining of conditions.
tags:
  - filter data
  - operators
---


```sql
-- Find all employees whose salaries are greater than 5,000 and less than 7,000.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 5000
    AND salary < 7000
ORDER BY
    salary;
-- Find all employees whose salary is either 7,000 or 8,000.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary = 7000
    OR salary = 8000
ORDER BY
    salary;
```

|first_name | last_name | salary  
|-----------|-----------|---------
|Bruce      | Ernst     | 6000.00
|Pat        | Fay       | 6000.00
|Charles    | Johnson   | 6200.00
|Shanta     | Vollman   | 6500.00
|Susan      | Mavris    | 6500.00
|Luis       | Popp      | 6900.00
(6 rows)

```sql
-- Find all employees who do not have a phone number.
SELECT
    first_name,
    last_name,
    phone_number
FROM
    employees
WHERE
    phone_number IS NULL
ORDER BY
    first_name, last_name;
```

|first_name | last_name | salary  
|-----------|-----------|---------
|Kimberely  | Grant     | 7000.00
|Matthew    | Weiss     | 8000.00
(2 rows)

```sql
-- Find all employees whose salaries are between 9,000 and 12,000.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 9000 AND 12000
ORDER BY
    salary;
```

|first_name | last_name  | phone_number 
|-----------|------------|--------------
|Charles    | Johnson    | 
|Jack       | Livingston | 
|John       | Russell    | 
|Jonathon   | Taylor     | 
|Karen      | Partners   | 
|Kimberely  | Grant      | 
(6 rows)

```sql
-- Find all employees who work in the department id 8 or 9.
SELECT
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (8, 9)
ORDER BY
    department_id;
```

|first_name | last_name |  salary  
|-----------|-----------|----------
|Alexander  | Hunold    |  9000.00
|Daniel     | Faviet    |  9000.00
|Hermann    | Baer      | 10000.00
|Den        | Raphaely  | 11000.00
|Nancy      | Greenberg | 12000.00
|Shelley    | Higgins   | 12000.00
(6 rows)

```sql
-- Find all employees whose first name starts with the string 'jo'.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE 'jo%'
ORDER BY
    first_name;
```

|first_name | last_name  | department_id 
|-----------|------------|---------------
|Kimberely  | Grant      |             8
|Charles    | Johnson    |             8
|John       | Russell    |             8
|Karen      | Partners   |             8
|Jonathon   | Taylor     |             8
|Jack       | Livingston |             8
|Lex        | De Haan    |             9
|Neena      | Kochhar    |             9
|Steven     | King       |             9
(9 rows)

```sql
-- Find all employees with the first names whose the second character is 'h'.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    first_name LIKE '_h%'
ORDER BY
    first_name;
```

|employee_id | first_name | last_name 
|------------|------------|-----------
(0 rows)

```sql
-- Find all employees whose salaries are greater than all salaries of employees in the department 8.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > ALL(
        SELECT salary
        FROM
            employees
        WHERE
            department_id = 8
    )
ORDER BY
    salary;
```

|employee_id | first_name | last_name 
|------------|------------|-----------
|179 | Charles    | Johnson
|123 | Shanta     | Vollman
|205 | Shelley    | Higgins
|116 | Shelli     | Baida
(4 rows)

```sql
-- Find all employees whose salaries are greater than the average salary of every department.   
-- Note that SOME is an alias for ANY.
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > ANY(
        SELECT AVG(salary)
        FROM
            employees
        GROUP BY
            department_id
    )
ORDER BY
    first_name, last_name;
```

|first_name | last_name |  salary  
|-----------|-----------|----------
|Neena      | Kochhar   | 17000.00
|Steven     | King      | 24000.00
|Lex        | De Haan   | 38964.32
(3 rows)

```sql
-- Find all employees who have dependents.
SELECT
    first_name,
    last_name
FROM
    employees e
WHERE
    EXISTS (
        SELECT 1
        FROM
            dependents d
        WHERE
            d.employee_id = e.employee_id
    );

```

|first_name  | last_name  |  salary  
|------------|------------|----------
|Adam        | Fripp      |  8200.00
|Alexander   | Hunold     |  9000.00
|Bruce       | Ernst      |  6000.00
|Charles     | Johnson    |  6200.00
|Daniel      | Faviet     |  9000.00
|David       | Austin     |  4800.00
|Den         | Raphaely   | 11000.00
|Diana       | Lorentz    |  4200.00
|Hermann     | Baer       | 10000.00
|Ismael      | Sciarra    |  7700.00
|Jack        | Livingston |  8400.00
|Jennifer    | Whalen     |  4400.00
|John        | Chen       |  8200.00
|John        | Russell    | 14000.00
|Jonathon    | Taylor     |  8600.00
|Jose Manuel | Urman      |  7800.00
|Karen       | Partners   | 13500.00
|Kimberely   | Grant      |  7000.00
|Lex         | De Haan    | 38964.32
|Luis        | Popp       |  6900.00
|Matthew     | Weiss      |  8000.00
|Michael     | Hartstein  | 13000.00
|Nancy       | Greenberg  | 12000.00
|Neena       | Kochhar    | 17000.00
|Pat         | Fay        |  6000.00
|Payam       | Kaufling   |  7900.00
|Shanta      | Vollman    |  6500.00
|Shelley     | Higgins    | 12000.00
|Steven      | King       | 24000.00
|Susan       | Mavris     |  6500.00
|Valli       | Pataballa  |  4800.00
|William     | Gietz      |  8300.00
(32 rows)

```sql

```

|first_name  | last_name  
|------------|------------
|Steven      | King
|Neena       | Kochhar
|Alexander   | Hunold
|Bruce       | Ernst
|David       | Austin
|Valli       | Pataballa
|Diana       | Lorentz
|Nancy       | Greenberg
|Daniel      | Faviet
|John        | Chen
|Ismael      | Sciarra
|Jose Manuel | Urman
|Luis        | Popp
|Den         | Raphaely
|Alexander   | Khoo
|Shelli      | Baida
|Sigal       | Tobias
|Guy         | Himuro
|Karen       | Colmenares
|John        | Russell
|Karen       | Partners
|Jonathon    | Taylor
|Jennifer    | Whalen
|Michael     | Hartstein
|Pat         | Fay
|Susan       | Mavris
|Hermann     | Baer
|Shelley     | Higgins
|William     | Gietz
|Lex         | De Haan
(30 rows)

