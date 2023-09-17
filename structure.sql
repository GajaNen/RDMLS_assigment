CREATE SCHEMA finalassign;

USE finalassign;

################## PRICES TABLE ####################

CREATE TABLE `finalassign`.`prices` (
  `timestamp` DATETIME NULL,
  `AT_load_actual_entsoe_transparency` VARCHAR(128) NULL,
  `AT_load_forecast_entsoe_transparency` VARCHAR(128) NULL,
  `AT_price_day_ahead` VARCHAR(128) NULL,
	`AT_solar_generation_actual` VARCHAR(128) NULL, 
    `AT_wind_onshore_generation_actual` VARCHAR(128) NULL,
	`BE_load_actual_entsoe_transparency` VARCHAR(128) NULL,
	`BE_load_forecast_entsoe_transparency` VARCHAR(128) NULL, 
    `BE_solar_generation_actual` VARCHAR(128) NULL,
	`BE_wind_generation_actual` VARCHAR(128) NULL, 
    `BE_wind_offshore_generation_actual` VARCHAR(128) NULL,
	`BE_wind_onshore_generation_actual` VARCHAR(128) NULL,
	`BG_load_actual_entsoe_transparency` VARCHAR(128) NULL,
	`BG_load_forecast_entsoe_transparency` VARCHAR(128) NULL, 
    `BG_solar_generation_actual` VARCHAR(128) NULL,
	`BG_wind_onshore_generation_actual` VARCHAR(128) NULL,
	`id` INT NOT NULL);
  
  CREATE TABLE `finalassign`.`prices_correct` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NULL,
  `AT_load_actual_entsoe_transparency` DOUBLE NULL,
  `AT_load_forecast_entsoe_transparency` DOUBLE NULL,
  `AT_price_day_ahead` DOUBLE NULL,
	`AT_solar_generation_actual` DOUBLE NULL, 
    `AT_wind_onshore_generation_actual` DOUBLE NULL,
	`BE_load_actual_entsoe_transparency` DOUBLE NULL,
	`BE_load_forecast_entsoe_transparency` DOUBLE NULL, 
    `BE_solar_generation_actual` DOUBLE NULL,
	`BE_wind_generation_actual` DOUBLE NULL, 
    `BE_wind_offshore_generation_actual` DOUBLE NULL,
	`BE_wind_onshore_generation_actual` DOUBLE NULL,
	`BG_load_actual_entsoe_transparency` DOUBLE NULL,
	`BG_load_forecast_entsoe_transparency` DOUBLE NULL, 
    `BG_solar_generation_actual` DOUBLE NULL,
	`BG_wind_onshore_generation_actual` DOUBLE NULL,
  PRIMARY KEY (`id`));
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/prices_correct.csv'
INTO TABLE finalassign.prices FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(timestamp, @AT_load_actual_entsoe_transparency,
@AT_load_forecast_entsoe_transparency, @AT_price_day_ahead,
@AT_solar_generation_actual, @AT_wind_onshore_generation_actual,
@BE_load_actual_entsoe_transparency,
@BE_load_forecast_entsoe_transparency, @BE_solar_generation_actual,
@BE_wind_generation_actual, @BE_wind_offshore_generation_actual,
@BE_wind_onshore_generation_actual,
@BG_load_actual_entsoe_transparency,
@BG_load_forecast_entsoe_transparency, @BG_solar_generation_actual,
@BG_wind_onshore_generation_actual, id)
SET AT_load_actual_entsoe_transparency = NULLIF(@AT_load_actual_entsoe_transparency, ''),
AT_price_day_ahead = NULLIF(@AT_price_day_ahead, ''),
AT_solar_generation_actual = NULLIF(@AT_solar_generation_actual, ''),
AT_wind_onshore_generation_actual = NULLIF(@AT_wind_onshore_generation_actual, ''),
BE_load_actual_entsoe_transparency = NULLIF(@BE_load_actual_entsoe_transparency, ''),
BE_load_forecast_entsoe_transparency = NULLIF(@BE_load_forecast_entsoe_transparency, ''),
BE_solar_generation_actual = NULLIF(@BE_solar_generation_actual, ''),
BE_wind_generation_actual = NULLIF(@BE_wind_generation_actual, ''),
BE_wind_offshore_generation_actual = NULLIF(@BE_wind_offshore_generation_actual, ''),
BE_wind_onshore_generation_actual = NULLIF(@BE_wind_onshore_generation_actual, ''),
BG_load_actual_entsoe_transparency = NULLIF(@BG_load_actual_entsoe_transparency, ''),
BG_load_forecast_entsoe_transparency = NULLIF(@BG_load_forecast_entsoe_transparency, ''),
BG_solar_generation_actual = NULLIF(@BG_solar_generation_actual, ''),
BG_wind_onshore_generation_actual = NULLIF(@BG_wind_onshore_generation_actual, '');


