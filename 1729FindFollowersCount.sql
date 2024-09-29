/*

Solution developed by Eden Boychyn.
Date: September 29th, 2024

Schema Description:

(user_id, follower_id) is the primary key (combination of columns with unique values) for this table.
This table contains the IDs of a user and a follower in a social media app where the follower follows the user.

Problem to Solve: 

Write a solution that will, for each user, return the number of followers.
Return the result table ordered by user_id in ascending order.

* Create tables 
*/

CREATE TABLE Followers (
	user_id INT, 
	follower_id INT, 
	CONSTRAINT PK_Followers PRIMARY KEY (user_id, follower_id)
);

/* Insert records */
INSERT INTO Followers VALUES (0, 1), (1, 0), (2, 0), (2, 1);

/* MySQL & SQL Server solution */
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;