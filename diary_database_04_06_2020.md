# Database Diary 04.06.2020 Mario Wagner

## Company Database

We made a database of a company an had to form some SQL Queries (with JOINS)

Solution ->
https://github.com/CODERS-BAY/joins-mawa81/blob/master/solution.sql


sample for multiple joins:
```
SELECT departments.department_name, locations.postal_code, locations.city, locations.state_province, locations.street_address, countries.country_name,  CONCAT(employees.first_name, " ", employees.last_name) AS Manager

FROM departments

JOIN locations ON departments.location_id = locations.location_id

JOIN countries ON countries.country_id = locations.country_id

JOIN employees ON departments.department_id = employees.department_id

WHERE departments.manager_id = employees.manager_id;
```

last query -> the employees entity can get different alias like "a","b"... to get different versions of the same entity
```
SELECT CONCAT(a.first_name, " ", a.last_name) AS Manager, CONCAT(b.first_name, " ", b.last_name) AS Subordinate

FROM employees a, employees b

WHERE a.employee_id = b.manager_id

ORDER BY a.employee_id ASC;
```