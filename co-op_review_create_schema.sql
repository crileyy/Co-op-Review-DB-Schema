-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema reviews
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `reviews` ;

-- -----------------------------------------------------
-- Schema reviews
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reviews` DEFAULT CHARACTER SET utf8 ;
USE `reviews`;

-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `company_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company_location` ;

CREATE TABLE IF NOT EXISTS `company_location` (
  `company_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  
  CONSTRAINT `company_id` FOREIGN KEY (company_id) REFERENCES company (company_id),
  CONSTRAINT `company_id` FOREIGN KEY (company_id) REFERENCES company (company_id)
);
  

-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `location_id` INT NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `sate` VARCHAR(50) NULL,
  `country` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`location_id`));


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review`;

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` INT PRIMARY KEY AUTO_INCREMENT,
  `review_text` VARCHAR(2000) NULL,
  `rating` INT NOT NULL,
  `offer` BOOLEAN NULL,
  `return_offer` BOOLEAN NULL,
  `position_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `num_interviews` INT NOT NULL,
  
  CONSTRAINT `position_id` FOREIGN KEY (position_id) REFERENCES position (position_id),
  CONSTRAINT `user_id` FOREIGN KEY (user_id) REFERENCES user (user_id),
  CONSTRAINT `company_id` FOREIGN KEY (company_id) REFERENCES company (company_id),
  CONSTRAINT `location_id` FOREIGN KEY (location_id) REFERENCES location (location_id));

-- -----------------------------------------------------
-- Table `position`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `position` ;

CREATE TABLE IF NOT EXISTS `position` (
  `position_id` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`position_id`));
  
  
-- -----------------------------------------------------
-- Table `target_major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `target_major` ;

CREATE TABLE IF NOT EXISTS `target_major` (
  `major_id` INT NOT NULL,
  `position_id` INT NOT NULL,
  
  CONSTRAINT `major_id` FOREIGN KEY (major_id) REFERENCES major (major_id),
  CONSTRAINT `position_id` FOREIGN KEY (position_id) REFERENCES position (position_id)
);


-- -----------------------------------------------------
-- Table `major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `major` ;

CREATE TABLE IF NOT EXISTS `major` (
  `major_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`major_id`));

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `firstname` VARCHAR(50) NOT NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `year` INT NULL,
  `email` VARCHAR(50) NOT NULL,
  `num_coops` INT NOT NULL,
  `major_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  
  CONSTRAINT `major_id` FOREIGN KEY (major_id) REFERENCES major (major_id));
  
  
  
  