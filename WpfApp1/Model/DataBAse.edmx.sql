
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/11/2022 19:47:48
-- Generated from EDMX file: C:\Users\plovik\Desktop\dd\qxevtn\WpfApp1\Model\DataBAse.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
CREATE DATABASE [user2]
GO
USE [user2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__OrderProd__Order__2D27B809]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderProduct] DROP CONSTRAINT [FK__OrderProd__Order__2D27B809];
GO
IF OBJECT_ID(N'[dbo].[FK__OrderProd__Produ__2E1BDC42]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderProduct] DROP CONSTRAINT [FK__OrderProd__Produ__2E1BDC42];
GO
IF OBJECT_ID(N'[dbo].[FK__User__UserRole__267ABA7A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK__User__UserRole__267ABA7A];
GO
IF OBJECT_ID(N'[dbo].[FK_Order_PickupPoint]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_PickupPoint];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[OrderProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderProduct];
GO
IF OBJECT_ID(N'[dbo].[PickupPoint]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PickupPoint];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [OrderStatus] nvarchar(max)  NOT NULL,
    [OrderDeliveryDate] datetime  NOT NULL,
    [OrderPickupPoint] bigint  NOT NULL,
    [Client] nvarchar(50)  NULL,
    [OrderCreate] datetime  NULL,
    [OrrderCode] nvarchar(50)  NULL
);
GO

-- Creating table 'OrderProducts'
CREATE TABLE [dbo].[OrderProducts] (
    [OrderID] int  NOT NULL,
    [ProductArticleNumber] nvarchar(100)  NOT NULL,
    [Count] int  NULL,
    [Id] bigint  NOT NULL
);
GO

-- Creating table 'PickupPoints'
CREATE TABLE [dbo].[PickupPoints] (
    [Id] bigint  NOT NULL,
    [Index] nvarchar(50)  NULL,
    [Address] nvarchar(50)  NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductArticleNumber] nvarchar(100)  NOT NULL,
    [ProductName] nvarchar(max)  NULL,
    [ProductDescription] nvarchar(max)  NULL,
    [ProductCategory] nvarchar(max)  NULL,
    [ProductPhoto] varbinary(max)  NULL,
    [ProductManufacturer] nvarchar(max)  NULL,
    [ProductCost] decimal(19,4)  NULL,
    [ProductDiscountAmount] tinyint  NULL,
    [ProductQuantityInStock] int  NULL,
    [ProductMaxDiscountAmount] tinyint  NULL,
    [ProductProvider] nvarchar(50)  NULL,
    [ProductUnit] nvarchar(50)  NULL,
    [ProductPhotoUrl] nvarchar(50)  NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleID] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [UserSurname] nvarchar(100)  NOT NULL,
    [UserName] nvarchar(100)  NOT NULL,
    [UserPatronymic] nvarchar(100)  NOT NULL,
    [UserLogin] nvarchar(max)  NOT NULL,
    [UserPassword] nvarchar(max)  NOT NULL,
    [UserRole] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [OrderID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [Id] in table 'OrderProducts'
ALTER TABLE [dbo].[OrderProducts]
ADD CONSTRAINT [PK_OrderProducts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PickupPoints'
ALTER TABLE [dbo].[PickupPoints]
ADD CONSTRAINT [PK_PickupPoints]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ProductArticleNumber] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductArticleNumber] ASC);
GO

-- Creating primary key on [RoleID] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [UserID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [OrderID] in table 'OrderProducts'
ALTER TABLE [dbo].[OrderProducts]
ADD CONSTRAINT [FK__OrderProd__Order__2D27B809]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Orders]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__OrderProd__Order__2D27B809'
CREATE INDEX [IX_FK__OrderProd__Order__2D27B809]
ON [dbo].[OrderProducts]
    ([OrderID]);
GO

-- Creating foreign key on [OrderPickupPoint] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Order_PickupPoint]
    FOREIGN KEY ([OrderPickupPoint])
    REFERENCES [dbo].[PickupPoints]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Order_PickupPoint'
CREATE INDEX [IX_FK_Order_PickupPoint]
ON [dbo].[Orders]
    ([OrderPickupPoint]);
GO

-- Creating foreign key on [ProductArticleNumber] in table 'OrderProducts'
ALTER TABLE [dbo].[OrderProducts]
ADD CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
    FOREIGN KEY ([ProductArticleNumber])
    REFERENCES [dbo].[Products]
        ([ProductArticleNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__OrderProd__Produ__2E1BDC42'
CREATE INDEX [IX_FK__OrderProd__Produ__2E1BDC42]
ON [dbo].[OrderProducts]
    ([ProductArticleNumber]);
GO

-- Creating foreign key on [UserRole] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK__User__UserRole__267ABA7A]
    FOREIGN KEY ([UserRole])
    REFERENCES [dbo].[Roles]
        ([RoleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__User__UserRole__267ABA7A'
CREATE INDEX [IX_FK__User__UserRole__267ABA7A]
ON [dbo].[Users]
    ([UserRole]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------