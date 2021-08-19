USE [master]
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'serviceDB_xxx')

  BEGIN

    ALTER DATABASE [serviceDB_xxx] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE

    DROP DATABASE [serviceDB_xxx]

  END

GO

/****** Object:  Database [serviceDB]    ******/
CREATE DATABASE [serviceDB_xxx]
GO

USE [serviceDB_xxx]
GO

/****** Create the trip Table ******/
CREATE TABLE [dbo].[Trip](
    [number] char(10) NOT NULL,
	[Date] [datetime] NOT NULL,
	[charge] [decimal](18,2),
	[milage] [decimal](18,2),
	[payment_no] int,
	[Street_Code] [char](10),
	[CarModel_Id] [char](5),
 CONSTRAINT [PK_Trip] PRIMARY KEY CLUSTERED 
(
	[number] ASC
)) 

/****** Create the Street Table ******/
CREATE TABLE [dbo].[Street](
	[Street_Code] char(10) NOT NULL,
	[StreetName] varchar(80),
	[Zipcode] char(5),
	[City_Code] char(5),
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[Street_Code] ASC
)) 

/****** Create the City Table ******/
CREATE TABLE [dbo].[City](
	[City_Code] char(5) NOT NULL,
	[City] varchar(80),
	[State] varchar (10)
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[City_Code] ASC
)) 

/****** Create the Driver Table ******/
CREATE TABLE [dbo].[CarModel](
	[CarModel_Id] char(5) NOT NULL,
	[ModelName] varchar(50),
	Cost decimal (18,2)
 CONSTRAINT [PK_CarModel] PRIMARY KEY CLUSTERED 
(
	[CarModel_Id] ASC
)) 

-- Creating foreign key constraints

ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Street] FOREIGN KEY([Street_Code])
REFERENCES [dbo].[Street] ([Street_Code])

ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Car] FOREIGN KEY([CarModel_Id])
REFERENCES [dbo].[CarModel] ([CarModel_Id])

ALTER TABLE [dbo].[Street]  WITH CHECK ADD  CONSTRAINT [FK_Street_City] FOREIGN KEY([City_Code])
REFERENCES [dbo].[City] ([City_Code])
GO

-- Insert data into serviceDB 
Insert into City Values('PHX','Phoenix', 'AZ')
Insert into City Values('AUS','Austin','TX')
Insert into City Values('HOU','Houston','TX')

print 'The city data is now created'

Insert into Street Values('P345','Orange St','85040', 'PHX')
Insert into Street Values('H555','Main St', '77019', 'HOU')
Insert into Street Values('A670','Castle Dr', '78780', 'AUS')
Insert into Street Values('A987','Park Bend Dr','78758','AUS')
Insert into Street Values('P777','Lemon St', '85048', 'PHX')

print 'The Street data is now created'

Insert into CarModel Values('KS888','Full', 20000)
Insert into CarModel Values('TO777','Compact',  15000)
Insert into CarModel Values('AC988','SUV',  25000)
Insert into CarModel Values('ML211','Van',30000)

print 'The car model data is now created'

