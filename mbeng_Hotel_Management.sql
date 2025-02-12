-- MySQL Script generated by MySQL Workbench
-- Wed Sep 18 18:28:07 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mbeng_hotel_Management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mbeng_hotel_Management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mbeng_hotel_Management` DEFAULT CHARACTER SET utf8 ;
USE `Mbeng_hotel_Management` ;

-- -----------------------------------------------------
-- Table `Mbeng_hotel_Management`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mbeng_hotel_Management`.`customer` ;

CREATE TABLE IF NOT EXISTS `Mbeng_hotel_Management`.`customer` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `First_name` VARCHAR(255) NOT NULL,
  `Last_name` VARCHAR(225) NOT NULL,
  `Email` VARCHAR(32) NOT NULL,
  `Phone_number` INT NOT NULL,
  `Special_Preferences` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`Customer_id`));


-- -----------------------------------------------------
-- Table `Mbeng_hotel_Management`.`Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mbeng_hotel_Management`.`Room` ;

CREATE TABLE IF NOT EXISTS `Mbeng_hotel_Management`.`Room` (
  `Room_id` VARCHAR(45) NOT NULL,
  `Room_type` VARCHAR(255) NOT NULL,
  `Room_statue` VARCHAR(32) NOT NULL,
  `amenities` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`Room_id`));


-- -----------------------------------------------------
-- Table `Mbeng_hotel_Management`.`Feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mbeng_hotel_Management`.`Feedback` ;

CREATE TABLE IF NOT EXISTS `Mbeng_hotel_Management`.`Feedback` (
  `Feedback_id` VARCHAR(45) NOT NULL,
  `Reservaion_date` DATETIME NOT NULL,
  `Rating` INT NOT NULL,
  `Comments` VARCHAR(225) NOT NULL,
  `Feedback_date` DATETIME NOT NULL,
  PRIMARY KEY (`Feedback_id`));


-- -----------------------------------------------------
-- Table `Mbeng_hotel_Management`.`Reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mbeng_hotel_Management`.`Reservation` ;

