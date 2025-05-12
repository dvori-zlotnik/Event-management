USE [eventManagement]
GO
/****** Object:  UserDefinedFunction [dbo].[ifEmpty]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE function [dbo].[ifEmpty]
(@date date,@begining_time smallint,@length smallint, @roomId smallint)
returns smallint
AS
begin
declare @boolean smallint
declare @begin2 smallint
declare @end2 smallint
declare @n smallint
Set @n=1
set @boolean=1
While (select count(*) from roomsInSameDate(@date,@roomId))>=@n
Begin
select @begin2=beginning_time from events where eventId=@n
select @end2=beginning_time+length from events where eventId=@n
if(@begin2 > @begining_time and @end2<@begining_time+@length or 
@begin2 < @begining_time and @end2>@begining_time) 
Begin
set @boolean=0
Break
End
Else
Set @n=@n+1
End
return @boolean
end
GO
/****** Object:  UserDefinedFunction [dbo].[ifEmpty1]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ifEmpty2]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ifEmpty2] 
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
GO
/****** Object:  UserDefinedFunction [dbo].[machRoom]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[machRoom]
(@typeEventId smallint,@date date,@beginning_time smallint,@end_time smallint)
returns smallint
begin
declare @roomId smallint
set @roomId=1
declare @boolean smallint
set @boolean=0
While (@roomId<(select count(*) from rooms) and @boolean=0)
begin
declare @itemsForEvent smallint
declare @itemsInRoom smallint
select @itemsForEvent= count(*) from (select * from eventItem where typeEventId=@typeEventId)q1
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
GO
/****** Object:  UserDefinedFunction [dbo].[firstEvent]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[firstEvent]()
returns table
as
return (select name,beginning_time,date from
(Select *, Row_number() over(partition by date order by beginning_time) as RN
from events
)q1
where RN=1)
GO
/****** Object:  UserDefinedFunction [dbo].[item_in_room]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------project

/****** Object:  UserDefinedFunction [dbo].[itemsInRoom]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[itemsInRoom](@item1 smallint,@item2 smallint)
returns table
as
return (select rooms.* from rooms join Roomitems
on rooms.roomId=Roomitems.roomId
where itemId=@item1
intersect
select rooms.* from rooms join Roomitems
on rooms.roomId=Roomitems.roomId
where itemId=@item2)
GO
/****** Object:  UserDefinedFunction [dbo].[max_events]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[max_events](@date date)
returns table
as
return(select rooms.name from rooms
where roomId in
(select roomId from events	
where month(date)=MONTH(@date)
group by roomId
having COUNT(*)in
(
select top 1 COUNT(*) as a from events 
where month(date)=MONTH(getdate())
group by roomId
order by a desc)
))
GO
/****** Object:  UserDefinedFunction [dbo].[part_of_day]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[part_of_day]()
returns table
as
 return (select events.name ,price_of_tietck ,
case 
when beginning_time <13 then 'בוקר'+' '+left(rooms.name,3)
when beginning_time >13 and beginning_time <19 then 'צהרים'+' '+left(rooms.name,3)
when beginning_time >19 then 'ערב'+' '+left(rooms.name,3)
else 'לא ידוע'
end 'part_of_day'
from events join rooms
on events.roomId=rooms.roomId)
GO
/****** Object:  UserDefinedFunction [dbo].[roomsInSameDate]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[forAdvertisement]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[forAdvertisement]
as
select events.name,rooms.name as roomName,date,beginning_time,price_of_tietck
from events join rooms
on events.roomId=rooms.roomId
where date>GETDATE() and date<GETDATE()+7
GO
/****** Object:  StoredProcedure [dbo].[addItem]    Script Date: 18/03/2024 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addItem](@itemId smallint ,@roomId smallint) as
begin
if exists(select roomId from Roomitems where itemId=@itemId and roomId=@roomId)
update Roomitems set count=count+1
where roomId = @roomId and itemId = @itemId
else
insert into Roomitems Values(@itemId,1,@roomId)
--delete from Roomitems where itemId=@itemId
end
GO
