/*

Solution developed by Eden Boychyn.
Date: September 29th, 2024

Schema Description:

id is the primary key (column with unique values) for the Customers table.
Each row of this table indicates the ID and name of a customer.

id is the primary key (column with unique values) for the Orders table.
customerId is a foreign key (reference columns) of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.

Problem to Solve: 

Write a solution to find all customers who never order anything.
Return the result table in any order.

* Create tables 
*/

CREATE TABLE Customers (
	id INT NOT NULL PRIMARY KEY, 
	name VARCHAR(max)	
);

CREATE TABLE Orders (
	id INT NOT NULL PRIMARY KEY, 
	customerId INT FOREIGN KEY REFERENCES Customers(id)
);

/* Insert records */
INSERT INTO Customers VALUES (1, 'Joe'), (2, 'Henry'), (3, 'Sam'), (4, 'Max');

INSERT INTO Orders VALUES (1, 3), (2, 1);

/* MySQL & SQL Server solution */
SELECT name AS Customers
FROM Customers
WHERE Customers.id NOT IN(SELECT customerId FROM Orders);