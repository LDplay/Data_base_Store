---1.
DECLARE @num1_1 FLOAT = 10.5;
DECLARE @num2_1 FLOAT = 20.7;
DECLARE @num3_1 FLOAT = 15.3;

SELECT AVG(value) AS average
FROM (VALUES (@num1_1), (@num2_1), (@num3_1)) AS Numbers(value);



---2.
DECLARE @hour INT = DATEPART(HOUR, GETDATE());

IF @hour >= 6 AND @hour < 12
    PRINT 'Доброе утро!'
ELSE IF @hour >= 12 AND @hour < 18
    PRINT 'Добрый день!'
ELSE IF @hour >= 18 AND @hour < 24
    PRINT 'Добрый вечер!'
ELSE
    PRINT 'Доброй ночи!'



---3.
DECLARE @TicketNumber int = 123005;

	DECLARE @num1 int = @TicketNumber/100000% 10;
	DECLARE @num2 int = @TicketNumber / 10000% 10;
	DECLARE @num3 int = @TicketNumber/1000% 10;
	DECLARE @num4 int = @TicketNumber/ 100% 10;
	DECLARE @num5 int = @TicketNumber/ 10% 10;
	DECLARE @num6 int = @TicketNumber % 10;
	IF @num1 + @num2 + @num3 = @num4 + @num5+ @num6
	BEGIN
		DECLARE @FTicketNumber nvarchar(6) = RIGHT('000000' + CAST(@TicketNumber AS nvarchar(6)), 6); 
		PRINT 'Cчастливое число!';
	END
	ELSE
		PRINT 'НЕ счастливое число!';


