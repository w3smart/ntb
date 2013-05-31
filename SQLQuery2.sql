USE [NTB]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05/31/2013 17:21:06 ******/
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
	[numOfFloor] [int] NULL,
	[floorNo] [int] NULL,
	[roomOnEachFloor] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05/31/2013 17:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[location] [int] NOT NULL,
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
	[numOfFloor] [int] NULL,
	[floorNo] [int] NULL,
	[roomOnEachFloor] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 05/31/2013 17:21:06 ******/
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
	[paymentType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 05/31/2013 17:21:06 ******/
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
/****** Object:  StoredProcedure [dbo].[getUser]    Script Date: 05/31/2013 17:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getUser]
@userId int = 0,
@username nvarchar(200) = null,
@password nvarchar(200) = null,
@role nvarchar(200) = NULL,
@fields nvarchar(250) = '*'
AS
BEGIN
DECLARE @SqlStr NVARCHAR(MAX), 
	@ParamList NVARCHAR(2000)

	SELECT @SqlStr = 'SELECT '+@fields+' FROM Users WHERE 1=1'
IF @userId > 0           
	SELECT @SqlStr = @SqlStr + ' AND id = @userId' 
IF (@username IS NOT NULL) OR (@username <> '')
	SELECT @SqlStr = @SqlStr + ' AND (username = @username)'
IF (@password IS NOT NULL) OR (@password <> '')
	SELECT @SqlStr = @SqlStr + ' AND (password = @password)'
IF (@role IS NOT NULL) OR (@role <> '')
	SELECT @SqlStr = @SqlStr + ' AND (role = @role)'

SELECT @ParamList = '
		@userId int,
		@username nvarchar(240),
		@password nvarchar(200),
		@role nvarchar(200),
		@fields nvarchar(200)'
EXEC SP_EXECUTESQL	@SqlStr,
					@ParamList,
					@userId,
					@username,
					@password,
					@role,
					@fields
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalMoney]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getTotalMoney]
@dateCreatedMin nvarchar(200) = '',
@dateCreatedMax nvarchar(200) = ''
AS
BEGIN
DECLARE @SqlStr NVARCHAR(MAX), 
	@ParamList NVARCHAR(2000)

	SELECT @SqlStr = 'SELECT ''Total'', SUM(price*area) as Value FROM Product WHERE 1=1 AND landType LIKE ''%room%'' AND [status] = ''onsale'''

IF (@dateCreatedMin <> '') AND (@dateCreatedMax = '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated >= @dateCreatedMin'
	
IF (@dateCreatedMin <> '') AND (@dateCreatedMax <> '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated BETWEEN @dateCreatedMin AND @dateCreatedMax'

SELECT @ParamList = '
		@dateCreatedMin nvarchar(200),
		@dateCreatedMax nvarchar(200)'

EXEC SP_EXECUTESQL	@SqlStr,
					@ParamList,
					@dateCreatedMin,
					@dateCreatedMax
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalCustomer]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getTotalCustomer]
@dateCreatedMin nvarchar(200) = '',
@dateCreatedMax nvarchar(200) = ''
AS
BEGIN
DECLARE @SqlStr NVARCHAR(MAX), 
	@ParamList NVARCHAR(2000)

	SELECT @SqlStr = 'SELECT ''Total'', COUNT(*) as Value FROM Users WHERE 1=1 AND [role] = ''customer'''

IF (@dateCreatedMin <> '') AND (@dateCreatedMax = '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated >= @dateCreatedMin'
	
IF (@dateCreatedMin <> '') AND (@dateCreatedMax <> '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated BETWEEN @dateCreatedMin AND @dateCreatedMax'

SELECT @ParamList = '
		@dateCreatedMin nvarchar(200),
		@dateCreatedMax nvarchar(200)'

EXEC SP_EXECUTESQL	@SqlStr,
					@ParamList,
					@dateCreatedMin,
					@dateCreatedMax
END
GO
/****** Object:  StoredProcedure [dbo].[getStatisticProductType]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getStatisticProductType]
@dateCreatedMin nvarchar(200) = '',
@dateCreatedMax nvarchar(200) = ''
AS
BEGIN
DECLARE @SqlStr NVARCHAR(MAX), 
	@ParamList NVARCHAR(2000)

	SELECT @SqlStr = 'SELECT landType, COUNT(*) as Total FROM Product WHERE 1=1'

IF (@dateCreatedMin <> '') AND (@dateCreatedMax = '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated >= @dateCreatedMin'
	
IF (@dateCreatedMin <> '') AND (@dateCreatedMax <> '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated BETWEEN @dateCreatedMin AND @dateCreatedMax'

SELECT @SqlStr = @SqlStr + ' GROUP BY [landType]'
SELECT @ParamList = '
		@dateCreatedMin nvarchar(200),
		@dateCreatedMax nvarchar(200)'

EXEC SP_EXECUTESQL	@SqlStr,
					@ParamList,
					@dateCreatedMin,
					@dateCreatedMax
END
GO
/****** Object:  StoredProcedure [dbo].[getStatisticProductStatus]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getStatisticProductStatus]
@dateCreatedMin nvarchar(200) = '',
@dateCreatedMax nvarchar(200) = ''
AS
BEGIN
DECLARE @SqlStr NVARCHAR(MAX), 
	@ParamList NVARCHAR(2000)

	SELECT @SqlStr = 'SELECT status, COUNT(*) as Total FROM Product WHERE 1=1'

IF (@dateCreatedMin <> '') AND (@dateCreatedMax = '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated >= @dateCreatedMin'
	
IF (@dateCreatedMin <> '') AND (@dateCreatedMax <> '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated BETWEEN @dateCreatedMin AND @dateCreatedMax'

SELECT @SqlStr = @SqlStr + ' GROUP BY [status]'
SELECT @ParamList = '
		@dateCreatedMin nvarchar(200),
		@dateCreatedMax nvarchar(200)'

EXEC SP_EXECUTESQL	@SqlStr,
					@ParamList,
					@dateCreatedMin,
					@dateCreatedMax
END
GO
/****** Object:  StoredProcedure [dbo].[getStatisticOrderStatus]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getStatisticOrderStatus]
@dateCreatedMin nvarchar(200) = '',
@dateCreatedMax nvarchar(200) = ''
AS
BEGIN
DECLARE @SqlStr NVARCHAR(MAX), 
	@ParamList NVARCHAR(2000)

	SELECT @SqlStr = 'SELECT status, COUNT(*) as Total FROM Orders WHERE 1=1'

IF (@dateCreatedMin <> '') AND (@dateCreatedMax = '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated >= @dateCreatedMin'
	
IF (@dateCreatedMin <> '') AND (@dateCreatedMax <> '')
	SELECT @SqlStr = @SqlStr + ' AND dateCreated BETWEEN @dateCreatedMin AND @dateCreatedMax'

SELECT @SqlStr = @SqlStr + ' GROUP BY [status]'
SELECT @ParamList = '
		@dateCreatedMin nvarchar(200),
		@dateCreatedMax nvarchar(200)'

EXEC SP_EXECUTESQL	@SqlStr,
					@ParamList,
					@dateCreatedMin,
					@dateCreatedMax
END
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[password] [nvarchar](150) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[email] [nvarchar](250) NOT NULL,
	[dateCreated] [datetime] NULL,
	[dateModified] [datetime] NULL,
	[address] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_User_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_User_Name] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[getOrder]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getOrder]
@orderId int = 0,
@userId int = 0,
@username nvarchar(200) = '',
@productId int = 0,
@productName nvarchar(200) = '',
@status nvarchar(200) = '',
@paymentType nvarchar(200) = '',
@dateCreatedMin nvarchar(200) = '',
@dateCreatedMax nvarchar(200) = ''
AS
BEGIN
DECLARE @SqlStr NVARCHAR(MAX), 
	@ParamList NVARCHAR(2000)

	SELECT @SqlStr = 'SELECT Orders.id, productId, Orders.status,Orders.dateCreated, paymentType, Users.username, Product.name FROM Orders INNER JOIN Users ON Orders.userId = Users.id INNER JOIN Product ON Orders.productId = Product.id WHERE 1=1'
IF @orderId > 0           
	SELECT @SqlStr = @SqlStr + ' AND Orders.id = @orderId' 
IF @userId > 0
	SELECT @SqlStr = @SqlStr + ' AND userId = @userId'
IF @productId > 0
	SELECT @SqlStr = @SqlStr + ' AND productId = @productId'
IF (@status <> '')
	SELECT @SqlStr = @SqlStr + ' AND (Orders.status LIKE ''%'+@status+'%'')'

IF (@productName <> '')
	SELECT @SqlStr = @SqlStr + ' AND (Product.name LIKE ''%'+@productName+'%'')'

IF (@username <> '')
	SELECT @SqlStr = @SqlStr + ' AND (username LIKE ''%'+@username+'%'')'

IF (@paymentType <> '')
	SELECT @SqlStr = @SqlStr + ' AND (paymentType LIKE ''%'+@paymentType+'%'')'
	
IF (@dateCreatedMin <> '') AND (@dateCreatedMax = '')
	SELECT @SqlStr = @SqlStr + ' AND Orders.dateCreated >= @dateCreatedMin'
	
IF (@dateCreatedMin <> '') AND (@dateCreatedMax <> '')
	SELECT @SqlStr = @SqlStr + ' AND Orders.dateCreated BETWEEN @dateCreatedMin AND @dateCreatedMax'

SELECT @SqlStr = @SqlStr + ' ORDER BY productId'

SELECT @ParamList = '
		@orderId int,
		@userId int,
		@username nvarchar(200),
		@productId int,
		@productName nvarchar(200),
		@status nvarchar(200),
		@paymentType nvarchar(200),
		@dateCreatedMin nvarchar(200),
		@dateCreatedMax nvarchar(200)'

EXEC SP_EXECUTESQL	@SqlStr,
					@ParamList,
					@orderId,
					@userId,
					@username,
					@productId,
					@productName,
					@status,
					@paymentType,
					@dateCreatedMin,
					@dateCreatedMax
END
GO
/****** Object:  StoredProcedure [dbo].[AdvancedGetProducts]    Script Date: 05/31/2013 17:21:17 ******/
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
/****** Object:  StoredProcedure [dbo].[getProduct]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getProduct]
@productId int = 0,
@location int = 0,
@status nvarchar(200) = null,
@type nvarchar(200) = NULL,
@priceMin int = 0,
@priceMax int = 0,
@parent int = 0,
@fields nvarchar(250) = '*',
@name nvarchar(250) = NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(MAX), 
	@ParamList NVARCHAR(2000)

	SELECT @SqlStr = 'SELECT '+@fields+' FROM Product WHERE 1=1'
IF (@name IS NOT NULL) OR (@name <> '')
	SELECT @SqlStr = @SqlStr + ' AND (name LIKE ''%'+@name+'%'')'
IF @productId > 0           
	SELECT @SqlStr = @SqlStr + ' AND id = @productId' 
IF @location > 0
	SELECT @SqlStr = @SqlStr + ' AND location = @location'
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
	SELECT @SqlStr = @SqlStr + ' AND price BETWEEN @priceMin AND @priceMax'
END
IF (@parent <> 0)
BEGIN
	SELECT @SqlStr = @SqlStr + ' AND parentId = @parent'
END

SELECT @ParamList = '
		@productId int,
		@location int,
		@status nvarchar(200),
		@type nvarchar(200),
		@priceMin int,
		@priceMax int,
		@parent int,
		@fields nvarchar(250),
		@name nvarchar(250)'
EXEC SP_EXECUTESQL	@SqlStr,
					@ParamList,
					@productId,
					@location,
					@status,
					@type,
					@priceMin,
					@priceMax,
					@parent,
					@fields,
					@name
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderItem]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getOrderItem]
@userId int
AS
SELECT Product.* FROM Orders 
INNER JOIN Product ON Product.id = Orders.productId
INNER JOIN Users ON Orders.userId = Users.id
WHERE
Product.landType LIKE '%room%'
AND Users.id = @userId
GO
/****** Object:  StoredProcedure [dbo].[getLocation]    Script Date: 05/31/2013 17:21:17 ******/
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
/****** Object:  StoredProcedure [dbo].[getAllProduct]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllProduct] AS SELECT * FROM Products
GO
/****** Object:  StoredProcedure [dbo].[deleteProduct]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deleteProduct]
@id int
AS
DELETE FROM Product WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[deleteObject]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deleteObject]
@table nvarchar(200),
@id int
AS
IF (@table = 'Locations')
	DELETE FROM Locations WHERE id = @id
IF (@table = 'Orders')
	DELETE FROM Orders WHERE id = @id
IF (@table = 'Product')
	DELETE FROM Product WHERE id = @id
IF (@table = 'Users')
	DELETE FROM Users WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[deleteLocation]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deleteLocation]
@id int
AS
DELETE FROM Locations WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateUser]
@id int,
@username nvarchar(250),
@password nvarchar(50),
@role nvarchar(50),
@email nvarchar(50),
@address nvarchar(250),
@phone nvarchar(50)
AS
UPDATE Users SET 
username = @username,
[password] = @password,
[role] = @role, 
[email] = @email, 
[address] = @address, 
phone = @phone, 
dateModified = CURRENT_TIMESTAMP
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[updateProduct]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateProduct]
@id int,
@name nvarchar(250),
@location int,
@price float,
@status nvarchar(50),
@area float,
@creator int,
@description ntext,
@parentId int,
@landType nvarchar(50),
@thumbnail nvarchar(550),
@numOfFloor int,
@floorNo int,
@roomOnEachFloor int
AS
UPDATE Product SET 
name = @name,
location = @location, 
price = @price, 
[status] = @status, 
area = @area, 
creator = @creator, 
[description] = @description,
parentId = @parentId, 
landType = @landType, 
thumbnail = @thumbnail, 
numOfFloor = @numOfFloor, 
floorNo = @floorNo,
roomOnEachFloor = @roomOnEachFloor,
dateModified = CURRENT_TIMESTAMP
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[updateOrder]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateOrder]
@id int,
@status nvarchar(50)
AS
UPDATE Orders SET [status] = @status WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[updateLocation]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateLocation]
@id int,
@location nvarchar(250)
AS
UPDATE Locations SET location = @location WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_getProduct]    Script Date: 05/31/2013 17:21:17 ******/
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
/****** Object:  StoredProcedure [dbo].[getProductByTypeAndStatus]    Script Date: 05/31/2013 17:21:17 ******/
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
/****** Object:  StoredProcedure [dbo].[getProductByStatus]    Script Date: 05/31/2013 17:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getProductByStatus]
@status nvarchar(50)
AS
SELECT * FROM Products WHERE [status] = @status
GO
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 05/31/2013 17:21:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertUser]
@username nvarchar(250),
@password nvarchar(50),
@role nvarchar(50),
@email nvarchar(50),
@address ntext,
@phone nvarchar(50),
@id int output
AS
INSERT INTO Users(username, [password], [role], [email], [address], phone)
VALUES(@username, @password, @role, @email, @address, @phone)
SET @id = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[insertProduct]    Script Date: 05/31/2013 17:21:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertProduct]
@name nvarchar(250),
@location int,
@price float,
@status nvarchar(50),
@area float,
@creator int,
@description ntext,
@parentId int,
@landType nvarchar(50),
@thumbnail nvarchar(550),
@numOfFloor int,
@floorNo int,
@roomOnEachFloor int,
@id int output
AS
INSERT INTO Product(name, location, price, [status], area, creator, [description], parentId, landType, thumbnail, numOfFloor, floorNo, roomOnEachFloor)
VALUES(@name, @location, @price, @status, @area, @creator, @description, @parentId, @landType, @thumbnail, @numOfFloor, @floorNo, @roomOnEachFloor)
SET @id = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[insertOrder]    Script Date: 05/31/2013 17:21:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertOrder]
@userId int,
@productId int,
@status nvarchar(250),
@paymentType nvarchar(50)
AS
INSERT INTO Orders(userId, productId, [status], paymentType) VALUES (@userId, @productId, @status, @paymentType)
GO
/****** Object:  StoredProcedure [dbo].[insertLocation]    Script Date: 05/31/2013 17:21:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertLocation]
@location nvarchar(250)
AS
INSERT INTO Locations(location) VALUES (@location)
GO
/****** Object:  Default [DF_Products_dateCreated]    Script Date: 05/31/2013 17:21:06 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_dateCreated]  DEFAULT (getdate()) FOR [dateCreated]
GO
/****** Object:  Default [DF_Products_dateModified]    Script Date: 05/31/2013 17:21:06 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_dateModified]  DEFAULT (getdate()) FOR [dateModified]
GO
/****** Object:  Default [DF_Product_dateCreated]    Script Date: 05/31/2013 17:21:06 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_dateCreated]  DEFAULT (getdate()) FOR [dateCreated]
GO
/****** Object:  Default [DF_Product_dateModified]    Script Date: 05/31/2013 17:21:06 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_dateModified]  DEFAULT (getdate()) FOR [dateModified]
GO
/****** Object:  Default [DF_Orders_dateCreated]    Script Date: 05/31/2013 17:21:06 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_dateCreated]  DEFAULT (getdate()) FOR [dateCreated]
GO
/****** Object:  Default [DF_Users_dateCreated]    Script Date: 05/31/2013 17:21:17 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_dateCreated]  DEFAULT (getdate()) FOR [dateCreated]
GO
/****** Object:  Default [DF_Users_dateModified]    Script Date: 05/31/2013 17:21:17 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_dateModified]  DEFAULT (getdate()) FOR [dateModified]
GO