Insert into Trip Values(11,'01-01-2010',68.48,8.5,1110,'P345', 'KS888')
Insert into Trip Values(12,'01-02-2010',57.65,3.5,1116,'P777', 'AC988')
Insert into Trip Values(13,'01-03-2010',48.4,5.5,8110,'P345', 'KS888')
Insert into Trip Values(14,'01-04-2010',38.8,8.5,7110,'P777', 'KS888')
Insert into Trip Values(15,'01-05-2010',168.8,10.5,1120,'A987', 'ML211')
Insert into Trip Values(16,'01-05-2010',18.48,8.5,2340,'A987', 'TO777')
Insert into Trip Values(17,'01-05-2010',58.8,10.5,7650,'A670', 'ML211')
Insert into Trip Values(18,'01-08-2010',65.8,5.0,1522,'H555', 'ML211')
Insert into Trip Values(19,'01-09-2010',68.8,6.5,1022,'A987', 'AC988')
Insert into Trip Values(20,'01-10-2010',74.4,5.5,1009,'A987', 'ML211')
Insert into Trip Values(21,'01-11-2010',55.2,4.5,1408,'A670', 'ML211')
Insert into Trip Values(22,'01-11-2010',175.3,18.0,1088,'P345', 'KS888')
Insert into Trip Values(25,'01-11-2010',168.8,14.5,2022,'P777', 'AC988')
Insert into Trip Values(26,'01-11-2010',55.2,8.0,2033,'H555', 'ML211')
Insert into Trip Values(27,'01-11-2010',68.4,4.5,2208,'A987', 'ML211')
Insert into Trip Values(30,'01-16-2010',68.4,8.6,3330,'A670', 'ML211')
Insert into Trip Values(31,'01-17-2010',75.4,4.5,3320,'A987', 'AC988')
Insert into Trip Values(32,'01-18-2010',55.4,8.5,3315,'A987', 'AC988')
Insert into Trip Values(33,'01-19-2010',68.4,4.0,3390,'H555', 'ML211')
Insert into Trip Values(34,'01-20-2010',128.4,8.0,5550,'P345', 'KS888')
Insert into Trip Values(35,'01-21-2010',68.4,5.5,5590,'P777', 'KS888')
Insert into Trip Values(36,'01-22-2010',55.0,.65,9880,'A670', 'AC988')
Insert into Trip Values(37,'01-23-2010',75.2,48.5,9760,'H555', 'ML211')
Insert into Trip Values(38,'01-24-2010',68.8,8.5,8760,'A987', 'ML211')
Insert into Trip Values(39,'01-25-2010',68.8,8.5,7670,'A987', 'AC988')
Insert into Trip Values(40,'01-26-2010',155.0,10.0,6654,'A987', 'ML211')
Insert into Trip Values(41,'01-27-2010',68.0,5.5,3998,'H555', 'ML211')
Insert into Trip Values(42,'01-28-2010',75.0,8.5,8908,'A670', 'ML211')
Insert into Trip Values(43,'01-29-2010',68.8,8.5,4440,'P345', 'KS888')
Insert into Trip Values(44,'01-30-2010',55.2,8.5,4420,'P777', 'AC988')
Insert into Trip Values(45,'01-31-2010',68.8,8.65,4320,'H555', 'TO777')
Insert into Trip Values(46,'02-01-2010',68.8,8.65,4560,'A670', 'AC988')
Insert into Trip Values(47,'02-02-2010',57.6,4.54,4416,'H555', 'ML211')
Insert into Trip Values(48,'02-03-2010',75.3,4.4,4980,'A987', 'ML211')
Insert into Trip Values(49,'02-04-2010',55.2,4.5,9910,'A987', 'AC988')
Insert into Trip Values(111,'02-05-2011',68.8,4.65,9090,'P777', 'KS888')
Insert into Trip Values(112,'02-06-2011',68.8,4.65,9020,'A670', 'AC988')
Insert into Trip Values(113,'02-07-2011',68.8,4.65,9050,'H555', 'TO777')
Insert into Trip Values(116,'02-08-2011',55.2,2.65,9870,'P345', 'TO777')
Insert into Trip Values(117,'02-09-2011',75.3,4.65,9830,'P777', 'TO777')
Insert into Trip Values(118,'02-10-2011',68.4,4.65,9807,'H555', 'TO777')
Insert into Trip Values(119,'02-11-2011',68.4,4.65,6760,'A670', 'AC988')
Insert into Trip Values(120,'02-12-2011',55.4,5.65,6730,'P345', 'AC988')
Insert into Trip Values(121,'02-13-2010',68.48,5.65,6720,'P777', 'KS888')
Insert into Trip Values(122,'02-14-2010',75.43,6.65,6810,'A987', 'TO777')
Insert into Trip Values(124,'02-15-2010',28.8,4.65,6920,'H555', 'TO777')
Insert into Trip Values(127,'02-16-2010',30.2,3.5,5910,'A670', 'ML211')
Insert into Trip Values(128,'02-17-2010',68.4,5,6310,'P345', 'AC988')
Insert into Trip Values(129,'02-18-2010',20.4,3.0,2940,'P345', 'KS888')
Insert into Trip Values(139,'02-19-2010',105.4,null,2900,'A670', 'TO777')
Insert into Trip Values(991,'02-20-2012',85.4,11.5,2970,'H555', 'ML211')
Go

print 'The serviceDB is now created'