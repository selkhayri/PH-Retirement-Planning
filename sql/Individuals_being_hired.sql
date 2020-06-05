DROP TABLE hired_by_month;
DROP TABLE hired_by_dept_month;
DROP TABLE hired_by_year;
DROP TABLE hired_by_dept_year;

SELECT hire_month, COUNT(*) AS hire_num 
INTO hired_by_month
FROM
(
	SELECT to_char(hire_date,'MM') as hire_month, 1 FROM employees
) being_hired
GROUP BY hire_month
ORDER BY hire_num DESC
;

SELECT department, hire_month, COUNT(*) AS hire_num 
INTO hired_by_dept_month
FROM
(
	SELECT  d.dept_name as department, 
			to_char(e.hire_date,'MM') as hire_month, 
			1
	FROM employees e
	JOIN dept_emp de 
	ON e.emp_no = de.emp_no
	JOIN departments d
	ON de.dept_no = d.dept_no
) being_hired
GROUP BY department, hire_month
ORDER BY hire_num DESC
;

SELECT hire_year, COUNT(*) AS hire_num 
INTO hired_by_year
FROM
(
	SELECT to_char(hire_date,'YYYY') as hire_year, 1 FROM employees
) being_hired
GROUP BY hire_year
ORDER BY hire_num DESC
;

SELECT department, hire_year, COUNT(*) AS hire_num 
INTO hired_by_dept_year
FROM
(
	SELECT  d.dept_name as department, 
			to_char(e.hire_date,'YYYY') as hire_year, 
			1
	FROM employees e
	JOIN dept_emp de 
	ON e.emp_no = de.emp_no
	JOIN departments d
	ON de.dept_no = d.dept_no
) being_hired
GROUP BY department, hire_year
ORDER BY hire_num DESC
;