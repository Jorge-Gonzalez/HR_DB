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
