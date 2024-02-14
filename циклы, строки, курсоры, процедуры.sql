---1.
DECLARE @i INT = 1;
DECLARE @factorial BIGINT = 1;

WHILE @i <= 25
BEGIN
    SET @factorial = @factorial * @i;
    PRINT 'Факториал числа ' + CAST(@i AS NVARCHAR(2)) + ' = ' + CAST(@factorial AS NVARCHAR(255));
    SET @i = @i + 1;
END;

---2.
DECLARE @num INT = 3;

WHILE @num <= 1000000
BEGIN
    DECLARE @divisor INT = 2;
    DECLARE @isPrime BIT = 1;

    WHILE @divisor <= SQRT(@num)
    BEGIN
        IF @num % @divisor = 0
        BEGIN
            SET @isPrime = 0;
            BREAK;
        END;
        SET @divisor = @divisor + 1;
    END;

    IF @isPrime = 1
        PRINT CAST(@num AS NVARCHAR(10));

    SET @num = @num + 1;
END;


---3.
DECLARE @balance INT = 500; 
DECLARE @bet INT = 10;
DECLARE @count INT = 0; 

WHILE @balance >= @bet AND @count <= 50
BEGIN
    SET @count = @count + 1;

    DECLARE @number1 INT = ROUND(RAND() * 7, 0);
    DECLARE @number2 INT = ROUND(RAND() * 7, 0);
    DECLARE @number3 INT = ROUND(RAND() * 7, 0);

    PRINT 'Текущий баланс: ' + CAST(@balance AS VARCHAR(10));

    PRINT 'Выпавшие числа: ' + CAST(@number1 AS VARCHAR(2)) + '-' + CAST(@number2 AS VARCHAR(2)) + '-' + CAST(@number3 AS VARCHAR(2));

    IF @number1 = 7 AND @number2 = 7 AND @number3 = 7
    BEGIN
        SET @balance = @balance + 777 - @bet;
        PRINT 'Поздравляем! Вы выиграли 777 кредитов!';
        BREAK;
    END
    ELSE IF @number1 = @number2 AND @number2 = @number3
    BEGIN
        SET @balance = @balance + 50 - @bet;
        PRINT 'Вы выиграли приз в 50 кредитов!';
    END

    ELSE
    BEGIN
        SET @balance = @balance - @bet;
        PRINT 'Увы, вы не выиграли.';
    END
END

IF @balance < @bet
    PRINT 'К сожалению, вы проиграли. Игра окончена.';
ELSE
    PRINT 'Поздравляем! Вы победили в этом раунде.';



---4.
DECLARE @inputString NVARCHAR(MAX) = 'Привет, этот текст содержит слово XXX';

IF EXISTS (
    SELECT * 
    FROM (VALUES ('viagra'), ('xxx')) AS BadWords(word)
    WHERE CHARINDEX(LOWER(word), LOWER(@inputString)) > 0
)
    PRINT 'Это спам/получи бан'
ELSE
    PRINT 'Это не спам';


---5.
DECLARE @dbName NVARCHAR(MAX);
DECLARE @size_mb DECIMAL(18, 2);
DECLARE @counter INT = 1;

DECLARE db_cursor CURSOR FOR
SELECT name, (SELECT SUM(size * 8 / 1024) FROM sys.master_files WHERE database_id = DB_ID(name)) AS size_mb
FROM sys.databases WHERE database_id > 4 AND state_desc = 'ONLINE';

OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @dbName, @size_mb;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @dbName;

    IF @counter % 4 = 0
        PRINT '--- Каждая четвёртая база ---';

    IF CHARINDEX('A', @dbName) > 0
        PRINT '--- Содержит букву "A" ---';

    IF @size_mb < 1024 
        PRINT '--- Размер меньше 1МБ ---';

    SET @counter = @counter + 1;
    FETCH NEXT FROM db_cursor INTO @dbName, @size_mb;
END;

CLOSE db_cursor;
DEALLOCATE db_cursor;






