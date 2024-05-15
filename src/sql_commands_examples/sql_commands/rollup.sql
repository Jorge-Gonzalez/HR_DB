-- The ROLLUP option allows you to include extra rows that represent the subtotals, which are commonly referred to as super-aggregate rows, along with the grand total row.
-- Fisrt let's find the total inventory by warehouse.
SELECT
    warehouse,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    warehouse;

-- SQL ROLLUP with one column example
-- Now let's add the product's grand total.
-- the ROLLUP option causes the query to produce another row with the total aggregate value.
SELECT
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    ROLLUP(warehouse), product;

-- The COALESCE() function can be used to replace NULL value for something meaningful.
SELECT
    COALESCE(warehouse, 'All Warehouses') AS wh,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    ROLLUP(wh);

-- SQL ROLLUP with multiple columns example.
-- The ROLLUP assumes a hierarchy among the input columns in order to generate grouping sets.
-- That comes in handy for generating subtotals and grand totals.
-- Calculate the inventory by warehouse and product, with subtotals and grand total.
SELECT
    warehouse,
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    ROLLUP(warehouse, product);

-- SQL ROLLUP with partial rollup example.
-- The partial roll-up that reduces the number of subtotals calculated.
-- Calculate the inventory with subtotals by product only.
SELECT
    warehouse,
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    warehouse,
    ROLLUP(product);
