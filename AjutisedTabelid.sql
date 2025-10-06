--34
--Local Temporary tabel
create table #PersonDetails1(Id int, Name nvarchar(20))
insert into #PersonDetails1 values(1, 'Mike')
insert into #PersonDetails1 values (2, 'John')
insert into #PersonDetails1 values (3, 'Todd')
select * from #PersonDetails1

--sysobjects käsuga TEMPDB alt
Select name from tempdb..sysobjects
where name like '#PersonDetails1%'


--tabeli kustutamine
drop table #PersonDetails1

--loome salvestatud protseduuri lokaalse ajutise tabeli nimega #PersonDetails1
Create procedure spCreateLocalTempTable
as
begin
Create table #PersonDetails1(Id int, Name nvarchar(20))
insert into #PersonDetails1 values(1, 'Mike')
insert into #PersonDetails1 values (2, 'John')
insert into #PersonDetails1 values (3, 'Todd')
select * from #PersonDetails1
end

--käivitamine
exec spCreateLocalTempTable;