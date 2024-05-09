---
title: NOT Operator
description: Yields true if the operand is false.
tags:
  - filter data
  - operators
---


```sql
-- Retrieve all employees who work in the department id 5.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    department_id = 5
ORDER BY
    salary DESC;
```

|employee_id | first_name |  last_name  | salary  
|------------|------------|-------------|---------
|121 | Adam       | Fripp       | 8200.00
|120 | Matthew    | Weiss       | 8000.00
|122 | Payam      | Kaufling    | 7900.00
|123 | Shanta     | Vollman     | 6500.00
|192 | Sarah      | Bell        | 4000.00
|193 | Britney    | Everett     | 3900.00
|126 | Irene      | Mikkilineni | 2700.00
(7 rows)

```sql
-- Get the employees who work in the department id 5 and with a salary not greater than 5000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    department_id = 5
    AND NOT salary > 5000
ORDER BY
    salary;
```

|employee_id | first_name |  last_name  | salary  
|------------|------------|-------------|---------
|126 | Irene      | Mikkilineni | 2700.00
|193 | Britney    | Everett     | 3900.00
|192 | Sarah      | Bell        | 4000.00
(3 rows)

```sql
-- Get all the employees who are not working in the departments 1, 2, or 3.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id NOT IN (1, 2, 3)
ORDER BY
    first_name;
```

|employee_id | first_name  |  last_name  | department_id 
|------------|-------------|-------------|---------------
|121 | Adam        | Fripp       |             5
|103 | Alexander   | Hunold      |             6
|193 | Britney     | Everett     |             5
|104 | Bruce       | Ernst       |             6
|179 | Charles     | Johnson     |             8
|109 | Daniel      | Faviet      |            10
|105 | David       | Austin      |             6
|107 | Diana       | Lorentz     |             6
|204 | Hermann     | Baer        |             7
|126 | Irene       | Mikkilineni |             5
|111 | Ismael      | Sciarra     |            10
|177 | Jack        | Livingston  |             8
|110 | John        | Chen        |            10
|145 | John        | Russell     |             8
|176 | Jonathon    | Taylor      |             8
|112 | Jose Manuel | Urman       |            10
|146 | Karen       | Partners    |             8
|178 | Kimberely   | Grant       |             8
|102 | Lex         | De Haan     |             9
|113 | Luis        | Popp        |            10
|120 | Matthew     | Weiss       |             5
|108 | Nancy       | Greenberg   |            10
|101 | Neena       | Kochhar     |             9
|122 | Payam       | Kaufling    |             5
|192 | Sarah       | Bell        |             5
|123 | Shanta      | Vollman     |             5
|205 | Shelley     | Higgins     |            11
|100 | Steven      | King        |             9
|203 | Susan       | Mavris      |             4
|106 | Valli       | Pataballa   |             6
|206 | William     | Gietz       |            11
(31 rows)

```sql
-- Retrieves all the employees whose first names do not start with the letter D.
SELECT
    first_name,
    last_name
FROM
    employees
WHERE
    first_name NOT LIKE 'D%'
ORDER BY
    first_name;
```

|first_name  |  last_name  
|------------|-------------
|Adam        | Fripp
|Alexander   | Khoo
|Alexander   | Hunold
|Britney     | Everett
|Bruce       | Ernst
|Charles     | Johnson
|Guy         | Himuro
|Hermann     | Baer
|Irene       | Mikkilineni
|Ismael      | Sciarra
|Jack        | Livingston
|Jennifer    | Whalen
|John        | Chen
|John        | Russell
|Jonathon    | Taylor
|Jose Manuel | Urman
|Karen       | Partners
|Karen       | Colmenares
|Kimberely   | Grant
|Lex         | De Haan
|Luis        | Popp
|Matthew     | Weiss
|Michael     | Hartstein
|Nancy       | Greenberg
|Neena       | Kochhar
|Pat         | Fay
|Payam       | Kaufling
|Sarah       | Bell
|Shanta      | Vollman
|Shelley     | Higgins
|Shelli      | Baida
|Sigal       | Tobias
|Steven      | King
|Susan       | Mavris
|Valli       | Pataballa
|William     | Gietz
(36 rows)

```sql
-- Get employees whose salaries are not between 3,000 and 5,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 3000 AND 5000
ORDER BY
    salary;
```

|employee_id | first_name  |  last_name  |  salary  
|------------|-------------|-------------|----------
|119 | Karen       | Colmenares  |  2500.00
|118 | Guy         | Himuro      |  2600.00
|126 | Irene       | Mikkilineni |  2700.00
|117 | Sigal       | Tobias      |  2800.00
|116 | Shelli      | Baida       |  2900.00
|202 | Pat         | Fay         |  6000.00
|104 | Bruce       | Ernst       |  6000.00
|179 | Charles     | Johnson     |  6200.00
|203 | Susan       | Mavris      |  6500.00
|123 | Shanta      | Vollman     |  6500.00
|113 | Luis        | Popp        |  6900.00
|178 | Kimberely   | Grant       |  7000.00
|111 | Ismael      | Sciarra     |  7700.00
|112 | Jose Manuel | Urman       |  7800.00
|122 | Payam       | Kaufling    |  7900.00
|120 | Matthew     | Weiss       |  8000.00
|110 | John        | Chen        |  8200.00
|121 | Adam        | Fripp       |  8200.00
|206 | William     | Gietz       |  8300.00
|177 | Jack        | Livingston  |  8400.00
|176 | Jonathon    | Taylor      |  8600.00
|103 | Alexander   | Hunold      |  9000.00
|109 | Daniel      | Faviet      |  9000.00
|204 | Hermann     | Baer        | 10000.00
|114 | Den         | Raphaely    | 11000.00
|205 | Shelley     | Higgins     | 12000.00
|108 | Nancy       | Greenberg   | 12000.00
|201 | Michael     | Hartstein   | 13000.00
|146 | Karen       | Partners    | 13500.00
|145 | John        | Russell     | 14000.00
|101 | Neena       | Kochhar     | 17000.00
|100 | Steven      | King        | 24000.00
|102 | Lex         | De Haan     | 37108.88
(33 rows)

```sql
-- Get the employees who do not have any dependents.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees e
WHERE
    NOT EXISTS (
        SELECT employee_id
        FROM
            dependents d
        WHERE
            d.employee_id = e.employee_id
    );

```

|employee_id | first_name |  last_name  
|------------|------------|-------------
|120 | Matthew    | Weiss
|121 | Adam       | Fripp
|122 | Payam      | Kaufling
|123 | Shanta     | Vollman
|126 | Irene      | Mikkilineni
|177 | Jack       | Livingston
|178 | Kimberely  | Grant
|179 | Charles    | Johnson
|192 | Sarah      | Bell
|193 | Britney    | Everett
(10 rows)

