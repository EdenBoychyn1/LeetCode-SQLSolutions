/*

Solution developed by Eden Boychyn.
Date: December 6th, 2024

Schema Description:

id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 
Problem to Solve: 

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
After running your script, the answer shown is the Person table. The driver will first compile and 
run your piece of code and then show the Person table. The final order of the Person table does not 
matter.

* Create table
*/

CREATE TABLE Person1 (
	id INT PRIMARY KEY, 
	email VARCHAR(max)
);

/* Insert records*/
INSERT INTO Person1 VALUES (1, 'john@example.com'), (2, 'bob@example.com'),  (3, 'john@example.com'), (4, 'jane@example.com'), (6, 'jane@example.com'), (5, 'jane@example.com')


/* SQL Server and MySQL solution*/
DELETE FROM Person1
WHERE id NOT IN (
	SELECT RowId FROM (
	   SELECT MIN(id) as RowId, email
	   FROM Person1 
	   GROUP BY email
	) as c
)
