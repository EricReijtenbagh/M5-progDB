-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`gamer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gamer` (
  `username` INT NOT NULL,
  `behaalde achievements` VARCHAR(45) NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`game` (
  `items` INT NOT NULL,
  `currency` VARCHAR(45) NULL,
  `skins` VARCHAR(45) NULL,
  PRIMARY KEY (`items`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`achievements` (
  `naam` INT NOT NULL,
  `icoon` VARCHAR(45) NOT NULL,
  `hoeveelheid` VARCHAR(45) NOT NULL,
  `game_items` INT NOT NULL,
  PRIMARY KEY (`naam`),
  INDEX `fk_achievements_game1_idx` (`game_items` ASC) VISIBLE,
  CONSTRAINT `fk_achievements_game1`
    FOREIGN KEY (`game_items`)
    REFERENCES `mydb`.`game` (`items`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gamer_has_achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gamer_has_achievements` (
  `gamer_username` INT NOT NULL,
  `achievements_naam` INT NOT NULL,
  PRIMARY KEY (`gamer_username`, `achievements_naam`),
  INDEX `fk_gamer_has_achievements_achievements1_idx` (`achievements_naam` ASC) VISIBLE,
  INDEX `fk_gamer_has_achievements_gamer1_idx` (`gamer_username` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_has_achievements_gamer1`
    FOREIGN KEY (`gamer_username`)
    REFERENCES `mydb`.`gamer` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamer_has_achievements_achievements1`
    FOREIGN KEY (`achievements_naam`)
    REFERENCES `mydb`.`achievements` (`naam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gamer_has_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gamer_has_game` (
  `gamer_username` INT NOT NULL,
  `game_items` INT NOT NULL,
  PRIMARY KEY (`gamer_username`, `game_items`),
  INDEX `fk_gamer_has_game_game1_idx` (`game_items` ASC) VISIBLE,
  INDEX `fk_gamer_has_game_gamer1_idx` (`gamer_username` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_has_game_gamer1`
    FOREIGN KEY (`gamer_username`)
    REFERENCES `mydb`.`gamer` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamer_has_game_game1`
    FOREIGN KEY (`game_items`)
    REFERENCES `mydb`.`game` (`items`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
