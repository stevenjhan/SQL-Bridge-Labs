-- SQL Bridge Week 1 Quiz 1

-- 1. What is the average altitude of the three major New York airports?

SELECT
AVG(alt)
FROM airports
WHERE faa IN ('JFK', 'EWR', 'LGA')

-- 2. What is the average altitude for airports grouped by timezone. Which timezone has the highest altitude? Why?

SELECT
tz AS 'Time Zone',
AVG(alt) AS 'Average Altitude',
COUNT(*) AS 'Number of Records'
FROM airports
GROUP BY tz
ORDER BY AVG(alt) DESC

SELECT
tz AS 'Time Zone',
name AS 'Airport Name',
alt as 'Altitude'
FROM airports
WHERE tz = '-7'
ORDER BY alt DESC
LIMIT 20

-- 3. Which of these four airplanes made the most flights out of New York City airports in 2013? Plane tailnums: 'N125UW','N848MQ','N328AA','N247JB'

SELECT
year AS 'Year',
tailnum AS 'Plane Tail Number',
COUNT(*)  AS 'Number of Flights'
FROM flights
WHERE tailnum IN('N125UW','N848MQ','N328AA','N247JB')
AND year = '2013'
GROUP BY year, tailnum
ORDER BY 'Number of Flights' DESC

-- 4. For each of these four planes, show the corresponding meta-data (model, manufacturer, engines, etc.) about each plane? What is surprising about the information returned? How do you think this could happen?

SELECT *
FROM planes
WHERE tailnum IN('N125UW','N848MQ','N328AA','N247JB')

-- 5. Write a SELECT statement that shows for all of the flights during the period February 14th to February 17th for each of the four planes above: ‘N125UW’,’N848MQ’,’N328AA’,’N247JB’. Your select statement should return the following information: tailnum, flight date information, departure delay, arrival delay, 3 digit destination code

SELECT
tailnum AS 'Flight Tail Number',
CONCAT(month,'/',day,'/',year) AS 'Date',
dep_delay AS 'Departure Delay',
arr_delay AS 'Arrival Delay',
dest AS 'Destination Code'
FROM flights
WHERE tailnum IN ('N125UW','N848MQ','N328AA','N247JB')
AND month = '2'
AND day BETWEEN '14' AND '17'