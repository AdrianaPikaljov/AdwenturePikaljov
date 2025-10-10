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