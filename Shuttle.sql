Create database Homeless;

-- What are all the unique Route Names?

SELECT DISTINCT
    Route_Name
FROM
    shuttle;
    
-- Total number of trips

SELECT 
    SUM(Trips) AS 'Total Trips'
FROM
    shuttle;

-- How many trips are available for each route?

SELECT 
    route_id, route_name, COUNT(trips) AS 'Number of Trips'
FROM
    shuttle
GROUP BY route_id , route_name
ORDER BY route_name;

-- What are the origins of routes?

SELECT distinct route_name, route_id,
    origin
FROM
    shuttle;

-- What is the average estimated arrival time for each route?

SELECT 
    route_id,
    route_name,
    SEC_TO_TIME(AVG(TIME_TO_SEC(estimated_time))) AS 'estimated arrival time'
FROM
    shuttle
GROUP BY route_id , route_name;

-- All routes and their corresponding estimated arrival times.

SELECT 
    route_id, route_name, Estimated_Time
FROM
    shuttle
ORDER BY Estimated_Time;

--  Number of stops for each route

SELECT 
    route_id, route_name, COUNT(STOP_ID) AS 'Number of Stops'
FROM
    shuttle
GROUP BY route_id , route_name;

-- Route with the shortest estimated arrival time.

SELECT 
    route_id,
    route_name,
    SEC_TO_TIME(MIN(TIME_TO_SEC(estimated_time))) AS 'Earliest Arrival Time'
FROM
    shuttle
GROUP BY route_id , route_name
ORDER BY 'Shortest Arrival Time'
LIMIT 1;

-- What is the total estimated arrival time for all routes?

SELECT 
    SEC_TO_TIME(sum(TIME_TO_SEC(estimated_time))) AS 'total_estimated_arrival_time'
FROM
    shuttle;
    
-- Which route has the longest estimated arrival time?

SELECT 
    route_id,
    route_name,
    SEC_TO_TIME(MAX(TIME_TO_SEC(estimated_time))) AS 'Longest_Arrival_Time'
FROM
    shuttle
GROUP BY route_id , route_name
ORDER BY Longest_Arrival_Time DESC
LIMIT 1;

