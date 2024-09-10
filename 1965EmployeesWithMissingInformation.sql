/*

Solution developed by Eden Boychyn.
Date: September 9th, 2024

Schema Description:

employee_id is the column with unique values for this table.
Each row of this table indicates the name and he salary of the employee whose ID is employee_id.
 

Problem to Solve: 

Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:
The employee's name is missing, or The employee's salary is missing. Return the result table ordered by employee_id in ascending order.

 * Create tables 
 */
CREATE TABLE Employees2 (
	employee_id INT NOT NULL PRIMARY KEY, 
	name VARCHAR(MAX)
); 

CREATE TABLE Salaries (
	employee_id INT NOT NULL PRIMARY KEY, 
	salary INT
); 

/*
 * Insert records into tables
 */
INSERT INTO Employees2 VALUES (2, 'Crew'), (4, 'Haven'), (5, 'Kristian'); 

INSERT INTO Salaries VALUES (5, 76071), (1, 22517), (4, 63539); 

SELECT employee_id FROM (SELECT employee_id FROM Employees2 EXCEPT SELECT employee_id FROM Salaries) AS table_a
UNION
SELECT employee_id FROM (SELECT employee_id FROM Salaries EXCEPT SELECT employee_id FROM Employees2) AS table_b
ORDER BY employee_id ASC;