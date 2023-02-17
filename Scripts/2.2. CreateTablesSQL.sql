-- =============================================================
-- Створення таблиць.
-- =============================================================

USE MyDB;

CREATE TABLE Clients (
	ID INT IDENTITY,
	Surname NVARCHAR(20) NOT NULL,
	Name NVARCHAR(20) NOT NULL,
	Patronymic NVARCHAR(20),
	Document NVARCHAR(12),
	DiscountAmount REAL,
	CONSTRAINT PK_Clients PRIMARY KEY(ID),
	CONSTRAINT CK_Clients_Surname CHECK(Surname != ''),
	CONSTRAINT CK_Clients_Name CHECK(Name != ''),
	CONSTRAINT CK_Clients_Patronymic CHECK(Patronymic != ''),
	CONSTRAINT UQ_Clients_Document UNIQUE (Document)
);

CREATE TABLE Categories (
	ID INT IDENTITY,
	Name NVARCHAR(30) NOT NULL,
	Discount REAL,
	CONSTRAINT PK_Categories PRIMARY KEY(ID),
	CONSTRAINT CK_Categories_Discount CHECK (Discount BETWEEN 0 AND 1)
);

CREATE TABLE ClientCategory (
	ClientID INT NOT NULL,
	CategoryID INT NOT NULL,
);

CREATE TABLE Hotels (
	ID INT IDENTITY,
	Name NVARCHAR(20) NOT NULL,
	Location NVARCHAR(100),
	Director NVARCHAR(50),
	Rooms INT,
	AvailableRooms INT,
	CONSTRAINT PK_Hotels PRIMARY KEY(ID)
);

CREATE TABLE Positions (
	ID INT IDENTITY,
	Name NVARCHAR(20) NOT NULL,
	Salary MONEY NOT NULL,
	CONSTRAINT PK_Positions PRIMARY KEY(ID),
	CONSTRAINT CK_Positions_Name CHECK (Name != '')
);

CREATE TABLE Employees (
	ID INT IDENTITY,
	Surname NVARCHAR(20) NOT NULL,
	Name NVARCHAR(20) NOT NULL,
	Patronymic NVARCHAR(20),
	Document NVARCHAR(12),
	PositionID INT,
	Salary MONEY,
	HotelID INT,
	CONSTRAINT PK_Employees PRIMARY KEY(ID),
	CONSTRAINT CK_Employees_Surname CHECK(Surname != ''),
	CONSTRAINT CK_Employees_Name CHECK(Name != ''),
	CONSTRAINT CK_Employees_Patronymic CHECK(Patronymic != '')
);

CREATE TABLE SalaryPayment (
	ID INT IDENTITY,
	EmployeeID INT NOT NULL,
	PayrollID INT NOT NULL,
	CONSTRAINT PK_SalaryPayment PRIMARY KEY(ID)
);

CREATE TABLE Payroll (
	ID INT IDENTITY,
	Date DATE NOT NULL,
	Amount MONEY,
	CONSTRAINT PK_Payroll PRIMARY KEY(ID)
);

CREATE TABLE Comfort (
	ID INT IDENTITY,
	Name NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_Comfort PRIMARY KEY(ID)
);

CREATE TABLE Rooms (
	ID INT IDENTITY,
	IsAvailable BIT NOT NULL,
	Price MONEY NOT NULL,
	BookingPrice MONEY,
	Capacity INT NOT NULL,
	ComfortID INT NOT NULL,
	HotelID INT NOT NULL,
	CONSTRAINT PK_Rooms PRIMARY KEY(ID)
);

CREATE TABLE Booking (
	ID INT IDENTITY,
	OrderID INT,
	AdvancePayment MONEY,
	UnderPayment MONEY,
	CONSTRAINT PK_Booking PRIMARY KEY(ID)
);

CREATE TABLE Orders (
	ID INT IDENTITY,
	OrderDate DATE NOT NULL,
	RoomID INT NOT NULL,
	ClientID INT NOT NULL,
	CheckInDate DATETIME NOT NULL,
	CheckOutDate DATETIME NOT NULL,
	Bill MONEY NOT NULL,
	BookingPrice MONEY,
	CONSTRAINT PK_Orders PRIMARY KEY(ID)
);

/* Таблиця, створена для подальшого видалення. */
CREATE TABLE OddTable (
	ID INT,
	OddColumn NVARCHAR(20)
		CONSTRAINT DF_OddTable_OddColumn DEFAULT 7,
	CONSTRAINT PK_OddTable PRIMARY KEY(ID),
	CONSTRAINT UQ_OddTable_OddColumn UNIQUE (OddColumn)
);

CREATE TABLE IncomePerDay (
	Date DATE NOT NULL,
	Amount MONEY
		CONSTRAINT DF_IncomePerDay_Amount DEFAULT 0,
	OddID INT,
	CONSTRAINT PK_IncomePerDay PRIMARY KEY(Date),
	CONSTRAINT FK_IncomePerDay_OddID FOREIGN KEY (OddID) REFERENCES OddTable (ID)
);