INSERT INTO `finalassign`.`prices_correct` 
(  `id`,
  `timestamp`,
  `AT_load_actual_entsoe_transparency`,
  `AT_load_forecast_entsoe_transparency`,
  `AT_price_day_ahead`,
	`AT_solar_generation_actual`, 
    `AT_wind_onshore_generation_actual`,
	`BE_load_actual_entsoe_transparency`,
	`BE_load_forecast_entsoe_transparency`, 
    `BE_solar_generation_actual`,
	`BE_wind_generation_actual`, 
    `BE_wind_offshore_generation_actual`,
	`BE_wind_onshore_generation_actual`,
	`BG_load_actual_entsoe_transparency`,
	`BG_load_forecast_entsoe_transparency`, 
    `BG_solar_generation_actual`,
	`BG_wind_onshore_generation_actual`) 
SELECT  `id`,
  `timestamp`,
  `AT_load_actual_entsoe_transparency`,
  `AT_load_forecast_entsoe_transparency`,
  `AT_price_day_ahead`,
	`AT_solar_generation_actual`, 
    `AT_wind_onshore_generation_actual`,
	`BE_load_actual_entsoe_transparency`,
	`BE_load_forecast_entsoe_transparency`, 
    `BE_solar_generation_actual`,
	`BE_wind_generation_actual`, 
    `BE_wind_offshore_generation_actual`,
	`BE_wind_onshore_generation_actual`,
	`BG_load_actual_entsoe_transparency`,
	`BG_load_forecast_entsoe_transparency`, 
    `BG_solar_generation_actual`,
	`BG_wind_onshore_generation_actual` FROM `finalassign`.`prices`;

############################# WEATHER TABLE ###############################

