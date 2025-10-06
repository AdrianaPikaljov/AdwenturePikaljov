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
