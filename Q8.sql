with positions(driverid, position, lap) as (
	select l.driverid, l.position, l.lap
	from races as r, laptimes as l
	where r.year = 2000
		and lower(r.name) like 'monaco grand prix'
		and r.raceid = l.raceid
		order by l.lap, l.position
)

select d1.forename, d1.surname, p1.position, d2.forename, d2.surname, p2.position, p3.position, p1.lap
from positions as p1, positions as p2, positions p3, driver as d1, driver as d2
where p2.lap - p1.lap = 1
	and p1.lap = p3.lap
	and (p1.position >= p2.position
	and p1.position <= p3.position)
	and p2.driverid = p3.driverid
	and p2.position < p3.position
	and p2.driverid <> p1.driverid
	and p1.driverid = d1.driverid
	and p2.driverid = d2.driverid