﻿--
-- Script was generated by Devart dbForge Studio 2019 for SQL Server, Version 5.7.31.0
-- Product Home Page: http://www.devart.com/dbforge/sql/studio
-- Script date 12.12.2019 11:39:02
-- Target server version: 14.00.3223
-- Target connection string: Data Source=DBFSQLSRV\SQLLAST;Encrypt=False;Integrated Security=False;User ID=sa
--



SET LANGUAGE 'English'
SET DATEFORMAT ymd
SET ARITHABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
SET NUMERIC_ROUNDABORT, IMPLICIT_TRANSACTIONS, XACT_ABORT OFF
GO

--
-- Backing up database ExecuteDatabase
--
--
-- Create backup folder
--
IF OBJECT_ID('xp_create_subdir') IS NOT NULL
  EXEC xp_create_subdir N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLLAST\MSSQL\Backup'
--
-- Backup database to the file with the name: <database_name>_<yyyy>_<mm>_<dd>_<hh>_<mi>.bak
--
DECLARE @db_name SYSNAME
SET @db_name = N'ExecuteDatabase'

DECLARE @filepath NVARCHAR(4000)
SET @filepath =
/*define base part*/ N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLLAST\MSSQL\Backup\' + @db_name + '_' +
/*append date*/ REPLACE(CONVERT(NVARCHAR(10), GETDATE(), 102), '.', '_') + '_' +
/*append time*/ REPLACE(CONVERT(NVARCHAR(5), GETDATE(), 108), ':', '_') + '.bak'

DECLARE @SQL NVARCHAR(MAX)
SET @SQL = 
    N'BACKUP DATABASE ' + QUOTENAME(@db_name) + ' TO DISK = @filepath WITH INIT' + 
      CASE WHEN EXISTS(
                SELECT value
                FROM sys.configurations
                WHERE name = 'backup compression default'
          )
        THEN ', COMPRESSION'
        ELSE ''
      END

EXEC sys.sp_executesql @SQL, N'@filepath NVARCHAR(4000)', @filepath = @filepath
GO

USE ExecuteDatabase
GO

IF DB_NAME() <> N'ExecuteDatabase' SET NOEXEC ON
GO
--
-- Delete data from the table 'dbo.table1'
--
TRUNCATE TABLE dbo.table1
GO

--
-- Inserting data into table dbo.table1
--
SET IDENTITY_INSERT dbo.table1 ON
GO
INSERT dbo.table1(Id, Name, Phone) VALUES (1, 'Letha241', '(459) 613-9467')
INSERT dbo.table1(Id, Name, Phone) VALUES (2, 'Mollie1975', '(730) 955-6764')
INSERT dbo.table1(Id, Name, Phone) VALUES (3, 'Quintin5', '(681) 747-0352')
INSERT dbo.table1(Id, Name, Phone) VALUES (4, 'Kathern49', '(513) 643-0254')
INSERT dbo.table1(Id, Name, Phone) VALUES (5, 'Felisa221', '(776) 960-1978')
INSERT dbo.table1(Id, Name, Phone) VALUES (6, 'Shenita2027', '(943) 664-5705')
INSERT dbo.table1(Id, Name, Phone) VALUES (7, 'Arnita2004', '(282) 510-9326')
INSERT dbo.table1(Id, Name, Phone) VALUES (8, 'Woodrow2009', '(350) 234-6559')
INSERT dbo.table1(Id, Name, Phone) VALUES (9, NULL, NULL)
INSERT dbo.table1(Id, Name, Phone) VALUES (10, 'Chantel318', '(157) 934-3116')
GO
SET IDENTITY_INSERT dbo.table1 OFF
GO

--
-- Set NOEXEC to off
--

SET NOEXEC OFF
GO