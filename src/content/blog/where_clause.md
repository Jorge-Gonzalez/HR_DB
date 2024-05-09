---
title: WHERE Clause
description: Filter data according to specified conditions.
tags:
  - filter data
  - clause
---


```sql
-- WHERE clause to filter rows based on specified conditions.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary > 14000
ORDER BY
    salary DESC;
```

|employee_id | first_name | last_name | hire_date  |  salary  
|------------|------------|-----------|------------|----------
|102 | Lex        | De Haan   | 1993-01-13 | 38964.32
|100 | Steven     | King      | 1987-06-17 | 24000.00
|101 | Neena      | Kochhar   | 1989-09-21 | 17000.00
(3 rows)

```sql
-- Find all employees who work in the department id 5.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id = 5
ORDER BY
    first_name;
```

|employee_id | first_name |  last_name  | department_id 
|------------|------------|-------------|---------------
|121 | Adam       | Fripp       |             5
|193 | Britney    | Everett     |             5
|126 | Irene      | Mikkilineni |             5
|120 | Matthew    | Weiss       |             5
|122 | Payam      | Kaufling    |             5
|192 | Sarah      | Bell        |             5
|123 | Shanta     | Vollman     |             5
(7 rows)

```sql
-- SQL is case-insensitive,
-- but it is case-sensitive for the values in the comparison.
-- below using 'chen' or 'CHEN' will not return any results.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    last_name = 'Chen';
```

|employee_id | first_name | last_name 
|------------|------------|-----------
|110 | John       | Chen
(1 row)

```sql
-- Get all employees who joined the company after January 1st, 1999
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date >= '1999-01-01'
ORDER BY
    hire_date DESC;
```

|employee_id | first_name | last_name  | hire_date  
|------------|------------|------------|------------
|179 | Charles    | Johnson    | 2000-01-04
|113 | Luis       | Popp       | 1999-12-07
|119 | Karen      | Colmenares | 1999-08-10
|178 | Kimberely  | Grant      | 1999-05-24
|107 | Diana      | Lorentz    | 1999-02-07
(5 rows)

```sql
-- To find the employees who joined the company in 1999, you can use
-- the EXTRACT(YEAR FROM date) function, or the two expressions with the AND operator,
-- or the BETWEEN operator.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1999
ORDER BY
    hire_date DESC;

```

|employee_id | first_name | last_name  | hire_date  
|------------|------------|------------|------------
|113 | Luis       | Popp       | 1999-12-07
|119 | Karen      | Colmenares | 1999-08-10
|178 | Kimberely  | Grant      | 1999-05-24
|107 | Diana      | Lorentz    | 1999-02-07
(4 rows)

