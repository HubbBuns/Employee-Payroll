USE employees;

SELECT      
	ROUND(AVG(s.salary), 0) AS salary,    
    t.title AS title,   
		CASE    
			WHEN YEAR(s.to_date) = 9999 THEN DATEDIFF(e.hire_date, current_date())          
			ELSE TIMESTAMPDIFF(year, e.hire_date, s.to_date)  
		END AS avg_tenure 
FROM employees e  
JOIN salaries s  
	USING (emp_no) 
JOIN titles t 
	USING (emp_no) 
GROUP BY title 
HAVING title REGEXP 'Engineer'

