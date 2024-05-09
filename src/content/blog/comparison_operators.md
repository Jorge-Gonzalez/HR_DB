---
title: Comparison Operators
description: The WHERE clause can filter data using comparison operators such as greater than, greater than or equal, less than, less than or equal, equal, and not equal.
tags:
  - filter data
  - operators
---


```sql
-- Finds the employee whose last name **is equal** to Himuro.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    last_name = 'Himuro';
```

|employee_id | first_name | last_name 
|------------|------------|-----------
|118 | Guy        | Himuro
(1 row)

```sql
-- Note that null values are not equal to each other.
-- Lets try to find the employees that have no phone number.
-- Using the equal orperator will return an empty result.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    phone_number = NULL;
```

|employee_id | first_name | last_name 
|------------|------------|-----------
(0 rows)

```sql
-- In order to compare null values, use the IS NULL operator.
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    phone_number IS NULL;
```

|employee_id | first_name | last_name  
|------------|------------|------------
|145 | John       | Russell
|146 | Karen      | Partners
|176 | Jonathon   | Taylor
|177 | Jack       | Livingston
|178 | Kimberely  | Grant
|179 | Charles    | Johnson
(6 rows)

```sql
-- Return all employees whose department id is not 8.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id <> 8
ORDER BY
    first_name, last_name;
```

|employee_id | first_name  |  last_name  | department_id 
|------------|-------------|-------------|---------------
|121 | Adam        | Fripp       |             5
|103 | Alexander   | Hunold      |             6
|115 | Alexander   | Khoo        |             3
|193 | Britney     | Everett     |             5
|104 | Bruce       | Ernst       |             6
|109 | Daniel      | Faviet      |            10
|105 | David       | Austin      |             6
|114 | Den         | Raphaely    |             3
|107 | Diana       | Lorentz     |             6
|118 | Guy         | Himuro      |             3
|204 | Hermann     | Baer        |             7
|126 | Irene       | Mikkilineni |             5
|111 | Ismael      | Sciarra     |            10
|200 | Jennifer    | Whalen      |             1
|110 | John        | Chen        |            10
|112 | Jose Manuel | Urman       |            10
|119 | Karen       | Colmenares  |             3
|102 | Lex         | De Haan     |             9
|113 | Luis        | Popp        |            10
|120 | Matthew     | Weiss       |             5
|201 | Michael     | Hartstein   |             2
|108 | Nancy       | Greenberg   |            10
|101 | Neena       | Kochhar     |             9
|202 | Pat         | Fay         |             2
|122 | Payam       | Kaufling    |             5
|192 | Sarah       | Bell        |             5
|123 | Shanta      | Vollman     |             5
|205 | Shelley     | Higgins     |            11
|116 | Shelli      | Baida       |             3
|117 | Sigal       | Tobias      |             3
|100 | Steven      | King        |             9
|203 | Susan       | Mavris      |             4
|106 | Valli       | Pataballa   |             6
|206 | William     | Gietz       |            11
(34 rows)

```sql
-- The AND operator to combine two expressions.
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM
    employees
WHERE
    department_id <> 8
    AND department_id <> 10
ORDER BY
    first_name, last_name;
```

|employee_id | first_name |  last_name  | department_id 
|------------|------------|-------------|---------------
|121 | Adam       | Fripp       |             5
|103 | Alexander  | Hunold      |             6
|115 | Alexander  | Khoo        |             3
|193 | Britney    | Everett     |             5
|104 | Bruce      | Ernst       |             6
|105 | David      | Austin      |             6
|114 | Den        | Raphaely    |             3
|107 | Diana      | Lorentz     |             6
|118 | Guy        | Himuro      |             3
|204 | Hermann    | Baer        |             7
|126 | Irene      | Mikkilineni |             5
|200 | Jennifer   | Whalen      |             1
|119 | Karen      | Colmenares  |             3
|102 | Lex        | De Haan     |             9
|120 | Matthew    | Weiss       |             5
|201 | Michael    | Hartstein   |             2
|101 | Neena      | Kochhar     |             9
|202 | Pat        | Fay         |             2
|122 | Payam      | Kaufling    |             5
|192 | Sarah      | Bell        |             5
|123 | Shanta     | Vollman     |             5
|205 | Shelley    | Higgins     |            11
|116 | Shelli     | Baida       |             3
|117 | Sigal      | Tobias      |             3
|100 | Steven     | King        |             9
|203 | Susan      | Mavris      |             4
|106 | Valli      | Pataballa   |             6
|206 | William    | Gietz       |            11
(28 rows)

```sql
-- Find the employees whose salary is **greater than** 10,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 10000
ORDER BY
    salary DESC;
```

|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|102 | Lex        | De Haan   | 38964.32
|100 | Steven     | King      | 24000.00
|101 | Neena      | Kochhar   | 17000.00
|145 | John       | Russell   | 14000.00
|146 | Karen      | Partners  | 13500.00
|201 | Michael    | Hartstein | 13000.00
|108 | Nancy      | Greenberg | 12000.00
|205 | Shelley    | Higgins   | 12000.00
|114 | Den        | Raphaely  | 11000.00
(9 rows)

