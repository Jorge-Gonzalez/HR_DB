---
title: ORDER BY
description: Sort the results by one or more columns, either ascending or descending.
tags:
  - clause
  - sorting data
---


```sql
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees;
```

|employee_id | first_name  |  last_name  | hire_date  |  salary  
|------------|-------------|-------------|------------|----------
|100 | Steven      | King        | 1987-06-17 | 24000.00
|101 | Neena       | Kochhar     | 1989-09-21 | 17000.00
|103 | Alexander   | Hunold      | 1990-01-03 |  9000.00
|104 | Bruce       | Ernst       | 1991-05-21 |  6000.00
|105 | David       | Austin      | 1997-06-25 |  4800.00
|106 | Valli       | Pataballa   | 1998-02-05 |  4800.00
|107 | Diana       | Lorentz     | 1999-02-07 |  4200.00
|108 | Nancy       | Greenberg   | 1994-08-17 | 12000.00
|109 | Daniel      | Faviet      | 1994-08-16 |  9000.00
|110 | John        | Chen        | 1997-09-28 |  8200.00
|111 | Ismael      | Sciarra     | 1997-09-30 |  7700.00
|112 | Jose Manuel | Urman       | 1998-03-07 |  7800.00
|113 | Luis        | Popp        | 1999-12-07 |  6900.00
|114 | Den         | Raphaely    | 1994-12-07 | 11000.00
|115 | Alexander   | Khoo        | 1995-05-18 |  3100.00
|116 | Shelli      | Baida       | 1997-12-24 |  2900.00
|117 | Sigal       | Tobias      | 1997-07-24 |  2800.00
|118 | Guy         | Himuro      | 1998-11-15 |  2600.00
|119 | Karen       | Colmenares  | 1999-08-10 |  2500.00
|120 | Matthew     | Weiss       | 1996-07-18 |  8000.00
|121 | Adam        | Fripp       | 1997-04-10 |  8200.00
|122 | Payam       | Kaufling    | 1995-05-01 |  7900.00
|123 | Shanta      | Vollman     | 1997-10-10 |  6500.00
|126 | Irene       | Mikkilineni | 1998-09-28 |  2700.00
|145 | John        | Russell     | 1996-10-01 | 14000.00
|146 | Karen       | Partners    | 1997-01-05 | 13500.00
|176 | Jonathon    | Taylor      | 1998-03-24 |  8600.00
|177 | Jack        | Livingston  | 1998-04-23 |  8400.00
|178 | Kimberely   | Grant       | 1999-05-24 |  7000.00
|179 | Charles     | Johnson     | 2000-01-04 |  6200.00
|192 | Sarah       | Bell        | 1996-02-04 |  4000.00
|193 | Britney     | Everett     | 1997-03-03 |  3900.00
|200 | Jennifer    | Whalen      | 1987-09-17 |  4400.00
|201 | Michael     | Hartstein   | 1996-02-17 | 13000.00
|202 | Pat         | Fay         | 1997-08-17 |  6000.00
|203 | Susan       | Mavris      | 1994-06-07 |  6500.00
|204 | Hermann     | Baer        | 1994-06-07 | 10000.00
|205 | Shelley     | Higgins     | 1994-06-07 | 12000.00
|206 | William     | Gietz       | 1994-06-07 |  8300.00
|102 | Lex         | De Haan     | 1993-01-13 | 37108.88
(40 rows)

```sql
-- Order by first name
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    first_name;
```