CREATE TABLE IF NOT EXISTS `Mbeng_hotel_Management`.`Reservation` (
  `Reservation_id` INT NOT NULL AUTO_INCREMENT,
  `Customer_id` INT NOT NULL,
  `Room_id` INT NOT NULL,
  `Check_in_date` DATE NOT NULL,
  `Check_out_date` DATE NOT NULL,
  `Total_price` FLOAT NULL,
  `customer_Customer_id` INT NOT NULL,
  `Room_Room_id` VARCHAR(45) NOT NULL,
  `Feedback_Feedback_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Reservation_id`, `customer_Customer_id`, `Room_Room_id`, `Feedback_Feedback_id`),
  INDEX `fk_Reservation_customer_idx` (`customer_Customer_id` ASC) VISIBLE,
  INDEX `fk_Reservation_Room1_idx` (`Room_Room_id` ASC) VISIBLE,
  INDEX `fk_Reservation_Feedback1_idx` (`Feedback_Feedback_id` ASC) VISIBLE,
  CONSTRAINT `fk_Reservation_customer`
    FOREIGN KEY (`customer_Customer_id`)
    REFERENCES `Mbeng_hotel_Management`.`customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_Room1`
    FOREIGN KEY (`Room_Room_id`)
    REFERENCES `Mbeng_hotel_Management`.`Room` (`Room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_Feedback1`
    FOREIGN KEY (`Feedback_Feedback_id`)
    REFERENCES `Mbeng_hotel_Management`.`Feedback` (`Feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Mbeng_hotel_Management`.`Service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mbeng_hotel_Management`.`Service` ;

CREATE TABLE IF NOT EXISTS `Mbeng_hotel_Management`.`Service` (
  `Service_id` INT NOT NULL,
  `Service_name` VARCHAR(45) NOT NULL,
  `Price` FLOAT NULL,
  PRIMARY KEY (`Service_id`));


-- -----------------------------------------------------
-- Table `Mbeng_hotel_Management`.`Payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mbeng_hotel_Management`.`Payments` ;

CREATE TABLE IF NOT EXISTS `Mbeng_hotel_Management`.`Payments` (
  `Payment_id` INT NOT NULL AUTO_INCREMENT,
  `Reservation_id` INT NOT NULL,
  `Payment_method` VARCHAR(45) NOT NULL,
  `Amout_paid` FLOAT NOT NULL,
  `Payment_statue` VARCHAR(225) NOT NULL,
  `Payment_date` DATETIME NOT NULL,
  `Reservation_Reservation_id` INT NOT NULL,
  `Reservation_customer_Customer_id` INT NOT NULL,
  `Reservation_Room_Room_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Payment_id`, `Reservation_Reservation_id`, `Reservation_customer_Customer_id`, `Reservation_Room_Room_id`),
  INDEX `fk_Payments_Reservation1_idx` (`Reservation_Reservation_id` ASC, `Reservation_customer_Customer_id` ASC, `Reservation_Room_Room_id` ASC) VISIBLE,
  CONSTRAINT `fk_Payments_Reservation1`
    FOREIGN KEY (`Reservation_Reservation_id` , `Reservation_customer_Customer_id` , `Reservation_Room_Room_id`)
    REFERENCES `Mbeng_hotel_Management`.`Reservation` (`Reservation_id` , `customer_Customer_id` , `Room_Room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Mbeng_hotel_Management`.`Service_reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mbeng_hotel_Management`.`Service_reservation` ;

CREATE TABLE IF NOT EXISTS `Mbeng_hotel_Management`.`Service_reservation` (
  `Service_reservation_id` INT NOT NULL AUTO_INCREMENT,
  `Service_id` INT NOT NULL,
  `Reservation_id` INT NOT NULL,
  `Service_time` DATETIME NOT NULL,
  `Service_Service_id` INT NOT NULL,
  `Reservation_Reservation_id` INT NOT NULL,
  `Reservation_customer_Customer_id` INT NOT NULL,
  `Reservation_Room_Room_id` VARCHAR(45) NOT NULL,
  `Reservation_Feedback_Feedback_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Service_Service_id`, `Reservation_Reservation_id`, `Reservation_customer_Customer_id`, `Reservation_Room_Room_id`, `Reservation_Feedback_Feedback_id`),
  INDEX `fk_Service_reservation_Reservation1_idx` (`Reservation_Reservation_id` ASC, `Reservation_customer_Customer_id` ASC, `Reservation_Room_Room_id` ASC, `Reservation_Feedback_Feedback_id` ASC) VISIBLE,
  CONSTRAINT `fk_Service_reservation_Service1`
    FOREIGN KEY (`Service_Service_id`)
    REFERENCES `Mbeng_hotel_Management`.`Service` (`Service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Service_reservation_Reservation1`
    FOREIGN KEY (`Reservation_Reservation_id` , `Reservation_customer_Customer_id` , `Reservation_Room_Room_id` , `Reservation_Feedback_Feedback_id`)
    REFERENCES `Mbeng_hotel_Management`.`Reservation` (`Reservation_id` , `customer_Customer_id` , `Room_Room_id` , `Feedback_Feedback_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
INSERT INTO `Mbeng_hotel_Management`.`customer` 
(`First_name`, `Last_name`, `Email`, `Phone_number`, `Special_Preferences`) 
VALUES
('John', 'Doe', 'john.doe@example.com', 1234567890, 'Near window'),
('Jane', 'Smith', 'jane.smith@example.com', 9876543210, 'Extra pillows'),
('Alice', 'Brown', 'alice.brown@example.com', 1230984567, 'No feather bedding');

INSERT INTO `Mbeng_hotel_Management`.`Room` 
(`Room_id`, `Room_type`, `Room_statue`, `amenities`) 
VALUES
('101', 'Single', 'Available', 'WiFi, TV, Mini Bar'),
('102', 'Double', 'Occupied', 'WiFi, TV, Mini Bar, Balcony'),
('103', 'Suite', 'Available', 'WiFi, TV, Mini Bar, Jacuzzi');


INSERT INTO `Mbeng_hotel_Management`.`Feedback` 
(`Feedback_id`, `Reservaion_date`, `Rating`, `Comments`, `Feedback_date`) 
VALUES
('FDBK001', '2024-09-15 14:00:00', 5, 'Excellent service!', '2024-09-18 10:00:00'),
('FDBK002', '2024-09-10 12:30:00', 4, 'Very good but noisy neighbors.', '2024-09-12 09:30:00'),
('FDBK003', '2024-09-12 16:45:00', 3, 'Average stay, decent food.', '2024-09-16 18:20:00');


INSERT INTO `Mbeng_hotel_Management`.`Reservation` 
(`Customer_id`, `Room_id`, `Check_in_date`, `Check_out_date`, `Total_price`, `customer_Customer_id`, `Room_Room_id`, `Feedback_Feedback_id`) 
VALUES
(1, 101, '2024-09-10', '2024-09-12', 200.00, 1, '101', 'FDBK001'),
(2, 102, '2024-09-08', '2024-09-10', 400.00, 2, '102', 'FDBK002'),
(3, 103, '2024-09-11', '2024-09-13', 600.00, 3, '103', 'FDBK003');


INSERT INTO `Mbeng_hotel_Management`.`Service` 
(`Service_id`, `Service_name`, `Price`) 
VALUES
(1, 'Spa', 50.00),
(2, 'Gym', 20.00),
(3, 'Room Service', 30.00);



INSERT INTO `Mbeng_hotel_Management`.`Payments` 
(`Reservation_id`, `Payment_method`, `Amout_paid`, `Payment_statue`, `Payment_date`, `Reservation_Reservation_id`, `Reservation_customer_Customer_id`, `Reservation_Room_Room_id`) 
VALUES
(1, 'Credit Card', 200.00, 'Completed', '2024-09-12 12:00:00', 1, 1, '101'),
(2, 'Debit Card', 400.00, 'Completed', '2024-09-10 10:00:00', 2, 2, '102'),
(3, 'Cash', 600.00, 'Pending', '2024-09-13 15:00:00', 3, 3, '103');


INSERT INTO `Mbeng_hotel_Management`.`Service_reservation` 
(`Service_id`, `Reservation_id`, `Service_time`, `Service_Service_id`, `Reservation_Reservation_id`, `Reservation_customer_Customer_id`, `Reservation_Room_Room_id`, `Reservation_Feedback_Feedback_id`) 
VALUES
(1, 1, '2024-09-10 14:30:00', 1, 1, 1, '101', 'FDBK001'),
(2, 2, '2024-09-08 10:00:00', 2, 2, 2, '102', 'FDBK002'),
(3, 3, '2024-09-11 18:00:00', 3, 3, 3, '103', 'FDBK003');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
