-- a.	�������� �������������, ����� ������ ��� � �������� ������� --
CREATE VIEW Employees_KyivHotel
AS SELECT T1.ID, T1.Surname, T1.Name, T1.Patronymic, T1.Document, T2.Name Position
FROM Employees AS T1, Positions AS T2
WHERE T1.PositionID = T2.ID
	AND T1.HotelID = 2;
	
SELECT *
FROM Employees_KyivHotel;

-- b.	�������� �������������, ����� ������ ��� � �������� ������� 
-- �� ����������� �������������, ����� �������� � �.a --
CREATE VIEW Employees_KyivHotel_Salary
AS SELECT T1.ID, T1.Surname, T1.Position, T2.Salary
FROM Employees_KyivHotel AS T1, Positions AS T2
WHERE T1.Position = T2.Name;

SELECT *
FROM Employees_KyivHotel_Salary;

-- c.	������������ ������������� � ������������� ������� ALTER VIEW --
ALTER VIEW Employees_KyivHotel_Salary
AS SELECT T1.ID, T1.Surname, T1.Position, T2.Salary
FROM Employees_KyivHotel AS T1, Positions AS T2
WHERE T1.Position = T2.Name
	AND Salary > 7000;

SELECT *
FROM Employees_KyivHotel_Salary;

-- d.	�������� ���������� ���������� ��� �� ������������� � ������������� 
-- ���������� �������� (��������� � MsSQL sp_help, sp_helptext �� sp_depends) --
EXEC sp_help @objname = N'Employees_KyivHotel_Salary';
EXEC sp_helptext @objname = N'Employees_KyivHotel_Salary';
EXEC sp_depends @objname = N'Employees_KyivHotel_Salary';

EXEC sp_help @objname = N'Employees_KyivHotel';
EXEC sp_helptext @objname = N'Employees_KyivHotel';
EXEC sp_depends @objname = N'Employees_KyivHotel';