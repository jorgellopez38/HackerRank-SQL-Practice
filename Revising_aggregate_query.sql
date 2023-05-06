
-- Query a count of the number of cities in CITY having a Population larger than 100,000.

SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000;

###############################################################################################

-- Query the total population of all cities in CITY where District is California.

SELECT SUM(POPULATION) AS TOTAL_POP
FROM CITY
WHERE DISTRICT = 'California'

###############################################################################################

-- Query the average population of all cities in CITY where District is California.

SELECT AVG(POPULATION) AS AVG_POP
FROM CITY
WHERE DISTRICT = 'California';

###############################################################################################

-- Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT ROUND(AVG(POPULATION),0) AS MEAN_POP
FROM CITY;

###############################################################################################

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT SUM(POPULATION) AS AVG_JPN_POP
FROM CITY
WHERE COUNTRYCODE = 'JPN';

###############################################################################################

-- Query the difference between the maximum and minimum populations in CITY.

SELECT (MAX(POPULATION) - MIN(POPULATION)) AS DIFF_POP
FROM CITY;

###############################################################################################

-- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
-- but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding 
-- the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.

SELECT (ROUND(AVG(ROUND(Salary,0)),0)) - (ROUND(AVG(REPLACE(ROUND(Salary,0),'0',"")),0)) 
FROM EMPLOYEES;

###############################################################################################

-- We define an employee's total earnings to be their monthly salary X months worked, and the maximum total earnings to be the maximum 
-- total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees 
-- as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.

SELECT (salary * months) AS EARNINGS, COUNT((salary * months)) AS COUNT
FROM Employee
GROUP BY EARNINGS DESC
LIMIT 1;

###############################################################################################

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
-- Truncate your answer to 4 decimal places.

SELECT ROUND(SUM(LAT_N),4) AS SUM_LAT
FROM STATION
WHERE LAT_N < 137.2345 AND LAT_N > 38.7880

###############################################################################################

-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
-- Truncate your answer to 4 decimal places.

SELECT ROUND(MAX(LAT_N),4) AS SUM_LAT
FROM STATION
WHERE LAT_N < 137.2345;

###############################################################################################

-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . 
-- Round your answer to 4 decimal places.

SELECT ROUND(LONG_W,4) AS MEAN_LONG_W
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

###############################################################################################

-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

SELECT ROUND(MIN(LAT_N),4) AS SMALL_LONG_W
FROM STATION
WHERE LAT_N > 38.7780;

###############################################################################################

-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in 
-- STATION is greater than 38.7780. Round your answer to 4 decimal places.

SELECT ROUND(LONG_W,4) AS NEW_LONG_W
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;

###############################################################################################

-- Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

--  a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
--  b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
--  c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
--  d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points P1 and P2 and round it to a scale of  decimal places.

SELECT ROUND((MAX(LAT_N)- MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W)),4) AS MANHATTAN_DISTANCE
FROM STATION;

###############################################################################################

-- Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) 
-- and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
-- Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

SELECT ROUND(SQRT(POWER(MAX(LAT_N)- MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W),2)),4) AS EUCLIDEAN_DISTANCE
FROM STATION;