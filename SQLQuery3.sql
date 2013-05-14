USE [NTB]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05/14/2013 16:00:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](250) NOT NULL,
	[price] [float] NOT NULL,
	[status] [nvarchar](50) NULL,
	[area] [float] NOT NULL,
	[creator] [int] NOT NULL,
	[dateCreated] [datetime] NOT NULL,
	[dateModified] [datetime] NOT NULL,
	[description] [ntext] NULL,
	[parentId] [int] NULL,
	[landType] [nvarchar](50) NULL,
	[thumbnail] [nvarchar](550) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 05/14/2013 16:00:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
	[dateCreated] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 05/14/2013 16:00:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AdvancedGetProducts]    Script Date: 05/14/2013 16:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AdvancedGetProducts]
@productId int = 0,
@address nvarchar(200) = null,
@status nvarchar(200) = null,
@type nvarchar(200) = NULL,
@priceMin int = 0,
@priceMax int = 0,
@parent int = 0
AS
BEGIN
DECLARE @SqlStr NVARCHAR(MAX), 
	@ParamList NVARCHAR(2000)
		SELECT @SqlStr = 'SELECT * FROM Products WHERE 1=1'
IF @productId > 0           
	SELECT @SqlStr = @SqlStr + ' AND id = @productId' 
IF (@address IS NOT NULL) OR (@address <> '')
	SELECT @SqlStr = @SqlStr + ' AND (address LIKE ''%'+@address+'%'')'
IF (@status IS NOT NULL) OR (@status <> '')
	SELECT @SqlStr = @SqlStr + ' AND (status LIKE ''%'+@status+'%'')'
IF (@type IS NOT NULL) OR (@type <> '')
	SELECT @SqlStr = @SqlStr + ' AND (landType LIKE ''%'+@type+'%'')'
IF (@priceMin > 0) AND (@priceMax = 0)
BEGIN
	SELECT @SqlStr = @SqlStr + ' AND price = @priceMin'
END
IF (@priceMin > 0) AND (@priceMax > 0)
BEGIN
	SELECT @SqlStr = @SqlStr + ' AND price BETWEEN @priceMin AND @priceMax)'
END
IF (@parent <> 0)
BEGIN
	SELECT @SqlStr = @SqlStr + ' AND parentId = @parent'
END

SELECT @ParamList = '
		@productId int,
		@address nvarchar(200),
		@status nvarchar(200),
		@type nvarchar(200),
		@priceMin int,
		@priceMax int,
		@parent int'
EXEC SP_EXECUTESQL	@SqlStr,
					@ParamList,
					@productId,
					@address,
					@status,
					@type,
					@priceMin,
					@priceMax,
					@parent
END
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/14/2013 16:00:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](150) NOT NULL,
	[password] [nvarchar](150) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[bio] [ntext] NULL,
	[dateCreated] [datetime] NULL,
	[dateModified] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_getProduct]    Script Date: 05/14/2013 16:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_getProduct]
@id int = 0
AS

IF(@id > 0)
SELECT * FROM Products WHERE id = @id
ELSE
SELECT * FROM Products
GO
/****** Object:  StoredProcedure [dbo].[insertOrder]    Script Date: 05/14/2013 16:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertOrder]
@userId int,
@productId int,
@status nvarchar(250)
AS
INSERT INTO Orders(userId, productId, [status]) VALUES (@userId, @productId, @status)
GO
/****** Object:  StoredProcedure [dbo].[getProductByTypeAndStatus]    Script Date: 05/14/2013 16:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getProductByTypeAndStatus]
@status nvarchar(50),
@type nvarchar(50)
AS
SELECT * FROM Products WHERE [status] = @status AND landType = @type
GO
/****** Object:  StoredProcedure [dbo].[getProductByStatus]    Script Date: 05/14/2013 16:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getProductByStatus]
@status nvarchar(50)
AS
SELECT * FROM Products WHERE [status] = @status
GO
/****** Object:  StoredProcedure [dbo].[getLocation]    Script Date: 05/14/2013 16:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getLocation]
@id int = 0
AS

IF @id > 0
SELECT * FROM Locations WHERE Locations.id = @id
ELSE
SELECT * FROM Locations
GO
/****** Object:  StoredProcedure [dbo].[getAllProduct]    Script Date: 05/14/2013 16:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllProduct] AS SELECT * FROM Products
GO
/****** Object:  Default [DF_Orders_dateCreated]    Script Date: 05/14/2013 16:00:49 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_dateCreated]  DEFAULT (getdate()) FOR [dateCreated]
GO