CREATE TABLE `finalassign`.`weather` (
  `timestamp` DATETIME NULL,
  `AT_temperature` VARCHAR(145) NULL,
  `AT_radiation_direct_horizontal` VARCHAR(145) NULL,
  `AT_radiation_diffuse_horizontal` VARCHAR(145) NULL,
  `BE_temperature` VARCHAR(145) NULL,
  `BE_radiation_direct_horizontal` VARCHAR(145) NULL,
  `BE_radiation_diffuse_horizontal` VARCHAR(145) NULL,
  `BG_temperature` VARCHAR(145) NULL,
  `BG_radiation_direct_horizontal` VARCHAR(145) NULL,
  `BG_radiation_diffuse_horizontal` VARCHAR(145) NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `finalassign`.`weather_correct` (
  `id` INT NOT NULL,
  `timestamp` DATETIME NULL,
  `AT_temperature` DOUBLE NULL,
  `AT_radiation_direct_horizontal` DOUBLE NULL,
  `AT_radiation_diffuse_horizontal` DOUBLE NULL,
  `BE_temperature` DOUBLE NULL,
  `BE_radiation_direct_horizontal` DOUBLE NULL,
  `BE_radiation_diffuse_horizontal` DOUBLE NULL,
  `BG_temperature` DOUBLE NULL,
  `BG_radiation_direct_horizontal` DOUBLE NULL,
  `BG_radiation_diffuse_horizontal` DOUBLE NULL,
  PRIMARY KEY (`id`));
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/weather_correct.csv'
INTO TABLE finalassign.weather FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;  
  
INSERT INTO `finalassign`.`weather_correct` (`id`,  `timestamp`,  `AT_temperature`, `AT_radiation_direct_horizontal`, `AT_radiation_diffuse_horizontal`,
`BE_temperature`,  `BE_radiation_direct_horizontal`,  `BE_radiation_diffuse_horizontal`, `BG_temperature`,
 `BG_radiation_direct_horizontal`,  `BG_radiation_diffuse_horizontal`) SELECT `id`,  `timestamp`,  `AT_temperature`, `AT_radiation_direct_horizontal`, `AT_radiation_diffuse_horizontal`,
`BE_temperature`,  `BE_radiation_direct_horizontal`,  `BE_radiation_diffuse_horizontal`, `BG_temperature`,
 `BG_radiation_direct_horizontal`,  `BG_radiation_diffuse_horizontal` FROM `finalassign`.`weather`;


############### IMPORT LONG TABLE FOR SIMPLITICTY ####################


CREATE TABLE `finalassign`.`weather_long` (
  `id` INT NOT NULL,
  `fundament` VARCHAR(128) NULL,
  `utc_timestamp` DATETIME NULL,
  `country` VARCHAR(2) NULL,
  `value` DOUBLE NULL,
  PRIMARY KEY (`id`));
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/weather_long.csv'
INTO TABLE finalassign.weather_long FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;  

CREATE TABLE `finalassign`.`prices_long` (
  `id` INT NOT NULL,
  `fundament` LONGTEXT NULL,
  `utc_timestamp` DATETIME NULL,
  `country` VARCHAR(2) NULL,
  `value` BIGINT NULL,
  PRIMARY KEY (`id`));
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/prices_long.csv'
INTO TABLE finalassign.prices_long FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id, fundament, `utc_timestamp`, country, @value)
SET value = NULLIF(@value, '');  


