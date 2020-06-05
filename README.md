# PH-Retirement-Planning
PH planning to mitigate the impending grey tsunami

## Number of Retiring Employees by Title

The [query](retiree_counts_by_title.sql) that was used to determine the **number of retiring employees by job title** was created by querying the retiring_employees table and then grouping by title. 

The [retiring_employees](retiring_employees.sql) query was created by joining the following tables:

* the **employees** table and the **salary** table, which were originally provided as csv files, and 
* the **retirement_info_revised** table which was created during the course of the class work.

The _retirement_info_revised_ table was created using the _retirement_info_ table and then adding the emp_no column which is necessary to join it to the other two tables. The SQL script that was used to create the _retirement_info_revised_ is the following:

SELECT emp_no, first_name, last_name
INTO retirement_info_revised
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

