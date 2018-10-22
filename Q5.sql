with brs(Forename, Surname, driverId) as (
	select Forename, Surname, driverId from Driver where Nationality = 'Brazilian'
), lastLapForRace(rId, lap) as (
	select distinct raceId as rId, max(lap) from lapTimes group by raceId
), winnerForRace(raceId, driverId) as (
	select raceId, driverId from lapTimes, lastLapforRace where (raceId = rId AND laptimes.lap = lastLapforRace.lap) AND position = '1'
) select Distinct Forename, Surname from brs, winnerForRace where brs.driverId = winnerForRace.driverId
