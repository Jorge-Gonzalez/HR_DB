---
title: FETCH
description: Returns the results in partial chunks of data one at a time instead of the hole result.
tags:
  - filter data
  - clause
---


```sql
-- Despite that LIMIT is widely supported, it is not in the SQL standard.
-- SQL:2008 intoduced the OFFSET FETCH clause, to skip N first rows.
-- It is handy when pagination is needed; and is best used with ORDER BY.
-- Return the first employee who has the highest salary:
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;
```

|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|102 | Lex        | De Haan   | 38964.32
(1 row)

```sql
-- Sort by salary, skips the first 5 highest salaries rows, and fetches the next 5.
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

```

|employee_id | first_name | last_name |  salary  
|------------|------------|-----------|----------
|201 | Michael    | Hartstein | 13000.00
|205 | Shelley    | Higgins   | 12000.00
|108 | Nancy      | Greenberg | 12000.00
|114 | Den        | Raphaely  | 11000.00
|204 | Hermann    | Baer      | 10000.00
(5 rows)

