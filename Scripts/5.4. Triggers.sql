-- a.	створити тригер, котрий буде спрацьовувати при видаленні даних --
CREATE OR ALTER TRIGGER on_delete
ON Clients
INSTEAD OF DELETE
AS
	PRINT 'It is not allowed to delete records from the table "Clients"'
GO

DELETE FROM Clients
WHERE ID = 5
GO

SELECT * FROM Clients
GO

-- b.	створити тригер, котрий буде спрацьовувати при модифікації даних --
CREATE OR ALTER TRIGGER on_update
ON Rooms
AFTER UPDATE
AS
	UPDATE Hotels
	SET Rooms = (SELECT COUNT(*) FROM Rooms WHERE Rooms.HotelID = Hotels.ID)
	UPDATE Hotels
	SET AvailableRooms = (SELECT COUNT(*) FROM Rooms WHERE Rooms.HotelID = Hotels.ID AND Rooms.IsAvailable = 1)
GO

UPDATE Rooms
SET IsAvailable = 0
WHERE ID BETWEEN 5 AND 8 OR ID > 14
GO

SELECT * FROM Rooms
GO
SELECT * FROM Hotels
GO

-- c.	створити тригер, котрий буде спрацьовувати при додаванні даних --
CREATE OR ALTER TRIGGER on_insert
ON Employees
AFTER INSERT
AS
	UPDATE Employees
	SET Salary = (SELECT Positions.Salary FROM Positions WHERE Positions.ID = PositionID)
GO

INSERT INTO Employees (
	Surname, Name, Document, PositionID, HotelID
	)
	VALUES
	('Johnsoniuk', 'Borys', '001826371', 2, 1)
	;
GO

SELECT * FROM Employees
GO

------------------------------------
DISABLE TRIGGER on_delete ON Clients

DROP TRIGGER on_delete

DROP TRIGGER on_update

DROP TRIGGER on_insert