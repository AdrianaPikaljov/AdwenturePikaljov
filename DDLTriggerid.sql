--92
create trigger [Trigger_Name]
on [Scope(Server|Database)]
for[EventType1,EventType2,EventType3, ..],
as 
begin
--trigger body
end

create trigger trMyFirstTrigger
on Database
for Create_Table
as
begin
print 'new table created'
end

create table Test (Id int)

alter trigger trMyFirstTrigger
on Database
for create_table,alter_table,drop_table
as
begin
print 'a table has just been created, modified or deleted'
end

alter trigger trMyFirstTrigger
on Database
for create_table,alter_table,drop_table
as
begin
rollback
print 'a table has just been created, modified or deleted'
end

disable trigger trMyFirstTrigger on database

drop trigger trMyFirstTrigger on database

create trigger trRenameTable
on database 
for rename 
as begin
print 'you just renamed sm'
end
