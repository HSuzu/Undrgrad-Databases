Select r.year as ano, r.name as nomecorrida, c.name as nomecircuito, c.location as cidade
from races as r, circuits as c
where r.circuitid = c.circuitid
	and lower(country) like '%brazil%'
order by r.year