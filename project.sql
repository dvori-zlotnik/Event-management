--הפרויקט!!
--1
--החדרים עם הכי הרבה אירועים בחודש האחרון
select rooms.name from rooms
where roomId in
(select roomId from events	
where month(date)=MONTH(getdate())
group by roomId
having COUNT(*)in
(
select top 1 COUNT(*) as a from events 
where month(date)=MONTH(getdate())
group by roomId
order by a desc)
)

--2
-- שליפה של שם האירוע, מחיר לכרטיס ובאיזה חלק של היום  
select events.name ,price_of_tietck ,
case 
when beginning_time <13 then 'בוקר'+' '+left(rooms.name,3)
when beginning_time >13 and beginning_time <19 then 'צהרים'+' '+left(rooms.name,3)
when beginning_time >19 then 'ערב'+' '+left(rooms.name,3)
else 'לא ידוע'
end 'part_of_day'
from events join rooms
on events.roomId=rooms.roomId

--3
-- שליפה של האירוע הראשון בכל יום 
select name,beginning_time,date from
(Select *, Row_number() over(partition by date order by beginning_time) as RN
from events
)q1
where RN=1

--4
--פונקציה שמקבלת שתי קודי אביזר ומחזירה את פרטי החדרים שקיימים בהם שני האביזרים
alter function itemsInRoom(@item1 smallint,@item2 smallint)
returns table
as
return (select rooms.* from rooms join Roomitems
on rooms.roomId=Roomitems.roomId
where itemId=@item1
intersect
select rooms.* from rooms join Roomitems
on rooms.roomId=Roomitems.roomId
where itemId=@item2)
go

--5
--פונקציה שמקבלת חדר וזמן ובודקת האם החדר פנוי
alter function ifEmpty2 
(@roomId smallint,@date date,@begining_time smallint,@end_time smallint) 
returns smallint
begin
declare @boolean smallint
set @boolean =0
if exists (select * from events where roomId=@roomId and date=@date and 
(beginning_time>=@begining_time and beginning_time<=@end_time 
or beginning_time+length >= @begining_time and beginning_time+length<= @end_time))
set @boolean =1
return @boolean
end
go


--6
-- פונקציה שמקבלת סוג אירוע תאריך ושעה ומוצאת חדר 
alter function machRoom
(@typeEventId smallint,@date date,@beginning_time smallint,@end_time smallint)
returns smallint
begin
declare @itemsForEvent smallint
select @itemsForEvent= count(*) from 
(select * from eventItem where typeEventId=@typeEventId)q1
declare @roomId smallint
set @roomId=1
declare @boolean smallint
set @boolean=0
While (@roomId<(select count(*) from rooms) and @boolean=0)
begin
declare @itemsInRoom smallint
select @itemsInRoom= count(*) from
 (select itemsId,itemId
from eventItem join Roomitems
on itemsId=itemId and eventItem.count<=Roomitems.count
where typeEventId=@typeEventId
and roomitems.roomId=@roomId)q2
if @itemsForEvent=@itemsInRoom and
dbo.ifEmpty2(@roomId,@date,@beginning_time,@end_time)=0
set @boolean=1
break
set @roomId=@roomId+1
end
if @boolean=1
return @roomId
return -1
end
go

 --7
 --טריגר שמןפעל בעת הוספת אירוע, 
 -- הטריגר שולח את פרטי האירוע לפונקציה שמחפשת
alter trigger add_event on events for insert
as
begin
declare @typeEventId smallint
declare @date date
declare @beginning_time smallint
declare @end smallint
declare @name varchar(20)
select @name=name from inserted
select @typeEventId=typeEventId from inserted
select @date=date from inserted 
select @beginning_time=beginning_time from inserted 
select @end=beginning_time+length from inserted
declare @roomId smallint
set @roomId=dbo.machRoom(@typeEventId,@date,@beginning_time,@end)
if @roomId=-1
rollback
else
update events set roomId=@roomId where name=@name
end
go

--8
--טבלה שנשלחת מדי שבוע לפרסום
alter view forAdvertisement
as
select events.name,rooms.name as roomName,date,beginning_time,price_of_tietck
from events join rooms
on events.roomId=rooms.roomId
where date>GETDATE() and date<GETDATE()+7
-----------------------------------------------
 select * from forAdvertisement


--9
--פרוצדורה שמקבלת קוד חדר וקוד פריט.
-- אם הפריט קיים מוסיפה אחד לכמות, ואם לא מוסיפה שורה
alter PROCEDURE addItem(@itemId smallint ,@roomId smallint) as
begin
if exists(select roomId from Roomitems where itemId=@itemId and roomId=@roomId)
update Roomitems set count=count+1
where roomId = @roomId and itemId = @itemId
else
insert into Roomitems Values(@itemId,1,@roomId)
end
go

--10
--הסמן עובר על כל החדרים עבור כל חדר מוסיף פריט 
--ומדפיס את כל הפריטים הנמצאים בחדר לאחר ההוספה
-- סמן פנימי שעובר על כל הפריטים מטבלת roomItem 
declare @roomId smallint
declare @name varchar(10)
declare addItemEachRoom  cursor
FOR SELECT roomId,name from rooms
Open addItemEachRoom
Fetch next from addItemEachRoom Into @roomId,@name
While @@fetch_status=0
Begin
exec addItem 2,@roomId
print @name
declare @itemId smallint
declare @count smallint
DECLARE printItems  CURSOR
FOR SELECT itemId,count from Roomitems 
where roomId=@roomId
Open printItems
Fetch next from printItems Into @itemId,@count
While @@fetch_status=0
Begin
declare @itemIdCount varchar(20)
select @itemIdCount =  name from items where itemId=@itemId
set @itemIdCount=@itemIdCount+' '
set @itemIdCount= @itemIdCount+CAST(@count AS varchar(12))
print @itemIdCount
Fetch next from printItems
Into @itemId,@count
End
Close printItems
Deallocate printItems
Fetch next from addItemEachRoom
Into  @roomId,@name
End
Close addItemEachRoom
Deallocate addItemEachRoom