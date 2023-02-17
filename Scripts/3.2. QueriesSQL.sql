-- a.1 --
SELECT ID, Name + ' ' + Surname AS FullName, 
(SELECT Hotels.Name FROM Hotels WHERE Employees.HotelID = Hotels.ID) AS Hotel
FROM Employees;

-- a.2 --
SELECT *
FROM (SELECT Orders.ID AS OrderID, Clients.Surname + ' ' + Clients.Name AS ClientName, Orders.RoomID AS Room, Orders.OrderDate, Orders.Bill
	FROM Orders, Clients 
	WHERE Orders.ClientID = Clients.ID) AS T
WHERE T.Room BETWEEN 1 AND 5;

-- b.1 --
SELECT ID, Name + ' ' + Surname AS FullName, Document, DiscountAmount
FROM Clients
WHERE EXISTS (SELECT * FROM ClientCategory, Categories WHERE ClientCategory.ClientID = Clients.ID AND Categories.ID = ClientCategory.CategoryID);

-- b.2 --
SELECT *
FROM IncomePerDay
WHERE Date IN (SELECT OrderDate FROM Orders)

-- c --
SELECT Employees.Name + ' ' + Employees.Surname AS FullName, Positions.Name AS PossiblePosition, Positions.Salary
FROM Employees, Positions
WHERE Positions.Salary > 12000;

-- d --
SELECT Employees.ID, Employees.Name + ' ' + Employees.Surname AS FullName, Positions.Name AS Position, Hotels.Name AS Hotel
FROM Employees, Positions, Hotels
WHERE Employees.PositionID = Positions.ID 
	AND Employees.HotelID = Hotels.ID;

-- e --
SELECT Employees.ID, Employees.Name + ' ' + Employees.Surname AS FullName, Positions.Name AS Position, Hotels.Name AS Hotel
FROM Employees, Positions, Hotels
WHERE Employees.PositionID = Positions.ID 
	AND Employees.HotelID = Hotels.ID
	AND Positions.Name IN ('Administrator', 'Manager')
	AND Hotels.ID = 2;

-- f --
SELECT Clients.Name + ' ' + Clients.Surname AS FullName, Categories.Name
FROM Clients
INNER JOIN ClientCategory
ON Clients.ID = ClientCategory.ClientID
INNER JOIN Categories
ON ClientCategory.CategoryID = Categories.ID;

-- g --
SELECT Clients.Name + ' ' + Clients.Surname AS FullName, Categories.Name
FROM Clients
LEFT JOIN ClientCategory
ON Clients.ID = ClientCategory.ClientID
LEFT JOIN Categories
ON ClientCategory.CategoryID = Categories.ID;

-- h --
SELECT Orders.ID AS OrderID, Orders.OrderDate, Rooms.ID AS RoomID, Rooms.Price AS RoomPrice, Rooms.Capacity AS RoomCapacity
FROM Orders
RIGHT JOIN Rooms
ON Orders.RoomID = Rooms.ID;

-- i --
SELECT T1.Surname, T1.Name, T1.Patronymic, T1.Document
FROM Clients AS T1
UNION
SELECT T2.Surname, T2.Name, T2.Patronymic, T2.Document
FROM Employees AS T2;