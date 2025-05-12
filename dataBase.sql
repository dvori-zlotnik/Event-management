create database eventManagement 

use eventManagement
create table  typeEvent
( typeEventId smallint identity(1,1) primary key ,
name varchar(15)
) 
use eventManagement
create table rooms 
(roomId smallint identity(1,1) primary key ,
name varchar(20),
date date,
capacity smallint,
beginning_time smallint,
 roomItemId smallint)
 go
 create table items 
(itemId smallint identity(1,1) primary key ,
name varchar(20),
)

 go
 use eventManagement
create table Roomitems 
(roomitemId smallint identity(1,1) primary key ,
itemId smallint references items,
count smallint,
roomId smallint references rooms
)
go
use eventManagement
create table events 
(eventId smallint identity(1,1) primary key ,
length smallint ,
roomId smallint references rooms,
name varchar(20),
cost int,
date date,
typeEventId smallint references typeEvent,
beginning_time smallint,
price_of_tietck smallint)
go

 use eventManagement

  go
 use eventManagement
create table eventItem 
(eventItemId smallint identity(1,1) primary key ,
 typeEventId smallint references typeEvent,
 itemsId smallint references items,
count smallint,
roomId smallint references rooms
)


