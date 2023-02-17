-- a.	����� � ������������� ������� COUNT --
SELECT ID, Name, 
(SELECT COUNT(*) FROM Rooms WHERE Rooms.HotelID = Hotels.ID) AS Rooms,
(SELECT COUNT(*) FROM Rooms WHERE Rooms.HotelID = Hotels.ID AND Rooms.IsAvailable = 1) AS AvailableRooms
FROM Hotels;

-- b.	����� � ������������� ������� SUM --
SELECT ID, Name + ' ' + Surname AS FullName, Document, 
(SELECT ROUND(SUM(Categories.Discount), 3) FROM ClientCategory, Categories WHERE ClientCategory.ClientID = Clients.ID AND Categories.ID = ClientCategory.CategoryID) AS Discount
FROM Clients
WHERE EXISTS (SELECT * FROM ClientCategory, Categories WHERE ClientCategory.ClientID = Clients.ID AND Categories.ID = ClientCategory.CategoryID)

-- c.	����� � ������������� ������� UPPER, LOWER --
SELECT Hotels.ID, LOWER(Hotels.Name) AS Name, UPPER(Hotels.Location) AS Location
FROM Hotels;

-- d.	����� � ������������� ������� ��� ������ � ������ --
SELECT Orders.ID AS OrderID, Clients.Surname + ' ' + Clients.Name AS ClientName, Orders.OrderDate, DATEDIFF(day, Orders.CheckInDate, Orders.CheckOutDate) AS Duration, Orders.Bill
FROM Orders, Clients 
WHERE Orders.ClientID = Clients.ID;

-- e.	 ����� � ������������� ���������� �� �������� �������� --
SELECT HotelID, (SELECT Name FROM Positions WHERE Positions.ID = Employees.PositionID) AS Position, COUNT(*) AS Employees
FROM Employees
GROUP BY PositionID, HotelID;

-- f.	����� � ������������� ����� ������ ���� HAVING --
SELECT HotelID, COUNT(*) AS Employees
FROM Employees
GROUP BY HotelID
HAVING COUNT(*) > 4;

-- g.	����� � ������������� HAVING ��� GROUP BY --
SELECT SUM(Amount) AS FullPayroll
FROM Payroll
HAVING SUM(Amount) > 200000;

-- h.	����� � ������������� ������� row_number() over ... --
SELECT ROW_NUMBER() OVER(ORDER BY Surname ASC, Name ASC) AS Row, Surname + ' ' + Name AS FullName, Document
FROM Clients;

-- i.	����� � ������������� ���������� �� �������� �������� --
SELECT *
FROM Orders
WHERE Bill < 5000
ORDER BY OrderDate ASC, CheckInDate ASC, CheckOutDate ASC, Bill ASC;