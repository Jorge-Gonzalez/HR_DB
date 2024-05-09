---
title: BETWEEN Operator
description: Select data within a range of values.
tags:
  - filter data
  - operators
---


```sql
-- Find all employees whose salaries are between 2,500 and 2,900.
-- Notice that both end points are included.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 2500 AND 2900
ORDER BY
    salary DESC;
```

|employee_id | first_name |  last_name  | salary  
|------------|------------|-------------|---------
|116 | Shelli     | Baida       | 2900.00
|117 | Sigal      | Tobias      | 2800.00
|126 | Irene      | Mikkilineni | 2700.00
|118 | Guy        | Himuro      | 2600.00
|119 | Karen      | Colmenares  | 2500.00
(5 rows)

```sql
-- Using comparison operators the same result can be achieved.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 2500
    AND salary <= 2900
ORDER BY
    salary DESC;
```

|employee_id | first_name |  last_name  | salary  
|------------|------------|-------------|---------
|116 | Shelli     | Baida       | 2900.00
|117 | Sigal      | Tobias      | 2800.00
|126 | Irene      | Mikkilineni | 2700.00
|118 | Guy        | Himuro      | 2600.00
|119 | Karen      | Colmenares  | 2500.00
(5 rows)

```sql
-- Find all employees whose salaries are not in the range of 2,500 and 2,900.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 2500 AND 2900
ORDER BY
    salary DESC;
```

|employee_id | first_name  | last_name  |  salary  
|------------|-------------|------------|----------
|102 | Lex         | De Haan    | 37108.88
|100 | Steven      | King       | 24000.00
|101 | Neena       | Kochhar    | 17000.00
|145 | John        | Russell    | 14000.00
|146 | Karen       | Partners   | 13500.00
|201 | Michael     | Hartstein  | 13000.00
|108 | Nancy       | Greenberg  | 12000.00
|205 | Shelley     | Higgins    | 12000.00
|114 | Den         | Raphaely   | 11000.00
|204 | Hermann     | Baer       | 10000.00
|103 | Alexander   | Hunold     |  9000.00
|109 | Daniel      | Faviet     |  9000.00
|176 | Jonathon    | Taylor     |  8600.00
|177 | Jack        | Livingston |  8400.00
|206 | William     | Gietz      |  8300.00
|110 | John        | Chen       |  8200.00
|121 | Adam        | Fripp      |  8200.00
|120 | Matthew     | Weiss      |  8000.00
|122 | Payam       | Kaufling   |  7900.00
|112 | Jose Manuel | Urman      |  7800.00
|111 | Ismael      | Sciarra    |  7700.00
|178 | Kimberely   | Grant      |  7000.00
|113 | Luis        | Popp       |  6900.00
|203 | Susan       | Mavris     |  6500.00
|123 | Shanta      | Vollman    |  6500.00
|179 | Charles     | Johnson    |  6200.00
|104 | Bruce       | Ernst      |  6000.00
|202 | Pat         | Fay        |  6000.00
|106 | Valli       | Pataballa  |  4800.00
|105 | David       | Austin     |  4800.00
|200 | Jennifer    | Whalen     |  4400.00
|107 | Diana       | Lorentz    |  4200.00
|192 | Sarah       | Bell       |  4000.00
|193 | Britney     | Everett    |  3900.00
|115 | Alexander   | Khoo       |  3100.00
(35 rows)

```sql
-- Find all employees who joined the company between January 1, 1999, and December 31, 2000.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '1999-01-01' AND '2000-12-31'
ORDER BY
    hire_date;
```

|employee_id | first_name | last_name  | hire_date  
|------------|------------|------------|------------
|107 | Diana      | Lorentz    | 1999-02-07
|178 | Kimberely  | Grant      | 1999-05-24
|119 | Karen      | Colmenares | 1999-08-10
|113 | Luis       | Popp       | 1999-12-07
|179 | Charles    | Johnson    | 2000-01-04
(5 rows)

```sql
-- Find employees who have not joined the company from January 1, 1989 to December 31, 1999.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31'
ORDER BY
    hire_date;
```

|employee_id | first_name | last_name | hire_date  
|------------|------------|-----------|------------
|100 | Steven     | King      | 1987-06-17
|200 | Jennifer   | Whalen    | 1987-09-17
|179 | Charles    | Johnson   | 2000-01-04
(3 rows)

```sql
-- Find employees who joined the company between 1990 and 1993.
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) BETWEEN 1990 AND 1993
ORDER BY
    hire_date;

```

|employee_id | first_name | last_name | hire_date  
|------------|------------|-----------|------------
|103 | Alexander  | Hunold    | 1990-01-03
|104 | Bruce      | Ernst     | 1991-05-21
|102 | Lex        | De Haan   | 1993-01-13
(3 rows)

