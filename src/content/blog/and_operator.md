---
title: AND Operator
description: Yields true if the two operands are true.
tags:
  - filter data
  - operators
---


```sql
-- Find all employees who have both job id 9 and salary greater than 5,000.
SELECT
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id = 9
    AND salary > 5000;
```

|first_name | last_name | job_id | salary  
|-----------|-----------|--------|---------
|Alexander  | Hunold    |      9 | 9000.00
|Bruce      | Ernst     |      9 | 6000.00
(2 rows)

```sql
-- Find all the employees who joined the company between 1997 and 1998.
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) >= '1997'
    AND EXTRACT(YEAR FROM hire_date) <= '1998';

```

|first_name  |  last_name  | hire_date  
|------------|-------------|------------
|David       | Austin      | 1997-06-25
|Valli       | Pataballa   | 1998-02-05
|John        | Chen        | 1997-09-28
|Ismael      | Sciarra     | 1997-09-30
|Jose Manuel | Urman       | 1998-03-07
|Shelli      | Baida       | 1997-12-24
|Sigal       | Tobias      | 1997-07-24
|Guy         | Himuro      | 1998-11-15
|Adam        | Fripp       | 1997-04-10
|Shanta      | Vollman     | 1997-10-10
|Irene       | Mikkilineni | 1998-09-28
|Karen       | Partners    | 1997-01-05
|Jonathon    | Taylor      | 1998-03-24
|Jack        | Livingston  | 1998-04-23
|Britney     | Everett     | 1997-03-03
|Pat         | Fay         | 1997-08-17
(16 rows)

