/*

Solution developed by Eden Boychyn.
Date: August 30th, 2024

Schema Description:

In SQL,(id, month) is the primary key of this table.
The table has information about the revenue of each department per month.
The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 

Problem to Solve: 

Reformat the table such that there is a department id column and a revenue column for each month.
Return the result table in any order.
The result format is in the following example.

*/

/*
	Create table
*/
CREATE TABLE Department (
	id INT NOT NULL PRIMARY KEY, 
	revenue INT, 
	month VARCHAR(11) NOT NULL, 

);

/*
Insert records into table.
*/
INSERT INTO Department VALUES (1, 8000, 'Jan'), (2, 9000, 'Jan'), (3, 10000, 'Feb'), (1, 7000, 'Feb'),  (1, 6000, 'Mar'); 

/* For SQL Server */
/*
	Select the ID and when/if the month is Jan, Feb, March etc return the corresponding revenue. Use the MAX function to find the revenue for each composite key.
	The results are returned by id and order by id.
*/
SELECT id,
	MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue, 
	MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue, 
	MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue, 
	MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
	MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue, 
	MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue, 
	MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue, 
	MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue, 
	MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Apr_Revenue, 
	MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue, 
	MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
	MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
	GROUP BY id
	ORDER BY  id;
	
/*
 For MySQL 

SELECT id, 
	sum( if( month = 'Jan', revenue, NULL ) ) AS Jan_Revenue,
	sum( if( month = 'Feb', revenue, NULL ) ) AS Feb_Revenue,
	sum( if( month = 'Mar', revenue, NULL ) ) AS Mar_Revenue,
	sum( if( month = 'Apr', revenue, NULL ) ) AS Apr_Revenue,
	sum( if( month = 'May', revenue, NULL ) ) AS May_Revenue,
	sum( if( month = 'Jun', revenue, NULL ) ) AS Jun_Revenue,
	sum( if( month = 'Jul', revenue, NULL ) ) AS Jul_Revenue,
	sum( if( month = 'Aug', revenue, NULL ) ) AS Aug_Revenue,
	sum( if( month = 'Sep', revenue, NULL ) ) AS Sep_Revenue,
	sum( if( month = 'Oct', revenue, NULL ) ) AS Oct_Revenue,
	sum( if( month = 'Nov', revenue, NULL ) ) AS Nov_Revenue,
	sum( if( month = 'Dec', revenue, NULL ) ) AS Dec_Revenue
FROM 
	Department
GROUP BY id;
*/





