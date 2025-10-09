--35
--votsin andmed aastakuluga tabelist DimCustomer palka eest
select * from DimCustomer;


Select * from  DimCustomer where YearlyIncome > 10000 and YearlyIncome < 70000

--üldise tulu indeksi loomine
create Index IX_tblDimCustomer_YearlyIncome
on DimCustomer(YearlyIncome ASC)

 --indeksi labivaatus
execute sp_helptext DimCustomer

--indeksi kustutamine
 drop index DimCustomer.IX_tblDimCustomer_YearlyIncome

 --36
 --loome tabel
 create table [tblEmployee]
 ([Id] int primary key,
 [Name] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
 )

 --lisame andmed
insert into tblEmployee values(3, 'John', 4500, 'Male', 'New York')
insert into tblEmployee values(1, 'Sam', 2500, 'Male', 'London')
insert into tblEmployee values(4, 'Sara', 5500, 'Female', 'Tokyo')
insert into tblEmployee values(5, 'Todd', 3100, 'Male', 'Toronto')
insert into tblEmployee values(2, 'Pam', 6500, 'Female', 'Sydney')

--kaivitamine
Select * from tblEmployee

--indeksi loomine
--ilmub veateade: Cannot create more than one clustered index on table 'tblEmployee'. Drop the existing clustered index 'PK__tblEmplo__3214EC0781679F29' before creating another.
create clustered index IX_tblEmployee_Name
on tblEmployee(Name)

--kustutame 
--ilmub veateade: An explicit DROP INDEX is not allowed on index 'tblEmployee.PK__tblEmplo__3214EC0781679F29'. It is being used for PRIMARY KEY constraint enforcement.
Drop index tblEmployee.PK__tblEmplo__3214EC0781679F29


--indeksi loomine veergudele gender ja salary
Create Clustered Index IX_tblEmployee_Gender_Salary
on tblEmployee(Gender DESC, Salary ASC)

--indeksi loomine nime jaoks
create NonClustered Index IX_tblEmployee_Name
on tblEmployee(Name)


--37

 create table [tblEmployee2]
 ([Id] int primary key,
 [FirstName] nvarchar(50),
 [LastName] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
 )


 execute sp_helpindex tblEmployee2

insert into tblEmployee2 values(1, 'Mike','Sandoz', 3100, 'Male', 'New York')
insert into tblEmployee2 values(1, 'John','Menco', 6500, 'Male', 'London')

drop index tblEmployee2.PK__tblEmplo__3214EC07C89910EF


--indeksi loomine veeru Id jaoks
create clustered Index IX_tblEmployee_Id
on tblEmployee2(Id)

--esmase võtme kontroll
execute sp_helpindex tblEmployee2;

--veeru Id indeksi kustutamine
drop index tblEmployee2.IX_tblEmployee_Id

--unikaalne indeks, mis tagab, et veerus Name 
--ei esineks korduvaid andmeid
create unique NonClustered Index UIX_tblEmployee_Name
on tblEmployee2(FirstName)

--unikaalse piirangu lisamine veerule City
alter table tblEmployee2
add constraint UQ_tblEmployee_City
Unique NonClustered (City)

--indeksi kontroll
execute sp_helpconstraint tblEmployee2;

--indeks, mis ei luba veerus korduvaid andmeid
Create unique Index IX_tblEmployee_City
On tblEmployee2(City)
with ignore_dup_key

--38
 create table [tblEmployee]
 ([Id] int primary key,
 [FirstName] nvarchar(50),
 [LastName] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
 )

insert into tblEmployee values(1,'Mike', 'Sandoz',4500,'Male', 'New York')
insert into tblEmployee values(2,'Sara', 'Menco',6500,'Female', 'London')
insert into tblEmployee values(3,'John', 'Barber',2500,'Male', 'Sydney')
insert into tblEmployee values(4,'Pam','Grove',3500,'Female', 'Toronto')
insert into tblEmployee values(5,'James', 'Mirch',7500,'Male', 'London')
select * from tblEmployee


create NonClustered Index IX_tblEmployee_Salary
on tblEmployee (Salary ASC)

select * from tblEmployee where Salary > 4000 and Salary < 8000

delete from tblEmployee where Salary = 2500
update tblEmployee Set Salary = 9000 where Salary = 7500

select * from tblEmployee order by Salary
select * from tblEmployee order by Salary desc

select Salary, count(Salary) as Total
from tblEmployee
group by Salary
