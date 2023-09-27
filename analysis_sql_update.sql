--1. List the following details of each employee:
-- employee number, last name, first name, gender, and salary.
-- from employees: employee number (emp_no), last name (last_name), first name (first_name), gender
-- from salaries: employee number (emp_no), salary
SELECT
		e.emp_no
		,e.last_name
		,e.first_name
		,e.sex
		,(SELECT s.salary FROM salaries1 AS s 
		  WHERE e.emp_no = s.emp_no) AS salary
					
FROM employees1 AS e
;


-- 2.List first name, last name, and hire date for employees who were hired in 1986.*/
SELECT
		e.last_name
		,e.first_name
		,e.hire_date
		
FROM employees1 AS e

WHERE DATE_PART('year', e.hire_date) = 1986
;

-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

SELECT
		d.dept_no
		,d.dept_name
		,e.emp_title_id
		,e.last_name
		,e.first_name

FROM 	dept_emp1 as de
		LEFT JOIN employees1 as e
					ON e.emp_no = de.emp_no
		LEFT JOIN departments1 as d
					ON d.dept_no = de.dept_no

WHERE e.emp_title_id LIKE 'm%'
;


-- 4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
CREATE VIEW all_dept_emp AS -- Create view for the joined table

			(SELECT e.emp_no
			 		,e.emp_title_id
			 		,e.birth_date
			 		,e.last_name
			 		,e.first_name
			 		,e.sex
			 		,e.hire_date
			 		,d.dept_name
			 		,d.dept_no

			FROM 	dept_emp1 as de
					LEFT JOIN employees1 as e
								ON e.emp_no = de.emp_no
					LEFT JOIN departments1 as d
								ON d.dept_no = de.dept_no)
;

SELECT
		emp_no
		,last_name
		,first_name
		,dept_name

FROM 	all_dept_emp


-- 5. List all employees whose first name is "Hercules" 
--and last names begin with "B.
SELECT
		e.first_name
		,e.last_name
		,e.sex

FROM	employees1 AS e

WHERE	e.first_name = 'Hercules'
		AND e.last_name LIKE 'B%'
;


-- Create table with most current departments for each employee to use for #6 and #7 below:

-- 6.List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
CREATE VIEW Q6_7 AS  -- Create another view as similar information is required in the 2 questions

			(SELECT
					emp_no
					,last_name
					,first_name
					,dept_name

			FROM	all_dept_emp)
;

SELECT * FROM Q6_7

WHERE	dept_name = 'Sales'
;
-- 7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT * FROM Q6_7

WHERE	dept_name IN ('Sales', 'Development')
;




-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.


SELECT
		e.last_name
		,COUNT(e.last_name) AS frequency
		
FROM	employees1 AS e

GROUP BY	e.last_name

ORDER BY	frequency DESC
;