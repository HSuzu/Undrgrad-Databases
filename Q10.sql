drop table if exists races2;
create table races2 as
with acess2 as (
with l1 as 
	(select raceid, driverid, lap from laptimes),
	l2 as 
	(select raceid, max(lap) as maxlap from laptimes group by raceid)
select l1.raceid, driverid, lap from l1, l2
	where l1.raceid = l2.raceid and (lap=1 or lap=maxlap)
),
comeco as (select raceid, count(driverid) from acess2 where lap = 1 group by raceid),
fim as (select raceid, count(driverid), lap from acess2 where lap != 1 group by raceid, lap),
acess(raceid, laps, started, finished) as (
	select laptimes.raceid, fim.lap, comeco.count, fim.count 
		from laptimes, comeco, fim 
		where laptimes.raceid = fim.raceid 
		and fim.raceid=comeco.raceid 
		group by laptimes.raceid, fim.lap, comeco.count, fim.count
) select acess.raceid, acess.laps, acess.started, acess.finished from races, acess
	where races.raceid=acess.raceid;
alter table races
	add column laps integer,
	add column started bigint,
	add column finished bigint;
update races
set laps = races2.laps from races2
where races.raceid=races2.raceid;
update races
set started = races2.started from races2
where races.raceid=races2.raceid;
update races
set finished = races2.finished from races2
where races.raceid=races2.raceid;
drop table if exists races2;