USE [master]
GO
/****** Object:  Database [PRJ_project]    Script Date: 03/02/2022 00:21:15 ******/
CREATE DATABASE [PRJ_project] ON  PRIMARY 
( NAME = N'PRJ_project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PRJ_project.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PRJ_project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PRJ_project_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Tables]    Script Date: 03/02/2022 00:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 03/02/2022 00:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[People] [int] NULL,
	[Message] [nvarchar](150) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 03/02/2022 00:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[Table] [int] NOT NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dishes]    Script Date: 03/02/2022 00:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dishes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[Price] [float] NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [bit] NOT NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/02/2022 00:21:16 ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 03/02/2022 00:21:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nchar](30) NOT NULL,
	[Password] [nchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Default [DF__Dishes__Status__03317E3D]    Script Date: 03/02/2022 00:21:16 ******/
ALTER TABLE [dbo].[Dishes] ADD  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Check [CK__Reservati__Statu__0BC6C43E]    Script Date: 03/02/2022 00:21:16 ******/
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD CHECK  (([Status]=(2) OR [Status]=(1) OR [Status]=(0)))
GO
/****** Object:  Check [CK__Orders__Status__108B795B]    Script Date: 03/02/2022 00:21:16 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([Status]=(1) OR [Status]=(0)))
GO
/****** Object:  Check [CK__Dishes__Price__023D5A04]    Script Date: 03/02/2022 00:21:16 ******/
ALTER TABLE [dbo].[Dishes]  WITH CHECK ADD CHECK  (([Price]>(0)))
GO
