Select r.date, r.name as nomecorrida, c.name as nomecircuito, c.location as cidade
from races as r, circuits as c
where r.circuitid = c.circuitid
	and lower(country) like '%brazil%'
	and r.date > CURRENT_DATE
order by r.year