|employee_id | first_name  |  last_name  | hire_date  |  salary  
|------------|-------------|-------------|------------|----------
|121 | Adam        | Fripp       | 1997-04-10 |  8200.00
|103 | Alexander   | Hunold      | 1990-01-03 |  9000.00
|115 | Alexander   | Khoo        | 1995-05-18 |  3100.00
|193 | Britney     | Everett     | 1997-03-03 |  3900.00
|104 | Bruce       | Ernst       | 1991-05-21 |  6000.00
|179 | Charles     | Johnson     | 2000-01-04 |  6200.00
|109 | Daniel      | Faviet      | 1994-08-16 |  9000.00
|105 | David       | Austin      | 1997-06-25 |  4800.00
|114 | Den         | Raphaely    | 1994-12-07 | 11000.00
|107 | Diana       | Lorentz     | 1999-02-07 |  4200.00
|118 | Guy         | Himuro      | 1998-11-15 |  2600.00
|204 | Hermann     | Baer        | 1994-06-07 | 10000.00
|126 | Irene       | Mikkilineni | 1998-09-28 |  2700.00
|111 | Ismael      | Sciarra     | 1997-09-30 |  7700.00
|177 | Jack        | Livingston  | 1998-04-23 |  8400.00
|200 | Jennifer    | Whalen      | 1987-09-17 |  4400.00
|145 | John        | Russell     | 1996-10-01 | 14000.00
|110 | John        | Chen        | 1997-09-28 |  8200.00
|176 | Jonathon    | Taylor      | 1998-03-24 |  8600.00
|112 | Jose Manuel | Urman       | 1998-03-07 |  7800.00
|119 | Karen       | Colmenares  | 1999-08-10 |  2500.00
|146 | Karen       | Partners    | 1997-01-05 | 13500.00
|178 | Kimberely   | Grant       | 1999-05-24 |  7000.00
|102 | Lex         | De Haan     | 1993-01-13 | 37108.88
|113 | Luis        | Popp        | 1999-12-07 |  6900.00
|120 | Matthew     | Weiss       | 1996-07-18 |  8000.00
|201 | Michael     | Hartstein   | 1996-02-17 | 13000.00
|108 | Nancy       | Greenberg   | 1994-08-17 | 12000.00
|101 | Neena       | Kochhar     | 1989-09-21 | 17000.00
|202 | Pat         | Fay         | 1997-08-17 |  6000.00
|122 | Payam       | Kaufling    | 1995-05-01 |  7900.00
|192 | Sarah       | Bell        | 1996-02-04 |  4000.00
|123 | Shanta      | Vollman     | 1997-10-10 |  6500.00
|205 | Shelley     | Higgins     | 1994-06-07 | 12000.00
|116 | Shelli      | Baida       | 1997-12-24 |  2900.00
|117 | Sigal       | Tobias      | 1997-07-24 |  2800.00
|100 | Steven      | King        | 1987-06-17 | 24000.00
|203 | Susan       | Mavris      | 1994-06-07 |  6500.00
|106 | Valli       | Pataballa   | 1998-02-05 |  4800.00
|206 | William     | Gietz       | 1994-06-07 |  8300.00
(40 rows)

```sql
-- Order by multiple columns
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    first_name ASC,
    last_name DESC;
```

