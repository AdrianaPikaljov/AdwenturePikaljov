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
