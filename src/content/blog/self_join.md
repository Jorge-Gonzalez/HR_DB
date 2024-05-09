---
title: SELF JOIN
description: join a table to itself with INNER JOIN or LEFT JOIN.
tags:
  - joining tables
---


```sql
-- It is used to evaluate rows with other rows in the same table.
-- Query the information of who reports to whom.
SELECT
    e.first_name || ' ' || e.last_name AS employee,
    m.first_name || ' ' || m.last_name AS manager
FROM
    employees AS e
INNER JOIN
    employees AS m ON e.manager_id = m.employee_id
ORDER BY
    manager;
```

|employee      |      manager      
|------------------|-------------------
|Bruce Ernst       | Alexander Hunold
|Diana Lorentz     | Alexander Hunold
|Valli Pataballa   | Alexander Hunold
|David Austin      | Alexander Hunold
|Karen Colmenares  | Den Raphaely
|Alexander Khoo    | Den Raphaely
|Shelli Baida      | Den Raphaely
|Sigal Tobias      | Den Raphaely
|Guy Himuro        | Den Raphaely
|Alexander Hunold  | Lex De Haan
|Irene Mikkilineni | Matthew Weiss
|Pat Fay           | Michael Hartstein
|John Chen         | Nancy Greenberg
|Ismael Sciarra    | Nancy Greenberg
|Jose Manuel Urman | Nancy Greenberg
|Luis Popp         | Nancy Greenberg
|Daniel Faviet     | Nancy Greenberg
|Hermann Baer      | Neena Kochhar
|Nancy Greenberg   | Neena Kochhar
|Susan Mavris      | Neena Kochhar
|Jennifer Whalen   | Neena Kochhar
|Shelley Higgins   | Neena Kochhar
|Britney Everett   | Shanta Vollman
|Sarah Bell        | Shanta Vollman
|William Gietz     | Shelley Higgins
|Lex De Haan       | Steven King
|Den Raphaely      | Steven King
|Matthew Weiss     | Steven King
|Adam Fripp        | Steven King
|Payam Kaufling    | Steven King
|Shanta Vollman    | Steven King
|John Russell      | Steven King
|Karen Partners    | Steven King
|Jonathon Taylor   | Steven King
|Jack Livingston   | Steven King
|Kimberely Grant   | Steven King
|Charles Johnson   | Steven King
|Michael Hartstein | Steven King
|Neena Kochhar     | Steven King
(39 rows)

```sql
-- Since the president doesn't have a manager, is not present in  the previous result.
-- In order to include the president, use LEFT JOIN instead of INNER JOIN.
SELECT
    e.first_name || ' ' || e.last_name AS employee,
    m.first_name || ' ' || m.last_name AS manager
FROM
    employees AS e
LEFT JOIN
    employees AS m ON e.manager_id = m.employee_id
ORDER BY
    manager;

```

|employee      |      manager      
|------------------|-------------------
|Valli Pataballa   | Alexander Hunold
|Diana Lorentz     | Alexander Hunold
|Bruce Ernst       | Alexander Hunold
|David Austin      | Alexander Hunold
|Guy Himuro        | Den Raphaely
|Karen Colmenares  | Den Raphaely
|Alexander Khoo    | Den Raphaely
|Shelli Baida      | Den Raphaely
|Sigal Tobias      | Den Raphaely
|Alexander Hunold  | Lex De Haan
|Irene Mikkilineni | Matthew Weiss
|Pat Fay           | Michael Hartstein
|Luis Popp         | Nancy Greenberg
|Daniel Faviet     | Nancy Greenberg
|Jose Manuel Urman | Nancy Greenberg
|John Chen         | Nancy Greenberg
|Ismael Sciarra    | Nancy Greenberg
|Nancy Greenberg   | Neena Kochhar
|Jennifer Whalen   | Neena Kochhar
|Susan Mavris      | Neena Kochhar
|Hermann Baer      | Neena Kochhar
|Shelley Higgins   | Neena Kochhar
|Britney Everett   | Shanta Vollman
|Sarah Bell        | Shanta Vollman
|William Gietz     | Shelley Higgins
|Lex De Haan       | Steven King
|Neena Kochhar     | Steven King
|Den Raphaely      | Steven King
|Matthew Weiss     | Steven King
|Adam Fripp        | Steven King
|Payam Kaufling    | Steven King
|Shanta Vollman    | Steven King
|John Russell      | Steven King
|Karen Partners    | Steven King
|Jonathon Taylor   | Steven King
|Jack Livingston   | Steven King
|Kimberely Grant   | Steven King
|Charles Johnson   | Steven King
|Michael Hartstein | Steven King
|Steven King       | 
(40 rows)

