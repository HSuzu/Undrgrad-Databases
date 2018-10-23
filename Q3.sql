WITH
lapsForRace(raceID1, nLaps) AS(
	SELECT DISTINCT raceid , max(lap)
	FROM LapTimes
	GROUP BY raceid
),
winnerForRace(raceID2, driverID2) AS(
	SELECT raceid, driverid
	FROM LapTimes, lapsForRace
	WHERE (raceid=raceID1 AND lap=nLaps) AND position='1'
),
racesForDriver(driverID3, nRaces) AS(
	SELECT driverID2, count(raceID2)
	FROM winnerForRace
	GROUP BY driverID2
)

SELECT DISTINCT Forename, Surname, nRaces
	FROM Driver, racesForDriver
	WHERE (driverid=driverID3 AND nRaces=(SELECT max(nRaces) FROM racesForDriver))
