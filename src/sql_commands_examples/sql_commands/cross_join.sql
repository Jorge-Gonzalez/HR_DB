-- Create two new tables  for the demonstration of the cross join.
-- And find the all possible sales channels that a sales organization can have
DROP TABLE IF EXISTS sales_organization;
DROP TABLE IF EXISTS sales_channel;
CREATE TABLE sales_organization (
    sales_org_id INT PRIMARY KEY,
    sales_org VARCHAR(255)
);
CREATE TABLE sales_channel (
    channel_id INT PRIMARY KEY,
    channel VARCHAR(255)
);
INSERT INTO sales_organization (sales_org_id, sales_org)
VALUES
(1, 'Domestic'),
(2, 'Export');
INSERT INTO sales_channel (channel_id, channel)
VALUES
(1, 'Wholesale'),
(2, 'Retail'),
(3, 'eCommerce'),
(4, 'TV Shopping');
SELECT
    s.sales_org,
    c.channel
FROM
    sales_organization AS s
CROSS JOIN sales_channel AS c;

-- The following query is equivalent to the previous one.
SELECT
    s.sales_org,
    c.channel
FROM
    sales_organization AS s,
    sales_channel AS c;

-- In some database systems such as PostgreSQL and Oracle, you can also use the INNER JOIN clause with a condition that evaluates to true.
SELECT
    s.sales_org,
    c.channel
FROM
    sales_organization AS s
INNER JOIN sales_channel AS c
    ON 1 = 1;
