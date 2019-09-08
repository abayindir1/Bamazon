DROP DATABASE IF EXISTS bamazon_db;

CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE `bamazon_db`.`products` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `department_name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NULL,
  `stock_quantity` INT NULL,
  PRIMARY KEY (`item_id`));

INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Kindle', 'Electronics', '129.99', '45');
INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Water Sports Shoes', 'Clothes', '9.99', '31');
INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Flat Cap', 'Clothes', '14.99', '23');
INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Jean', 'Clothes', '25.99', '34');
INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Asus ZenBook 13', 'Electronics', '999.00', '12');
INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Crime and Punishment', 'Books', '12.50', '13');
INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Anne Karenina', 'Books', '15.30', '23');
INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Apple iPad Pro', 'Electronics', '674.00', '12');
INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Swingline Stapler', 'Office Products', '17.96', '21');
INSERT INTO `bamazon_db`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('Fountain Pen', 'Office Products', '24.99', '15');

ALTER TABLE `bamazon_db`.`products` 
ADD COLUMN `product_sales` INT NULL AFTER `stock_quantity`;


CREATE TABLE `bamazon_db`.`departments` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `departments_name` VARCHAR(45) NOT NULL,
  `over_head_cost` INT NULL,
  PRIMARY KEY (`department_id`));

INSERT INTO `bamazon_db`.`departments` (`departments_name`, `over_head_cost`) VALUES ('Electronics', '3000');
INSERT INTO `bamazon_db`.`departments` (`departments_name`, `over_head_cost`) VALUES ('Sports', '2500');
INSERT INTO `bamazon_db`.`departments` (`departments_name`, `over_head_cost`) VALUES ('Clothes', '3500');
INSERT INTO `bamazon_db`.`departments` (`departments_name`, `over_head_cost`) VALUES ('Books', '4555');
INSERT INTO `bamazon_db`.`departments` (`departments_name`, `over_head_cost`) VALUES ('Office Products', '3434');

UPDATE `bamazon_db`.`departments` SET `over_head_cost` = '300' WHERE (`department_id` = '1');
UPDATE `bamazon_db`.`departments` SET `over_head_cost` = '250' WHERE (`department_id` = '2');
UPDATE `bamazon_db`.`departments` SET `over_head_cost` = '350' WHERE (`department_id` = '3');
UPDATE `bamazon_db`.`departments` SET `over_head_cost` = '455' WHERE (`department_id` = '4');
UPDATE `bamazon_db`.`departments` SET `over_head_cost` = '343' WHERE (`department_id` = '5');

