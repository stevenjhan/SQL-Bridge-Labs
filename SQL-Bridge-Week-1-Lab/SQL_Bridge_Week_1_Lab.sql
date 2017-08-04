-- SQL Bridge Week 1 Quiz

-- 1. Write a SELECT statement that returns all of the rows and columns in the planes table

SELECT *
FROM planes

-- 2. Using the weather table, concatenate the year, month, and day columns to display a date in the form "3/17/2013"

SELECT CONCAT(month,"/",day,"/",year) as Date
FROM weather

-- 3. Order by planes table by number of seats, in descending order

SELECT *
FROM planes
ORDER BY seats DESC

-- 4. List only those planes that have an engine that is 'Reciprocating'

SELECT *
FROM planes
WHERE engine = 'Reciprocating'

-- 5. List only the first 5 rows in the flights table

SELECT *
FROM flights
LIMIT 5

-- 6. What was the longest (non-blank) air time?

SELECT MAX(air_time)
FROM flights

-- 7. What was the shortest (non-blank) air time for Delta?

SELECT MIN(air_time)
FROM flights
WHERE carrier = 'DL'

-- 8. Show all of the Alaska Airlines flights between June 1st, 2013 and June 3rd, 2013. Is the way the data is stored in the database helpful to you in making your query?

SELECT *
FROM flights
WHERE CAST(CONCAT(year,'-',month,'-',day) AS DATE) BETWEEN CAST('2013-6-1' AS DATE) AND CAST('2013-6-3' AS DATE)

-- 9. Show all of the airlines whose names contain 'America'

SELECT
IFNULL(name,'unknown') AS 'Airlines with America in Title'
FROM airlines
WHERE name LIKE '%america%'

-- 10. How many flights went to Miami?

SELECT
COUNT(flight) as 'Flights to Miami'
FROM flights
WHERE dest IN ('MIA', 'MPB', 'OXD')

-- 11. Were there more flights to Miami in January 2013 or July 2013? (Multiple queries are OK)

SELECT
CASE month
WHEN '1' THEN 'January 2013'
WHEN '7' THEN 'July 2013'
ELSE 'Other'
END AS 'Month',
COUNT(flight) AS 'Comparison of Flights'
FROM flights
WHERE dest IN ('MIA', 'MPB', 'OXD')
AND year = '2013'
AND month IN ('1', '7')
GROUP BY
CASE month
WHEN '1' THEN 'January 2013'
WHEN '7' THEN 'July 2013'
ELSE 'Other'
END

-- 12. What is the average altitude of airports?

SELECT
AVG(alt) as 'Average Altitude of Airport'
FROM airports