-- =============================================================
-- Видалення полів, обмежень та таблиць.
-- =============================================================

USE MyDB;

/* Видалення перевірки значення поля. */
ALTER TABLE Clients
	DROP CONSTRAINT CK_Clients_Patronymic;

ALTER TABLE Employees
	DROP CONSTRAINT CK_Employees_Patronymic;

/* Видалення зовнішнього ключа. */
ALTER TABLE IncomePerDay
	DROP CONSTRAINT FK_IncomePerDay_OddID;
	
/* Видалення поля. */
ALTER TABLE IncomePerDay
	DROP COLUMN OddID;

/* Видалення значення поля за замовчуванням. */
ALTER TABLE OddTable
	DROP CONSTRAINT DF_OddTable_OddColumn;

/* Видалення первинного ключа. */
ALTER TABLE OddTable
	DROP CONSTRAINT PK_OddTable;

/* Видалення обмеження на унікальність значення поля. */
ALTER TABLE OddTable
	DROP CONSTRAINT UQ_OddTable_OddColumn;

/* Видалення таблиці. */
DROP TABLE IF EXISTS OddTable;