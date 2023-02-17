-- =============================================================
-- Додавання даних до таблиць.
-- =============================================================

USE MyDB;

INSERT INTO Clients (
	Surname, Name, Patronymic, Document, AddInformation
	)
	VALUES
	('Tate', 'Tabita', null, '001956782426', null),
	('Tate', 'Bob', null, '002046183263', 'Works in a diner'),
	('Blossom', 'Sheril', null, '003791936729', 'Has her own company'),
	('Diesel', 'Vin', null, '003527193001', 'An actor'),
	('Ukrainka', 'Lesya', null, 'CX271835', 'A writer'),
	('Shevchenko', 'Taras', 'Shryhorovych', '57913729', 'The most famous ukrainian writer'),
	('Noname', 'Sombody', null, '000000000', null),
	('Stetsenko', 'Alisa', 'Volodymyrivna', '001729372', null),
	('Pogoreltseva', 'Tetiana', 'Mykhaylivna', '002738171', null),
	('Reinhart', 'Lily', null, '081936273', 'An actress'),
	('Zaltsman', 'Lizzy', null, '001983936', null),
	('Cuper', 'Polly', null, '009826381', null),
	('Salvatore', 'Stephan', null, '010101010', 'Knows everything about everyone'),
	('Salvatore', 'Damon', null, '111111111', null),
	('Shevchenko', 'Kateryna', 'Shryhorivna', 'EE829128', null),
	('Shostak', 'Artem', 'Serhiyovych', '001729362', 'Student')
	;

INSERT INTO Categories (
	Name, Discount
	)
	VALUES
	('Pensioner', 0.15),
	('Disabled', 0.2),
	('Single mother', 0.1),
	('Single father', 0.1),
	('Large family', 0.07),
	('Unemployed', 0.05),
	('Orphan', 0.15),
	('Student', 0.1),
	('Regular client', 0.1)
	;

INSERT INTO ClientCategory (
	ClientID, CategoryID
	)
	VALUES
	(3, 7),
	(6, 7),
	(2, 2),
	(8, 8),
	(9, 3),
	(9, 5),
	(16, 8)
	;

INSERT INTO Hotels (
	Name, Director, Location
	)
	VALUES
	('Kyiv Hotel', 'Ribalka Mykola Mykolayovych', 'Kyiv'),
	('Odessa Hotel', 'Rishko Oleksiy Victorovych', 'Odessa'),
	('Kharkiv Hotel', 'Kozak Serhiy Volodymyrovych', 'Kharkiv')
	;

INSERT INTO Comfort (
	Name
	)
	VALUES
	('Presidential'),
	('Suite'),
	('Junior suite'),
	('Standard'),
	('Economy')
	;

INSERT INTO Rooms (
	isAvailable, Price, BookingPrice, Capacity, ComfortID, HotelID
	)
	VALUES
	(1, 3000, 1500, 3, 1, 1),
	(1, 2000, 1000, 2, 1, 1),
	(1, 2000, 700, 3, 2, 1),
	(1, 1500, 500, 2, 2, 1),
	(1, 1000, 250, 3, 3, 1),
	(1, 700, 175, 2, 3, 1),
	(1, 500, 100, 3, 4, 1),
	(1, 400, 80, 2, 4, 1),
	(1, 300, 50, 2, 5, 1),
	(1, 200, 35, 1, 5, 1),
	(1, 1000, 300, 2, 1, 2),
	(1, 700, 200, 2, 2, 2),
	(1, 500, 100, 2, 4, 2),
	(1, 250, 50, 2, 5, 2),
	(1, 1000, 350, 2, 2, 3),
	(1, 500, 100, 3, 4, 3)
	;

INSERT INTO Positions (
	Name, Salary
	)
	VALUES
	('Administrator', 15000),
	('Manager', 12000),
	('Maid', 5000),
	('Cook', 7000),
	('Waiter', 5000),
	('Security guard', 7000),
	('Sommelier', 6000)
	;

INSERT INTO Employees (
	Surname, Name, Patronymic, Document, PositionID, HotelID
	)
	VALUES
	('Grande', 'Ariana', null, '001927381', 1, 1),
	('Rishko', 'Tetiana', 'Mykolaivna', '001825728', 2, 1),
	('Karpiuk', 'Oles', null, '001728192', 4, 1),
	('Larin', 'Mykola', 'Valeriyovych', '001927628', 6, 1),
	('Kropiv', 'Victor', 'Victorovych', '002818283', 7, 1),
	('Rurik', 'Stanislav', null, '002828162', 1, 2),
	('Rahiv', 'Karina', 'Andriivna', '001562738', 1, 3),
	('Shkred', 'Iryna', 'Pavlovna', 'CB728193', 6, 2),
	('West', 'Hanna', null, '00172829182', 2, 2),
	('Mykulinych', 'Ivan', 'Ivanovych', 'CB627183', 3, 2),
	('Klymenko', 'Nadiya', 'Stepanivna', 'EB637183', 4, 2),
	('Freyman', 'Nick', null, '01283947281', 6, 2),
	('Leibnits', 'Martin', null, '26173829193', 2, 3),
	('Wirna', 'Ivanna', 'Artemivna', '001828361', 4, 3),
	('Stepanenko', 'Stephania', 'Stepanivna', 'EE617293', 7, 3)
	;

