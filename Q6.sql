with acess1(raceid1, date, name) as	(
	select raceid, date, name from races
), acess2(raceid2, laps) as	(
	select raceid as raceid2, max(lap) from laptimes group by raceid
) select date, name, laps from acess1, acess2
	where raceid1=raceid2;