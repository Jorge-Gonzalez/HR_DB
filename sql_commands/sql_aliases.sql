-- If a query contains expressions, you can assign column aliases to the expressions.
SELECT
    first_name,
    last_name,
    salary * 1.1 AS new_salary
FROM
    employees
ORDER BY
    new_salary;

-- In the SELECT clause, instead of using the employees table name, you can use the table alias of the employees table.
SELECT
    e.first_name,
    e.last_name
FROM
    employees AS e;
