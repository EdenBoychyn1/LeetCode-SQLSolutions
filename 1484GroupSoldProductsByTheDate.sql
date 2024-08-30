/*

Solution developed by Eden Boychyn.
Date: August 30th, 2024

Schema Description:

There is no primary key (column with unique values) for this table. It may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.
 

Problem to Solve: 

Write a solution to find for each date the number of different products sold and their names.
The sold products names for each date should be sorted lexicographically.
Return the result table ordered by sell_date.
The result format is in the following example.

*/

/*
Create the table. No Primary Key.
*/

CREATE TABLE Activities (
	sell_date DATE, 
	product VARCHAR(50)
); 

/*
 Insert records into Activities table. 
*/
INSERT INTO Activities 
	VALUES 
		('2020-05-30', 'Headphone'), 
		('2020-06-01', 'Pencil'), 
		('2020-06-02', 'Mask'), 
		('2020-05-30', 'Basketball'), 
		('2020-06-01', 'Bible'), 
		('2020-06-02', 'Mask'), 
		('2020-05-30', 'T-Shirt'); 


/*
	In SQL Server

	Select all fields from the table but count the number of products sold by the date. 
	In MySQL, I can use a simple GROUP_CONCAT function however, in SQL Server that function is not available to use. 
	I needed to use the STRING_AGG function but you cannot use the DISTINCT function or UNIQUE function so I used a nested query 
	to pull from the distinct values from the table again and grouped the results by sell_date. 
*/
SELECT sell_date, COUNT(product) AS num_sold, STRING_AGG(product, ', ') as products
FROM (SELECT DISTINCT sell_date, product FROM Activities ) AS X GROUP BY sell_date

/*
	In MySQL

	SELECT sell_date, COUNT(DISTINCT(product)) as num_sold, GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
	FROM Activities
	GROUP BY sell_date
*/

