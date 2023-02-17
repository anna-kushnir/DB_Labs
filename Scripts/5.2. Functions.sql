USE MyDB
GO

-- a.	створити функцію, котра повертає деяке скалярне значення --
CREATE OR ALTER FUNCTION GetInfoAboutEmployee(@EmployeeID INT)
RETURNS VARCHAR(125)
AS
BEGIN
	DECLARE @Result VARCHAR(125);
	IF (SELECT COUNT(*) FROM Employees WHERE Employees.ID = @EmployeeID) = 0
		SET @Result = 'Employee with ID = ' + CONVERT(varchar(10), @EmployeeID) + ' does not exist in the database.'
	ELSE
		SET @Result = (SELECT Employees.Name + ' ' + Employees.Surname + ' works as ' + LOWER(Positions.Name) + ' at ' + Hotels.Name + '.'
			FROM MyDB.dbo.Employees
			JOIN MyDB.dbo.Positions ON Employees.PositionID = Positions.ID
			JOIN MyDB.dbo.Hotels ON Employees.HotelID = Hotels.ID
			WHERE Employees.ID = @EmployeeID);
	RETURN (@Result);
END
GO

SELECT MyDB.dbo.GetInfoAboutEmployee(7) AS 'Employee Info'
GO

-- b.	створити функцію, котра повертає таблицю з динамічним набором стовпців --
CREATE OR ALTER PROCEDURE AuxiliaryProcedure @MagicNumber INT
AS
BEGIN
	IF @MagicNumber < 4
		SELECT TOP 10 ID, Surname, Name
		FROM Employees
	ELSE IF @MagicNumber = 4
		SELECT TOP 10 ID, Surname, Name, Patronymic
		FROM Employees
	ELSE IF @MagicNumber = 5
		SELECT TOP 10 ID, Surname, Name, Patronymic, Document
		FROM Employees
	ELSE
		SELECT TOP 10 ID, Surname, Name, Patronymic, Document, Salary
		FROM Employees
END
GO

SET quoted_identifier off
GO

CREATE OR ALTER FUNCTION GetEmployees (@Number INT)
RETURNS TABLE
AS
RETURN
(
	SELECT *
	FROM OPENROWSET('SQLNCLI11', 'Server=DESKTOP-HIMOTR0;Trusted_Connection=yes;', "
		DECLARE @SQL NVARCHAR(MAX)
		SET @SQL = 'MyDB.dbo.AuxiliaryProcedure ' + CONVERT(varchar(3), 6)
		EXEC sp_executeSQL @SQL
		WITH RESULT SETS
		(
		(ID INT, Surname NVARCHAR(20), Name NVARCHAR(20), Patronymic NVARCHAR(20), Document NVARCHAR(12), Salary INT)
		)") AS T
);
GO

SELECT *
FROM GetEmployees(4)
GO

-- c.	створити функцію, котра повертає таблицю заданої структури --
CREATE OR ALTER FUNCTION ProfitFromTheRooms ()
RETURNS @ResultTable TABLE (
	RoomID INT NOT NULL,
	Profit MONEY NOT NULL
)
AS
BEGIN
	INSERT @ResultTable
	SELECT Rooms.ID, ISNULL((SELECT SUM(Orders.Bill) FROM Orders WHERE Orders.RoomID = Rooms.ID), 0)
	FROM Rooms
	RETURN;
END
GO

SELECT *
FROM ProfitFromTheRooms()
GO