-- Creating new table with SQL
SELECT emp_no, first_name, last_name
INTO retirement_planning
FROM employees
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31');