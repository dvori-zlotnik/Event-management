CREATE DATABASE [eventManagement]
GO
USE [eventManagement]
GO
/****** Object:  Table [dbo].[eventItem]    Script Date: 18/03/2024 14:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventItem](
	[eventItemId] [smallint] IDENTITY(1,1) NOT NULL,
	[typeEventId] [smallint] NULL,
	[itemsId] [smallint] NULL,
	[count] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[eventItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[events]    Script Date: 18/03/2024 14:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[events](
	[eventId] [smallint] IDENTITY(1,1) NOT NULL,
	[length] [smallint] NULL,
	[roomId] [smallint] NULL,
	[name] [varchar](20) NULL,
	[cost] [int] NULL,
	[date] [date] NULL,
	[typeEventId] [smallint] NULL,
	[beginning_time] [smallint] NULL,
	[price_of_tietck] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[eventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items]    Script Date: 18/03/2024 14:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items](
	[itemId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roomitems]    Script Date: 18/03/2024 14:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roomitems](
	[roomitemId] [smallint] IDENTITY(1,1) NOT NULL,
	[itemId] [smallint] NULL,
	[count] [smallint] NULL,
	[roomId] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomitemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 18/03/2024 14:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[roomId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[capacity] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typeEvent]    Script Date: 18/03/2024 14:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typeEvent](
	[typeEventId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[typeEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[eventItem] ON 
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (1, 1, 3, 5)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (3, 1, 4, 1)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (4, 2, 1, 1)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (5, 2, 2, 3)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (6, 2, 4, 5)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (7, 2, 5, 2)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (8, 3, 1, 1)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (9, 3, 2, 2)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (10, 3, 5, 1)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (11, 4, 2, 1)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (12, 4, 3, 1)
GO
INSERT [dbo].[eventItem] ([eventItemId], [typeEventId], [itemsId], [count]) VALUES (13, 4, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[eventItem] OFF
GO
SET IDENTITY_INSERT [dbo].[events] ON 
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (43, 5, 4, N'שולי על הבמה', NULL, CAST(N'2024-03-03' AS Date), 2, 19, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (44, 10, 4, N'חתונת הכסף', 20000, NULL, 2, 12, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (46, 10, 4, N'חתונה', 20000, CAST(N'2024-03-03' AS Date), 2, 12, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (57, 1, 1, N'אחותי כלה', 100000, CAST(N'2025-03-04' AS Date), 3, 4, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (62, 3, 1, N'קישוטי סוכה', 1, CAST(N'2025-01-10' AS Date), 4, 19, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (66, 2, 1, N'הרב מנדלזון', NULL, CAST(N'2024-03-04' AS Date), 3, 16, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (67, 4, 1, N'מסיבת שעות', NULL, CAST(N'2024-03-01' AS Date), 3, 16, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (69, 2, NULL, NULL, NULL, CAST(N'2024-03-05' AS Date), 4, 15, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (76, 3, 1, N'כעת חיה', NULL, CAST(N'2024-03-02' AS Date), 3, 10, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (79, 3, 1, N'גולדראש', NULL, CAST(N'2024-03-20' AS Date), 3, 20, NULL)
GO
INSERT [dbo].[events] ([eventId], [length], [roomId], [name], [cost], [date], [typeEventId], [beginning_time], [price_of_tietck]) VALUES (81, 3, 1, N'אירוע מוחי', 1, CAST(N'1900-03-18' AS Date), 3, 12, NULL)
GO
SET IDENTITY_INSERT [dbo].[events] OFF
GO
SET IDENTITY_INSERT [dbo].[items] ON 
GO
INSERT [dbo].[items] ([itemId], [name]) VALUES (1, N'מקרן')
GO
INSERT [dbo].[items] ([itemId], [name]) VALUES (2, N'בוקסה')
GO
INSERT [dbo].[items] ([itemId], [name]) VALUES (3, N'שולחן')
GO
INSERT [dbo].[items] ([itemId], [name]) VALUES (4, N'רמקול')
GO
INSERT [dbo].[items] ([itemId], [name]) VALUES (5, N'מסך')
GO
INSERT [dbo].[items] ([itemId], [name]) VALUES (6, N'מושט')
GO
INSERT [dbo].[items] ([itemId], [name]) VALUES (7, N'טונוש')
GO
SET IDENTITY_INSERT [dbo].[items] OFF
GO
SET IDENTITY_INSERT [dbo].[Roomitems] ON 
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (1, 1, 7, 1)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (2, 2, 4, 1)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (3, 5, 1, 1)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (4, 3, 11, 2)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (5, 4, 203, 2)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (6, 2, 4, 2)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (7, 1, 8, 3)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (8, 2, 5, 3)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (9, 3, 6, 3)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (10, 4, 208, 3)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (11, 5, 3, 3)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (12, 1, 3, 2)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (13, 1, 3, 4)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (14, 1, 3, 5)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (15, 1, 3, 6)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (16, 1, 3, 7)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (17, 1, 3, 8)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (18, 1, 3, 9)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (19, 1, 3, 10)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (20, 1, 3, 11)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (21, 1, 3, 12)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (22, 1, 3, 13)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (23, 4, 201, 1)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (24, 4, 201, 4)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (25, 4, 201, 5)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (26, 4, 201, 6)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (27, 4, 201, 7)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (28, 4, 201, 8)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (29, 4, 201, 9)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (30, 4, 201, 10)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (31, 4, 201, 11)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (32, 4, 201, 12)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (33, 4, 201, 13)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (34, 3, 1, 1)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (35, 3, 1, 4)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (36, 3, 1, 5)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (37, 3, 1, 6)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (38, 3, 1, 7)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (39, 3, 1, 8)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (40, 3, 1, 9)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (41, 3, 1, 10)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (42, 3, 1, 11)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (43, 3, 1, 12)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (44, 3, 1, 13)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (72, 4, 200, 14)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (73, 1, 1, 14)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (74, 2, 1, 4)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (75, 2, 1, 5)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (76, 2, 1, 6)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (77, 2, 1, 7)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (78, 2, 1, 8)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (79, 2, 1, 9)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (80, 2, 1, 10)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (81, 2, 1, 11)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (82, 2, 1, 12)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (83, 2, 1, 13)
GO
INSERT [dbo].[Roomitems] ([roomitemId], [itemId], [count], [roomId]) VALUES (84, 2, 1, 14)
GO
SET IDENTITY_INSERT [dbo].[Roomitems] OFF
GO
SET IDENTITY_INSERT [dbo].[rooms] ON 
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (1, N'שוהם', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (2, N'סביון', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (3, N'נרקיס', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (4, N'קרפיון', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (5, N'חיטה', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (6, N'שעורה', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (7, N'גפן', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (8, N'תאנה', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (9, N'רימון', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (10, N'זית', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (11, N'תמר', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (12, N'ישראל', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (13, N'ביחד ננצח', NULL)
GO
INSERT [dbo].[rooms] ([roomId], [name], [capacity]) VALUES (14, N'ארמונות אור', NULL)
GO
SET IDENTITY_INSERT [dbo].[rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[typeEvent] ON 
GO
INSERT [dbo].[typeEvent] ([typeEventId], [name]) VALUES (1, N'סדנא')
GO
INSERT [dbo].[typeEvent] ([typeEventId], [name]) VALUES (2, N'הופעה')
GO
INSERT [dbo].[typeEvent] ([typeEventId], [name]) VALUES (3, N'הקרנה')
GO
INSERT [dbo].[typeEvent] ([typeEventId], [name]) VALUES (4, N'הרצאה')
GO
SET IDENTITY_INSERT [dbo].[typeEvent] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniqueName]    Script Date: 18/03/2024 14:01:26 ******/
ALTER TABLE [dbo].[events] ADD  CONSTRAINT [uniqueName] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eventItem]  WITH CHECK ADD FOREIGN KEY([itemsId])
REFERENCES [dbo].[items] ([itemId])
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD FOREIGN KEY([roomId])
REFERENCES [dbo].[rooms] ([roomId])
GO
ALTER TABLE [dbo].[events]  WITH CHECK ADD FOREIGN KEY([typeEventId])
REFERENCES [dbo].[typeEvent] ([typeEventId])
GO
ALTER TABLE [dbo].[Roomitems]  WITH CHECK ADD FOREIGN KEY([itemId])
REFERENCES [dbo].[items] ([itemId])
GO
ALTER TABLE [dbo].[Roomitems]  WITH CHECK ADD FOREIGN KEY([roomId])
REFERENCES [dbo].[rooms] ([roomId])
GO
