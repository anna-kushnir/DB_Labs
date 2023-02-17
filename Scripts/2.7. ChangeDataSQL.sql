-- =============================================================
-- Редагування даних у таблицях.
-- =============================================================

UPDATE Categories
SET Discount = 0.1
WHERE Discount < 0.1;

UPDATE Employees
SET Patronymic = 'Pavlivna'
WHERE Patronymic = 'Pavlovna';

UPDATE Employees
SET HotelID = 2
WHERE Surname = 'Rishko';

UPDATE Positions
SET Salary = 5500
WHERE Name = 'Sommelier';

UPDATE Employees
SET Salary = Positions.Salary
FROM Positions
WHERE Employees.PositionID = Positions.ID;

UPDATE Orders
SET Bill = (SELECT Price FROM Rooms WHERE Rooms.ID = Orders.RoomID) * DATEDIFF(day, CheckInDate, CheckOutDate);

UPDATE Orders
SET Bill = Bill - Bill * Clients.DiscountAmount
FROM Clients
WHERE Clients.ID = Orders.ClientID;

UPDATE Orders
SET BookingPrice = Rooms.BookingPrice * DATEDIFF(day, CheckInDate, CheckOutDate)
FROM Rooms
WHERE Rooms.ID = Orders.RoomID
	AND DATEDIFF(day, Orders.OrderDate, Orders.CheckInDate) > 0;

UPDATE Rooms
SET IsAvailable = 0
FROM Orders
WHERE Orders.RoomID = Rooms.ID
	AND CURRENT_TIMESTAMP BETWEEN Orders.CheckInDate 
	AND Orders.CheckOutDate;

UPDATE IncomePerDay
SET Amount = Orders.Bill
FROM Orders
WHERE Orders.OrderDate = IncomePerDay.Date;

UPDATE Clients
SET DiscountAmount = (SELECT SUM(Categories.Discount) 
							FROM ClientCategory, Categories 
							WHERE ClientCategory.ClientID = Clients.ID AND Categories.ID = ClientCategory.CategoryID)
WHERE EXISTS (SELECT * 
							FROM ClientCategory, Categories 
							WHERE ClientCategory.ClientID = Clients.ID AND Categories.ID = ClientCategory.CategoryID);

UPDATE Clients
SET DiscountAmount = 0
WHERE DiscountAmount IS NULL;

UPDATE Payroll
SET Amount = (SELECT SUM(Employees.Salary) 
				FROM SalaryPayment, Employees 
				WHERE SalaryPayment.PayrollID = Payroll.ID 
					AND SalaryPayment.EmployeeID = Employees.ID);