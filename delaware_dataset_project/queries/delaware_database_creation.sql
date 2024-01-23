USE master;
GO

CREATE DATABASE delaware_database ON
(NAME = delaware_database_dat,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\delawdat.mdf',
    SIZE = 2 GB,
    MAXSIZE = 10 GB,
    FILEGROWTH = 500 MB)
LOG ON
(NAME = delaware_project_log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\delawlog.ldf',
    SIZE = 1 GB,
    MAXSIZE = 5 GB,
    FILEGROWTH = 250 MB);
GO