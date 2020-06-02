SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date 
INTO mentorship_eligibility
FROM employees e
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND t.to_date = '9999-01-01'   -- presently employed