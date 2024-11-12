/*

Solution developed by Eden Boychyn.
Date: November 4th, 2024

Schema Description:

SalesPerson Table: 
sales_id is the primary key (column with unique values) for this table.
Each row of this table indicates the name and the ID of a salesperson alongside their salary, commission rate, and hire date.

Company Table: 
com_id is the primary key (column with unique values) for this table.
Each row of this table indicates the name and the ID of a company and the city in which the company is located.

Orders Table: 
order_id is the primary key (column with unique values) for this table.
com_id is a foreign key (reference column) to com_id from the Company table.
sales_id is a foreign key (reference column) to sales_id from the SalesPerson table.
Each row of this table contains information about one order. This includes the ID of the company, the ID of the salesperson, the date of the order, and the amount paid.

Problem to Solve: 

Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

* Create tables 
*/
CREATE TABLE SalesPerson(
	sales_id INT PRIMARY KEY, 
	name VARCHAR(50) NOT NULL, 
	salary INT NOT NULL, 
	comission_rate INT NOT NULL, 
	hire_date DATE NOT NULL
);

CREATE TABLE Company(
	com_id INT PRIMARY KEY, 
	name VARCHAR(50) NOT NULL, 
	city varchar(50) NOT NULL
);

CREATE TABLE Orders1(
	order_id INT PRIMARY KEY, 
	order_date DATE NOT NULL, 
	com_id INT FOREIGN KEY REFERENCES Company(com_id), 
	sales_id INT FOREIGN KEY REFERENCES SalesPerson(sales_id), 
	AMOUNT INT NOT NULL
); 

/* Insert records*/
INSERT INTO SalesPerson VALUES (1, 'John', 100000, 6, '4/1/2006'), (2, 'Amy', 12000, 5, '5/1/2010'), (3, 'Mark', 65000, 12, '12/25/2008'), (4, 'Pam', 25000, 25, '1/1/2005'), (5, 'Alex', 5000, 10, '2/3/2007');

INSERT INTO Company VALUES (1, 'RED', 'Boston'), (2, 'ORANGE', 'New York'), (3, 'YELLOW', 'Boston'),  (4, 'GREEN', 'Austin');

INSERT INTO Orders1 VALUES (1, '1/1/2014', 3, 4, 10000), (2, '2/1/2014', 4, 5, 5000), (3, '3/1/2014', 1, 1, 50000), (4, '4/1/2014', 1, 4, 25000);

/* Solution in SQL Server & MySQL
* 
* RUNTIME: 1352 ms in MySQL
*/
SELECT distinct(sp.name)
FROM SalesPerson as sp
LEFT JOIN Orders1 as o ON sp.sales_id = o.sales_id
LEFT JOIN Company as c ON o.com_id = c.com_id
WHERE sp.sales_id NOT IN (SELECT sales_id
                                FROM Orders1 as o 
                                LEFT JOIN Company as c ON o.com_id = c.com_id
                                WHERE c.name = 'RED' 
                                );