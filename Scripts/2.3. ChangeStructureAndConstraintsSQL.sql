-- =============================================================
-- ��������� �� ����������� ����, �������� �� �������.
-- =============================================================

USE MyDB;

/* ��������� ���������� ����� �������. */
ALTER TABLE ClientCategory
	ADD CONSTRAINT PK_ClientCategory
	PRIMARY KEY(ClientID, CategoryID);

/* ��������� ���� �� �������. */
ALTER TABLE Clients
	ADD AddInformation NVARCHAR(100);

/* ��������� �������� �������� ����. */
ALTER TABLE Clients
	ADD CONSTRAINT CK_Clients_DiscountAmount
	CHECK (DiscountAmount BETWEEN 0 AND 1);

ALTER TABLE Hotels
	ADD CONSTRAINT CK_Hotels_Rooms
	CHECK (Rooms >= 0 AND AvailableRooms >= 0);

/* ����������� ���� ���� �������. */
ALTER TABLE Hotels
	ALTER COLUMN Name NVARCHAR(50) NOT NULL;

/* ����������� �������� ���� �������. */
ALTER TABLE Hotels
	ALTER COLUMN Rooms INT NOT NULL;

ALTER TABLE Hotels
	ALTER COLUMN AvailableRooms INT NOT NULL;

ALTER TABLE IncomePerDay
	ALTER COLUMN Amount MONEY NOT NULL;

/* ��������� �������� �� ������������� ��� ����. */
ALTER TABLE Clients
	ADD CONSTRAINT DF_Clients_DiscountAmount 
	DEFAULT 0 FOR DiscountAmount;

ALTER TABLE Hotels
	ADD CONSTRAINT DF_Hotels_Rooms
	DEFAULT 0 FOR Rooms;

ALTER TABLE Hotels
	ADD CONSTRAINT DF_Hotels_AvailableRooms
	DEFAULT 0 FOR AvailableRooms;

/* ��������� ��������� �� ���������� �������� ����. */
ALTER TABLE Employees
	ADD CONSTRAINT UQ_Employees_Document
	UNIQUE (Document);

ALTER TABLE Booking
	ADD CONSTRAINT UQ_Booking_OrderID
	UNIQUE (OrderID);

/* ³��������� �������� �������� ����.  */
ALTER TABLE Positions
	NOCHECK CONSTRAINT CK_Positions_Name;