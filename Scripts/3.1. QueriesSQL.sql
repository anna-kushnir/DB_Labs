-- a --
SELECT *
FROM Employees
WHERE HotelID = 2;

-- b --
SELECT *
FROM Positions
WHERE Salary > 10000;

-- c.1 --
SELECT *
FROM Rooms
WHERE Price < 1000 AND HotelID = 1;

-- c.2 --
SELECT *
FROM Rooms
WHERE Price < 1000 OR Capacity = 2;

-- c.3 --
SELECT *
FROM Rooms
WHERE NOT HotelID = 1;

-- d --
SELECT *
FROM Rooms
WHERE Price < 1000 AND NOT HotelID = 2 OR 
	Price < 500 AND Capacity = 2;

-- e.1 --
SELECT ID, Surname, Name, Document, Salary * 0.2 AS Premium
FROM Employees
WHERE Salary < 10000;

-- e.2 --
SELECT ID, Surname, Name, Document, Salary
FROM Employees
WHERE Salary / 2 > 3000;

-- f.i --
SELECT *
FROM Categories
WHERE Name IN ('Pensioner', 'Disabled', 'Orphan');

-- f.ii --
SELECT *
FROM Positions
WHERE Salary BETWEEN 7000 AND 12000;

-- f.iii --
SELECT *
FROM Clients
WHERE Patronymic LIKE '%ivna';

-- f.iv --
SELECT *
FROM Clients
WHERE Patronymic IS NULL;