DROP TABLE IF EXISTS retirement_planning;

-- Creating new table with SQL
SELECT e.emp_no, first_name, last_name
INTO retirement_planning
FROM employees e
INNER JOIN titles t
ON t.emp_no = e.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND t.to_date = '9999-01-01'  -- Presently employed
;