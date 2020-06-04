SELECT title, count(*) As retiree_count
INTO retiree_count_by_title
FROM
(
	SELECT 	title,1
	FROM 
	(
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
		INNER JOIN	Titles ti
		ON			e.emp_no = ti.emp_no
		INNER JOIN	salaries s
		ON			e.emp_no = s.emp_no
		WHERE 		ti.to_date = '9999-01-01'   -- Currently employed
		AND			e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
		AND 		e.hire_date BETWEEN '1985-01-01' AND '1988-12-31'
	) tab
	WHERE max_to_rn = 1
	AND max_from_rn = 1
) title_count
GROUP BY title
;