SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
--
-- Compatible with newer MySQL versions. (After MySQL-5.5)
-- This SQL uses utf8mb4 and has CURRENT_TIMESTAMP function.
--


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `altislife`
-- Default Schema
--
CREATE DATABASE IF NOT EXISTS `altislife` DEFAULT CHARACTER SET utf8mb4;
USE `altislife`;

--
-- Drop procedures to ensure no conflicts
--
DROP PROCEDURE IF EXISTS `resetLifeVehicles`;
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DROP PROCEDURE IF EXISTS `deleteOldHouses`;
DROP PROCEDURE IF EXISTS `deleteOldGangs`;
DROP PROCEDURE IF EXISTS `deleteOldContainers`;

DELIMITER $$
--
-- Procedures
-- Edit arma3 to match a user in MySQL
-- For external databases: Edit localhost to match arma3server IP
--

CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
  UPDATE `vehicles` SET `active`= 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
  DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldContainers`()
BEGIN
  DELETE FROM `containers` WHERE `owned` = 0;
END$$

DELIMITER ;
