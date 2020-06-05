SELECT title, COUNT(*) AS retiree_count
INTO retiree_counts_by_title
FROM retiring_employees
GROUP BY title
ORDER BY title;