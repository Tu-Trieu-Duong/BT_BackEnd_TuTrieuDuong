-- Tắt liên kết FK để xóa dữ liệu bảng
SET FOREIGN_KEY_CHECKS = 1;

TRUNCATE TABLE `like_res`;
TRUNCATE TABLE `rate_res`;
TRUNCATE TABLE `orders`;
TRUNCATE TABLE `sub_food`;
TRUNCATE TABLE `food`;
TRUNCATE TABLE `food_type`;
TRUNCATE TABLE `restaurant`;
TRUNCATE TABLE `users`;


CREATE TABLE `users` (
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`full_name` VARCHAR(255),
	`email` VARCHAR(255),
	`password` VARCHAR(255),
	`isActive` BOOL DEFAULT 1,
	
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `users` (`full_name`, `email`, `password`)
VALUES
('Nguyen Van A', 'a@gmail.com', '123456'),
('Tran Thi B', 'b@gmail.com', 'abcdef'),
('Le Van C', 'c@gmail.com', 'qwerty'),
('Pham Thi D', 'd@gmail.com', '123abc'),
('Hoang Van E', 'e@gmail.com', 'pass123'),
('Ngo Van F', 'f@gmail.com', 'xyz123');

CREATE TABLE `restaurant` (
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`res_name` VARCHAR(255),
	`image` VARCHAR(255),
	`desc` VARCHAR(255),
	`isActive` BOOL DEFAULT 1,
	
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `restaurant` (`res_name`, `image`, `desc`)
VALUES 
('Pizza House', 'pizza.jpg', 'Chuyên pizza Ý'),
('Sushi World', 'sushi.jpg', 'Sushi tươi ngon'),
('BBQ King', 'bbq.jpg', 'BBQ kiểu Hàn'),
('Burger Town', 'burger.jpg', 'Burger kiểu Mỹ'),
('Vegan Delight', 'vegan.jpg', 'Thức ăn thuần chay');


CREATE TABLE `rate_res` (
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`user_id` INT NOT NULL,
	`res_id` INT NOT NULL,
	`amount` INT,
	`date_rate` DATETIME,
	`isActive` BOOL DEFAULT 1,
	
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
	FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`id`),
	
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`)
VALUES 
(1, 1, 5, '2025-05-01 10:00:00'),
(2, 2, 4, '2025-05-02 12:30:00'),
(3, 3, 3, '2025-05-03 15:00:00'),
(4, 4, 5, '2025-05-04 18:45:00'),
(5, 5, 4, '2025-05-05 20:00:00'),
(1, 2, 3, '2025-05-06 09:00:00'),
(2, 1, 4, '2025-05-06 11:00:00'),
(3, 4, 5, '2025-05-06 13:00:00'),
(4, 5, 2, '2025-05-06 15:00:00'),
(5, 3, 4, '2025-05-06 17:00:00'),
(3, 1, 5, '2025-05-01 10:00:00'),
(3, 2, 4, '2025-05-02 12:30:00'), 
(3, 3, 3, '2025-05-03 15:00:00'), 
(2, 4, 5, '2025-05-04 18:45:00'), 
(2, 5, 4, '2025-05-05 20:00:00'), 
(1, 1, 3, '2025-05-06 09:00:00'); 


CREATE TABLE `like_res` (
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`user_id` INT NOT NULL,
	`res_id` INT NOT NULL,
	`date_like` DATETIME,
	`isActive` BOOL DEFAULT 1,
	
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
	FOREIGN KEY (`res_id`) REFERENCES `restaurant`(`id`),

-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`)
VALUES 
(1, 1, '2025-05-01'),
(2, 2, '2025-05-02'),
(3, 3, '2025-05-03'),
(4, 4, '2025-05-04'),
(5, 5, '2025-05-05'),
(1, 2, '2025-05-06'),
(2, 1, '2025-05-06'),
(3, 4, '2025-05-06'),
(4, 5, '2025-05-06'),
(5, 3, '2025-05-06'),
(1, 3, '2025-05-05'),
(1, 1, '2025-05-01'), 
(1, 2, '2025-05-02'),  
(1, 3, '2025-05-03'),  
(4, 4, '2025-05-04'), 
(4, 5, '2025-05-05'), 
(5, 1, '2025-05-06');

CREATE TABLE `food_type` (
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`type_name` VARCHAR(255),
	`isActive` BOOL DEFAULT 1,
	
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `food_type` (`type_name`)
VALUES 
('Pizza'),
('Sushi'),
('BBQ'),
('Burger'),
('Vegan');

CREATE TABLE `food` (
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`food_name` VARCHAR(255),
	`image` VARCHAR(255),
	`price` FLOAT,
	`desc` VARCHAR(255),
	`type_id` INT NOT NULL, 
	`isActive` BOOL DEFAULT 1,
	
	FOREIGN KEY (`type_id`) REFERENCES `food_type` (`id`),
	
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `food` (`food_name`, `image`, `price`, `desc`, `type_id`)
VALUES 
('Pizza Margherita', 'pizza1.jpg', 150.0, 'Pizza cổ điển Ý', 1),
('Sashimi Set', 'sashimi.jpg', 200.0, 'Sashimi cá hồi & cá ngừ', 2),
('BBQ Pork', 'bbq1.jpg', 180.0, 'Thịt heo nướng Hàn Quốc', 3),
('Cheeseburger', 'burger1.jpg', 100.0, 'Burger phô mai bò', 4),
('Vegan Salad', 'vegan1.jpg', 90.0, 'Salad rau củ thuần chay', 5);


CREATE TABLE `sub_food` (
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`sub_name` VARCHAR(255),
	`sub_price` FLOAT,
	`food_id` INT NOT NULL, 
	`isActive` BOOL DEFAULT 1,
	
	FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
	
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `sub_food` (`sub_name`, `sub_price`, `food_id`)
VALUES 
('Phô mai thêm', 20.0, 1),
('Wasabi thêm', 10.0, 2),
('Kim chi', 15.0, 3),
('Khoai tây chiên', 25.0, 4),
('Đậu hũ non', 12.0, 5);

CREATE TABLE `orders` (
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	`user_id` INT NOT NULL,
	`food_id` INT NOT NULL,
	`amount` INT,
	`code` VARCHAR(255),
	`arr_sub_id` VARCHAR(255),
	`isActive` BOOL DEFAULT 1,
	
	FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
	FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
	
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`)
VALUES 
(1, 1, 2, 'ORD001', '1'),
(2, 2, 1, 'ORD002', '2'),
(3, 3, 3, 'ORD003', '3'),
(4, 4, 2, 'ORD004', '4'),
(5, 5, 1, 'ORD005', '5'),
(1, 2, 1, 'ORD006', '2'),
(2, 3, 2, 'ORD007', '3'),
(3, 4, 1, 'ORD008', '4'),
(1, 1, 2, 'ORD001', '1'),   
(1, 2, 1, 'ORD002', '2'),   
(1, 3, 3, 'ORD003', '3'),  
(2, 4, 2, 'ORD004', '4'),   
(2, 5, 1, 'ORD005', '5'),  
(3, 1, 2, 'ORD006', '1');


-- Tìm 5 người có lượt like nhiều nhất
SELECT `like_res`.`user_id`, `users`.`id`, `users`.`full_name`, COUNT(like_res.user_id) AS "Số lượt like"
FROM `like_res`
INNER JOIN `users` ON `like_res`.`user_id` = `users`.`id`
WHERE `like_res`.isDeleted = 0 AND `users`.isDeleted = 0
GROUP BY `like_res`.`user_id`, `users`.`id`, `users`.`full_name`
ORDER BY COUNT(`like_res`.`user_id`) DESC
LIMIT 5;

-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT `like_res`.`res_id`, `restaurant`.`id`, `restaurant`.`res_name`, COUNT(`like_res`.`res_id`) AS "Số lượt like"
FROM `like_res`
INNER JOIN `restaurant` ON `like_res`.`res_id` = `restaurant`.`id`
WHERE `like_res`.isDeleted = 0 AND `restaurant`.isDeleted = 0
GROUP BY `like_res`.`res_id`, `restaurant`.`id`, `restaurant`.`res_name`
ORDER BY COUNT(`like_res`.`res_id`) DESC
LIMIT 2

--Tìm người đã đặt nhà hàng nhiều nhất
SELECT `orders`.`user_id`, `users`.`id`, `users`.`full_name`, COUNT(`orders`.`user_id`) AS "Người đặt nhà hàng nhiều nhất"
FROM `orders`
INNER JOIN `users` ON `orders`.`user_id` = `users`.`id`
WHERE `orders`.isDeleted = 0 AND `users`.isDeleted = 0
GROUP BY `orders`.`user_id`, `users`.`id`, `users`.`full_name`
ORDER BY COUNT(`orders`.`user_id`) DESC
LIMIT 1

-- Tìm người dùng không hoạt động trong hệ thống
SELECT `users`.`id`, `users`.`full_name`
FROM `users`
LEFT JOIN `like_res` ON `users`.`id` = `like_res`.`user_id` AND `like_res`.`isDeleted` = 0
LEFT JOIN `rate_res` ON `users`.`id` = `rate_res`.`user_id` AND `rate_res`.`isDeleted` = 0
LEFT JOIN `orders` ON `users`.`id` = `orders`.`user_id` AND `orders`.`isDeleted` = 0
WHERE `users`.`isDeleted` = 0
  AND `like_res`.`user_id` IS NULL
  AND `rate_res`.`user_id` IS NULL
  AND `orders`.`user_id` IS NULL
