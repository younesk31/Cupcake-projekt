-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cupcake` ;

-- -----------------------------------------------------
-- Table `cupcake`.`bottoms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`bottoms` (
  `bottom_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`bottom_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`city` (
  `zipcode` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`zipcode`),
  UNIQUE INDEX `zipcode_UNIQUE` (`zipcode` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `balance` DOUBLE NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `username_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`contact_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`contact_info` (
  `user_id` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `zipcode` INT NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_contact_info_city_idx` (`zipcode` ASC) VISIBLE,
  CONSTRAINT `fk_contact_info_city`
    FOREIGN KEY (`zipcode`)
    REFERENCES `cupcake`.`city` (`zipcode`),
  CONSTRAINT `fk_contact_info_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `cupcake`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `total` DOUBLE NOT NULL,
  `created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `cupcake`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`toppings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`toppings` (
  `toppings_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`toppings_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cupcake`.`orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`orderline` (
  `order_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `topping_id` INT NOT NULL,
  `bottom_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `topping_id`, `bottom_id`),
  INDEX `fk_orders_has_product_orders1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_orderline_toppings1_idx` (`topping_id` ASC) VISIBLE,
  INDEX `fk_orderline_bottoms1_idx` (`bottom_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_has_product_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `cupcake`.`orders` (`order_id`),
  CONSTRAINT `fk_orderline_toppings1`
    FOREIGN KEY (`topping_id`)
    REFERENCES `cupcake`.`toppings` (`toppings_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderline_bottoms1`
    FOREIGN KEY (`bottom_id`)
    REFERENCES `cupcake`.`bottoms` (`bottom_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
