--tabeli loomine
create table Sales (
  Product nvarchar(50),
  SaleAmount int)

insert into Sales values ('Iphone', 500)
insert into Sales values ('Laptop', 800)
insert into Sales values ('Iphone', 1000)
insert into Sales values ('Speakers', 400)
insert into Sales values ('Laptop', 600)

--müügimaht kokku kahanevas järjekorras
select Product, Sum(SaleAmount) as TotalSales
from Sales
Group by Product

--kus müük kokku on suurem kui 1000€
select Product, Sum(SaleAmount) as TotalSales
from Sales
Group by Product
Having Sum(SaleAmount) > 1000

--süntaksivea
select Product, SUM (SaleAmount) as TotalSales
from Sales
Group by Product
WHERE Sum(SaleAmount) > 1000

--mis näitavad summat ning eemaldavad kõik tooted peale iPhone-i ja Speakerite
select Product, SUM (SaleAmount) as TotalSales
from Sales
where Product in ('Iphone', 'Speakers')
Group by Product

--kõik read Sales tabelis, mis näitavad summat ning eemaldavad kõik 
--tooted peale iPhone-i ja Speakerite
select Product, SUM (SaleAmount) as TotalSales
from Sales
Group by Product
where Product in ('Iphone', 'Speakers')

