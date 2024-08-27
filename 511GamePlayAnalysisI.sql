CREATE TABLE Activity (
	player_id INT NOT NULL, 
	device_id INT NOT NULL, 
	event_date DATE NOT NULL, 
	games_played INT NOT NULL, 
	CONSTRAINT PK_PlayerEvent PRIMARY KEY (player_id,event_date)
);

INSERT INTO Activity VALUES (1, 2, '2016-03-01', 5), (1, 2, '2016-05-02', 6), (2, 3, '2017-06-25', 1), (3, 1, '2016-03-02', 0), (3, 4, '2018-07-03', 5); 

SELECT player_id, MIN(event_date) as first_login
FROM Activity
GROUP BY player_id;