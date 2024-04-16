CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40),
    region_id INT NOT NULL
);

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25),
    country_id CHAR(2) NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries (country_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations (location_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id INT NOT NULL,
    salary NUMERIC(8, 2) NOT NULL,
    commission_pct NUMERIC(2, 2),
    manager_id INT,
    department_id INT,
    FOREIGN KEY (job_id) REFERENCES jobs (job_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dependents (
    dependent_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    relationship VARCHAR(25) NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
