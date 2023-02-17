-- =============================================================
-- Створення зв'язків між таблицями, додавання зовнішніх ключів.
-- =============================================================

USE MyDB;

ALTER TABLE ClientCategory
	ADD CONSTRAINT FK_ClientCategory_ClientID
	FOREIGN KEY(ClientID) 
	REFERENCES Clients (ID)
	ON DELETE CASCADE;

ALTER TABLE ClientCategory
	ADD CONSTRAINT FK_ClientCategory_CategoryID
	FOREIGN KEY(CategoryID) 
	REFERENCES Categories (ID)
	ON DELETE CASCADE;

ALTER TABLE Employees
	ADD CONSTRAINT FK_Employees_PositionID
	FOREIGN KEY(PositionID) 
	REFERENCES Positions (ID)
	ON DELETE SET NULL;

ALTER TABLE Employees
	ADD CONSTRAINT FK_Employees_HotelID
	FOREIGN KEY(HotelID) 
	REFERENCES Hotels (ID)
	ON DELETE CASCADE;

ALTER TABLE Rooms
	ADD CONSTRAINT FK_Rooms_ComfortID
	FOREIGN KEY(ComfortID) 
	REFERENCES Comfort (ID)
	ON DELETE CASCADE;

ALTER TABLE Rooms
	ADD CONSTRAINT FK_Rooms_HotelID
	FOREIGN KEY(HotelID) 
	REFERENCES Hotels (ID)
	ON DELETE CASCADE;

ALTER TABLE Orders
	ADD CONSTRAINT FK_Orders_OrderDate
	FOREIGN KEY(OrderDate) 
	REFERENCES IncomePerDay (Date)
	ON DELETE NO ACTION;

ALTER TABLE Orders
	ADD CONSTRAINT FK_Orders_RoomID
	FOREIGN KEY(RoomID) 
	REFERENCES Rooms (ID)
	ON DELETE CASCADE;

ALTER TABLE Orders
	ADD CONSTRAINT FK_Orders_ClientID
	FOREIGN KEY(ClientID) 
	REFERENCES Clients (ID)
	ON DELETE CASCADE;

ALTER TABLE Booking
	ADD CONSTRAINT FK_Booking_OrderID
	FOREIGN KEY(OrderID) 
	REFERENCES Orders (ID)
	ON DELETE CASCADE;

ALTER TABLE SalaryPayment
	ADD CONSTRAINT FK_SalaryPayment_EmployeeID
	FOREIGN KEY(EmployeeID) 
	REFERENCES Employees (ID)
	ON DELETE CASCADE;

ALTER TABLE SalaryPayment
	ADD CONSTRAINT FK_SalaryPayment_PayrollID
	FOREIGN KEY(PayrollID) 
	REFERENCES Payroll (ID)
	ON DELETE CASCADE;