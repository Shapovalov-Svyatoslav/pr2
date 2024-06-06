CREATE DATABASE [university]
GO

USE [university]
GO

CREATE TABLE [Students](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Class] [int] NULL,
	CONSTRAINT [PK_Students] PRIMARY KEY(Id),
)
GO

CREATE TABLE [Subjects](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
	CONSTRAINT [PK_Subjects] PRIMARY KEY (Id)
)
GO

CREATE TABLE [Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED (Id)
)
GO

CREATE TABLE [Grades](
	[Id] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Grade] [int] NOT NULL,
	CONSTRAINT [PK_Grades] PRIMARY KEY(Id),
	CONSTRAINT [FK_Grades_Students] FOREIGN KEY([StudentId]) REFERENCES [dbo].[Students] ([Id]),
	CONSTRAINT [FK_Grades_Subjects] FOREIGN KEY([SubjectId]) REFERENCES [dbo].[Subjects] ([Id])
)
GO

CREATE TABLE [Schedule](
	[Id] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Weekday] [nchar](100) NOT NULL,
	[TimeStart] [time](0) NOT NULL,
	[TimeEnd] [time](7) NULL,
	CONSTRAINT [PK_Schedule] PRIMARY KEY(Id),
	CONSTRAINT [FK_Schedule_Subjects] FOREIGN KEY([SubjectId]) REFERENCES [dbo].[Subjects] ([Id]),
	CONSTRAINT [FK_Schedule_Teachers] FOREIGN KEY([TeacherId]) REFERENCES [dbo].[Teachers] ([Id])
)
