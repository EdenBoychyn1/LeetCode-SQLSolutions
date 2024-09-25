/*

Solution developed by Eden Boychyn.
Date: September 24th, 2024

Schema Description:

id is the primary key (column with unique values) for this table.
The sex column is ENUM (category) value of type ('m', 'f').
The table contains information about an employee.
 

This table may have duplicate rows.
product_id is a foreign key (reference column) to the Products table.
unit is the number of products ordered in order_date.
 

Problem to Solve: 

Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables. 
Note that you must write a single update statement, do not write any select statement for this problem.

* Create tables 
*/

CREATE TABLE Salary (
	id INT PRIMARY KEY,
	name VARCHAR(max) NOT NULL, 
	sex VARCHAR(1),
	salary int NOT NULL
);

/* Insert Records*/

INSERT INTO Salary VALUES (1, 'A', 'm', 2500), (2, 'B', 'f', 1500), (3, 'C', 'm', 5500), (4, 'D', 'f', 500); 


/* MySQL and SQL Server Solution*/
UPDATE Salary
	SET sex = CASE sex
		WHEN 'm' THEN 'f'
		WHEN 'f' THEN 'm'
		END;

/* Check the results*/		
SELECT * FROM Salary;