--Q4
WITH T1 AS (
	SELECT DISTINCT driverid , raceid
			FROM Laptimes
),
T2 AS (
	SELECT driverid, count(raceid) AS ncorridas
		FROM T1
		GROUP BY driverid)

SELECT T2.driverid, Forename, Surname, ncorridas
	FROM T2, Driver
	WHERE (ncorridas=(SELECT max(ncorridas) FROM T2) AND T2.driverid=Driver.driverid)