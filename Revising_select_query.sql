-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
-- The CITY table is described as follows:

SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE LIKE 'USA';

###############################################################################################

-- Find the difference between the total number of CITY entries in the table and the 
-- number of distinct CITY entries in the table.
-- where LAT_N is the northern latitude and LONG_W is the western longitude.

SELECT COUNT(*) - COUNT(DISTINCT CITY) AS UNIQUE_CITY
FROM STATION;

###############################################################################################

-- Query the two cities in STATION with the shortest and longest CITY names, 
-- as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, choose the one that comes first when 
-- ordered alphabetically.

SELECT CITY, LENGTH(CITY) AS NAME_LENGTH
FROM STATION
WHERE LENGTH(CITY) = (SELECT MIN(LENGTH(CITY)) FROM STATION)
   OR LENGTH(CITY) = (SELECT MAX(LENGTH(CITY)) FROM STATION)
ORDER BY NAME_LENGTH DESC, CITY
LIMIT 2;

###############################################################################################

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from 
-- STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE'u%';

###############################################################################################

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
-- Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE'%u';

###############################################################################################

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and 
-- last characters. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE'u%') 
AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');

###############################################################################################

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(CITY, 1,1) NOT IN ('a', 'e', 'i', 'o', 'u');

###############################################################################################

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(CITY, -1) NOT IN ('a', 'e', 'i', 'o', 'u');

###############################################################################################

-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
-- Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(CITY, 1, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
OR SUBSTR(CITY, -1) NOT IN ('a', 'e', 'i', 'o', 'u');

###############################################################################################

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
-- Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(CITY, 1, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
AND SUBSTR(CITY, -1) NOT IN ('a', 'e', 'i', 'o', 'u');

###############################################################################################

-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by 
-- ascending ID.

SELECT Name
FROM STUDENTS
WHERE MARKS > 75
ORDER BY SUBSTR(Name,-3), ID;

###############################################################################################

-- Write a query that prints a list of employee names (i.e.: the name attribute) 
-- from the Employee table in alphabetical order.

SELECT Name
FROM Employee
ORDER BY Name;

###############################################################################################

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having 
-- a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.

SELECT Name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;

###############################################################################################

-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
-- Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with 3 sides of equal length.
-- Isosceles: It's a triangle with 2 sides of equal length.
-- Scalene: It's a triangle with 3 sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT 
  CASE
    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR A = C OR B = C THEN 'Isosceles'
    ELSE 'Scalene'
  END AS TriangleType
FROM TRIANGLES;

###############################################################################################
