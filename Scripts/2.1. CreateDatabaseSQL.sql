-- ===========================================
-- Створення Бази Даних.
-- ===========================================

USE master
GO

IF EXISTS (
	SELECT name
		FROM sys.databases
		WHERE name = N'MyDB'
)
	DROP DATABASE MyDB
GO

CREATE DATABASE MyDB
GO