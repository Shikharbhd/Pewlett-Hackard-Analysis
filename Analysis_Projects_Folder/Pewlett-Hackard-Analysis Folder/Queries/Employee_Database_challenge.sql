-- DELIVERABLE 1: The Number of Retiring Employees by Titles

-- Retrieving Retiring Employees by Titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles As ti
ON e.emp_no = ti.emp_no
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
	
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
		first_name,
		last_name,
		title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;


--DELIVERABLE 2: The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (e.emp_no) de.emp_no,
			e.first_name,
			e.last_name,
			e.birth_date,
			de.from_date,
			de.to_date,
			ti.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date='9999-01-1')
	 AND (e.birth_date BETWEEN '1965-01-01' AND '1965-01-31')
ORDER BY e.emp_no ASC;

--SELECT COUNT(*),title
--FROM mentorship_eligibilty
--GROUP BY title
--ORDER BY COUNT DESC;