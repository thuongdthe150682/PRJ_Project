USE [master]
GO
/****** Object:  Database [PRJ_project]    Script Date: 03/24/2022 10:42:38 ******/
CREATE DATABASE [PRJ_project] ON  PRIMARY 
( NAME = N'PRJ_project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PRJ_project.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PRJ_project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PRJ_project_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PRJ_project] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ_project] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PRJ_project] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PRJ_project] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PRJ_project] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PRJ_project] SET ARITHABORT OFF
GO
ALTER DATABASE [PRJ_project] SET AUTO_CLOSE ON
GO
ALTER DATABASE [PRJ_project] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PRJ_project] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PRJ_project] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PRJ_project] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PRJ_project] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PRJ_project] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PRJ_project] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PRJ_project] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PRJ_project] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PRJ_project] SET  ENABLE_BROKER
GO
ALTER DATABASE [PRJ_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PRJ_project] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PRJ_project] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PRJ_project] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PRJ_project] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PRJ_project] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PRJ_project] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PRJ_project] SET  READ_WRITE
GO
ALTER DATABASE [PRJ_project] SET RECOVERY SIMPLE
GO
ALTER DATABASE [PRJ_project] SET  MULTI_USER
GO
ALTER DATABASE [PRJ_project] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PRJ_project] SET DB_CHAINING OFF
GO
USE [PRJ_project]
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 03/24/2022 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tables] ON
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (1, N'Table A1', 0)
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (2, N'Table A2', 1)
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (3, N'Table A3', 1)
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (4, N'Table A4', 1)
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (5, N'Table A5', 1)
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (6, N'Table A6', 0)
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (7, N'Table A7', 1)
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (8, N'Table A8', 1)
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (9, N'Table A9', 1)
INSERT [dbo].[Tables] ([Id], [Name], [Status]) VALUES (10, N'Table A10', 1)
SET IDENTITY_INSERT [dbo].[Tables] OFF
/****** Object:  Table [dbo].[Staff]    Script Date: 03/24/2022 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[UserName] [nchar](15) NOT NULL,
	[FirstName] [nchar](15) NOT NULL,
	[LastName] [nchar](15) NOT NULL,
	[DOB] [date] NOT NULL,
	[Address] [nchar](50) NOT NULL,
	[Phone] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Staff] ([UserName], [FirstName], [LastName], [DOB], [Address], [Phone]) VALUES (N'ha123          ', N'thuong         ', N'duong          ', CAST(0x3A240B00 AS Date), N'KC,HN                                             ', N'0386018771     ')
INSERT [dbo].[Staff] ([UserName], [FirstName], [LastName], [DOB], [Address], [Phone]) VALUES (N'ma123          ', N'Thu            ', N'Thuy           ', CAST(0x01270B00 AS Date), N'KC,HY                                             ', N'0321345632     ')
INSERT [dbo].[Staff] ([UserName], [FirstName], [LastName], [DOB], [Address], [Phone]) VALUES (N'ta123          ', N'thuong         ', N'duong          ', CAST(0xA7250B00 AS Date), N'KC,HY                                             ', N'0386018771     ')
/****** Object:  Table [dbo].[Reservation]    Script Date: 03/24/2022 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[People] [int] NULL,
	[Message] [nvarchar](300) NULL,
	[Staff] [nchar](15) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__Reservat__3214EC274D94879B] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Reservation] ON
INSERT [dbo].[Reservation] ([ID], [Name], [Date], [Time], [Phone], [People], [Message], [Staff], [Status]) VALUES (1, N'thuong', CAST(0xB8430B00 AS Date), CAST(0x0700BED6386E0000 AS Time), N'123456789', 5, N'', N'ha123          ', 1)
INSERT [dbo].[Reservation] ([ID], [Name], [Date], [Time], [Phone], [People], [Message], [Staff], [Status]) VALUES (5, N'thuong', CAST(0xD4430B00 AS Date), CAST(0x0700000000000000 AS Time), N'0386018771', 6, N'', N'ha123          ', 1)
INSERT [dbo].[Reservation] ([ID], [Name], [Date], [Time], [Phone], [People], [Message], [Staff], [Status]) VALUES (6, N'Hai', CAST(0xB4430B00 AS Date), CAST(0x0700000000000000 AS Time), N'0321273244', 4, N'', N'ha123          ', 1)
INSERT [dbo].[Reservation] ([ID], [Name], [Date], [Time], [Phone], [People], [Message], [Staff], [Status]) VALUES (7, N'Anh', CAST(0xB8430B00 AS Date), CAST(0x0700CAD152890000 AS Time), N'0333222111', 6, N'', NULL, 0)
INSERT [dbo].[Reservation] ([ID], [Name], [Date], [Time], [Phone], [People], [Message], [Staff], [Status]) VALUES (8, N'Thu', CAST(0xC4430B00 AS Date), CAST(0x0700000000000000 AS Time), N'0386018771', 5, N'', NULL, 0)
INSERT [dbo].[Reservation] ([ID], [Name], [Date], [Time], [Phone], [People], [Message], [Staff], [Status]) VALUES (12, N'thuong', CAST(0xBD430B00 AS Date), CAST(0x0700000000000000 AS Time), N'0386018771', 2, N'', N'ma123          ', 1)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 03/24/2022 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Starter')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Main course')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Side dish')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Dessert')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Cold starter')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Cheese and biscuits')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 03/24/2022 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nchar](15) NOT NULL,
	[Password] [nchar](15) NOT NULL,
	[IsManage] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [IsManage]) VALUES (N'ha123          ', N'ha123@123      ', 1)
INSERT [dbo].[Account] ([Username], [Password], [IsManage]) VALUES (N'ma123          ', N'ma@123         ', 0)
INSERT [dbo].[Account] ([Username], [Password], [IsManage]) VALUES (N'man123         ', N'man@123        ', 0)
INSERT [dbo].[Account] ([Username], [Password], [IsManage]) VALUES (N'na123          ', N'na@123         ', 1)
INSERT [dbo].[Account] ([Username], [Password], [IsManage]) VALUES (N'ta123          ', N'ta@123         ', 0)
/****** Object:  Table [dbo].[TablesStatus]    Script Date: 03/24/2022 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablesStatus](
	[Id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[TimeStart] [time](7) NOT NULL,
	[TimeEnd] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dishes]    Script Date: 03/24/2022 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dishes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Price] [float] NOT NULL,
	[Image] [nvarchar](700) NOT NULL,
	[Status] [bit] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK__Dishes__3214EC0700551192] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dishes] ON
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (1, N'Fried Catfish Sandwiches', N'Tender catfish fillets marinate briefly in garlic and pepper before being breaded and fried and extra-crispy fried catfish sandwiches. ', 30, N'Images/1.png', 1, 2)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (2, N'Peppercorn Roast Beef ', N'Beef spread with peppercorns, salt, mustard, and rosemary leaves. An overnight cold tenderizes the meat and also dries the outside of the roast nicely, helping to create a crispy crust after roasting. ', 50, N'Images/2.png', 1, 2)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (3, N'Roast chicken', N'The chicken is juicy and spicy, a combination sterling achieves by brining the bird and then applying a marinade of sharp mustard and roasted garlic.', 60, N'Images/3.png', 1, 2)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (4, N'Kung pao chicken ', N'A heavy dose of spice that''s balanced with a bit of sweetness. There are tons of peanuts involved, and they play especially well with the vibrant Szechuan peppercorns and crunchy bits of garlic.', 40, N'Images/4.png', 1, 2)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (5, N'Chicken soup', N'A soup made with shredded chicken, turmeric, vermicelli noodles, cabbage, and a hard-boiled egg. ', 30, N'Images/5.png', 0, 1)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (6, N'Taro Balls with grass jelly', N'Taro balls have the QQ texture, along with the flavors of taro and sweet potato. ', 20, N'Images/6.png', 1, 4)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (7, N'Tofu Pudding', N'Besides being a sweet dessert, is enjoyed as a savory. It creates this unbeatable melt-in-the-mouth. ', 20, N'Images/7.png', 1, 4)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (8, N'Milk Tea with Grass Jelly', N'A sweet milky dessert beverage with bouncy grass jelly cubes.', 20, N'Images/8.png', 1, 4)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (9, N'Beef Noodle Soup', N'Pho is white, soft, soaked in hot broth, beef encrusted with soft, fragrant.', 20, N'Images/9.png', 1, 2)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (13, N'Roast lamb', N'Lamb shoulder roasted Herbs garlic-rosemary-thyme combination. ', 60, N'Images/10.png', 1, 2)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (15, N'Roasted Asparagus', N'Roasted Asparagus spears in lightly seasoned lemon butter with parmesan cheese which is very healthy vegetable.', 10, N'Images/11.png', 1, 3)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (16, N'Smoked Chicken', N'Very tender Smoked Chicken - perfect protein for meal prep.', 50, N'Images/12.png', 1, 2)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (17, N'Summer Asian Slaw', N'A tahini miso dressing gives it a creamy umami coating, while peaches add juicy pops of sweetness, with toasted pepitas for crunch.', 20, N'Images/13.png', 1, 3)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (18, N'Raw Salted Salmon', N'Raw Salted Salmon Slices and Cucumberrrrrrrrrrrrrrr', 20, N'Images/14.png', 1, 1)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (20, N'Prawn Salad', N'Prawn salad recipe a little twist, I add a splash of gin with a good squeeze of lime juice but dialling up the flavours with chilli flakes, crushed garlic and coriander roots.', 10, N'Images/15.png', 1, 1)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (21, N'Champion Beer', N'With a rich, strong flavour and unique sweet and fruity character, Champion is a firm favourite in the McEwan''s range. ', 5, N'Images/16.png', 1, 5)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (22, N'Heineken Lager Beer', N'a pale lager beer with 5% alcohol', 5, N'Images/17.png', 1, 5)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (23, N'Coca Cola', N'Enjoy Coca-Cola’s crisp, delicious taste with meals', 4, N'Images/18.png', 1, 5)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (24, N'7UP', N'Get your mood up with this energetic drink', 4, N'Images/19.png', 1, 5)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (25, N'Turkey Burgers ', N'Improve upon your love of avocado toast by smashing it on a juicy turkey burger.', 20, N'Images/20.png', 1, 6)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (27, N'Grilled Cheese Sandwich', N'Nothing is more comforting than a hot, melty grilled cheese sandwich. Grilled cheese and tomato soup are a combo made in heaven.', 30, N'Images/21.png', 1, 2)
INSERT [dbo].[Dishes] ([Id], [Name], [Description], [Price], [Image], [Status], [CategoryID]) VALUES (28, N'Mr Deleted', N'aaaaaaaaaaaaa', 20, N'https://www.google.com.vn/url?sa=i&url=https%3A%2F%2Fwww.healthline.com%2Fnutrition%2F50-super-healthy-foods&psig=AOvVaw3zHvz7HF_eoBKGuSzkFB8v&ust=1648177547352000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCODqmv3h3fYCFQAAAAAdAAAAABAD', 1, 1)
SET IDENTITY_INSERT [dbo].[Dishes] OFF
/****** Object:  Table [dbo].[Orders]    Script Date: 03/24/2022 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[Table] [int] NOT NULL,
	[EndTime] [time](7) NULL,
	[ReserveID] [int] NULL,
 CONSTRAINT [PK__Orders__3214EC070EA330E9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (2, CAST(0xB1430B00 AS Date), CAST(0x0780A9E02EC60000 AS Time), 1, CAST(0x0780A36364820000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (5, CAST(0xB2430B00 AS Date), CAST(0x0780064E14AD0000 AS Time), 10, CAST(0x0780D04BE6720000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (6, CAST(0xB2430B00 AS Date), CAST(0x0700CB3F8BBE0000 AS Time), 4, CAST(0x07806869FF030000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (7, CAST(0xB3430B00 AS Date), CAST(0x0700B063F6720000 AS Time), 2, CAST(0x0700EBBBFE720000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (8, CAST(0xB3430B00 AS Date), CAST(0x0780CAD30E730000 AS Time), 8, CAST(0x078040841F730000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (9, CAST(0xB3430B00 AS Date), CAST(0x07808CBF1A730000 AS Time), 6, CAST(0x07007DBA1D730000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (10, CAST(0xB5430B00 AS Date), CAST(0x070063B681BE0000 AS Time), 1, CAST(0x0700CB3F8BBE0000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (11, CAST(0xB5430B00 AS Date), CAST(0x07802DD750C00000 AS Time), 7, CAST(0x0700E721A2040000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (12, CAST(0xB6430B00 AS Date), CAST(0x0780C595140B0000 AS Time), 4, CAST(0x0700E3C1180B0000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (13, CAST(0xB6430B00 AS Date), CAST(0x0780A76A100D0000 AS Time), 6, CAST(0x0700E9FF49C70000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (14, CAST(0xB6430B00 AS Date), CAST(0x07007C2A1F580000 AS Time), 5, CAST(0x07008F9D47C70000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (15, CAST(0xBB430B00 AS Date), CAST(0x0700D03F44010000 AS Time), 1, CAST(0x078053B184BE0000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (16, CAST(0xBB430B00 AS Date), CAST(0x0780577529110000 AS Time), 3, CAST(0x070090E782BE0000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (17, CAST(0xBB430B00 AS Date), CAST(0x07808881575F0000 AS Time), 5, CAST(0x0700368580BE0000 AS Time), NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (18, CAST(0xBC430B00 AS Date), CAST(0x0780CC77E3C00000 AS Time), 1, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Date], [StartTime], [Table], [EndTime], [ReserveID]) VALUES (19, CAST(0xBC430B00 AS Date), CAST(0x07809C8AF6C00000 AS Time), 6, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  Table [dbo].[Order_Dish]    Script Date: 03/24/2022 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Dish](
	[OrderID] [int] NOT NULL,
	[DishID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[DishID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (2, 1, 3, 40)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (5, 2, 2, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (5, 3, 1, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (5, 8, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (5, 18, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (6, 2, 1, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (6, 3, 1, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (6, 18, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (6, 20, 2, 10)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (7, 2, 2, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (7, 3, 1, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (7, 4, 2, 40)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (7, 7, 2, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (7, 8, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (7, 13, 1, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (7, 16, 1, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (7, 24, 1, 4)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (8, 3, 2, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (8, 4, 2, 40)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (8, 6, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (8, 7, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (8, 9, 2, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (8, 24, 2, 4)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (9, 2, 2, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (9, 3, 2, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (9, 4, 1, 40)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (9, 8, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (9, 17, 2, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (9, 18, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (9, 25, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (10, 1, 3, 30)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (10, 2, 2, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (10, 13, 2, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (10, 16, 1, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (10, 17, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (10, 18, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (11, 3, 3, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (11, 4, 2, 40)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (11, 8, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (11, 9, 2, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (11, 15, 2, 10)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (11, 17, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (11, 23, 1, 4)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (12, 1, 3, 30)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (12, 2, 2, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (12, 3, 1, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (12, 8, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (12, 15, 1, 10)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (12, 27, 1, 30)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (13, 1, 3, 30)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (13, 2, 3, 30)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (13, 8, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (13, 13, 1, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (13, 17, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (14, 2, 3, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (14, 3, 2, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (14, 4, 2, 40)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (14, 6, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (15, 3, 1, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (15, 9, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (15, 13, 1, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (15, 17, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (16, 2, 3, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (16, 15, 4, 10)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (16, 21, 8, 5)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (16, 23, 1, 4)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (17, 2, 5, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (17, 3, 8, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (17, 4, 1, 44)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (17, 9, 1, 22)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (17, 13, 2, 61)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (17, 18, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (17, 20, 1, 10)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (18, 2, 3, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (18, 3, 2, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (18, 16, 1, 50)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (18, 27, 1, 30)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (19, 1, 7, 30)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (19, 3, 2, 60)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (19, 18, 1, 20)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (19, 20, 1, 10)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (19, 21, 2, 5)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (19, 24, 1, 111)
INSERT [dbo].[Order_Dish] ([OrderID], [DishID], [Quantity], [Price]) VALUES (19, 28, 1, 20)
/****** Object:  Default [DF__Reservati__Statu__4F7CD00D]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Reservation] ADD  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__Dishes__Status__03317E3D]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Dishes] ADD  CONSTRAINT [DF__Dishes__Status__03317E3D]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Check [CK__Dishes__Price__023D5A04]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Dishes]  WITH CHECK ADD  CONSTRAINT [CK__Dishes__Price__023D5A04] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Dishes] CHECK CONSTRAINT [CK__Dishes__Price__023D5A04]
GO
/****** Object:  Check [CK__Order_Dis__Price__46E78A0C]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Order_Dish]  WITH CHECK ADD CHECK  (([Price]>=(0)))
GO
/****** Object:  Check [CK__Order_Dis__Quant__45F365D3]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Order_Dish]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
/****** Object:  ForeignKey [FK_TablesStatus_Tables]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[TablesStatus]  WITH CHECK ADD  CONSTRAINT [FK_TablesStatus_Tables] FOREIGN KEY([Id])
REFERENCES [dbo].[Tables] ([Id])
GO
ALTER TABLE [dbo].[TablesStatus] CHECK CONSTRAINT [FK_TablesStatus_Tables]
GO
/****** Object:  ForeignKey [FK_Dishes_Category]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Dishes]  WITH CHECK ADD  CONSTRAINT [FK_Dishes_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Dishes] CHECK CONSTRAINT [FK_Dishes_Category]
GO
/****** Object:  ForeignKey [FK_Orders_Reservation]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Reservation] FOREIGN KEY([ReserveID])
REFERENCES [dbo].[Reservation] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Reservation]
GO
/****** Object:  ForeignKey [FK_Orders_Tables]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Tables] FOREIGN KEY([Table])
REFERENCES [dbo].[Tables] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Tables]
GO
/****** Object:  ForeignKey [FK_Order_Dish_Dishes]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Order_Dish]  WITH CHECK ADD  CONSTRAINT [FK_Order_Dish_Dishes] FOREIGN KEY([DishID])
REFERENCES [dbo].[Dishes] ([Id])
GO
ALTER TABLE [dbo].[Order_Dish] CHECK CONSTRAINT [FK_Order_Dish_Dishes]
GO
/****** Object:  ForeignKey [FK_Order_Dish_Orders]    Script Date: 03/24/2022 10:42:39 ******/
ALTER TABLE [dbo].[Order_Dish]  WITH CHECK ADD  CONSTRAINT [FK_Order_Dish_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Order_Dish] CHECK CONSTRAINT [FK_Order_Dish_Orders]
GO
