CREATE DATABASE cookchef;
use cookchef;
CREATE TABLE `recipe_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` text,
  PRIMARY KEY (`user_id`)
);
CREATE TABLE `recipe_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `cooking_time` int DEFAULT NULL,
  `recipe` text,
  `ingredients` text,
  `image_name` varchar(50) DEFAULT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  FOREIGN KEY (`userid`) REFERENCES `recipe_users` (`user_id`)
);
