-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'

DELIMITER $$
CREATE FUNCTION num_of_day(number BIGINT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE num_days BIGINT DEFAULT 0;
	DECLARE num_hours BIGINT DEFAULT 0;
	DECLARE num_minutes BIGINT DEFAULT 0;
	DECLARE num_seconds BIGINT DEFAULT 0;
    DECLARE result_str TEXT DEFAULT "";

	SET num_days = number DIV 86400;
	SET number = number % 86400;

	SET num_hours = number DIV 3600;
	SET number = number % 3600; 

	SET num_minutes = number DIV 60;

	SET num_seconds = number % 60;

    SET result_str = CONCAT(num_days, " days ");
	SET result_str = CONCAT(result_str, num_hours, " hours ");
	SET result_str = CONCAT(result_str, num_minutes, " minutes ");
	SET result_str = CONCAT(result_str, num_seconds, " seconds ");

    RETURN result_str;

END $$
DELIMITER;
