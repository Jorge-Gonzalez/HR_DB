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

-- Retrieve the locations located in the US, UK and China.
SELECT
    country_id,
    street_address,
    city
FROM
    locations
WHERE
    country_id IN ('US', 'UK', 'CN');

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

-- Find the country that does not have any locations
SELECT c.country_name
FROM
    countries AS c
LEFT OUTER JOIN locations AS l
    ON c.country_id = l.country_id
WHERE
    c.country_id IN ('US', 'UK', 'CN');

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