```sql
-- Combining the AND and OR operators.
-- Find the employees in dep. 8 with salary greater than 10,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    department_id = 8
    AND salary > 10000
ORDER BY
    salary DESC;
```

|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|145 | John       | Russell   | 14000.00
|146 | Karen      | Partners  | 13500.00
(2 rows)

```sql
-- Return all employees whose salaries are less than 10,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary < 10000
ORDER BY
    salary DESC;
```

|employee_id | first_name  |  last_name  | salary  
|------------|-------------|-------------|---------
|109 | Daniel      | Faviet      | 9000.00
|103 | Alexander   | Hunold      | 9000.00
|176 | Jonathon    | Taylor      | 8600.00
|177 | Jack        | Livingston  | 8400.00
|206 | William     | Gietz       | 8300.00
|121 | Adam        | Fripp       | 8200.00
|110 | John        | Chen        | 8200.00
|120 | Matthew     | Weiss       | 8000.00
|122 | Payam       | Kaufling    | 7900.00
|112 | Jose Manuel | Urman       | 7800.00
|111 | Ismael      | Sciarra     | 7700.00
|178 | Kimberely   | Grant       | 7000.00
|113 | Luis        | Popp        | 6900.00
|123 | Shanta      | Vollman     | 6500.00
|203 | Susan       | Mavris      | 6500.00
|179 | Charles     | Johnson     | 6200.00
|104 | Bruce       | Ernst       | 6000.00
|202 | Pat         | Fay         | 6000.00
|106 | Valli       | Pataballa   | 4800.00
|105 | David       | Austin      | 4800.00
|200 | Jennifer    | Whalen      | 4400.00
|107 | Diana       | Lorentz     | 4200.00
|192 | Sarah       | Bell        | 4000.00
|193 | Britney     | Everett     | 3900.00
|115 | Alexander   | Khoo        | 3100.00
|116 | Shelli      | Baida       | 2900.00
|117 | Sigal       | Tobias      | 2800.00
|126 | Irene       | Mikkilineni | 2700.00
|118 | Guy         | Himuro      | 2600.00
|119 | Karen       | Colmenares  | 2500.00
(30 rows)

```sql
-- Finds employees whose salaries are greater than or equal 9,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 9000
ORDER BY
    salary;
```

|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|109 | Daniel     | Faviet    |  9000.00
|103 | Alexander  | Hunold    |  9000.00
|204 | Hermann    | Baer      | 10000.00
|114 | Den        | Raphaely  | 11000.00
|108 | Nancy      | Greenberg | 12000.00
|205 | Shelley    | Higgins   | 12000.00
|201 | Michael    | Hartstein | 13000.00
|146 | Karen      | Partners  | 13500.00
|145 | John       | Russell   | 14000.00
|101 | Neena      | Kochhar   | 17000.00
|100 | Steven     | King      | 24000.00
|102 | Lex        | De Haan   | 38964.32
(12 rows)

```sql
-- Finds employees whose salaries are less than or equal to 9,000.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary <= 9000
ORDER BY
    salary DESC;

```

|employee_id | first_name  |  last_name  | salary  
|------------|-------------|-------------|---------
|109 | Daniel      | Faviet      | 9000.00
|103 | Alexander   | Hunold      | 9000.00
|176 | Jonathon    | Taylor      | 8600.00
|177 | Jack        | Livingston  | 8400.00
|206 | William     | Gietz       | 8300.00
|121 | Adam        | Fripp       | 8200.00
|110 | John        | Chen        | 8200.00
|120 | Matthew     | Weiss       | 8000.00
|122 | Payam       | Kaufling    | 7900.00
|112 | Jose Manuel | Urman       | 7800.00
|111 | Ismael      | Sciarra     | 7700.00
|178 | Kimberely   | Grant       | 7000.00
|113 | Luis        | Popp        | 6900.00
|123 | Shanta      | Vollman     | 6500.00
|203 | Susan       | Mavris      | 6500.00
|179 | Charles     | Johnson     | 6200.00
|104 | Bruce       | Ernst       | 6000.00
|202 | Pat         | Fay         | 6000.00
|106 | Valli       | Pataballa   | 4800.00
|105 | David       | Austin      | 4800.00
|200 | Jennifer    | Whalen      | 4400.00
|107 | Diana       | Lorentz     | 4200.00
|192 | Sarah       | Bell        | 4000.00
|193 | Britney     | Everett     | 3900.00
|115 | Alexander   | Khoo        | 3100.00
|116 | Shelli      | Baida       | 2900.00
|117 | Sigal       | Tobias      | 2800.00
|126 | Irene       | Mikkilineni | 2700.00
|118 | Guy         | Himuro      | 2600.00
|119 | Karen       | Colmenares  | 2500.00
(30 rows)

