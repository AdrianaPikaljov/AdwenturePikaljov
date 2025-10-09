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