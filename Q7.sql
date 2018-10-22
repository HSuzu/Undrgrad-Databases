with values as(
with acess1(raceid1, date, name) as	(
	select raceid, date, name from races
), acess2(raceid2, laps) as	(
	select raceid as raceid2, max(lap) from laptimes group by raceid
) select date, name, laps from acess1, acess2
	where raceid1=raceid2
	order by date
) select date from values
	where values.date = (select min(date) from values)
	and (values.laps is not null);