|employee_id | first_name  |  last_name  | hire_date  |  salary  
|------------|-------------|-------------|------------|----------
|121 | Adam        | Fripp       | 1997-04-10 |  8200.00
|115 | Alexander   | Khoo        | 1995-05-18 |  3100.00
|103 | Alexander   | Hunold      | 1990-01-03 |  9000.00
|193 | Britney     | Everett     | 1997-03-03 |  3900.00
|104 | Bruce       | Ernst       | 1991-05-21 |  6000.00
|179 | Charles     | Johnson     | 2000-01-04 |  6200.00
|109 | Daniel      | Faviet      | 1994-08-16 |  9000.00
|105 | David       | Austin      | 1997-06-25 |  4800.00
|114 | Den         | Raphaely    | 1994-12-07 | 11000.00
|107 | Diana       | Lorentz     | 1999-02-07 |  4200.00
|118 | Guy         | Himuro      | 1998-11-15 |  2600.00
|204 | Hermann     | Baer        | 1994-06-07 | 10000.00
|126 | Irene       | Mikkilineni | 1998-09-28 |  2700.00
|111 | Ismael      | Sciarra     | 1997-09-30 |  7700.00
|177 | Jack        | Livingston  | 1998-04-23 |  8400.00
|200 | Jennifer    | Whalen      | 1987-09-17 |  4400.00
|145 | John        | Russell     | 1996-10-01 | 14000.00
|110 | John        | Chen        | 1997-09-28 |  8200.00
|176 | Jonathon    | Taylor      | 1998-03-24 |  8600.00
|112 | Jose Manuel | Urman       | 1998-03-07 |  7800.00
|146 | Karen       | Partners    | 1997-01-05 | 13500.00
|119 | Karen       | Colmenares  | 1999-08-10 |  2500.00
|178 | Kimberely   | Grant       | 1999-05-24 |  7000.00
|102 | Lex         | De Haan     | 1993-01-13 | 37108.88
|113 | Luis        | Popp        | 1999-12-07 |  6900.00
|120 | Matthew     | Weiss       | 1996-07-18 |  8000.00
|201 | Michael     | Hartstein   | 1996-02-17 | 13000.00
|108 | Nancy       | Greenberg   | 1994-08-17 | 12000.00
|101 | Neena       | Kochhar     | 1989-09-21 | 17000.00
|202 | Pat         | Fay         | 1997-08-17 |  6000.00
|122 | Payam       | Kaufling    | 1995-05-01 |  7900.00
|192 | Sarah       | Bell        | 1996-02-04 |  4000.00
|123 | Shanta      | Vollman     | 1997-10-10 |  6500.00
|205 | Shelley     | Higgins     | 1994-06-07 | 12000.00
|116 | Shelli      | Baida       | 1997-12-24 |  2900.00
|117 | Sigal       | Tobias      | 1997-07-24 |  2800.00
|100 | Steven      | King        | 1987-06-17 | 24000.00
|203 | Susan       | Mavris      | 1994-06-07 |  6500.00
|106 | Valli       | Pataballa   | 1998-02-05 |  4800.00
|206 | William     | Gietz       | 1994-06-07 |  8300.00
(40 rows)

```sql
-- Sort values in a numeric column
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    salary DESC;
```

|employee_id | first_name  |  last_name  | hire_date  |  salary  
|------------|-------------|-------------|------------|----------
|102 | Lex         | De Haan     | 1993-01-13 | 37108.88
|100 | Steven      | King        | 1987-06-17 | 24000.00
|101 | Neena       | Kochhar     | 1989-09-21 | 17000.00
|145 | John        | Russell     | 1996-10-01 | 14000.00
|146 | Karen       | Partners    | 1997-01-05 | 13500.00
|201 | Michael     | Hartstein   | 1996-02-17 | 13000.00
|108 | Nancy       | Greenberg   | 1994-08-17 | 12000.00
|205 | Shelley     | Higgins     | 1994-06-07 | 12000.00
|114 | Den         | Raphaely    | 1994-12-07 | 11000.00
|204 | Hermann     | Baer        | 1994-06-07 | 10000.00
|103 | Alexander   | Hunold      | 1990-01-03 |  9000.00
|109 | Daniel      | Faviet      | 1994-08-16 |  9000.00
|176 | Jonathon    | Taylor      | 1998-03-24 |  8600.00
|177 | Jack        | Livingston  | 1998-04-23 |  8400.00
|206 | William     | Gietz       | 1994-06-07 |  8300.00
|110 | John        | Chen        | 1997-09-28 |  8200.00
|121 | Adam        | Fripp       | 1997-04-10 |  8200.00
|120 | Matthew     | Weiss       | 1996-07-18 |  8000.00
|122 | Payam       | Kaufling    | 1995-05-01 |  7900.00
|112 | Jose Manuel | Urman       | 1998-03-07 |  7800.00
|111 | Ismael      | Sciarra     | 1997-09-30 |  7700.00
|178 | Kimberely   | Grant       | 1999-05-24 |  7000.00
|113 | Luis        | Popp        | 1999-12-07 |  6900.00
|203 | Susan       | Mavris      | 1994-06-07 |  6500.00
|123 | Shanta      | Vollman     | 1997-10-10 |  6500.00
|179 | Charles     | Johnson     | 2000-01-04 |  6200.00
|104 | Bruce       | Ernst       | 1991-05-21 |  6000.00
|202 | Pat         | Fay         | 1997-08-17 |  6000.00
|105 | David       | Austin      | 1997-06-25 |  4800.00
|106 | Valli       | Pataballa   | 1998-02-05 |  4800.00
|200 | Jennifer    | Whalen      | 1987-09-17 |  4400.00
|107 | Diana       | Lorentz     | 1999-02-07 |  4200.00
|192 | Sarah       | Bell        | 1996-02-04 |  4000.00
|193 | Britney     | Everett     | 1997-03-03 |  3900.00
|115 | Alexander   | Khoo        | 1995-05-18 |  3100.00
|116 | Shelli      | Baida       | 1997-12-24 |  2900.00
|117 | Sigal       | Tobias      | 1997-07-24 |  2800.00
|126 | Irene       | Mikkilineni | 1998-09-28 |  2700.00
|118 | Guy         | Himuro      | 1998-11-15 |  2600.00
|119 | Karen       | Colmenares  | 1999-08-10 |  2500.00
(40 rows)

