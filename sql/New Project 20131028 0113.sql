-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.27


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema phanloaicanbo
--

CREATE DATABASE IF NOT EXISTS phanloaicanbo;
USE phanloaicanbo;

--
-- Definition of table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `employee_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) NOT NULL,
  `ten_dem` varchar(45) DEFAULT NULL,
  `ho` varchar(45) NOT NULL,
  `ngay_sinh` int(10) unsigned NOT NULL,
  `so_chung_minh_thu` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`employee_id`,`ten`,`ten_dem`,`ho`,`ngay_sinh`,`so_chung_minh_thu`) VALUES 
 (1,'Hùng','Mạnh','Nguyễn',1986,'131398081');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0' COMMENT '0: de-active, 1: active',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`employee_id`,`group_id`,`username`,`password`,`status`) VALUES 
 (1,1,0,'hungnm','37a9b57da9afc663e11b5da3e01c3da5','1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `users_log`
--

DROP TABLE IF EXISTS `users_log`;
CREATE TABLE `users_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `login_date` int(10) unsigned NOT NULL,
  `login_ip` varchar(45) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_log`
--

/*!40000 ALTER TABLE `users_log` DISABLE KEYS */;
INSERT INTO `users_log` (`log_id`,`user_id`,`login_date`,`login_ip`) VALUES 
 (2,1,0,'::1'),
 (3,1,0,'::1'),
 (4,1,1382861394,'::1'),
 (5,1,1382861836,'::1'),
 (6,1,1382862038,'::1'),
 (7,1,1382862109,'::1'),
 (8,1,1382862188,'::1'),
 (9,1,1382864274,'::1');
/*!40000 ALTER TABLE `users_log` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
