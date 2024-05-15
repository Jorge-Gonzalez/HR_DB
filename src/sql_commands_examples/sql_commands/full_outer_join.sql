-- The full outer join includes all rows from the joined tables.
-- To illustrate this lets create two new tables: baskets and fruits.
DROP TABLE IF EXISTS fruits;
DROP TABLE IF EXISTS baskets;
CREATE TABLE fruits (
    fruit_id INTEGER PRIMARY KEY,
    fruit_name VARCHAR(255) NOT NULL,
    basket_id INTEGER
);
CREATE TABLE baskets (
    basket_id INTEGER PRIMARY KEY,
    basket_name VARCHAR(255) NOT NULL
);
INSERT INTO baskets (basket_id, basket_name)
VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');
INSERT INTO fruits (fruit_id, fruit_name, basket_id)
VALUES
(1, 'Apple', 1),
(2, 'Orange', 1),
(3, 'Banana', 2),
(4, 'Strawberry', NULL);
SELECT
    baskets.basket_name,
    fruits.fruit_name
FROM
    fruits
FULL OUTER JOIN
    baskets ON fruits.basket_id = baskets.basket_id;

-- With FULL OUTER JOIN, the WHERE clause is handly to filter the results.
-- Lets find the empty baskets.
SELECT
    baskets.basket_name,
    fruits.fruit_name
FROM
    fruits
FULL OUTER JOIN
    baskets ON fruits.basket_id = baskets.basket_id
WHERE
    fruits.basket_id IS NULL;

-- Or see which fruit is not in any basket yet.
SELECT
    baskets.basket_name,
    fruits.fruit_name
FROM
    baskets
FULL OUTER JOIN
    fruits ON baskets.basket_id = fruits.basket_id
WHERE
    baskets.basket_id IS NULL;
