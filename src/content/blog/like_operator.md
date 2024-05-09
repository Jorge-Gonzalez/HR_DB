---
title: LIKE Operator
description: Filter data based on a specified character's pattern in a column.
tags:
  - filter data
  - operators
---


```sql
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
```

|employee_id | first_name | last_name 
|------------|------------|-----------
|109 | Daniel     | Faviet
|105 | David      | Austin
(2 rows)

```sql
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
```

|employee_id | first_name | last_name 
|------------|------------|-----------
|103 | Alexander  | Hunold
|115 | Alexander  | Khoo
|200 | Jennifer   | Whalen
(3 rows)

```sql
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
```

|employee_id | first_name  | last_name 
|------------|-------------|-----------
|102 | Lex         | De Haan
|178 | Kimberely   | Grant
|112 | Jose Manuel | Urman
|123 | Shanta      | Vollman
(4 rows)

```sql
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
```

|employee_id | first_name | last_name 
|------------|------------|-----------
|110 | John       | Chen
|145 | John       | Russell
(2 rows)

```sql
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
```

|employee_id | first_name | last_name  
|------------|------------|------------
|119 | Karen      | Colmenares
|146 | Karen      | Partners
(2 rows)

```sql
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

```

|employee_id | first_name | last_name 
|------------|------------|-----------
|192 | Sarah      | Bell
|117 | Sigal      | Tobias
|100 | Steven     | King
|203 | Susan      | Mavris
(4 rows)

