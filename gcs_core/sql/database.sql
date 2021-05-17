-- MySQL Script generated by MySQL Workbench
-- Wed Jan  6 11:56:32 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fivem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fivem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fivem` DEFAULT CHARACTER SET utf8 ;
USE `fivem` ;

-- -----------------------------------------------------
-- Table `fivem`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Account` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Account` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`steam_identifier` VARCHAR(45) NULL,
	`license_identifier` VARCHAR(45) NULL,
	`xbl_identifier` VARCHAR(45) NULL,
	`ip_identifier` VARCHAR(45) NULL,
	`discord_identifier` VARCHAR(45) NULL,
	`live_identifier` VARCHAR(45) NULL,
	`whitelisted` TINYINT NULL,
	`banned` TINYINT NULL,
	`date_whitelisted` DATETIME NULL,
	`date_banned` DATETIME NULL,
	`is_first_connection` INT NULL DEFAULT 1,
	PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Job` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Job` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NULL,
	PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`JobRank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`JobRank` ;

CREATE TABLE IF NOT EXISTS `fivem`.`JobRank` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Job_id` INT NOT NULL,
	`name` VARCHAR(45) NULL,
	`level` VARCHAR(45) NULL,
	`salary` INT NULL,
	PRIMARY KEY (`id`, `Job_id`),
	INDEX `fk_JobRank_Job1_idx` (`Job_id` ASC),
	CONSTRAINT `fk_JobRank_Job1`
		FOREIGN KEY (`Job_id`)
		REFERENCES `fivem`.`Job` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Character`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Character` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Character` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(45) NULL,
	`last_name` VARCHAR(45) NULL,
	`date_of_birth` VARCHAR(45) NULL,
	`height` INT NULL,
	`sex` INT NULL,
	`connected` TINYINT NULL,
	`position` VARCHAR(255) NULL DEFAULT '{-1044.99914550781,-2749.8173828125,21.3634204864502}',
	`max_weight` VARCHAR(45) NULL,
	`Account_id` INT NOT NULL,
	`Job_id` INT NOT NULL,
	`JobRank_id` INT NOT NULL,
	`health` INT NULL DEFAULT 200,
	PRIMARY KEY (`id`, `Account_id`, `Job_id`, `JobRank_id`),
	INDEX `fk_Character_Account_idx` (`Account_id` ASC),
	INDEX `fk_Character_JobRank1_idx` (`JobRank_id` ASC),
	INDEX `fk_Character_Job1_idx` (`Job_id` ASC),
	CONSTRAINT `fk_Character_Account`
		FOREIGN KEY (`Account_id`)
		REFERENCES `fivem`.`Account` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_Character_Job1`
		FOREIGN KEY (`Job_id`)
		REFERENCES `fivem`.`Job` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_Character_JobRank1`
		FOREIGN KEY (`JobRank_id`)
		REFERENCES `fivem`.`JobRank` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`user` ;

