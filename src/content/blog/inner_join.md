---
title: INNER JOIN
description: Bring only the rows that match the join conditions for each specified table.
tags:
  - joining tables
---


```sql
-- The department_id column in the employees table is the foreign key column that links the employees to the departments table.
-- Get the information of the department id 1,2, and 3.
SELECT
    department_id,
    department_name
FROM
    departments
WHERE
    department_id IN (1, 2, 3);
```

|department_id | department_name 
|--------------|-----------------
|1 | Administration
|2 | Marketing
|3 | Purchasing
(3 rows)

```sql
-- Get the information of employees who work in the department id 1, 2 and 3.
SELECT
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (1, 2, 3)
ORDER BY
    department_id;
```

|first_name | last_name  | department_id 
|-----------|------------|---------------
|Jennifer   | Whalen     |             1
|Michael    | Hartstein  |             2
|Pat        | Fay        |             2
|Sigal      | Tobias     |             3
|Den        | Raphaely   |             3
|Karen      | Colmenares |             3
|Guy        | Himuro     |             3
|Alexander  | Khoo       |             3
|Shelli     | Baida      |             3
(9 rows)

```sql
-- Combine previous two queries from different tables into a single query.
-- In inner join only the rows that matched are returned from both tables.
SELECT
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_id AS department_id2,
    d.department_name
FROM
    employees AS e
INNER JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.department_id IN (1, 2, 3);
```

|first_name | last_name  | department_id | department_id2 | department_name 
|-----------|------------|---------------|----------------|-----------------
|Jennifer   | Whalen     |             1 |              1 | Administration
|Pat        | Fay        |             2 |              2 | Marketing
|Michael    | Hartstein  |             2 |              2 | Marketing
|Karen      | Colmenares |             3 |              3 | Purchasing
|Guy        | Himuro     |             3 |              3 | Purchasing
|Sigal      | Tobias     |             3 |              3 | Purchasing
|Shelli     | Baida      |             3 |              3 | Purchasing
|Alexander  | Khoo       |             3 |              3 | Purchasing
|Den        | Raphaely   |             3 |              3 | Purchasing
(9 rows)

```sql
-- Get the first name, last name, job title, and department name of
-- employees who work in department id 1, 2, and 3.
SELECT
    e.first_name,
    e.last_name,
    j.job_title,
    d.department_name
FROM
    employees AS e
INNER JOIN
    jobs AS j ON e.job_id = j.job_id
INNER JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.department_id IN (1, 2, 3);

```

|first_name | last_name  |        job_title         | department_name 
|-----------|------------|--------------------------|-----------------
|Jennifer   | Whalen     | Administration Assistant | Administration
|Pat        | Fay        | Marketing Representative | Marketing
|Michael    | Hartstein  | Marketing Manager        | Marketing
|Den        | Raphaely   | Purchasing Manager       | Purchasing
|Alexander  | Khoo       | Purchasing Clerk         | Purchasing
|Shelli     | Baida      | Purchasing Clerk         | Purchasing
|Sigal      | Tobias     | Purchasing Clerk         | Purchasing
|Guy        | Himuro     | Purchasing Clerk         | Purchasing
|Karen      | Colmenares | Purchasing Clerk         | Purchasing
(9 rows)

