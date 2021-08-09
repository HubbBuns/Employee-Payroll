USE employees;

SELECT      
    ROUND(AVG(s.salary), 0) AS salary,	#Getting the average salary, then rounding it to a whole number
    t.title AS title,   #Selecting job titles
		ROUND(AVG(CASE    #Using the case statement to get the average tenure, rounded to a whole number, and the year difference from their starting to ending/current date
			WHEN YEAR(t.to_date) = 9999 THEN TIMESTAMPDIFF(year, t.from_date, '2002-12-31')	    #If the year of to_date = 9999, then the employee is currently active.  
			ELSE TIMESTAMPDIFF(year, t.from_date, t.to_date)  				    #Instead of using current_now(), which is 2021, 
		END), 0) AS avg_tenure									    #2002 was used since thats the latest year of to_date and matches closely to the time period of the table.
FROM titles t 	#Joining the two relevant tables needed, titles and salaries
JOIN salaries s
	USING (emp_no)	#Joining the two tables and their primary keys
GROUP BY title	#Grouping by titles to see their average salary and average tenure
HAVING title REGEXP 'Engineer'	#Using Engineer as an example here to simplify titles related to each other, ie. Assistant Engineer, Engineer, and Senior Engineer



