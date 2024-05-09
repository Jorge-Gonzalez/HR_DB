---
title: VIEW
description: A view is like a virtual table produced by executing a query, it allows to store complex queries.
tags:
  - querying data
---


```sql
-- Create the employee contacts view based on the data of the employees and departments tables.
CREATE VIEW employee_contacts AS
SELECT
    e.first_name,
    e.last_name,
    e.email,
    e.phone_number,
    d.department_name
FROM
    employees AS e
INNER JOIN
    departments AS d
    ON e.department_id = d.department_id
ORDER BY
    e.first_name;
```

|CREATE VIEW
|CREATE VIEW
|first_name  |  last_name  |               email               | phone_number | department_name  
|------------|-------------|-----------------------------------|--------------|------------------
|Adam        | Fripp       | adam.fripp@sqltutorial.org        | 650.123.2234 | Shipping
|Alexander   | Khoo        | alexander.khoo@sqltutorial.org    | 515.127.4562 | Purchasing
|Alexander   | Hunold      | alexander.hunold@sqltutorial.org  | 590.423.4567 | IT
|Britney     | Everett     | britney.everett@sqltutorial.org   | 650.501.2876 | Shipping
|Bruce       | Ernst       | bruce.ernst@sqltutorial.org       | 590.423.4568 | IT
|Charles     | Johnson     | charles.johnson@sqltutorial.org   |              | Sales
|Daniel      | Faviet      | daniel.faviet@sqltutorial.org     | 515.124.4169 | Finance
|David       | Austin      | david.austin@sqltutorial.org      | 590.423.4569 | IT
|Den         | Raphaely    | den.raphaely@sqltutorial.org      | 515.127.4561 | Purchasing
|Diana       | Lorentz     | diana.lorentz@sqltutorial.org     | 590.423.5567 | IT
|Guy         | Himuro      | guy.himuro@sqltutorial.org        | 515.127.4565 | Purchasing
|Hermann     | Baer        | hermann.baer@sqltutorial.org      | 515.123.8888 | Public Relations
|Irene       | Mikkilineni | irene.mikkilineni@sqltutorial.org | 650.124.1224 | Shipping
|Ismael      | Sciarra     | ismael.sciarra@sqltutorial.org    | 515.124.4369 | Finance
|Jack        | Livingston  | jack.livingston@sqltutorial.org   |              | Sales
|Jennifer    | Whalen      | jennifer.whalen@sqltutorial.org   | 515.123.4444 | Administration
|John        | Chen        | john.chen@sqltutorial.org         | 515.124.4269 | Finance
|John        | Russell     | john.russell@sqltutorial.org      |              | Sales
|Jonathon    | Taylor      | jonathon.taylor@sqltutorial.org   |              | Sales
|Jose Manuel | Urman       | jose manuel.urman@sqltutorial.org | 515.124.4469 | Finance
|Karen       | Partners    | karen.partners@sqltutorial.org    |              | Sales
|Karen       | Colmenares  | karen.colmenares@sqltutorial.org  | 515.127.4566 | Purchasing
|Kimberely   | Grant       | kimberely.grant@sqltutorial.org   |              | Sales
|Lex         | De Haan     | lex.de haan@sqltutorial.org       | 515.123.4569 | Executive
|Luis        | Popp        | luis.popp@sqltutorial.org         | 515.124.4567 | Finance
|Matthew     | Weiss       | matthew.weiss@sqltutorial.org     | 650.123.1234 | Shipping
|Michael     | Hartstein   | michael.hartstein@sqltutorial.org | 515.123.5555 | Marketing
|Nancy       | Greenberg   | nancy.greenberg@sqltutorial.org   | 515.124.4569 | Finance
|Neena       | Kochhar     | neena.kochhar@sqltutorial.org     | 515.123.4568 | Executive
|Pat         | Fay         | pat.fay@sqltutorial.org           | 603.123.6666 | Marketing
|Payam       | Kaufling    | payam.kaufling@sqltutorial.org    | 650.123.3234 | Shipping
|Sarah       | Bell        | sarah.bell@sqltutorial.org        | 650.501.1876 | Shipping
|Shanta      | Vollman     | shanta.vollman@sqltutorial.org    | 650.123.4234 | Shipping
|Shelley     | Higgins     | shelley.higgins@sqltutorial.org   | 515.123.8080 | Accounting
|Shelli      | Baida       | shelli.baida@sqltutorial.org      | 515.127.4563 | Purchasing
|Sigal       | Tobias      | sigal.tobias@sqltutorial.org      | 515.127.4564 | Purchasing
|Steven      | King        | steven.king@sqltutorial.org       | 515.123.4567 | Executive
|Susan       | Mavris      | susan.mavris@sqltutorial.org      | 515.123.7777 | Human Resources
|Valli       | Pataballa   | valli.pataballa@sqltutorial.org   | 590.423.4560 | IT
|William     | Gietz       | william.gietz@sqltutorial.org     | 515.123.8181 | Accounting
(40 rows)

