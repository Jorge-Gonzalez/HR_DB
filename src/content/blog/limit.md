---
title: LIMIT
description: Limit the number of rows that a query returns in conjunction with the OFFSET clause
tags:
  - filter data
  - clause
---


```sql
-- Selects all rows from the employees table sorted by first name.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
ORDER BY
    first_name;
```

|employee_id | first_name  |  last_name  
|------------|-------------|-------------
|121 | Adam        | Fripp
|103 | Alexander   | Hunold
|115 | Alexander   | Khoo
|193 | Britney     | Everett
|104 | Bruce       | Ernst
|179 | Charles     | Johnson
|109 | Daniel      | Faviet
|105 | David       | Austin
|114 | Den         | Raphaely
|107 | Diana       | Lorentz
|118 | Guy         | Himuro
|204 | Hermann     | Baer
|126 | Irene       | Mikkilineni
|111 | Ismael      | Sciarra
|177 | Jack        | Livingston
|200 | Jennifer    | Whalen
|145 | John        | Russell
|110 | John        | Chen
|176 | Jonathon    | Taylor
|112 | Jose Manuel | Urman
|119 | Karen       | Colmenares
|146 | Karen       | Partners
|178 | Kimberely   | Grant
|102 | Lex         | De Haan
|113 | Luis        | Popp
|120 | Matthew     | Weiss
|201 | Michael     | Hartstein
|108 | Nancy       | Greenberg
|101 | Neena       | Kochhar
|202 | Pat         | Fay
|122 | Payam       | Kaufling
|192 | Sarah       | Bell
|123 | Shanta      | Vollman
|205 | Shelley     | Higgins
|116 | Shelli      | Baida
|117 | Sigal       | Tobias
|100 | Steven      | King
|203 | Susan       | Mavris
|106 | Valli       | Pataballa
|206 | William     | Gietz
(40 rows)

```sql
-- Limits the returned rows to 5.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
ORDER BY
    first_name
LIMIT 5;
```

|employee_id | first_name | last_name 
|------------|------------|-----------
|121 | Adam       | Fripp
|103 | Alexander  | Hunold
|115 | Alexander  | Khoo
|193 | Britney    | Everett
|104 | Bruce      | Ernst
(5 rows)

```sql
-- Limits the returned rows to 5 starting from the 4th row.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
ORDER BY
    first_name
LIMIT 5 OFFSET 3;
```

|employee_id | first_name | last_name 
|------------|------------|-----------
|193 | Britney    | Everett
|104 | Bruce      | Ernst
|179 | Charles    | Johnson
|109 | Daniel     | Faviet
|105 | David      | Austin
(5 rows)

```sql
-- Get the top N rows with the highest or lowest value.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
LIMIT 5;
```

|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|102 | Lex        | De Haan   | 37108.88
|100 | Steven     | King      | 24000.00
|101 | Neena      | Kochhar   | 17000.00
|145 | John       | Russell   | 14000.00
|146 | Karen      | Partners  | 13500.00
(5 rows)

```sql
-- Get employees who have the 2nd highest salary in the company.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
LIMIT 1 OFFSET 1;
```

|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|100 | Steven     | King      | 24000.00
(1 row)

```sql
-- The previous query only returns the first of the employees with the second highest salary.
-- In order to get the list of all employees with the second highest salary.
-- First get the second highest salary:
SELECT salary
FROM
    employees
ORDER BY
    salary DESC
LIMIT 1 OFFSET 1;
```

|salary  
|---------
|24000.00
(1 row)

```sql
-- And pass the result to another query.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary = 17000;
```

|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|101 | Neena      | Kochhar   | 17000.00
(1 row)

```sql
-- A more straightforward method is using subqueries.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary = (
        SELECT salary
        FROM
            employees
        ORDER BY
            salary DESC
        LIMIT 1 OFFSET 1
    );

```

|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|100 | Steven     | King      | 24000.00
(1 row)

