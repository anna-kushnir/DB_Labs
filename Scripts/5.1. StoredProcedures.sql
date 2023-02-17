USE MyDB
GO
-- a. запит для створення тимчасової таблиці через змінну типу TABLE --
CREATE OR ALTER PROCEDURE CreateTempTable
AS
BEGIN
	CREATE TABLE ##ClientsWithCategories (
	ID INT, 
	FirstName NVARCHAR(20), 
	LastName NVARCHAR(20), 
	Document NVARCHAR(12), 
	Category NVARCHAR(30)
	)

	INSERT INTO ##ClientsWithCategories (
	ID, FirstName, LastName, Document, Category
	)
	SELECT 
		Clients.ID, Clients.Name, Clients.Surname, Clients.Document, Categories.Name
	FROM MyDB.dbo.Clients, MyDB.dbo.Categories, MyDB.dbo.ClientCategory
	WHERE Clients.ID = ClientCategory.ClientID
		AND ClientCategory.CategoryID = Categories.ID

	SELECT *
	FROM ##ClientsWithCategories
END
GO

EXECUTE CreateTempTable
GO

-- b. запит з використанням умовної конструкції IF --
CREATE OR ALTER PROCEDURE HasHighSalary @EmployeeID INT
AS
BEGIN
	IF (SELECT COUNT(*) FROM Employees WHERE Employees.ID = @EmployeeID) = 0
		PRINT 'Employee with ID = ' + CONVERT(varchar(10), @EmployeeID) + ' does not exist in the database.'
	ELSE
		IF (SELECT Positions.Salary
			FROM MyDB.dbo.Employees, MyDB.dbo.Positions
			WHERE Employees.ID = @EmployeeID AND
				Employees.PositionID = Positions.ID) >= 10000
			PRINT 'Employee with ID = ' + CONVERT(varchar(10), @EmployeeID) + ' has high salary.'
		ELSE
			PRINT 'Employee with ID = ' + CONVERT(varchar(10), @EmployeeID) + ' has low salary.'
END
GO

EXECUTE HasHighSalary 1
GO
EXECUTE HasHighSalary 5
GO
EXECUTE HasHighSalary 20
GO

-- c. запит з використанням циклу WHILE --
CREATE OR ALTER PROCEDURE RaiseWages @Coefficient REAL, @MaxSalary REAL
AS
BEGIN
	WHILE (SELECT MAX(Positions.Salary) FROM Positions) <= @MaxSalary
	BEGIN
		UPDATE MyDB.dbo.Positions
			SET Salary = Salary * @Coefficient
	END

	UPDATE Employees
	SET Salary = Positions.Salary
	FROM Positions
	WHERE Employees.PositionID = Positions.ID;

	SELECT *
	FROM Positions
END
GO

EXECUTE RaiseWages 1.05, 20000
GO

-- d. створення процедури без параметрів --
CREATE OR ALTER PROCEDURE EmployeesYearSalary
AS
BEGIN
	SELECT Employees.ID, Employees.Surname, Employees.Name, Employees.Salary * 12 AS YearSalary
	FROM MyDB.dbo.Employees
	ORDER BY Surname, Name
END
GO

EXECUTE EmployeesYearSalary
GO

-- e. створення процедури з вхідним параметром --
CREATE OR ALTER PROCEDURE HotelsAvailableRooms @HotelID INT
AS
BEGIN
	SELECT Hotels.Name AS Hotel, Rooms.ID AS RoomID, Rooms.Price, Rooms.Capacity, Comfort.Name AS Comfort
	FROM Hotels, Rooms, Comfort
	WHERE Rooms.HotelID = @HotelID
		AND Hotels.ID = @HotelID
		AND Rooms.ComfortID = Comfort.ID
		AND Rooms.IsAvailable = 1
END
GO

EXECUTE HotelsAvailableRooms 1
GO

-- f. створення процедури з вхідним параметром та RETURN --
CREATE OR ALTER PROCEDURE MostExpensiveRoom @HotelID INT, @RoomID INT OUTPUT
AS
BEGIN
	SELECT @RoomID = Rooms.ID
	FROM Rooms
	WHERE Rooms.HotelID = @HotelID AND
		Rooms.Price = (SELECT MAX(Price) FROM Rooms WHERE HotelID = @HotelID);
	RETURN;
END
GO

DECLARE @MostExpensiveRoomID INT;
EXECUTE MostExpensiveRoom @HotelID = 1, @RoomID = @MostExpensiveRoomID OUTPUT;
PRINT 'Most expensive room in Hotel 1 has ID = ' + CONVERT(varchar(10), @MostExpensiveRoomID);
GO

-- g. створення процедури оновлення даних в деякій таблиці БД --
CREATE OR ALTER PROCEDURE ChangeRoomPrices @RaiseOn INT
AS
BEGIN
	UPDATE MyDB.dbo.Rooms
		SET Price = Price + @RaiseOn
	UPDATE MyDB.dbo.Rooms
		SET BookingPrice = BookingPrice + @RaiseOn / 2

	SELECT *
	FROM MyDB.dbo.Rooms
END
GO

EXECUTE ChangeRoomPrices 100
GO

-- h. створення процедури, в котрій робиться вибірка даних --
CREATE OR ALTER PROCEDURE MonthReportForHotel @HotelID INT, @Month VARCHAR(7)
AS
BEGIN
	SELECT Payroll.Date, Employees.HotelID, Employees.ID AS EmployeeID, Employees.Surname + ' ' + Employees.Name AS FullName, Employees.Salary
	FROM Employees, SalaryPayment, Payroll
	WHERE Date LIKE (@Month + '%') AND
		Payroll.ID = SalaryPayment.PayrollID AND
		SalaryPayment.EmployeeID = Employees.ID AND
		Employees.HotelID = @HotelID
	ORDER BY FullName
END
GO

EXECUTE MonthReportForHotel 1, '2022-09'
GO