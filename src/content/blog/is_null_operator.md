---
title: IS NULL Operator
description: Determine if an expression is NULL.
tags:
  - filter data
  - operators
---


```sql
-- Null values cannot be compared using the = operator.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    phone_number = NULL;
```

|employee_id | first_name | last_name | salary 
|------------|------------|-----------|--------
(0 rows)

```sql
-- The IS NULL operator is used to determine if an expression is NULL.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    phone_number IS NULL;
```

|employee_id | first_name | last_name  |  salary  
|------------|------------|------------|----------
|145 | John       | Russell    | 14000.00
|146 | Karen      | Partners   | 13500.00
|176 | Jonathon   | Taylor     |  8600.00
|177 | Jack       | Livingston |  8400.00
|178 | Kimberely  | Grant      |  7000.00
|179 | Charles    | Johnson    |  6200.00
(6 rows)

```sql
-- Find all employees who have phone numbers.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    phone_number IS NOT NULL;

```

|employee_id | first_name  |  last_name  |  salary  
|------------|-------------|-------------|----------
|100 | Steven      | King        | 24000.00
|101 | Neena       | Kochhar     | 17000.00
|103 | Alexander   | Hunold      |  9000.00
|104 | Bruce       | Ernst       |  6000.00
|105 | David       | Austin      |  4800.00
|106 | Valli       | Pataballa   |  4800.00
|107 | Diana       | Lorentz     |  4200.00
|108 | Nancy       | Greenberg   | 12000.00
|109 | Daniel      | Faviet      |  9000.00
|110 | John        | Chen        |  8200.00
|111 | Ismael      | Sciarra     |  7700.00
|112 | Jose Manuel | Urman       |  7800.00
|113 | Luis        | Popp        |  6900.00
|114 | Den         | Raphaely    | 11000.00
|115 | Alexander   | Khoo        |  3100.00
|116 | Shelli      | Baida       |  2900.00
|117 | Sigal       | Tobias      |  2800.00
|118 | Guy         | Himuro      |  2600.00
|119 | Karen       | Colmenares  |  2500.00
|120 | Matthew     | Weiss       |  8000.00
|121 | Adam        | Fripp       |  8200.00
|122 | Payam       | Kaufling    |  7900.00
|123 | Shanta      | Vollman     |  6500.00
|126 | Irene       | Mikkilineni |  2700.00
|192 | Sarah       | Bell        |  4000.00
|193 | Britney     | Everett     |  3900.00
|200 | Jennifer    | Whalen      |  4400.00
|201 | Michael     | Hartstein   | 13000.00
|202 | Pat         | Fay         |  6000.00
|203 | Susan       | Mavris      |  6500.00
|204 | Hermann     | Baer        | 10000.00
|205 | Shelley     | Higgins     | 12000.00
|206 | William     | Gietz       |  8300.00
|102 | Lex         | De Haan     | 38964.32
(34 rows)