CREATE TABLE IF NOT EXISTS `fivem`.`user` (
	`username` VARCHAR(16) NOT NULL,
	`email` VARCHAR(255) NULL,
	`password` VARCHAR(32) NOT NULL,
	`create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Outfit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Outfit` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Outfit` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NULL,
	`category` VARCHAR(45) NULL,
	`model` VARCHAR(45) NULL,
	`arm` VARCHAR(45) NULL,
	`arm_txt` VARCHAR(45) NULL,
	`tshirt` VARCHAR(45) NULL,
	`tshirt_txt` VARCHAR(45) NULL,
	`jacket` VARCHAR(45) NULL,
	`jacket_txt` VARCHAR(45) NULL,
	`pant` VARCHAR(45) NULL,
	`pant_txt` VARCHAR(45) NULL,
	`shoes` VARCHAR(45) NULL,
	`shoes_txt` VARCHAR(45) NULL,
	`glasses` VARCHAR(45) NULL,
	`glasses_txt` VARCHAR(45) NULL,
	`hat` VARCHAR(45) NULL,
	`hat_txt` VARCHAR(45) NULL,
	`mask` VARCHAR(45) NULL,
	`mask_txt` VARCHAR(45) NULL,
	`shield` VARCHAR(45) NULL,
	`shield_txt` VARCHAR(45) NULL,
	`ears` VARCHAR(45) NULL,
	`ears_txt` VARCHAR(45) NULL,
	PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`CharacterOutfit2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`CharacterOutfit2` ;

CREATE TABLE IF NOT EXISTS `fivem`.`CharacterOutfit2` (
	`id` INT NOT NULL,
	`current` TINYINT NULL,
	`Character_id` INT NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `fk_Character_Outfit_Character1_idx` (`Character_id` ASC),
	CONSTRAINT `fk_Character_Outfit_Character1`
		FOREIGN KEY (`Character_id`)
		REFERENCES `fivem`.`Character` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Skin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Skin` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Skin` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`model` VARCHAR(50) NULL,
	`face` VARCHAR(900) NULL,
	`head` INT NULL,
	`body_color` INT NULL,
	`hair` INT NULL,
	`hair_color` INT NULL,
	`beard` INT NULL,
	`beard_color` INT NULL,
	`eyebrow` INT NULL,
	`eyebrow_color` INT NULL,
	`piercing` INT NULL,
	`piercing_txt` INT NULL,
	`makeup` INT NULL,
	`makeup_color` INT NULL,
	`lipstick` INT NULL,
	`lipstick_color` INT NULL,
	PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`LicenseType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`LicenseType` ;

CREATE TABLE IF NOT EXISTS `fivem`.`LicenseType` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NULL,
	PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`License`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`License` ;

CREATE TABLE IF NOT EXISTS `fivem`.`License` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`LicenseType_id` INT NOT NULL,
	`Character_id` INT NOT NULL,
	`license` VARCHAR(45) NULL,
	PRIMARY KEY (`id`, `LicenseType_id`, `Character_id`),
	INDEX `fk_License_LicenseType1_idx` (`LicenseType_id` ASC),
	INDEX `fk_License_Character1_idx` (`Character_id` ASC),
	CONSTRAINT `fk_License_LicenseType1`
		FOREIGN KEY (`LicenseType_id`)
		REFERENCES `fivem`.`LicenseType` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_License_Character1`
		FOREIGN KEY (`Character_id`)
		REFERENCES `fivem`.`Character` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`CharacterInventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`CharacterInventory` ;

CREATE TABLE IF NOT EXISTS `fivem`.`CharacterInventory` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Character_id` INT NOT NULL,
	`inventory` JSON NULL,
	`capacity` INT NULL,
	PRIMARY KEY (`id`),
	INDEX `fk_CharacterInventory_Character1_idx` (`Character_id` ASC),
	CONSTRAINT `fk_CharacterInventory_Character1`
		FOREIGN KEY (`Character_id`)
		REFERENCES `fivem`.`Character` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`DiseaseType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`DiseaseType` ;

CREATE TABLE IF NOT EXISTS `fivem`.`DiseaseType` (
	`id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Disease`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Disease` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Disease` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`DiseaseType_id` INT NOT NULL,
	PRIMARY KEY (`id`, `DiseaseType_id`),
	INDEX `fk_Disease_DiseaseType1_idx` (`DiseaseType_id` ASC),
	CONSTRAINT `fk_Disease_DiseaseType1`
		FOREIGN KEY (`DiseaseType_id`)
		REFERENCES `fivem`.`DiseaseType` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`VehicleState`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`VehicleState` ;

CREATE TABLE IF NOT EXISTS `fivem`.`VehicleState` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(45) NULL,
	`VehicleStatecol` VARCHAR(45) NULL,
	PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Vehicle` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Vehicle` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Character_id` INT NOT NULL,
	`name` VARCHAR(45) NULL,
	`color_primary` VARCHAR(45) NULL,
	`color_secondary` VARCHAR(45) NULL,
	`color_pearlescent` VARCHAR(45) NULL,
	`color_wheel` VARCHAR(45) NULL,
	`color_neon_1` VARCHAR(45) NULL,
	`color_neon_2` VARCHAR(45) NULL,
	`color_neon_3` VARCHAR(45) NULL,
	`color_smoke_1` VARCHAR(45) NULL,
	`color_smoke_2` VARCHAR(45) NULL,
	`color_smoke_3` VARCHAR(45) NULL,
	`window_int` INT NULL,
	`wheel_type` INT NULL,
	`wheel_bulletproof` TINYINT NULL,
	`neon_0` TINYINT NULL,
	`neon_1` TINYINT NULL,
	`model` VARCHAR(45) NULL,
	`price` VARCHAR(45) NULL,
	`plate` VARCHAR(45) NULL,
	`plate_index` VARCHAR(45) NULL,
	`VehicleState_id` INT NOT NULL,
	`neon_2` TINYINT NULL,
	`neon_3` TINYINT NULL,
	`turbo` TINYINT NULL,
	`xenon` TINYINT NULL,
	`tire_smoke` TINYINT NULL,
	PRIMARY KEY (`id`, `Character_id`, `VehicleState_id`),
	INDEX `fk_Vehicle_Character1_idx` (`Character_id` ASC),
	INDEX `fk_Vehicle_VehicleState1_idx` (`VehicleState_id` ASC),
	CONSTRAINT `fk_Vehicle_Character1`
		FOREIGN KEY (`Character_id`)
		REFERENCES `fivem`.`Character` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_Vehicle_VehicleState1`
		FOREIGN KEY (`VehicleState_id`)
		REFERENCES `fivem`.`VehicleState` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`KeyVehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`KeyVehicle` ;

CREATE TABLE IF NOT EXISTS `fivem`.`KeyVehicle` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Vehicle_id` INT NOT NULL,
	`Character_id` INT NOT NULL,
	PRIMARY KEY (`id`, `Vehicle_id`, `Character_id`),
	INDEX `fk_KeyVehicle_Vehicle1_idx` (`Vehicle_id` ASC),
	INDEX `fk_KeyVehicle_Character1_idx` (`Character_id` ASC),
	CONSTRAINT `fk_KeyVehicle_Vehicle1`
		FOREIGN KEY (`Vehicle_id`)
		REFERENCES `fivem`.`Vehicle` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_KeyVehicle_Character1`
		FOREIGN KEY (`Character_id`)
		REFERENCES `fivem`.`Character` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Leveling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Leveling` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Leveling` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Character_id` INT NOT NULL,
	`xp_police` INT NULL,
	`lvl_police` INT NULL,
	`xp_lsms` INT NULL,
	`lvl_lsms` INT NULL,
	PRIMARY KEY (`id`, `Character_id`),
	INDEX `fk_Leveling_Character1_idx` (`Character_id` ASC),
	CONSTRAINT `fk_Leveling_Character1`
		FOREIGN KEY (`Character_id`)
		REFERENCES `fivem`.`Character` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Needs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Needs` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Needs` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Character_id` INT NOT NULL,
	`hunger` DOUBLE NULL,
	`thirst` DOUBLE NULL,
	PRIMARY KEY (`id`, `Character_id`),
	INDEX `fk_Needs_Character1_idx` (`Character_id` ASC),
	CONSTRAINT `fk_Needs_Character1`
		FOREIGN KEY (`Character_id`)
		REFERENCES `fivem`.`Character` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Skeleton`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Skeleton` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Skeleton` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Character_id` INT NOT NULL,
	`head` VARCHAR(45) NULL,
	`left_arm` VARCHAR(45) NULL,
	`right_arm` VARCHAR(45) NULL,
	`left_leg` VARCHAR(45) NULL,
	`right_leg` VARCHAR(45) NULL,
	`body` VARCHAR(45) NULL,
	PRIMARY KEY (`id`, `Character_id`),
	INDEX `fk_Skeleton_Character1_idx` (`Character_id` ASC),
	CONSTRAINT `fk_Skeleton_Character1`
		FOREIGN KEY (`Character_id`)
		REFERENCES `fivem`.`Character` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Bank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Bank` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Bank` (
	`idBank` INT NOT NULL,
	PRIMARY KEY (`idBank`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Skin_has_CharacterOutfit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Skin_has_CharacterOutfit` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Skin_has_CharacterOutfit` (
	`Skin_id` INT NOT NULL,
	`Skin_CharacterOutfit_id` INT NOT NULL,
	`CharacterOutfit_id` INT NOT NULL,
	PRIMARY KEY (`Skin_id`, `Skin_CharacterOutfit_id`, `CharacterOutfit_id`),
	INDEX `fk_Skin_has_CharacterOutfit_CharacterOutfit1_idx` (`CharacterOutfit_id` ASC),
	INDEX `fk_Skin_has_CharacterOutfit_Skin1_idx` (`Skin_id` ASC, `Skin_CharacterOutfit_id` ASC),
	CONSTRAINT `fk_Skin_has_CharacterOutfit_Skin1`
		FOREIGN KEY (`Skin_id`)
		REFERENCES `fivem`.`Skin` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_Skin_has_CharacterOutfit_CharacterOutfit1`
		FOREIGN KEY (`CharacterOutfit_id`)
		REFERENCES `fivem`.`CharacterOutfit2` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`CharacterOutfit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`CharacterOutfit` ;

CREATE TABLE IF NOT EXISTS `fivem`.`CharacterOutfit` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Character_id` INT NOT NULL,
	`Character_Account_id` INT NOT NULL,
	`Skin_id` INT NOT NULL,
	`Outfit_id` INT NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `fk_CharacterOutfit_Character1_idx` (`Character_id` ASC, `Character_Account_id` ASC),
	INDEX `fk_CharacterOutfit_Skin1_idx` (`Skin_id` ASC),
	INDEX `fk_CharacterOutfit_Outfit1_idx` (`Outfit_id` ASC),
	CONSTRAINT `fk_CharacterOutfit_Character1`
		FOREIGN KEY (`Character_id` , `Character_Account_id`)
		REFERENCES `fivem`.`Character` (`id` , `Account_id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_CharacterOutfit_Skin1`
		FOREIGN KEY (`Skin_id`)
		REFERENCES `fivem`.`Skin` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT `fk_CharacterOutfit_Outfit1`
		FOREIGN KEY (`Outfit_id`)
		REFERENCES `fivem`.`Outfit` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fivem`.`Chests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fivem`.`Chests` ;

CREATE TABLE IF NOT EXISTS `fivem`.`Chests` (
	`id` INT NOT NULL,
	`position` JSON NOT NULL DEFAULT '{}[]',
	`type` INT NOT NULL,
	`capacity` INT NOT NULL,
	`Character_id` INT NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `fk_Chests_Character1_idx` (`Character_id` ASC),
	CONSTRAINT `fk_Chests_Character1`
		FOREIGN KEY (`Character_id`)
		REFERENCES `fivem`.`Character` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;