```sql
-- Sort dates
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    hire_date DESC;

```

|employee_id | first_name  |  last_name  | hire_date  |  salary  
|------------|-------------|-------------|------------|----------
|179 | Charles     | Johnson     | 2000-01-04 |  6200.00
|113 | Luis        | Popp        | 1999-12-07 |  6900.00
|119 | Karen       | Colmenares  | 1999-08-10 |  2500.00
|178 | Kimberely   | Grant       | 1999-05-24 |  7000.00
|107 | Diana       | Lorentz     | 1999-02-07 |  4200.00
|118 | Guy         | Himuro      | 1998-11-15 |  2600.00
|126 | Irene       | Mikkilineni | 1998-09-28 |  2700.00
|177 | Jack        | Livingston  | 1998-04-23 |  8400.00
|176 | Jonathon    | Taylor      | 1998-03-24 |  8600.00
|112 | Jose Manuel | Urman       | 1998-03-07 |  7800.00
|106 | Valli       | Pataballa   | 1998-02-05 |  4800.00
|116 | Shelli      | Baida       | 1997-12-24 |  2900.00
|123 | Shanta      | Vollman     | 1997-10-10 |  6500.00
|111 | Ismael      | Sciarra     | 1997-09-30 |  7700.00
|110 | John        | Chen        | 1997-09-28 |  8200.00
|202 | Pat         | Fay         | 1997-08-17 |  6000.00
|117 | Sigal       | Tobias      | 1997-07-24 |  2800.00
|105 | David       | Austin      | 1997-06-25 |  4800.00
|121 | Adam        | Fripp       | 1997-04-10 |  8200.00
|193 | Britney     | Everett     | 1997-03-03 |  3900.00
|146 | Karen       | Partners    | 1997-01-05 | 13500.00
|145 | John        | Russell     | 1996-10-01 | 14000.00
|120 | Matthew     | Weiss       | 1996-07-18 |  8000.00
|201 | Michael     | Hartstein   | 1996-02-17 | 13000.00
|192 | Sarah       | Bell        | 1996-02-04 |  4000.00
|115 | Alexander   | Khoo        | 1995-05-18 |  3100.00
|122 | Payam       | Kaufling    | 1995-05-01 |  7900.00
|114 | Den         | Raphaely    | 1994-12-07 | 11000.00
|108 | Nancy       | Greenberg   | 1994-08-17 | 12000.00
|109 | Daniel      | Faviet      | 1994-08-16 |  9000.00
|205 | Shelley     | Higgins     | 1994-06-07 | 12000.00
|206 | William     | Gietz       | 1994-06-07 |  8300.00
|204 | Hermann     | Baer        | 1994-06-07 | 10000.00
|203 | Susan       | Mavris      | 1994-06-07 |  6500.00
|102 | Lex         | De Haan     | 1993-01-13 | 37108.88
|104 | Bruce       | Ernst       | 1991-05-21 |  6000.00
|103 | Alexander   | Hunold      | 1990-01-03 |  9000.00
|101 | Neena       | Kochhar     | 1989-09-21 | 17000.00
|200 | Jennifer    | Whalen      | 1987-09-17 |  4400.00
|100 | Steven      | King        | 1987-06-17 | 24000.00
(40 rows)

