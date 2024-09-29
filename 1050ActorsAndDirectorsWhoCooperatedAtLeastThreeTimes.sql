/*

Solution developed by Eden Boychyn.
Date: September 28th, 2024

Schema Description:

timestamp is the primary key (column with unique values) for this table.

Problem to Solve: 

Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
Return the result table in any order.

* Create tables 
*/

CREATE TABLE ActorDirector (
	actor_id INT NOT NULL, 
	director_id INT NOT NULL, 
	timestamp INT PRIMARY KEY
);


/* 
	Insert records 
*/
INSERT INTO ActorDirector VALUES (1, 1, 0), (1, 1, 1), (1, 1, 2), (1, 2, 3), (1, 2, 4), (2, 1, 5), (2, 1, 6);

/* Solution in SQL Server */
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(actor_id) >= 3 AND COUNT(director_id) >= 3;

/* MySQL
# Write your MySQL query statement below
SELECT actor_id, director_id 
FROM ActorDirector
GROUP BY actor_id,director_id
HAVING COUNT(actor_id) AND COUNT(director_id) >= 3
*/