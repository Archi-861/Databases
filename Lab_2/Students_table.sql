USE `seschool_06`;



CREATE TABLE IF NOT EXISTS `Students_table` (
	`№` BIGINT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Фамилия` VARCHAR(50) NOT NULL,
	`Дата рождения` DATE NOT NULL,
	`Пол` ENUM('ж', 'м') NOT NULL,
	`СНИЛС` VARCHAR(14) UNIQUE NOT NULL,
	`Курс` TINYINT NOT NULL DEFAULT 1,
	`Группа` VARCHAR(10) NOT NULL,
	`Средний балл` FLOAT UNSIGNED NOT NULL,
	`Хобби` VARCHAR(50) DEFAULT '-'
);

INSERT INTO `Students_table` (`Фамилия`, `Пол`, `Дата рождения`, `СНИЛС`, `Курс`, `Группа`, `Средний балл`, `Хобби`)
	VALUES 
		('Горбунова Е.А.', 'ж', '1993-07-21', '128-389-457 23', 3, 'АУС-36', 86.3, 'Плавание'),
		('Ильин Л.И.', 'м', '1993-12-25', '279-237-417 25', 3, 'АУС-35', 98.1, 'Чтение'),
   	('Борисенко С.Д.', 'м', '1994-11-01', '872-954-736 94', 2, 'АВМ-41', 92.4, 'Шахматы'),
   	('Макаров С.С.', 'м', '1995-05-23', '864-278-354 11', 1, 'ЭОП-118', 82.0, 'Альпинизм'),
   	('Курилин Д.В.', 'м', '1992-04-16', '711-257-696 85', 3, 'АУС-36', 63.7, 'Плавание'),
		('Иноземцева Д.Д.', 'ж', '1993-08-12', '112-598-478 23', 3, 'АУС-36', 91.8, 'Дайвинг'),
   	('Шипунов Р.Е.', 'м', '1995-03-04', '996-478-258 75', 1, 'ЭОП-238', 75.4, DEFAULT),
   	('Скородумов Д.Б.', 'м', '1994-01-14', '359-489-269 66', 1, 'ЭОП-118', 72.6, 'Бильярд'),
   	('Пикулина С.А.', 'ж', '1995-03-02', '234-217-598 89', 1, 'ЭОП-238', 86.4, 'Шахматы'),
   	('Сафронова М.Д.', 'ж', '1993-08-19', '887-555-124 17', 3, 'АУС-36', 90.1, 'Плавание'),
   	('Ковшова Э.А.', 'ж', '1995-09-26', '469-489-557 12', 1, 'ЭОП-238', 65.8, 'Бильярд'),
   	('Зайцев К.С.', 'м', '1993-12-15', '689-565-487 38', 3, 'АУС-35', 72.6, 'Чтение'),
   	('Антонова С.Д.', 'м', '1992-12-19', '773-557-986 12', 3, 'АУС-35', 99.6, DEFAULT),
   	('Кондрашова Е.В.', 'м', '1993-02-08', '669-476-123 76', 3, 'АУС-35', 97.7, 'Чтение'),
   	('Кукушкина Е.В.', 'м', '1995-10-14', '369-568-559 56', 2, 'АВМ-41', 90.2, 'Шахматы');




--1
SELECT * FROM `Students_table`
	WHERE `Students_table`.`Пол` = 'ж';
	
	
	
--2
SELECT * FROM `Students_table`
	WHERE `Students_table`.`Курс` = '3';
	
	
	
--3
SELECT * FROM `Students_table`
	WHERE `Students_table`.`Дата рождения` > '1994-02-03';
	
	
	
--4
SELECT * FROM `Students_table`
	WHERE `Students_table`.`Средний балл` >= 70 AND `Students_table`.`Средний балл` <= 85;
	
		
	
SELECT * FROM `Students_table`
	WHERE `Students_table`.`Средний балл` BETWEEN 70 AND 85;
	
	
	
--5
SELECT * FROM `Students_table`
	WHERE `Students_table`.`Курс` = 2 AND `Students_table`.`Курс` = 3;
	
	
	
SELECT * FROM  `Students_table`
	WHERE  `Students_table`.`Курс` IN (2,3);
	
	
	
--6
SELECT * FROM  `Students_table`
	WHERE  `Students_table`.`Фамилия` LIKE `С%` OR  `Students_table`.`Фамилия` LIKE `К%`;
	
	
	
--7
SELECT * FROM  `Students_table`
	WHERE  `Students_table`.`Пол` = 'ж' AND  `Students_table`.`Группа` LIKE 'АУС%';

	
	
--8
SELECT * FROM  `Students_table`
	WHERE  `Students_table`.`Хобби` = '-';
	
	
	
--9
SELECT DISTINCT `Курс` FROM `Students_table`;
	


--10
SELECT * FROM  `Students_table`
	ORDER BY  `Students_table`.`Средний балл`
	LIMIT 5;
	
	
	
--11
SELECT * FROM  `Students_table`
	ORDER BY `Students_table`.`Средний балл` DESC,  `Students_table`.`Фамилия`
	LIMIT 10;
	
	
	
--12
SELECT 
	COUNT(*),AS 'Количество студентов',
	COUNT(), WHERE `Students_table`.`Хобби` = '-' AS 'Количество студентов без хобби',
	MAX(`Students_table`.`Средний балл`) AS 'Максимальный балл', 
	MIN(`Students_table`.`Средний балл`) AS 'Минимальный балл',
	AVG(`Students_table`.`Средний балл`) AS 'Средний балл'
FROM `Students_table`;
	


--13
SELECT `Курс`, COUNT(*) FROM `Students_table`
	GROUP BY `Курс`;



--14
SELECT `Пол`, AVG(`Students_table`.`Средний балл`) FROM `Students_table`
	GROUP BY `Пол`;
	
	
	
--15
SELECT MAX(`Средний балл`) FROM `Students_table`
	WHERE `Students_table`.`Курс` = '3' AND `Students_table`.`Дата рождения` >= '1993-01-01';
	
	
--16
SELECT
	CASE
		WHEN `Students_table`.`Средний балл` BETWEEN 80 AND 100 THEN 'Отлично',
		WHEN `Students_table`.`Средний балл` BETWEEN 60 AND 79 THEN 'Хорошо',
		WHEN `Students_table`.`Средний балл` BETWEEN 40 AND 59 THEN 'Удовлетворительно'
		ELSE 'Неудовлетворительно';
	END AS 'Оценка (по пятибалльной системе)'
FROM `Students_table`;
