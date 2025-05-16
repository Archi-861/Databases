USE `seschool_06`;


-- 1

CREATE TABLE `ZootopiaCharacters`(
	`CharacterID` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`CharacterName` VARCHAR(75) UNIQUE NOT NULL,
	`Species` VARCHAR(75) NOT NULL,
	`Role` ENUM('Главный герой', 'Антагонист', 'Второстепенный персонаж') DEFAULT 'Второстепенный персонаж' NOT NULL,
	`Occupation` VARCHAR(100),
	`Catchphrase` VARCHAR(255)
);



-- 2

INSERT INTO `ZootopiaCharacters` (`CharacterName`, `Species`, `Role`, `Occupation`, `Catchphrase`)
	VALUES 
			('Judy Hopps', 'Кролик', 'Главный герой', 'Полицейский','Сначала попробуй!'),
			('Nick Wilde', 'Лиса', 'Главный герой', 'Полицейский', 'Скользкий как лиса!'),
			('Chief Bogo', 'Буйвол','Второстепенный персонаж', 'Шеф полиции', NULL),
			('Bellwether', 'Овца', 'Антагонист', 'Мэр', NULL),
			('Flash', 'Ленивец', 'Второстепенный персонаж', 'Сотрудник DMV', NULL),
			('Mr. Big', 'Полярный медведь', 'Второстепенный персонаж', 'Босс мафии', 'Твое слово — мое слово'),
			('Finnick', 'Лиса', 'Второстепенный персонаж', 'Мошенник', NULL),
			('Clawhauser', 'Гепард', 'Второстепенный персонаж', 'Сотрудник полиции', 'Добро пожаловать в Зверополис!'),
			('Duke Weaselton', 'Ласка', 'Второстепенный персонаж', 'Контрабандист', NULL),
			('Yax', 'Як', 'Второстепенный персонаж', 'Управляющий спа-салоном', NULL);
			
			
			

-- 3

CREATE TABLE `Customers` (
	`CustomerID` INT PRIMARY KEY AUTO_INCREMENT
	`FirstName` VARCHAR(100) NOT NULL,
	`LastName` VARCHAR(100) NOT NULL,
	`Email` VARCHAR(150) UNIQUE,
	`PhoneNumber` VARCHAR(20)
);
 
 
CREATE TABLE `Orders` (
	`OrderID` INT PRIMARY KEY AUTO_INCREMENT,
	`OrderDate` DATETIME NOT NULL,
	`TotalAmount` DECIMAL(10, 2) NOT NULL,
	`CustomerID` INT NOT NULL
	CONSTRAINT fk_customers
	FOREIGN KEY (`CustomerID`)
	REFERENCES `Customer`(`CustomerID`)
);


