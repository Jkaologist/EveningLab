-- We should reference departments to employees
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    emp_months_at_job INT NOT NULL,
    emp_is_full_time BOOLEAN NOT NULL,
    manager_name TEXT DEFAULT ''
);

CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name TEXT NOT NULL,
    employee_id INTEGER NOT NULL REFERENCES employees
);

INSERT INTO employees (emp_name, emp_months_at_job, emp_is_full_time, manager_name)
    VALUES
        ('Nick Styles', 32, TRUE, 'Genna Sussman'),
        ('Genna Sussman', 15, FALSE, NULL),
        ('Roger Clark', 43, FALSE, 'Genna Sussman'),
        ('Jim Gaffigan', 21, TRUE, 'Nick Styles');

INSERT INTO departments (dept_name, employee_id)
    VALUES
        ('Legal', 1),
        ('Exec', 2),
        ('Finance', 3);

-- Query 1 --
SELECT emp_name, manager_name, emp_id
FROM employees;
