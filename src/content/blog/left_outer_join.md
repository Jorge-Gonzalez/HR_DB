---
title: LEFT OUTER JOIN
description: Select rows from the left table even when there is no match on the right table.
tags:
  - joining tables
---


```sql
-- The left join returns all rows from the left table and the matching rows
-- from the right table.
-- Query the country names of US, UK, and China.
SELECT
    country_id,
    country_name
FROM
    countries
WHERE
    country_id IN ('US', 'UK', 'CN');
```

|country_id |       country_name       
|-----------|--------------------------
|CN         | China
|UK         | United Kingdom
|US         | United States of America
(3 rows)

```sql
-- Retrieve the locations located in the US, UK and China.
SELECT
    country_id,
    street_address,
    city
FROM
    locations
WHERE
    country_id IN ('US', 'UK', 'CN');
```

|country_id |              street_address              |        city         
|-----------|------------------------------------------|---------------------
|US         | 2014 Jabberwocky Rd                      | Southlake
|US         | 2011 Interiors Blvd                      | South San Francisco
|US         | 2004 Charade Rd                          | Seattle
|UK         | 8204 Arthur St                           | London
|UK         | Magdalen Centre, The Oxford Science Park | Oxford
(5 rows)

```sql
-- LEFT JOIN the countries table with the locations table.
-- The non-matching rows in the right table are filled with the NULL values.
SELECT
    c.country_name,
    c.country_id,
    l.country_id AS country_id2,
    l.street_address,
    l.city
FROM
    countries AS c
LEFT OUTER JOIN locations AS l
    ON c.country_id = l.country_id
WHERE
    c.country_id IN ('US', 'UK', 'CN');
```

|country_name       | country_id | country_id2 |              street_address              |        city         
|-------------------------|------------|-------------|------------------------------------------|---------------------
|United States of America | US         | US          | 2014 Jabberwocky Rd                      | Southlake
|United States of America | US         | US          | 2011 Interiors Blvd                      | South San Francisco
|United States of America | US         | US          | 2004 Charade Rd                          | Seattle
|United Kingdom           | UK         | UK          | 8204 Arthur St                           | London
|United Kingdom           | UK         | UK          | Magdalen Centre, The Oxford Science Park | Oxford
|China                    | CN         |             |                                          | 
(6 rows)

```sql
-- Find the country that does not have any locations
SELECT c.country_name
FROM
    countries AS c
LEFT OUTER JOIN locations AS l
    ON c.country_id = l.country_id
WHERE
    c.country_id IN ('US', 'UK', 'CN');
```

|country_name       
|-------------------------
|United States of America
|United States of America
|United States of America
|United Kingdom
|United Kingdom
|China
(6 rows)

```sql
-- Join the 3 tables to show regions, countries, and locations for US, UK and
-- China.
SELECT
    r.region_name,
    c.country_name,
    l.street_address,
    l.city
FROM
    regions AS r
LEFT JOIN countries AS c
    ON r.region_id = c.region_id
LEFT JOIN locations AS l
    ON c.country_id = l.country_id
WHERE
    c.country_id IN ('US', 'UK', 'CN');

```

|region_name |       country_name       |              street_address              |        city         
|------------|--------------------------|------------------------------------------|---------------------
|Americas    | United States of America | 2014 Jabberwocky Rd                      | Southlake
|Americas    | United States of America | 2011 Interiors Blvd                      | South San Francisco
|Americas    | United States of America | 2004 Charade Rd                          | Seattle
|Europe      | United Kingdom           | 8204 Arthur St                           | London
|Europe      | United Kingdom           | Magdalen Centre, The Oxford Science Park | Oxford
|Asia        | China                    |                                          | 
(6 rows)

