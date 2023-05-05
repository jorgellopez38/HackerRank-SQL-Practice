-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
-- The CITY table is described as follows:

SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE LIKE 'USA';


-- Find the difference between the total number of CITY entries in the table and the 
-- number of distinct CITY entries in the table.
-- where LAT_N is the northern latitude and LONG_W is the western longitude.

SELECT COUNT(*) - COUNT(DISTINCT CITY) AS UNIQUE_CITY
FROM STATION;

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