INSERT INTO Payroll (
	Date
	)
	VALUES
	('2022-08-28'),
	('2022-08-30'),
	('2022-08-31'),
	('2022-09-28'),
	('2022-09-30'),
	('2022-10-28'),
	('2022-10-30'),
	('2022-10-31')
	;

INSERT INTO SalaryPayment (
	PayrollID, EmployeeID
	)
	VALUES
	(1, 6),
	(1, 8),
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 4),
	(2, 5),
	(3, 7),

	(4, 6),
	(4, 8),
	(5, 1),
	(5, 2),
	(5, 3),
	(5, 4),
	(5, 5),
	(5, 7),

	(6, 6),
	(6, 8),
	(7, 1),
	(7, 2),
	(7, 3),
	(7, 4),
	(7, 5),
	(8, 7)
	;

INSERT INTO IncomePerDay (
	Date
	)
	VALUES
	('2022-09-01'),
	('2022-09-02'),
	('2022-09-03'),
	('2022-09-04'),
	('2022-09-05'),
	('2022-09-06'),
	('2022-09-07'),
	('2022-09-08'),
	('2022-09-09'),
	('2022-09-10'),
	('2022-09-11'),
	('2022-09-12'),
	('2022-09-13'),
	('2022-09-14'),
	('2022-09-15'),
	('2022-09-16'),
	('2022-09-17'),
	('2022-09-18'),
	('2022-09-19'),
	('2022-09-20'),
	('2022-09-21'),
	('2022-09-22'),
	('2022-09-23'),
	('2022-09-24'),
	('2022-09-25'),
	('2022-09-26'),
	('2022-09-27'),
	('2022-09-28'),
	('2022-09-29'),
	('2022-09-30'),

	('2022-10-01'),
	('2022-10-02'),
	('2022-10-03'),
	('2022-10-04'),
	('2022-10-05'),
	('2022-10-06'),
	('2022-10-07'),
	('2022-10-08'),
	('2022-10-09'),
	('2022-10-10'),
	('2022-10-11'),
	('2022-10-12'),
	('2022-10-13'),
	('2022-10-14'),
	('2022-10-15'),
	('2022-10-16'),
	('2022-10-17'),
	('2022-10-18'),
	('2022-10-19'),
	('2022-10-20'),
	('2022-10-21'),
	('2022-10-22'),
	('2022-10-23'),
	('2022-10-24'),
	('2022-10-25'),
	('2022-10-26'),
	('2022-10-27'),
	('2022-10-28'),
	('2022-10-29'),
	('2022-10-30'),
	('2022-10-31'),

	('2022-11-01'),
	('2022-11-02'),
	('2022-11-03'),
	('2022-11-04'),
	('2022-11-05'),
	('2022-11-06'),
	('2022-11-07'),
	('2022-11-08'),
	('2022-11-09'),
	('2022-11-10'),
	('2022-11-11'),
	('2022-11-12'),
	('2022-11-13'),
	('2022-11-14'),
	('2022-11-15'),
	('2022-11-16'),
	('2022-11-17'),
	('2022-11-18'),
	('2022-11-19'),
	('2022-11-20'),
	('2022-11-21'),
	('2022-11-22'),
	('2022-11-23'),
	('2022-11-24'),
	('2022-11-25'),
	('2022-11-26'),
	('2022-11-27'),
	('2022-11-28'),
	('2022-11-29'),
	('2022-11-30')
	;

INSERT INTO Orders (
	OrderDate, RoomID, ClientID, CheckInDate, CheckOutDate
	)
	VALUES
	('2022-09-05', 2, 1, '2022-09-05', '2022-09-07'),
	('2022-09-07', 5, 3, '2022-09-07', '2022-09-15'),
	('2022-09-12', 7, 8, '2022-09-12', '2022-09-16'),
	('2022-11-12', 7, 2, '2022-11-12', '2022-11-16'),
	('2022-11-13', 5, 3, '2022-11-13', '2022-11-18'),
	('2022-11-15', 2, 6, '2022-11-15', '2022-11-16'),
	('2022-11-16', 3, 1, '2022-11-17', '2022-11-19'),
	('2022-11-16', 4, 2, '2022-11-17', '2022-11-19'),
	('2022-11-14', 6, 4, '2022-11-16', '2022-11-18'),
	('2022-11-11', 8, 5, '2022-11-15', '2022-11-19'),
	('2022-11-13', 9, 9, '2022-11-13', '2022-11-15'),
	('2022-11-14', 10, 7, '2022-11-14', '2022-11-15'),
	('2022-11-17', 12, 11, '2022-11-19', '2022-11-25')
	;

INSERT INTO Booking (
	OrderID, AdvancePayment, UnderPayment
	)
	SELECT 
		Orders.ID, Orders.BookingPrice, Orders.Bill - Orders.BookingPrice
	FROM Orders 
	WHERE Orders.BookingPrice IS NOT NULL
	;