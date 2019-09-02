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