############################### CREATE A TS TABLE AND INPUT THE DATA #############################

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TimeSeries
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TimeSeries
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TimeSeries` DEFAULT CHARACTER SET utf8 ;
USE `TimeSeries` ;

-- -----------------------------------------------------
-- Table `TimeSeries`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TimeSeries`.`Country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(2) NULL,
  `population` INT NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TimeSeries`.`Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TimeSeries`.`Time` (
  `time_id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NULL,
  `timezone` VARCHAR(3) NULL,
  PRIMARY KEY (`time_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TimeSeries`.`Fundament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TimeSeries`.`Fundament` (
  `fund_id` INT NOT NULL AUTO_INCREMENT,
  `fund_name` VARCHAR(45) NULL,
  `type` TEXT NULL,
  PRIMARY KEY (`fund_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TimeSeries`.`Actual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TimeSeries`.`Actual` (
  `actual_id` INT NOT NULL AUTO_INCREMENT,
  `time_id` INT NULL,
  `provider` VARCHAR(45) NULL,
  `country_id` INT NULL,
  `fund_id` INT NULL,
  `value` DOUBLE NULL,
  PRIMARY KEY (`actual_id`),
  INDEX `time_a_idx` (`time_id` ASC) VISIBLE,
  INDEX `count_a_idx` (`country_id` ASC) VISIBLE,
  INDEX `fund_a_idx` (`fund_id` ASC) VISIBLE,
  CONSTRAINT `time_a`
    FOREIGN KEY (`time_id`)
    REFERENCES `TimeSeries`.`Time` (`time_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `count_a`
    FOREIGN KEY (`country_id`)
    REFERENCES `TimeSeries`.`Country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fund_a`
    FOREIGN KEY (`fund_id`)
    REFERENCES `TimeSeries`.`Fundament` (`fund_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TimeSeries`.`Forecast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TimeSeries`.`Forecast` (
  `forecast_id` INT NOT NULL AUTO_INCREMENT,
  `time_id` INT NULL,
  `provider` VARCHAR(45) NULL,
  `country_id` INT NULL,
  `fund_id` INT NULL,
  `value` DOUBLE NULL,
  PRIMARY KEY (`forecast_id`),
  INDEX `count_f_idx` (`country_id` ASC) VISIBLE,
  INDEX `fund_f_idx` (`fund_id` ASC) VISIBLE,
  INDEX `time_f_idx` (`time_id` ASC) VISIBLE,
  CONSTRAINT `count_f`
    FOREIGN KEY (`country_id`)
    REFERENCES `TimeSeries`.`Country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `time_f`
    FOREIGN KEY (`time_id`)
    REFERENCES `TimeSeries`.`Time` (`time_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fund_f`
    FOREIGN KEY (`fund_id`)
    REFERENCES `TimeSeries`.`Fundament` (`fund_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

# insert into country all the countries - if there were more countries we would select distinct(country) 
# from the long data table in finalassign table
INSERT INTO `TimeSeries`.`Country` (`country_name`, `population`) VALUES ('AT', 9130273), ('BE', 11589623), ('BG', 6822357);
 
 # insert all the fundaments into fund table
 INSERT INTO `TimeSeries`.`Fundament` (`fund_name`, `type`) VALUES ('temperature', NULL), 
 ('load', 'total'), ('radiation', 'direct horizontal'),
 ('radiation', 'diffuse horizontal');
 
 # insert all the timestamps into time table`
 INSERT INTO `TimeSeries`.`Time` (`timestamp`) 
 SELECT timestamp FROM finalassign.weather_correct 
 UNION DISTINCT SELECT timestamp FROM finalassign.prices_correct;
 # add timezones
 SET SQL_SAFE_UPDATES = 0;
 UPDATE `TimeSeries`.`Time`
 SET timezone = 'UTC';
 
# insert actuals temperature
INSERT INTO TimeSeries.Actual (time_id, country_id, fund_id, value) 
SELECT time_id, country_id, fund_id, value FROM 
(SELECT `utc_timestamp`, country, fundament, value FROM finalassign.weather_long 
WHERE country = 'AT' AND fundament = 'temperature') as tb INNER JOIN TimeSeries.Country as tb2
ON tb.country = tb2.country_name INNER JOIN TimeSeries.Time as tb3 
ON tb.utc_timestamp = tb3.timestamp INNER JOIN TimeSeries.Fundament as tb4
ON tb.fundament = tb4.fund_name;

INSERT INTO TimeSeries.Actual (time_id, country_id, fund_id, value) 
SELECT time_id, country_id, fund_id, value FROM 
(SELECT `utc_timestamp`, country, fundament, value FROM finalassign.weather_long 
WHERE country = 'BE' AND fundament = 'temperature') as tb INNER JOIN TimeSeries.Country as tb2
ON tb.country = tb2.country_name INNER JOIN TimeSeries.Time as tb3 
ON tb.utc_timestamp = tb3.timestamp INNER JOIN TimeSeries.Fundament as tb4
ON tb.fundament = tb4.fund_name;

INSERT INTO TimeSeries.Actual (time_id, country_id, fund_id, value) 
SELECT time_id, country_id, fund_id, value FROM 
(SELECT `utc_timestamp`, country, fundament, value FROM finalassign.weather_long 
WHERE country = 'BG' AND fundament = 'temperature') as tb INNER JOIN TimeSeries.Country as tb2
ON tb.country = tb2.country_name INNER JOIN TimeSeries.Time as tb3 
ON tb.utc_timestamp = tb3.timestamp INNER JOIN TimeSeries.Fundament as tb4
ON tb.fundament = tb4.fund_name;

# insert actuals load

INSERT INTO TimeSeries.Actual (time_id, country_id, fund_id, value) 
SELECT time_id, country_id, fund_id, value FROM 
(SELECT `utc_timestamp`, country, fundament, value FROM finalassign.prices_long 
WHERE country = 'AT' AND fundament LIKE 'load_actual%') as tb INNER JOIN TimeSeries.Country as tb2
ON tb.country = tb2.country_name INNER JOIN TimeSeries.Time as tb3 
ON tb.utc_timestamp = tb3.timestamp LEFT JOIN TimeSeries.Fundament as tb4
ON tb.fundament LIKE CONCAT(tb4.fund_name, '_actual%');
 
INSERT INTO TimeSeries.Actual (time_id, country_id, fund_id, value) 
SELECT time_id, country_id, fund_id, value FROM 
(SELECT `utc_timestamp`, country, fundament, value FROM finalassign.prices_long 
WHERE country = 'BE' AND fundament LIKE 'load_actual%') as tb INNER JOIN TimeSeries.Country as tb2
ON tb.country = tb2.country_name INNER JOIN TimeSeries.Time as tb3 
ON tb.utc_timestamp = tb3.timestamp LEFT JOIN TimeSeries.Fundament as tb4
ON tb.fundament LIKE CONCAT(tb4.fund_name, '_actual%');

INSERT INTO TimeSeries.Actual (time_id, country_id, fund_id, value) 
SELECT time_id, country_id, fund_id, value FROM 
(SELECT `utc_timestamp`, country, fundament, value FROM finalassign.prices_long 
WHERE country = 'BG' AND fundament LIKE 'load_actual%') as tb INNER JOIN TimeSeries.Country as tb2
ON tb.country = tb2.country_name INNER JOIN TimeSeries.Time as tb3 
ON tb.utc_timestamp = tb3.timestamp LEFT JOIN TimeSeries.Fundament as tb4
ON tb.fundament LIKE CONCAT(tb4.fund_name, '_actual%');

UPDATE `TimeSeries`.`Actual`
SET provider = 'ENTSOE';
 
# insert the forecasts load
 
INSERT INTO TimeSeries.Forecast (time_id, country_id, fund_id, value) 
SELECT time_id, country_id, fund_id, value FROM 
(SELECT `utc_timestamp`, country, fundament, value FROM finalassign.prices_long 
WHERE country = 'AT' AND fundament LIKE 'load_forecast%') as tb INNER JOIN TimeSeries.Country as tb2
ON tb.country = tb2.country_name INNER JOIN TimeSeries.Time as tb3 
ON tb.utc_timestamp = tb3.timestamp LEFT JOIN TimeSeries.Fundament as tb4
ON tb.fundament LIKE CONCAT(tb4.fund_name, '_forecast%');

INSERT INTO TimeSeries.Forecast (time_id, country_id, fund_id, value) 
SELECT time_id, country_id, fund_id, value FROM 
(SELECT `utc_timestamp`, country, fundament, value FROM finalassign.prices_long 
WHERE country = 'BE' AND fundament LIKE 'load_forecast%') as tb INNER JOIN TimeSeries.Country as tb2
ON tb.country = tb2.country_name INNER JOIN TimeSeries.Time as tb3 
ON tb.utc_timestamp = tb3.timestamp LEFT JOIN TimeSeries.Fundament as tb4
ON tb.fundament LIKE CONCAT(tb4.fund_name, '_forecast%');

INSERT INTO TimeSeries.Forecast (time_id, country_id, fund_id, value) 
SELECT time_id, country_id, fund_id, value FROM 
(SELECT `utc_timestamp`, country, fundament, value FROM finalassign.prices_long 
WHERE country = 'BG' AND fundament LIKE 'load_forecast%') as tb INNER JOIN TimeSeries.Country as tb2
ON tb.country = tb2.country_name INNER JOIN TimeSeries.Time as tb3 
ON tb.utc_timestamp = tb3.timestamp LEFT JOIN TimeSeries.Fundament as tb4
ON tb.fundament LIKE CONCAT(tb4.fund_name, '_forecast%');

UPDATE `TimeSeries`.`Forecast`
SET provider = 'ENTSOE';