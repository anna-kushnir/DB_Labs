-- =============================================================
-- ��������� ����, �������� �� �������.
-- =============================================================

USE MyDB;

/* ��������� �������� �������� ����. */
ALTER TABLE Clients
	DROP CONSTRAINT CK_Clients_Patronymic;

ALTER TABLE Employees
	DROP CONSTRAINT CK_Employees_Patronymic;

/* ��������� ���������� �����. */
ALTER TABLE IncomePerDay
	DROP CONSTRAINT FK_IncomePerDay_OddID;
	
/* ��������� ����. */
ALTER TABLE IncomePerDay
	DROP COLUMN OddID;

/* ��������� �������� ���� �� �������������. */
ALTER TABLE OddTable
	DROP CONSTRAINT DF_OddTable_OddColumn;

/* ��������� ���������� �����. */
ALTER TABLE OddTable
	DROP CONSTRAINT PK_OddTable;

/* ��������� ��������� �� ���������� �������� ����. */
ALTER TABLE OddTable
	DROP CONSTRAINT UQ_OddTable_OddColumn;

/* ��������� �������. */
DROP TABLE IF EXISTS OddTable;