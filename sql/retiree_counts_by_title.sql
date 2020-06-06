DROP TABLE IF EXISTS retiretiree_counts_by_title;

SELECT title, COUNT(*) AS retiree_count
INTO retiree_counts_by_title
FROM (
	SELECT 	emp_no,
		first_name,
		last_name,
		title,
		from_date,
		salary
	FROM (
		SELECT	e.emp_no,
				e.first_name,
				e.last_name,
				ti.title,
				ti.from_date,
				ti.to_date,
				s.salary,
				ROW_NUMBER() OVER ( PARTITION BY (ti.emp_no) ORDER BY ti.to_date DESC) AS max_to_rn,
				ROW_NUMBER() OVER ( PARTITION BY (ti.emp_no) ORDER BY ti.from_date DESC) AS max_from_rn
		FROM 		Employees e
		INNER JOIN  retirement_info_revised ri
		ON			e.emp_no = ri.emp_no
		INNER JOIN	Titles ti
		ON			e.emp_no = ti.emp_no
		INNER JOIN	salaries s
		ON			e.emp_no = s.emp_no
		WHERE 		ti.to_date = '9999-01-01'   -- Currently employed
	) tab
	WHERE max_to_rn = 1
	AND max_from_rn = 1
) retiring_employees
GROUP BY title
ORDER BY title;