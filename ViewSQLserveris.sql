--39
drop table tblEmployee
 create table [tblEmployee]
 ([Id] int primary key,
 [Name] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 DepartmentId int
 )

create table tblDepartment(
Deptld int primary key,
DeptName nvarchar(20)
)
insert into tblDepartment values (1, 'IT')
insert into tblDepartment values (2, 'Payroll')
insert into tblDepartment values (3, 'HR')
insert into tblDepartment values (4, 'Admin')

insert into tblEmployee values (1, 'John', 5000, 'Male', 3)
insert into tblEmployee values (2, 'Mike', 3400, 'Male', 2)
insert into tblEmployee values (3, 'Pam', 6000, 'Female', 1)
insert into tblEmployee values (4, 'Todd', 4800, 'Male', 4)
insert into tblEmployee values (5, 'Sara', 3200, 'Female', 1)
insert into tblEmployee values (6, 'Ben', 4800, 'Male', 3)

select * from tblEmployee,tblDepartment

Select Id, Name,Salary,Gender,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Deptld


create view vWEmployeesByDepartment
as
Select Id, Name, Salary, Gender,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Deptld

select * from vWEmployeesByDepartment

create view vWITDepartment_Employees
as 
Select Id, Name, Salary, Gender,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Deptld
where tblDepartment.DeptName = 'IT'

select * from vWITDepartment_Employees

create view vWEmployeesNonConfidentialData
as 
Select Id, Name, Gender,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Deptld

select * from vWEmployeesNonConfidentialData

create view vWEmployeesCountByDepartment
as 
Select DeptName, Count(Id) as totalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Deptld
group by DeptName

select * from vWEmployeesCountByDepartment


--40
create view vWEmployeesDataExceptSalary
as
Select Id,Name,Gender,DepartmentId
from tblEmployee

select * from vWEmployeesDataExceptSalary


update vWEmployeesDataExceptSalary
set Name = 'Adri' where Id = 2

delete from vWEmployeesDataExceptSalary where Id = 2
insert into vWEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2)

create view vwEmployeesDetailsByDepartment
as 
Select Id, Name, Salary, Gender,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Deptld

select * from vwEmployeesDetailsByDepartment

update vwEmployeesDetailsByDepartment
set DeptName = 'IT' where Name = 'John'

