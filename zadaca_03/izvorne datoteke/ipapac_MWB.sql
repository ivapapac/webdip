-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema WebDiP2019x092
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema WebDiP2019x092
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `WebDiP2019x092` DEFAULT CHARACTER SET utf8 ;
USE `WebDiP2019x092` ;

-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Vrsta korisnika`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Vrsta korisnika` (
  `vrsta_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(50) NOT NULL,
  `opis` TEXT NOT NULL,
  PRIMARY KEY (`vrsta_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Korisnik` (
  `korisnik_id` INT NOT NULL AUTO_INCREMENT,
  `oib` CHAR(11) NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `datum_rodenja` DATE NOT NULL,
  `adresa` TEXT NOT NULL,
  `broj_mobitela` VARCHAR(12) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `korisnicko_ime` VARCHAR(45) NOT NULL,
  `lozinka` VARCHAR(20) NOT NULL,
  `lozinka_sha1` CHAR(40) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `uvjeti` DATETIME NOT NULL,
  `aktivacijski_link` CHAR(40) NOT NULL,
  `vrsta_korisnika` INT NOT NULL,
  PRIMARY KEY (`korisnik_id`),
  INDEX `fk_Korisnik_Vrsta korisnika_idx` (`vrsta_korisnika` ASC),
  UNIQUE INDEX `oib_UNIQUE` (`oib` ASC),
  UNIQUE INDEX `korisnicko_ime_UNIQUE` (`korisnicko_ime` ASC),
  CONSTRAINT `fk_Korisnik_Vrsta korisnika`
    FOREIGN KEY (`vrsta_korisnika`)
    REFERENCES `WebDiP2019x092`.`Vrsta korisnika` (`vrsta_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Tip akcije`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Tip akcije` (
  `tip_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` TEXT NOT NULL,
  PRIMARY KEY (`tip_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Dnevnik rada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Dnevnik rada` (
  `datum_vrijeme` TIMESTAMP NOT NULL,
  `korisnik` INT NOT NULL,
  `tip_akcije` INT NOT NULL,
  `opis` TEXT NOT NULL,
  `upit` TEXT NOT NULL,
  INDEX `fk_Dnevnik rada_Tip rada1_idx` (`tip_akcije` ASC),
  INDEX `fk_Dnevnik rada_Korisnik1_idx` (`korisnik` ASC),
  PRIMARY KEY (`datum_vrijeme`, `tip_akcije`, `korisnik`),
  CONSTRAINT `fk_Dnevnik rada_Tip rada1`
    FOREIGN KEY (`tip_akcije`)
    REFERENCES `WebDiP2019x092`.`Tip akcije` (`tip_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Dnevnik rada_Korisnik1`
    FOREIGN KEY (`korisnik`)
    REFERENCES `WebDiP2019x092`.`Korisnik` (`korisnik_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Dječji vrtić`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Dječji vrtić` (
  `vrtic_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `adresa` TEXT NOT NULL,
  `broj_telefona` VARCHAR(12) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `moderator` INT NOT NULL,
  PRIMARY KEY (`vrtic_id`),
  INDEX `fk_Dječji vrtić_Korisnik1_idx` (`moderator` ASC),
  UNIQUE INDEX `moderator_UNIQUE` (`moderator` ASC),
  CONSTRAINT `fk_Dječji vrtić_Korisnik1`
    FOREIGN KEY (`moderator`)
    REFERENCES `WebDiP2019x092`.`Korisnik` (`korisnik_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Ocjena rada vrtića`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Ocjena rada vrtića` (
  `razdoblje` VARCHAR(20) NOT NULL,
  `djecji_vrtic` INT NOT NULL,
  `ocjena` INT NOT NULL,
  `opis` TEXT NOT NULL,
  `datum_unosa` DATE NOT NULL,
  INDEX `fk_Ocjena rada vrtića_Dječji vrtić1_idx` (`djecji_vrtic` ASC),
  PRIMARY KEY (`razdoblje`, `djecji_vrtic`),
  CONSTRAINT `fk_Ocjena rada vrtića_Dječji vrtić1`
    FOREIGN KEY (`djecji_vrtic`)
    REFERENCES `WebDiP2019x092`.`Dječji vrtić` (`vrtic_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Skupina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Skupina` (
  `skupina_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `cijena` FLOAT NOT NULL,
  `broj_mjesta` INT NOT NULL,
  `djecji_vrtic` INT NOT NULL,
  PRIMARY KEY (`skupina_id`),
  INDEX `fk_Skupina_Dječji vrtić1_idx` (`djecji_vrtic` ASC),
  CONSTRAINT `fk_Skupina_Dječji vrtić1`
    FOREIGN KEY (`djecji_vrtic`)
    REFERENCES `WebDiP2019x092`.`Dječji vrtić` (`vrtic_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Poziv za upis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Poziv za upis` (
  `poziv_id` INT NOT NULL AUTO_INCREMENT,
  `broj_mjesta` INT NOT NULL,
  `upisi_od` DATE NOT NULL,
  `upisi_do` DATE NOT NULL,
  `djecji_vrtic` INT NOT NULL,
  PRIMARY KEY (`poziv_id`),
  INDEX `fk_Poziv za upis_Dječji vrtić1_idx` (`djecji_vrtic` ASC),
  CONSTRAINT `fk_Poziv za upis_Dječji vrtić1`
    FOREIGN KEY (`djecji_vrtic`)
    REFERENCES `WebDiP2019x092`.`Dječji vrtić` (`vrtic_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Status prijave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Status prijave` (
  `status_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` TEXT NOT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Prijava za upis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Prijava za upis` (
  `prijava_id` INT NOT NULL AUTO_INCREMENT,
  `roditelj` INT NOT NULL,
  `skupina` INT NOT NULL,
  `datum_prijave` DATE NOT NULL,
  `status_prijave` INT NOT NULL,
  `poziv` INT NOT NULL,
  PRIMARY KEY (`prijava_id`),
  INDEX `fk_Prijava za upis_Korisnik1_idx` (`roditelj` ASC),
  INDEX `fk_Prijava za upis_Skupina1_idx` (`skupina` ASC),
  INDEX `fk_Prijava za upis_Status prijave1_idx` (`status_prijave` ASC),
  INDEX `fk_Prijava za upis_Poziv za upis1_idx` (`poziv` ASC),
  CONSTRAINT `fk_Prijava za upis_Korisnik1`
    FOREIGN KEY (`roditelj`)
    REFERENCES `WebDiP2019x092`.`Korisnik` (`korisnik_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Prijava za upis_Skupina1`
    FOREIGN KEY (`skupina`)
    REFERENCES `WebDiP2019x092`.`Skupina` (`skupina_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Prijava za upis_Status prijave1`
    FOREIGN KEY (`status_prijave`)
    REFERENCES `WebDiP2019x092`.`Status prijave` (`status_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Prijava za upis_Poziv za upis1`
    FOREIGN KEY (`poziv`)
    REFERENCES `WebDiP2019x092`.`Poziv za upis` (`poziv_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Dijete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Dijete` (
  `dijete_id` INT NOT NULL AUTO_INCREMENT,
  `oib` CHAR(11) NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `datum_rodenja` DATE NOT NULL,
  `potvrda_koristenja` TINYINT(1) NOT NULL,
  `roditelj` INT NOT NULL,
  `skupina` INT NOT NULL,
  PRIMARY KEY (`dijete_id`),
  INDEX `fk_Dijete_Skupina1_idx` (`skupina` ASC),
  INDEX `fk_Dijete_Korisnik1_idx` (`roditelj` ASC),
  UNIQUE INDEX `oib_UNIQUE` (`oib` ASC),
  CONSTRAINT `fk_Dijete_Skupina1`
    FOREIGN KEY (`skupina`)
    REFERENCES `WebDiP2019x092`.`Skupina` (`skupina_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dijete_Korisnik1`
    FOREIGN KEY (`roditelj`)
    REFERENCES `WebDiP2019x092`.`Korisnik` (`korisnik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Evidencija dolazaka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Evidencija dolazaka` (
  `datum` DATE NOT NULL,
  `dijete` INT NOT NULL,
  `dolazak` TINYINT(1) NOT NULL,
  PRIMARY KEY (`datum`, `dijete`),
  INDEX `fk_Evidencija dolazaka_Dijete1_idx` (`dijete` ASC),
  CONSTRAINT `fk_Evidencija dolazaka_Dijete1`
    FOREIGN KEY (`dijete`)
    REFERENCES `WebDiP2019x092`.`Dijete` (`dijete_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2019x092`.`Računi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2019x092`.`Računi` (
  `racun_id` INT NOT NULL AUTO_INCREMENT,
  `iznos` FLOAT NOT NULL,
  `razdoblje` VARCHAR(20) NOT NULL,
  `datum_izdavanja` DATE NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `dijete` INT NOT NULL,
  PRIMARY KEY (`racun_id`),
  INDEX `fk_Računi_Dijete1_idx` (`dijete` ASC),
  CONSTRAINT `fk_Računi_Dijete1`
    FOREIGN KEY (`dijete`)
    REFERENCES `WebDiP2019x092`.`Dijete` (`dijete_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