```sql
-- Creates a view whose column names are not the same as the column names of the base tables.
CREATE VIEW payroll (first_name, last_name, job, compensation) AS
SELECT
    e.first_name,
    e.last_name,
    j.job_title,
    e.salary
FROM
    employees AS e
INNER JOIN
    jobs AS j ON e.job_id = j.job_id
ORDER BY
    e.first_name;
```

|job              | min_compensation | max_compensation |    avg_compensation    
|------------------------------|------------------|------------------|------------------------
|Accountant                    |          6900.00 |          9000.00 |  7920.0000000000000000
|Accounting Manager            |         12000.00 |         12000.00 | 12000.0000000000000000
|Administration Assistant      |          4400.00 |          4400.00 |  4400.0000000000000000
|Administration Vice President |         17000.00 |         38964.32 |     27982.160000000000
(4 rows)

```sql
-- Selects data from the employee_contacts view.
SELECT
    *
FROM
    employee_contacts;
```

|first_name  |  last_name  |               job               | compensation 
|------------|-------------|---------------------------------|--------------
|Adam        | Fripp       | Stock Manager                   |      8200.00
|Alexander   | Khoo        | Purchasing Clerk                |      3100.00
|Alexander   | Hunold      | Programmer                      |      9000.00
|Britney     | Everett     | Shipping Clerk                  |      3900.00
|Bruce       | Ernst       | Programmer                      |      6000.00
|Charles     | Johnson     | Sales Representative            |      6200.00
|Daniel      | Faviet      | Accountant                      |      9000.00
|David       | Austin      | Programmer                      |      4800.00
|Den         | Raphaely    | Purchasing Manager              |     11000.00
|Diana       | Lorentz     | Programmer                      |      4200.00
|Guy         | Himuro      | Purchasing Clerk                |      2600.00
|Hermann     | Baer        | Public Relations Representative |     10000.00
|Irene       | Mikkilineni | Stock Clerk                     |      2700.00
|Ismael      | Sciarra     | Accountant                      |      7700.00
|Jack        | Livingston  | Sales Representative            |      8400.00
|Jennifer    | Whalen      | Administration Assistant        |      4400.00
|John        | Chen        | Accountant                      |      8200.00
|John        | Russell     | Sales Manager                   |     14000.00
|Jonathon    | Taylor      | Sales Representative            |      8600.00
|Jose Manuel | Urman       | Accountant                      |      7800.00
|Karen       | Colmenares  | Purchasing Clerk                |      2500.00
|Karen       | Partners    | Sales Manager                   |     13500.00
|Kimberely   | Grant       | Sales Representative            |      7000.00
|Lex         | De Haan     | Administration Vice President   |     38964.32
|Luis        | Popp        | Accountant                      |      6900.00
|Matthew     | Weiss       | Stock Manager                   |      8000.00
|Michael     | Hartstein   | Marketing Manager               |     13000.00
|Nancy       | Greenberg   | Finance Manager                 |     12000.00
|Neena       | Kochhar     | Administration Vice President   |     17000.00
|Pat         | Fay         | Marketing Representative        |      6000.00
|Payam       | Kaufling    | Stock Manager                   |      7900.00
|Sarah       | Bell        | Shipping Clerk                  |      4000.00
|Shanta      | Vollman     | Stock Manager                   |      6500.00
|Shelley     | Higgins     | Accounting Manager              |     12000.00
|Shelli      | Baida       | Purchasing Clerk                |      2900.00
|Sigal       | Tobias      | Purchasing Clerk                |      2800.00
|Steven      | King        | President                       |     24000.00
|Susan       | Mavris      | Human Resources Representative  |      6500.00
|Valli       | Pataballa   | Programmer                      |      4800.00
|William     | Gietz       | Public Accountant               |      8300.00
(40 rows)

