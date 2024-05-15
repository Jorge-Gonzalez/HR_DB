-- CUBE allows you to generate subtotals like the ROLLUP extension.
-- But additionally, CUBE can generate subtotals for all combinations of grouping columns specified in the GROUP BY clause.
-- Find the total inventory of every warehouse.
SELECT
    warehouse,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    warehouse;

-- SQL CUBE with one column example.
-- Now let's add the product's grand total.
SELECT
    warehouse,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    CUBE(warehouse)
ORDER BY
    warehouse;

-- The COALESCE() function can be used to replace NULL value for something meaningful.
SELECT
    COALESCE(warehouse, 'All Warehouses') AS wh,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    CUBE(wh)
ORDER BY
    wh;

-- Finds the total inventory by warehouse and product.
SELECT
    warehouse,
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    warehouse, product
ORDER BY
    warehouse, product;

-- SQL CUBE with multiple columns example.
-- The previous query with subtotals for each warehouse and each product and also the grand total.
SELECT
    warehouse,
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    CUBE(warehouse, product)
ORDER BY
    warehouse, product;

-- Substitute null values by more meaningful data.
SELECT
    COALESCE(warehouse, 'All warehouses') AS wh,
    COALESCE(product, 'All products') AS pr,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    CUBE(wh, pr)
ORDER BY
    wh, pr;

-- Creating cross-tabular reports.
SELECT
    COALESCE(d.department_name, '-') AS department,
    COALESCE(j.job_title, '-') AS job,
    COUNT(*) AS count,
    SUM(e.salary) AS salary
FROM
    employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
INNER JOIN jobs AS j ON e.job_id = j.job_id
GROUP BY
    CUBE(d.department_name, j.job_title)
ORDER BY
    d.department_name ASC NULLS LAST;
