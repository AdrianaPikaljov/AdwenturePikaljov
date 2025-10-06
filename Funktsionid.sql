--funktsionid


select * from DimEmployee;


--Tabelisiseväärtusega funktsioon e Inline Table Valued function (ILTVF) koodinäide:

create function fn_ILVF_GetEmployees()

returns table
as
return(select EmployeeKey, FirstName, cast(BirthDate as Date)as DOB
from DimEmployee);

--kaivita funktrsiooni 
select * from fn_ILVF_GetEmployees()
