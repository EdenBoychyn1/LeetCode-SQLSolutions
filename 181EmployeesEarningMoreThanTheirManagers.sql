/*

Solution developed by Eden Boychyn.
Date: September 28th, 2024

Schema Description:

id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.

Problem to Solve: 

Write a solution to find the employees who earn more than their managers.
Return the result table in any order.

* Create tables 
*/

CREATE TABLE Employee4 (
	id INT PRIMARY KEY, 
	name VARCHAR(max), 
	salary INT NOT NULL, 
	managerId INT
);


/* 
	Insert records 
	managerId references the id field.
*/
INSERT INTO Employee4 VALUES (1, 'Joe', 70000, 3), (2, 'Henry', 80000, 4), (3, 'Sam', 60000, null), (4, 'Max', 90000, null);

/* Solution in MySQL and SQL Server */
SELECT e1.name AS Employee
FROM Employee4 as e1
JOIN Employee4 e2
	ON (e1.managerId = e2.id AND e1.managerId = e2.id)
WHERE e1.salary > e2.salary; 