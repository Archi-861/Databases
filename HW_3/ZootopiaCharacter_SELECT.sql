USE `seschool_06`;



-- 2.1

SELECT ZoCh.`CharacterName`, ZoCh.`Species` FROM `ZootopiaCharacters` AS ZoCh;



-- 2.2

SELECT ZoCh.`CharacterName` FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`Species` = 'Лиса';
	
	
	
-- 2.3

SELECT ZoCh.`CharacterName` FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`Species` = 'Кролик' OR ZoCh.`Species` = 'Буйвол';
	
	
	
-- 2.4

SELECT * FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`Occupation` IS NOT NULL
	ORDER BY ZoCh.`CharacterName`
	LIMIT 3;
	
	
	
-- 2.5

SELECT * FROM `ZootopiaCharacters` AS ZoCh
	GROUP BY ZoCh.`Occupation`
	ORDER BY ZoCh.`Role` DESC;
	
	
	
-- 2.6

SELECT * FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`CharacterName` LIKE '%a%'
	ORDER BY ZoCh.`CharacterName` DESC;
	
	
	
-- 2.7

SELECT ZoCh.`Role` FROM `ZootopiaCharacters` AS ZoCh
	GROUP BY ZoCh.`Role`
	ORDER BY ZoCh.`Role`;
	
	
	
-- 2.8

SELECT * FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`Catchphrase` IS NOT NULL
	ORDER BY ZoCh.`CharacterName`
	LIMIT 5;
	
	
	
-- 2.9

SELECT * FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`Species` = 'Кролик'
	ORDER BY ZoCh.`CharacterName`
	LIMIT 1
	OFFSET 2;
	
	
	
-- 2.10

SELECT COUNT(*) AS `Количество персонажей` FROM `ZootopiaCharacters`;



-- 2.11

SELECT ZoCh.`Occupation`, COUNT(*) AS `Количество персонажей по каждой профессии` FROM `ZootopiaCharacters` AS ZoCh
	GROUP BY ZoCh.`Occupation`;



-- 2.12

SELECT ZoCh.`Occupation`, COUNT(*) AS `Количество персонажей по каждой профессии` FROM `ZootopiaCharacters` AS ZoCh
	GROUP BY ZoCh.`Occupation`
	ORDER BY `Количество персонажей по каждой профессии` DESC;

-- 2.13

SELECT ZoCh.`Species`, COUNT(*) AS `Количество персонажей каждого вида` FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`Role` = 'Главный герой'
	GROUP BY ZoCh.`Species`;

-- 2.14

SELECT ZoCh.`CharacterName`, ZoCh.`Occupation` FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`Occupation` IN (
		SELECT ZoCh1.`Occupation` FROM `ZootopiaCharacters` AS ZoCh1
			GROUP BY ZoCh1.`Occupation`
			HAVING COUNT(*) = 1
	);	

-- 2.15

SELECT * FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`Occupation` IS NOT NULL
	ORDER BY ZoCh.`CharacterName`
	LIMIT 5;

-- 2.16

SELECT ZoCh.`Occupation`, COUNT(*) AS `Количество персонажей` FROM `ZootopiaCharacters` AS ZoCh
	GROUP BY ZoCh.`Occupation`
	HAVING COUNT(*) > 1
	ORDER BY ZoCh.`Occupation`;


-- 2.17

SELECT ZoCh.`Species`, COUNT(*) AS `Количество персонажей` FROM `ZootopiaCharacters` AS ZoCh
	WHERE ZoCh.`Occupation` IS NOT NULL
	GROUP BY ZoCh.`Species`
	ORDER BY `Количество персонажей`
	LIMIT 3;