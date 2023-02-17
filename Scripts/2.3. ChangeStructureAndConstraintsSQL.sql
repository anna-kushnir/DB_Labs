-- =============================================================
-- Додавання та редагування полів, обмежень та таблиць.
-- =============================================================

USE MyDB;

/* Додавання первинного ключа таблиці. */
ALTER TABLE ClientCategory
	ADD CONSTRAINT PK_ClientCategory
	PRIMARY KEY(ClientID, CategoryID);

/* Додавання поля до таблиці. */
ALTER TABLE Clients
	ADD AddInformation NVARCHAR(100);

/* Додавання перевірки значення полів. */
ALTER TABLE Clients
	ADD CONSTRAINT CK_Clients_DiscountAmount
	CHECK (DiscountAmount BETWEEN 0 AND 1);

ALTER TABLE Hotels
	ADD CONSTRAINT CK_Hotels_Rooms
	CHECK (Rooms >= 0 AND AvailableRooms >= 0);

/* Редагування типу поля таблиці. */
ALTER TABLE Hotels
	ALTER COLUMN Name NVARCHAR(50) NOT NULL;

/* Редагування атрибутів поля таблиці. */
ALTER TABLE Hotels
	ALTER COLUMN Rooms INT NOT NULL;

ALTER TABLE Hotels
	ALTER COLUMN AvailableRooms INT NOT NULL;

ALTER TABLE IncomePerDay
	ALTER COLUMN Amount MONEY NOT NULL;

/* Додавання значення за замовчуванням для поля. */
ALTER TABLE Clients
	ADD CONSTRAINT DF_Clients_DiscountAmount 
	DEFAULT 0 FOR DiscountAmount;

ALTER TABLE Hotels
	ADD CONSTRAINT DF_Hotels_Rooms
	DEFAULT 0 FOR Rooms;

ALTER TABLE Hotels
	ADD CONSTRAINT DF_Hotels_AvailableRooms
	DEFAULT 0 FOR AvailableRooms;

/* Додавання обмеження на унікальність значення поля. */
ALTER TABLE Employees
	ADD CONSTRAINT UQ_Employees_Document
	UNIQUE (Document);

ALTER TABLE Booking
	ADD CONSTRAINT UQ_Booking_OrderID
	UNIQUE (OrderID);

/* Відключення перевірки значення поля.  */
ALTER TABLE Positions
	NOCHECK CONSTRAINT CK_Positions_Name;