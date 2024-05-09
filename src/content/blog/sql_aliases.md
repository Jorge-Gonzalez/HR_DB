---
title: SQL Aliases
description: Create a shorter name for the three-part name of a table or view.
tags:
  - joining tables
---


```sql
-- If a query contains expressions, you can assign column aliases to the expressions.
SELECT
    first_name,
    last_name,
    salary * 1.1 AS new_salary
FROM
    employees
ORDER BY
    new_salary;
```

|first_name  |  last_name  | new_salary 
|------------|-------------|------------
|Karen       | Colmenares  |   2750.000
|Guy         | Himuro      |   2860.000
|Irene       | Mikkilineni |   2970.000
|Sigal       | Tobias      |   3080.000
|Shelli      | Baida       |   3190.000
|Alexander   | Khoo        |   3410.000
|Britney     | Everett     |   4290.000
|Sarah       | Bell        |   4400.000
|Diana       | Lorentz     |   4620.000
|Jennifer    | Whalen      |   4840.000
|Valli       | Pataballa   |   5280.000
|David       | Austin      |   5280.000
|Bruce       | Ernst       |   6600.000
|Pat         | Fay         |   6600.000
|Charles     | Johnson     |   6820.000
|Shanta      | Vollman     |   7150.000
|Susan       | Mavris      |   7150.000
|Luis        | Popp        |   7590.000
|Kimberely   | Grant       |   7700.000
|Ismael      | Sciarra     |   8470.000
|Jose Manuel | Urman       |   8580.000
|Payam       | Kaufling    |   8690.000
|Matthew     | Weiss       |   8800.000
|Adam        | Fripp       |   9020.000
|John        | Chen        |   9020.000
|William     | Gietz       |   9130.000
|Jack        | Livingston  |   9240.000
|Jonathon    | Taylor      |   9460.000
|Alexander   | Hunold      |   9900.000
|Daniel      | Faviet      |   9900.000
|Hermann     | Baer        |  11000.000
|Den         | Raphaely    |  12100.000
|Shelley     | Higgins     |  13200.000
|Nancy       | Greenberg   |  13200.000
|Michael     | Hartstein   |  14300.000
|Karen       | Partners    |  14850.000
|John        | Russell     |  15400.000
|Neena       | Kochhar     |  18700.000
|Steven      | King        |  26400.000
|Lex         | De Haan     |  42860.752
(40 rows)

```sql
-- In the SELECT clause, instead of using the employees table name, you can use the table alias of the employees table.
SELECT
    e.first_name,
    e.last_name
FROM
    employees AS e;

```

|first_name  |  last_name  
|------------|-------------
|Steven      | King
|Neena       | Kochhar
|Alexander   | Hunold
|Bruce       | Ernst
|David       | Austin
|Valli       | Pataballa
|Diana       | Lorentz
|Nancy       | Greenberg
|Daniel      | Faviet
|John        | Chen
|Ismael      | Sciarra
|Jose Manuel | Urman
|Luis        | Popp
|Den         | Raphaely
|Alexander   | Khoo
|Shelli      | Baida
|Sigal       | Tobias
|Guy         | Himuro
|Karen       | Colmenares
|Matthew     | Weiss
|Adam        | Fripp
|Payam       | Kaufling
|Shanta      | Vollman
|Irene       | Mikkilineni
|John        | Russell
|Karen       | Partners
|Jonathon    | Taylor
|Jack        | Livingston
|Kimberely   | Grant
|Charles     | Johnson
|Sarah       | Bell
|Britney     | Everett
|Jennifer    | Whalen
|Michael     | Hartstein
|Pat         | Fay
|Susan       | Mavris
|Hermann     | Baer
|Shelley     | Higgins
|William     | Gietz
|Lex         | De Haan
(40 rows)

