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


--93

create trigger tr_DatabaseScopeTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop a table in the current database'
end


create trigger tr_ServerScopeTrigger
on all server
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
rollback
print 'You cannot create, alter or drop a table in any database on the server'
end

disable trigger tr_ServerScopeTrigger on all server


enable trigger tr_ServerScopeTrigger on all server


drop trigger tr_ServerScopeTrigger on all server
