-- MySQL Script generated by MySQL Workbench
-- Sat May 24 09:41:39 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema art
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `art` ;

-- -----------------------------------------------------
-- Schema art
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `art` DEFAULT CHARACTER SET utf8 ;
USE `art` ;

-- -----------------------------------------------------
-- Table `art`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`artist` ;

CREATE TABLE IF NOT EXISTS `art`.`artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NOT NULL,
  `m_name` VARCHAR(45) NULL,
  `l_name` VARCHAR(45) NOT NULL,
  `dob` INT NOT NULL,
  `dod` INT NULL,
  `country` VARCHAR(45) NOT NULL,
  `location` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art`.`title`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`title` ;

CREATE TABLE IF NOT EXISTS `art`.`title` (
  `title_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `period` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `file` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`title_id`),
  INDEX `fk_title_artist_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_title_artist`
    FOREIGN KEY (`artist_id`)
    REFERENCES `art`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`keyword` ;

CREATE TABLE IF NOT EXISTS `art`.`keyword` (
  `keyword_id` INT NOT NULL AUTO_INCREMENT,
  `keyword` VARCHAR(45) NULL,
  PRIMARY KEY (`keyword_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art`.`keyword_has_title`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`keyword_has_title` ;

CREATE TABLE IF NOT EXISTS `art`.`keyword_has_title` (
  `keyword_id` INT NOT NULL,
  `title_id` INT NOT NULL,
  PRIMARY KEY (`keyword_id`, `title_id`),
  INDEX `fk_keyword_has_title_title1_idx` (`title_id` ASC) VISIBLE,
  INDEX `fk_keyword_has_title_keyword1_idx` (`keyword_id` ASC) VISIBLE,
  CONSTRAINT `fk_keyword_has_title_keyword1`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `art`.`keyword` (`keyword_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_keyword_has_title_title1`
    FOREIGN KEY (`title_id`)
    REFERENCES `art`.`title` (`title_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
