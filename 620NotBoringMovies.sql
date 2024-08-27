
/* 
 * Create the Cinema table
 */
CREATE TABLE Cinema (
	id INT NOT NULL PRIMARY KEY, 
	movie VARCHAR(max) NOT NULL, 
	description VARCHAR(max) NOT NULL, 
	rating FLOAT NOT NULL
); 

/* 
 * Insert records into table
 */
INSERT INTO Cinema 
	VALUES 
		(1, 'War', 'great 3D', 8.9), 
		(2, 'Science', 'fiction', 8.5), 
		(3, 'irish', 'boring', 6.2), 
		(4, 'Ice song', 'Fantacy', 8.6), 
		(5, 'House card', 'Interesting', 9.1); 

/* 
 * Find all records with an odd numbered id and that do not have the description of 'boring'. 
 * I complete the challenges in MySQL however I am using SQL Server to document my solutions which allows me to learn both languages concurrently. 
 */

 /*
  * In SQL Server	  	
  */
SELECT * 
FROM Cinema 
WHERE id%2 <> 0 AND description <> 'Boring'
ORDER BY rating DESC;

/*	In MySQL

	SELECT * 
	FROM Cinema 
	WHERE MOD(id,2) <> 0 AND description <> "Boring"
	ORDER BY rating DESC;
*/