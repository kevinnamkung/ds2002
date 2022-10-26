#Kevin Namkung khn8ur
USE employees;
#1
SELECT employees.gender, count(*) AS total_count FROM employees GROUP BY gender ORDER BY total_count DESC;

#2
SELECT count(*), titles.title, ROUND(AVG(salaries.salary),2) AS title_salaries 
FROM titles JOIN salaries ON salaries.emp_no = titles.emp_no
GROUP BY titles.title ORDER BY title_salaries DESC;

#3 look again
SELECT employees.first_name, employees.last_name, count(*) AS departments
FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
GROUP BY dept_emp.emp_no HAVING departments > 1 ORDER BY count(*) DESC;

#4
SELECT employees.first_name, employees.last_name, salaries.salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salaries.salary = (select max(salaries.salary) FROM salaries);

#5
SELECT employees.first_name, employees.last_name, salaries.salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salaries.salary < (select max(salaries.salary) FROM salaries) ORDER BY salaries.salary DESC LIMIT 1;

#6
SELECT MONTH(hire_date) AS hire_month, count(*) AS total_hires
FROM employees GROUP BY hire_month ORDER BY total_hires DESC LIMIT 1;

#7 todo fix
SELECT dept.dept_name, MIN(TIMESTAMPDIFF(YEAR, e.birth_date, e.hire_date)) AS age
FROM employees e 
	JOIN dept_emp d_emp ON e.emp_no = d_emp.emp_no 
	JOIN departments dept ON d_emp.dept_no = dept.dept_no
GROUP BY dept.dept_name;

#8
SELECT employees.first_name, departments.dept_name 
FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE employees.first_name NOT RLIKE '^[AEIOU]';



