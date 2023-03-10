USE [master]
GO
/****** Object:  Database [Sale_Management]    Script Date: 26/01/2023 6:16:17 PM ******/
CREATE DATABASE [Sale_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sale_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sale_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sale_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sale_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sale_Management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sale_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sale_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sale_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sale_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sale_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sale_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sale_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sale_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sale_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sale_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sale_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sale_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sale_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sale_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sale_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sale_Management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sale_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sale_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sale_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sale_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sale_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sale_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sale_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sale_Management] SET RECOVERY FULL 
GO
ALTER DATABASE [Sale_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Sale_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sale_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sale_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sale_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sale_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sale_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sale_Management', N'ON'
GO
ALTER DATABASE [Sale_Management] SET QUERY_STORE = OFF
GO
USE [Sale_Management]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 26/01/2023 6:16:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CompanyName] [varchar](40) NOT NULL,
	[City] [varchar](15) NOT NULL,
	[Country] [varchar](15) NOT NULL,
	[Password] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26/01/2023 6:16:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[RequiredDate] [date] NULL,
	[ShippedDate] [date] NULL,
	[Freight] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 26/01/2023 6:16:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26/01/2023 6:16:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [varchar](40) NOT NULL,
	[Weight] [varchar](20) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (2, N'hoa@gmail.com', N'VNU234', N'HN2', N'Vietnamese', N'123456')
INSERT [dbo].[Member] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (3, N'hai2@gmail.com', N'VNU', N'HN25', N'VN222', N'123456789')
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (4, 3, CAST(N'2024-12-14' AS Date), CAST(N'2024-12-18' AS Date), CAST(N'2024-12-14' AS Date), 35.0000)
INSERT [dbo].[Order] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (8, 3, CAST(N'2022-12-25' AS Date), CAST(N'2022-12-26' AS Date), CAST(N'2022-12-27' AS Date), 30.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (5, 4, N'5', N'6', 6.0000, 6)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (7, 6, N'6', N'6', 6.0000, 6)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (8, 8, N'8', N'8', 9.0000, 8)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (10, 12, N'Test', N'12', 12.0000, 12)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (11, 12, N'12', N'12', 12.0000, 12)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (12, 13, N'13', N'13', 13.0000, 13)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
USE [master]
GO
ALTER DATABASE [Sale_Management] SET  READ_WRITE 
GO
