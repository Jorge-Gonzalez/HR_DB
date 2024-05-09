---
title: OR operator
description: Yields true if one of the operands is true.
tags:
  - filter data
  - operators
---


```sql
-- Finds all employees who joined the company in 1997 or 1998.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1997
    OR EXTRACT(YEAR FROM hire_date) = 1998
ORDER BY
    first_name,
    last_name;
```

|employee_id | first_name  |  last_name  | hire_date  
|------------|-------------|-------------|------------
|121 | Adam        | Fripp       | 1997-04-10
|193 | Britney     | Everett     | 1997-03-03
|105 | David       | Austin      | 1997-06-25
|118 | Guy         | Himuro      | 1998-11-15
|126 | Irene       | Mikkilineni | 1998-09-28
|111 | Ismael      | Sciarra     | 1997-09-30
|177 | Jack        | Livingston  | 1998-04-23
|110 | John        | Chen        | 1997-09-28
|176 | Jonathon    | Taylor      | 1998-03-24
|112 | Jose Manuel | Urman       | 1998-03-07
|146 | Karen       | Partners    | 1997-01-05
|202 | Pat         | Fay         | 1997-08-17
|123 | Shanta      | Vollman     | 1997-10-10
|116 | Shelli      | Baida       | 1997-12-24
|117 | Sigal       | Tobias      | 1997-07-24
|106 | Valli       | Pataballa   | 1998-02-05
(16 rows)

```sql
-- find all employees who joined the company  in 1997 or 1998 and worked in the department id 3.
-- Note that logical operators are evaluated from left to right, hence the need of parentheses.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id = 3
    AND (
        EXTRACT(YEAR FROM hire_date) = 1997
        OR EXTRACT(YEAR FROM hire_date) = 1998
    )
ORDER BY
    first_name,
    last_name;
```

|employee_id | first_name | last_name | department_id 
|------------|------------|-----------|---------------
|118 | Guy        | Himuro    |             3
|116 | Shelli     | Baida     |             3
|117 | Sigal      | Tobias    |             3
(3 rows)

```sql
-- If a query uses many OR operators, it will become difficult to read.
-- Find all employees who joined the company in 1990 or 1999 or 2000.
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1990
    OR EXTRACT(YEAR FROM hire_date) = 1999
    OR EXTRACT(YEAR FROM hire_date) = 2000
ORDER BY
    hire_date;
```

|first_name | last_name  | hire_date  
|-----------|------------|------------
|Alexander  | Hunold     | 1990-01-03
|Diana      | Lorentz    | 1999-02-07
|Kimberely  | Grant      | 1999-05-24
|Karen      | Colmenares | 1999-08-10
|Luis       | Popp       | 1999-12-07
|Charles    | Johnson    | 2000-01-04
(6 rows)

```sql
-- The OR operator can be substituted with the IN operator.
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) IN (1990, 1999, 2000)
ORDER BY
    hire_date;

```

|first_name | last_name  | hire_date  
|-----------|------------|------------
|Alexander  | Hunold     | 1990-01-03
|Diana      | Lorentz    | 1999-02-07
|Kimberely  | Grant      | 1999-05-24
|Karen      | Colmenares | 1999-08-10
|Luis       | Popp       | 1999-12-07
|Charles    | Johnson    | 2000-01-04
(6 rows)

