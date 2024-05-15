-- For demonstration purposes let's create a sample table named inventory.
DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory (
    warehouse VARCHAR(255),
    product VARCHAR(255) NOT NULL,
    model VARCHAR(50) NOT NULL,
    quantity INT,
    PRIMARY KEY (warehouse, product, model)
);
INSERT INTO inventory (warehouse, product, model, quantity)
VALUES
('San Jose', 'iPhone', '6s', 100),
('San Fransisco', 'iPhone', '6s', 50),
('San Jose', 'iPhone', '7', 50),
('San Fransisco', 'iPhone', '7', 10),
('San Jose', 'iPhone', 'X', 150),
('San Fransisco', 'iPhone', 'X', 200),
('San Jose', 'Samsung', 'Galaxy S', 200),
('San Fransisco', 'Samsung', 'Galaxy S', 200),
('San Fransisco', 'Samsung', 'Note 8', 100),
('San Jose', 'Samsung', 'Note 8', 150);
SELECT *
FROM
    inventory;

-- A grouping set is a set of columns by which you group using the GROUP BY clause.
-- Normally, a single aggregate query defines a single grouping set.
-- Define a grouping set (warehouse, product) to get the number of stock keeping units (SKUs) by warehouse and product.
SELECT
    warehouse,
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    warehouse,
    product;

-- Find the number of SKUs by the warehouse.
SELECT
    warehouse,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    warehouse;

-- Find the number of SKUs by the product.
SELECT
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    product;

-- Finds the number of SKUs for all warehouses and products.
-- It defines an empty grouping set ().
SELECT SUM(quantity) AS sku
FROM
    inventory;
-- So far, we have four grouping sets: (warehouse, product), (warehouse), (product), and ().
-- To return all grouping sets using a single query, you can use the UNION ALL operator to combine all the queries above.
-- UNION ALL combines all result sets into a single result set.
-- For example, combining all the previous queries. But because those queries have different number of columns, NULL values are required to fill the empty columns.
SELECT
    warehouse,
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    warehouse,
    product
UNION ALL
SELECT
    warehouse,
    NULL,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    warehouse
UNION ALL
SELECT
    NULL,
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    product
UNION ALL
SELECT
    NULL,
    NULL,
    SUM(quantity) AS sku
FROM
    inventory;

-- The previous query is difficult to read and has performance problems.
-- GROUPING SETS resolves both issues, it enables to use GROUP BY with multiple grouping sets.
SELECT
    warehouse,
    product,
    SUM(quantity) AS sku
FROM
    inventory
GROUP BY
    GROUPING SETS (
        (warehouse, product), -- stock by warehouse and product
        (warehouse), -- stock by warehouse
        (product), -- stock by product
        () -- total stock
    );
