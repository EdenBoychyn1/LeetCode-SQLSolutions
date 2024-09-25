/*

Solution developed by Eden Boychyn.
Date: September 24th, 2024

Schema Description:

product_id is the primary key (column with unique values) for this table.
This table contains data about the company's products.

This table may have duplicate rows.
product_id is a foreign key (reference column) to the Products table.
unit is the number of products ordered in order_date.
 

Problem to Solve: 

Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
Return the result table in any order.

* Create tables 
*/

CREATE TABLE Products(
	product_id INT PRIMARY KEY, 
	product_name VARCHAR(max) NOT NULL, 
	product_category VARCHAR(max) NOT NULL
);

CREATE TABLE Orders(
	product_id INT, 
	order_date DATE NOT NULL, 
	unit INT NOT NULL
); 

/*Insert Data Into tables*/
INSERT INTO Products VALUES (1, 'Leetcode Solutions', 'Book'), (2, 'Jewels of Stringology', 'Book'), (3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt'); 

INSERT INTO Orders VALUES (1, '2020-02-05', 60), (1, '2020-02-10', 70), (2, '2020-01-18', 30), (2, '2020-02-11', 80), (3, '2020-02-17', 2), (3, '2020-02-24', 3), (4, '2020-03-01', 20), (4, '2020-03-04', 30), (4, '2020-03-04', 60),
(5, '2020-02-25', 50), (5, '2020-02-27', 50), (5, '2020-03-01', 50);

/*SQL Server Query*/
SELECT Products.product_name, SUM(Orders.unit) as unit
FROM Products JOIN Orders ON Products.product_id = Orders.product_id
WHERE Orders.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY Products.product_name
HAVING SUM(Orders.unit) >= 100;

/*MySQL Query

SELECT Products.product_name, SUM(Orders.unit) as unit
FROM Products JOIN Orders ON Products.product_id = Orders.product_id
WHERE Orders.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY Products.product_id
HAVING SUM(Orders.unit) >= 100;


*/

