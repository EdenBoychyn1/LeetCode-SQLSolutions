/*

Solution developed by Eden Boychyn.
Date: September 9th, 2024

Schema Description:

(emp_id, event_day, in_time) is the primary key (combinations of columns with unique values) of this table.
The table shows the employees' entries and exits in an office.
event_day is the day at which this event happened, in_time is the minute at which the employee entered the office, and out_time is the minute at which they left the office.
in_time and out_time are between 1 and 1440.
It is guaranteed that no two events on the same day intersect in time, and in_time < out_time.
 

Problem to Solve: 

Write a solution to calculate the total time in minutes spent by each employee on each day at the office. Note that within one day, an employee can enter and leave more than once. 
The time spent in the office for a single entry is out_time - in_time. Return the result table in any order.

* Create tables 
*/

CREATE TABLE Employees3 (
	emp_id INT NOT NULL, 
	event_day DATE NOT NULL, 
	in_time INT NOT NULL, 
	out_time INT NOT NULL, 
	CONSTRAINT PK_EmployeesPK PRIMARY KEY (emp_id, event_day, in_time)
);

INSERT INTO Employees3 VALUES (1, '2020-11-28', 4, 32), (1, '2020-11-28', 55, 200), (1, '2020-12-03', 1, 42), (2, '2020-11-28', 3, 33), (2, '2020-12-09', 47, 74); 


/* 
* MySQL & SQL Server Solution
* MIGHT NEED TO CHANGE THIS
*/ 
SELECT event_day, emp_id, SUM(out_time - in_time) AS total_time
FROM Employees3
GROUP BY event_day, emp_id;