# PH-Retirement-Planning
PH planning to mitigate the impending grey tsunami

The purpose of this report is to help Pewlett Hackard (PH) weather the fast approaching "silver tsunami," which is the retirement of thousands of people who will need to be replaced promptly if the operations at PH are not to suffer any disruptions due to the shortfall of the required skilled labour. The first part of this report will focus on determining the number of retiring employees grouped by business title. In order to achieve a smooth transition from older employees to newer employees, a mentoring plan needs to be implemented. The second part of this report focuses on identifying the mentorship-eligible staff, those who would be tasked with mentoring junior staff. 

## Number of Retiring Employees by Title

The [query](retiree_counts_by_title.sql) that was used to determine the **number of retiring employees by job title** was created by querying the retiring_employees table and then grouping by title. 

The [retiring_employees](retiring_employees.sql) query, which returns a list of all the retirement-eligible employees, was created by joining the following tables:

* the ```employees``` table and the ```salary``` table, which were originally provided as csv files, and 
* the ```retirement_info_revised``` table which was created during the course of the class work.

The ```retirement_info_revised``` table was created using the ```retirement_info``` table and then adding the ```emp_no``` column which is necessary to join it to the other two tables. The SQL script that was used to create the ```retirement_info_revised``` is the following:

```
SELECT emp_no, first_name, last_name
INTO retirement_info_revised
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
```

In order to group the employees based on title, [retiree_counts_by_title](retiree_counts_by_title.sql) was created. The following table shows the results of the retiree_counts_by_title query (also found in [this](csv/retiree_counts_by_title.csv) csv file):

|title|retiree_count|
|-----|---------|
|Assistant Engineer|251|
|Engineer|2711|
|Manager|2|
|Senior Engineer|13651|
|Senior Staff|12872|
|Staff|2022|
|Technique Leader|1609|

## Number of Individuals Being Hired

This section of the report explores the hiring trends at PH. Tables have been generated for hiring trends per month-of-year, hiring trends per title per month-of-year, hiring trends per year, and hiring trends per title per year. THe following are the results.

### Hiring trends per month of year

The query that was used to determine the trends per month of year can be viewed [here](sql/Individuals_being_hired.sql).

|hire_month|hire_num|
|-----|---------|
|03|26917|
|05|25943|
|07|25605|
|04|25553|
|08|25396|
|06|25003|
|10|24613|
|12|24509|
|02|24448|
|09|24316|
|11|23862|
|01|23859|

![](plots/Hiring%20Trends%20by%20Month.png)

Conclusion

There doesn't appear to be a significant difference in the hiring trends related to the month of year.

### Hiring trends per title per month of year

For this, twelve tables were created, one for each title, with each graph showing month-of-year trends. The table that was returned, ordered by number of hires per month of year, is the following:

|department|hire_month|hire_num|
|----------|----------|--------|
|Development|03|7788|
|Development|05|7481|
|Development|07|7358|
|Development|04|7245|
|Development|06|7219|
|Development|08|7182|
|Development|10|7041|
|Development|02|6974|
|Development|12|6914|
|Development|09|6854|
|Development|11|6851|
|Development|01|6800|
|Production|03|6511|
|Production|04|6329|
|Production|05|6321|
|Production|07|6284|
|Production|08|6190|
|Production|06|6176|
|Production|09|6055|
|Production|12|6000|
|Production|10|5985|
|Production|02|5927|
|Production|11|5908|
|Production|01|5799|
|Sales|03|4769|
|Sales|08|4488|
|Sales|05|4482|
|Sales|04|4469|
|Sales|07|4397|
|Sales|10|4310|
|Sales|12|4278|
|Sales|06|4273|
|Sales|02|4238|
|Sales|11|4207|
|Sales|01|4192|
|Sales|09|4142|
|Customer Service|05|2099|
|Customer Service|07|2067|
|Customer Service|08|2039|
|Customer Service|03|2009|
|Customer Service|04|2000|
|Customer Service|01|1990|
|Customer Service|02|1942|
|Customer Service|10|1932|
|Customer Service|09|1931|
|Research|03|1900|
|Customer Service|06|1896|
|Quality Management|03|1883|
|Customer Service|12|1864|
|Research|04|1861|
|Marketing|03|1856|
|Research|08|1814|
|Customer Service|11|1811|
|Research|12|1792|
|Quality Management|07|1791|
|Marketing|08|1780|
|Research|05|1763|
|Research|07|1760|
|Quality Management|05|1753|
|Research|06|1749|
|Marketing|05|1743|
|Research|02|1739|
|Marketing|04|1739|
|Research|10|1728|
|Marketing|12|1703|
|Research|01|1695|
|Quality Management|04|1685|
|Research|09|1672|
|Quality Management|08|1668|
|Quality Management|10|1665|
|Marketing|06|1664|
|Quality Management|06|1658|
|Research|11|1653|
|Marketing|09|1652|
|Marketing|10|1642|
|Marketing|07|1642|
|Quality Management|09|1634|
|Marketing|11|1625|
|Quality Management|02|1617|
|Quality Management|01|1615|
|Quality Management|12|1610|
|Marketing|02|1584|
|Marketing|01|1581|
|Finance|05|1542|
|Human Resources|03|1542|
|Quality Management|11|1538|
|Human Resources|09|1528|
|Human Resources|07|1528|
|Human Resources|08|1516|
|Finance|03|1506|
|Finance|07|1499|
|Human Resources|05|1495|
|Human Resources|12|1494|
|Human Resources|04|1489|
|Finance|02|1489|
|Human Resources|02|1483|
|Human Resources|06|1476|
|Finance|10|1462|
|Finance|08|1453|
|Finance|12|1432|
|Human Resources|11|1431|
|Finance|04|1431|
|Human Resources|10|1421|
|Finance|06|1402|
|Finance|01|1400|
|Finance|09|1394|
|Human Resources|01|1383|
|Finance|11|1336|

The bar graphs showing the trends for each title are the following:

![](plots/Hiring%20Trends%20by%20Month,%20Customer%20Service%20department.png)
![](plots/Hiring%20Trends%20by%20Month,%20Development%20department.png)
![](plots/Hiring%20Trends%20by%20Month,%20Finance%20department.png)
![](plots/Hiring%20Trends%20by%20Month,%20Human%20Resources%20department.png)
![](plots/Hiring%20Trends%20by%20Month,%20Marketing%20department.png)
![](plots/Hiring%20Trends%20by%20Month,%20Production%20department.png)
![](plots/Hiring%20Trends%20by%20Month,%20Quality%20Management%20department.png)
![](plots/Hiring%20Trends%20by%20Month,%20Research%20department.png)
![](plots/Hiring%20Trends%20by%20Month,%20Sales%20department.png)

As with Hiring trends per month of year, there does not appear to be a significant difference beteen the hiring trends with regard to month-of-year for all departments.

