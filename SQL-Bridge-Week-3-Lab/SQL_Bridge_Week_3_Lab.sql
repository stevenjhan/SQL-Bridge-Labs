-- 1. [Warm-up Exercise] Write a SELECT statement that shows for all of the flights during the period February 14th to
-- February 17th for each of the four planes above: ‘N125UW’,’N848MQ’,’N328AA’,’N247JB’. Your select statement
-- should return the following information: tailnum, flight date information, departure delay, arrival delay, 3 digit
-- destination code

SELECT
flights.tailnum AS 'Planes',
CAST(CONCAT(flights.year, '-', flights.month, '-', flights.day) AS DATE) AS 'Flight Date',
flights.dep_delay AS 'Departure Delay',
flights.arr_delay AS 'Arrival Delay',
flights.dest AS 'Destination'
FROM flights
WHERE flights.month = '2'
AND flights.day BETWEEN '14' AND '17'
AND flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB');

SELECT
COUNT(*)
FROM flights
WHERE flights.month = '2'
AND flights.day BETWEEN '14' AND '17'
AND flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB');

-- 2. Add a join clause, to also show destination airport name. How many rows were returned?

SELECT
flights.tailnum AS 'Planes',
CAST(CONCAT(flights.year, '-', flights.month, '-', flights.day) AS DATE) AS 'Flight Date',
flights.dep_delay AS 'Departure Delay',
flights.arr_delay AS 'Arrival Delay',
flights.dest AS 'Destination',
airports.name AS 'Airport Name'
FROM flights
JOIN airports
ON flights.dest = airports.faa
WHERE flights.month = '2'
AND flights.day BETWEEN '14' AND '17'
AND flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB');

SELECT
COUNT(*)
FROM flights
JOIN airports
ON flights.dest = airports.faa
WHERE flights.month = '2'
AND flights.day BETWEEN '14' AND '17'
AND flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB');

-- 3. Rewrite the join as a left join, and compare your results.

SELECT
flights.tailnum AS 'Planes',
CAST(CONCAT(flights.year, '-', flights.month, '-', flights.day) AS DATE) AS 'Flight Date',
flights.dep_delay AS 'Departure Delay',
flights.arr_delay AS 'Arrival Delay',
flights.dest AS 'Destination',
airports.name AS 'Airport Name'
FROM flights
LEFT JOIN airports
ON flights.dest = airports.faa
WHERE flights.month = '2'
AND flights.day BETWEEN '14' AND '17'
AND flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB');

-- 4. Add a second left join clause to also show the number of seats in the planes

SELECT
flights.tailnum AS 'Planes',
CAST(CONCAT(flights.year, '-', flights.month, '-', flights.day) AS DATE) AS 'Flight Date',
flights.dep_delay AS 'Departure Delay',
flights.arr_delay AS 'Arrival Delay',
flights.dest AS 'Destination',
airports.name AS 'Airport Name',
planes.seats AS 'Seats on Airplane'
FROM flights
LEFT JOIN airports
ON flights.dest = airports.faa
LEFT JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.month = '2'
AND flights.day BETWEEN '14' AND '17'
AND flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB');

-- 5. Rewrite your query, using table aliases. (Results unchanged from above). Do you find the code more readable
-- with or without table aliases?

SELECT
F.tailnum AS 'Planes',
CAST(CONCAT(F.year, '-', F.month, '-', F.day) AS DATE) AS 'Flight Date',
F.dep_delay AS 'Departure Delay',
F.arr_delay AS 'Arrival Delay',
F.dest AS 'Destination',
A.name AS 'Airport Name',
P.seats AS 'Seats on Airplane'
FROM flights AS F
LEFT JOIN airports AS A
ON F.dest = A.faa
LEFT JOIN planes AS P
ON F.tailnum = P.tailnum
WHERE F.month = '2'
AND F.day BETWEEN '14' AND '17'
AND F.tailnum IN ('N125UW','N848MQ','N328AA','N247JB');

-- 6. What are the names of the five airports that receive the most flights?

SELECT
A.name AS `Airport`,
COUNT(*) AS `Number of Flights`
FROM flights AS F
INNER JOIN airports AS A
ON F.dest = A.faa
GROUP BY A.name
ORDER BY COUNT(*) DESC
LIMIT 5;

-- 7. What are American Airlines’ destination cities from the New York airports?

SELECT
DISTINCT
AP.name AS `Airports`
FROM flights AS F
JOIN airports AS AP
ON F.dest = AP.faa
JOIN airlines AS AL
ON F.carrier = AL.carrier
WHERE F.origin IN ('JFK', 'LGA')
AND AL.name LIKE '%american%';