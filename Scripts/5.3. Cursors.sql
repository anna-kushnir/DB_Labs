USE MyDB
GO

-- a.	створити курсор --
DECLARE my_cursor CURSOR SCROLL
	FOR SELECT * FROM Orders
	FOR UPDATE

-- b.	відкрити курсор --
OPEN my_cursor

-- c.	вибірка даних, робота з курсорами
FETCH FIRST FROM my_cursor
FETCH RELATIVE 2 FROM my_cursor
FETCH NEXT FROM my_cursor
FETCH ABSOLUTE 5 FROM my_cursor
FETCH LAST FROM my_cursor
FETCH RELATIVE -3 FROM my_cursor

SELECT * FROM Orders

UPDATE Orders
SET ClientID = 14
WHERE CURRENT OF my_cursor

FETCH LAST FROM my_cursor

DELETE
FROM Orders
WHERE CURRENT OF my_cursor

SELECT * FROM Orders

CLOSE my_cursor
DEALLOCATE my_cursor