---
title: IN Operator
description: Verify if a value is in the list of values.
tags:
  - filter data
  - operators
---


```sql
-- Find employees with the job id is 8, 9, or 10.
SELECT
    employee_id,
    first_name,
    last_name,
    job_id
FROM
    employees
WHERE
    job_id IN (8, 9, 10)
ORDER BY
    job_id;
```

|employee_id | first_name | last_name | job_id 
|------------|------------|-----------|--------
|203 | Susan      | Mavris    |      8
|104 | Bruce      | Ernst     |      9
|105 | David      | Austin    |      9
|103 | Alexander  | Hunold    |      9
|107 | Diana      | Lorentz   |      9
|106 | Valli      | Pataballa |      9
|201 | Michael    | Hartstein |     10
(7 rows)

```sql
-- Find employees whose job’s id is neither 7, 8, nor 9.
SELECT
    employee_id,
    first_name,
    last_name,
    job_id
FROM
    employees
WHERE
    job_id NOT IN (7, 8, 9)
ORDER BY
    job_id;
```

|employee_id | first_name  |  last_name  | job_id 
|------------|-------------|-------------|--------
|206 | William     | Gietz       |      1
|205 | Shelley     | Higgins     |      2
|200 | Jennifer    | Whalen      |      3
|100 | Steven      | King        |      4
|102 | Lex         | De Haan     |      5
|101 | Neena       | Kochhar     |      5
|113 | Luis        | Popp        |      6
|112 | Jose Manuel | Urman       |      6
|111 | Ismael      | Sciarra     |      6
|110 | John        | Chen        |      6
|109 | Daniel      | Faviet      |      6
|201 | Michael     | Hartstein   |     10
|202 | Pat         | Fay         |     11
|204 | Hermann     | Baer        |     12
|118 | Guy         | Himuro      |     13
|119 | Karen       | Colmenares  |     13
|115 | Alexander   | Khoo        |     13
|116 | Shelli      | Baida       |     13
|117 | Sigal       | Tobias      |     13
|114 | Den         | Raphaely    |     14
|146 | Karen       | Partners    |     15
|145 | John        | Russell     |     15
|178 | Kimberely   | Grant       |     16
|179 | Charles     | Johnson     |     16
|176 | Jonathon    | Taylor      |     16
|177 | Jack        | Livingston  |     16
|192 | Sarah       | Bell        |     17
|193 | Britney     | Everett     |     17
|126 | Irene       | Mikkilineni |     18
|122 | Payam       | Kaufling    |     19
|123 | Shanta      | Vollman     |     19
|120 | Matthew     | Weiss       |     19
|121 | Adam        | Fripp       |     19
(33 rows)

```sql
-- Returns the department id of the Marketing and Sales departments.
SELECT department_id
FROM
    departments
WHERE
    department_name = 'Marketing'
    OR department_name = 'Sales'
ORDER BY
    department_id;
```

|department_id 
|--------------
|2
|8
(2 rows)

```sql
-- Pass the id list to the IN operator to find employees who work in the Marketing and Sales departments.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (2, 8);
```

|employee_id | first_name | last_name  | department_id 
|------------|------------|------------|---------------
|145 | John       | Russell    |             8
|146 | Karen      | Partners   |             8
|176 | Jonathon   | Taylor     |             8
|177 | Jack       | Livingston |             8
|178 | Kimberely  | Grant      |             8
|179 | Charles    | Johnson    |             8
|201 | Michael    | Hartstein  |             2
|202 | Pat        | Fay        |             2
(8 rows)

```sql
-- The first query can be nested inside the IN operator.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (
        SELECT department_id
        FROM
            departments
        WHERE
            department_name = 'Marketing'
            OR department_name = 'Sales'
    )
ORDER BY
    department_id;

```

|employee_id | first_name | last_name  | department_id 
|------------|------------|------------|---------------
|201 | Michael    | Hartstein  |             2
|202 | Pat        | Fay        |             2
|176 | Jonathon   | Taylor     |             8
|177 | Jack       | Livingston |             8
|145 | John       | Russell    |             8
|179 | Charles    | Johnson    |             8
|178 | Kimberely  | Grant      |             8
|146 | Karen      | Partners   |             8
(8 rows)

