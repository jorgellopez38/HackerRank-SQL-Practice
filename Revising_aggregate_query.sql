
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