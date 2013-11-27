-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.32


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
-- Definition of table `bang_cap`
--

DROP TABLE IF EXISTS `bang_cap`;
CREATE TABLE `bang_cap` (
  `bc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bc_name` varchar(255) NOT NULL,
  `bc_order` int(10) unsigned NOT NULL DEFAULT '0',
  `bc_status` int(10) unsigned NOT NULL DEFAULT '1',
  `bc_date_added` datetime DEFAULT NULL,
  `bc_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`bc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bang_cap`
--

/*!40000 ALTER TABLE `bang_cap` DISABLE KEYS */;
INSERT INTO `bang_cap` (`bc_id`,`bc_name`,`bc_order`,`bc_status`,`bc_date_added`,`bc_date_modified`) VALUES 
 (8,'Cao há»c',2,1,'2013-11-09 22:37:08','2013-11-09 22:37:08');
/*!40000 ALTER TABLE `bang_cap` ENABLE KEYS */;


--
-- Definition of table `chuc_vu`
--

DROP TABLE IF EXISTS `chuc_vu`;
CREATE TABLE `chuc_vu` (
  `cv_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cv_name` varchar(255) NOT NULL,
  `cv_order` int(10) unsigned NOT NULL DEFAULT '0',
  `cv_status` int(10) unsigned NOT NULL DEFAULT '1',
  `cv_date_added` datetime DEFAULT NULL,
  `cv_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`cv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chuc_vu`
--

/*!40000 ALTER TABLE `chuc_vu` DISABLE KEYS */;
INSERT INTO `chuc_vu` (`cv_id`,`cv_name`,`cv_order`,`cv_status`,`cv_date_added`,`cv_date_modified`) VALUES 
 (4,'GiÃ¡m Ä‘á»‘c',1,1,'2013-11-10 21:38:30','2013-11-10 21:38:30'),
 (6,'TrÆ°á»Ÿng Ä‘Æ¡n vá»‹',1,1,'2013-11-10 21:38:47','2013-11-10 21:38:47');
/*!40000 ALTER TABLE `chuc_vu` ENABLE KEYS */;


--
-- Definition of table `chung_chi`
--

DROP TABLE IF EXISTS `chung_chi`;
CREATE TABLE `chung_chi` (
  `cc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cc_name` varchar(255) NOT NULL,
  `cc_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: Loai khac, 1: Ngoai ngu, 2: tin hoc',
  `cc_order` int(10) unsigned NOT NULL DEFAULT '0',
  `cc_status` int(10) unsigned NOT NULL DEFAULT '1',
  `cc_date_added` datetime DEFAULT NULL,
  `cc_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chung_chi`
--

/*!40000 ALTER TABLE `chung_chi` DISABLE KEYS */;
INSERT INTO `chung_chi` (`cc_id`,`cc_name`,`cc_type`,`cc_order`,`cc_status`,`cc_date_added`,`cc_date_modified`) VALUES 
 (1,'Tiáº¿ng Anh B1',1,0,1,'2013-11-27 11:14:35','2013-11-27 11:14:35'),
 (2,'Tin há»c 1',2,2,1,'2013-11-27 11:15:04','2013-11-27 11:15:04'),
 (3,'ABC',0,0,1,'2013-11-27 11:15:28','2013-11-27 11:15:28');
/*!40000 ALTER TABLE `chung_chi` ENABLE KEYS */;


--
-- Definition of table `dan_toc`
--

DROP TABLE IF EXISTS `dan_toc`;
CREATE TABLE `dan_toc` (
  `dt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dt_name` varchar(255) NOT NULL,
  `dt_status` int(10) unsigned NOT NULL DEFAULT '1',
  `dt_order` int(10) unsigned DEFAULT '0',
  `dt_date_added` datetime DEFAULT NULL,
  `dt_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`dt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dan_toc`
--

/*!40000 ALTER TABLE `dan_toc` DISABLE KEYS */;
INSERT INTO `dan_toc` (`dt_id`,`dt_name`,`dt_status`,`dt_order`,`dt_date_added`,`dt_date_modified`) VALUES 
 (2,'TÃ y',1,0,'2013-11-09 17:09:09','2013-11-09 17:27:53');
/*!40000 ALTER TABLE `dan_toc` ENABLE KEYS */;


--
-- Definition of table `danh_gia_ket_qua_cong_viec`
--

DROP TABLE IF EXISTS `danh_gia_ket_qua_cong_viec`;
CREATE TABLE `danh_gia_ket_qua_cong_viec` (
  `dgkqcv_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dgkqcv_name` varchar(255) NOT NULL,
  `dgkqcv_order` int(10) unsigned NOT NULL DEFAULT '0',
  `dgkqcv_status` int(10) unsigned NOT NULL DEFAULT '1',
  `dgkqcv_date_added` datetime DEFAULT NULL,
  `dgkqcv_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`dgkqcv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `danh_gia_ket_qua_cong_viec`
--

/*!40000 ALTER TABLE `danh_gia_ket_qua_cong_viec` DISABLE KEYS */;
INSERT INTO `danh_gia_ket_qua_cong_viec` (`dgkqcv_id`,`dgkqcv_name`,`dgkqcv_order`,`dgkqcv_status`,`dgkqcv_date_added`,`dgkqcv_date_modified`) VALUES 
 (9,'HoÃ n thÃ nh xuáº¥t sáº¯c',1,1,'2013-11-09 23:01:08','2013-11-09 23:01:08'),
 (10,'HoÃ n thÃ nh tá»‘t',2,1,'2013-11-09 23:01:19','2013-11-09 23:01:19'),
 (11,'hoÃ n thÃ nh cÃ´ng viá»‡c',3,1,'2013-11-09 23:01:39','2013-11-09 23:01:39');
/*!40000 ALTER TABLE `danh_gia_ket_qua_cong_viec` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`employee_id`,`ten`,`ten_dem`,`ho`,`ngay_sinh`,`so_chung_minh_thu`) VALUES 
 (1,'Hung','Manh','Nguyen',1986,'131398081'),
 (2,'Bich','Ngoc','Au',23234,'434343');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


--
-- Definition of table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_status` int(10) unsigned NOT NULL DEFAULT '0',
  `group_order` int(10) unsigned DEFAULT '0',
  `group_permissions` text,
  `group_date_modified` datetime DEFAULT NULL,
  `group_date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`group_id`,`group_name`,`group_status`,`group_order`,`group_permissions`,`group_date_modified`,`group_date_added`) VALUES 
 (1,'Nhom 1',1,1,'1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,2001,2002,2003,2004,2005,2006,2007,2008,','2013-11-25 15:43:49',NULL),
 (5,'Test cai nao edit',1,12,'1001','2013-11-09 17:19:45','2013-11-07 23:33:59'),
 (6,'NhÃ³m 3',1,2,NULL,'2013-11-09 16:41:59','2013-11-09 16:41:59'),
 (7,'dÃ¡dasd',1,0,NULL,'2013-11-09 17:11:56','2013-11-09 17:11:56');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


--
-- Definition of table `hoc_ham`
--

DROP TABLE IF EXISTS `hoc_ham`;
CREATE TABLE `hoc_ham` (
  `hh_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hh_name` varchar(255) NOT NULL,
  `hh_order` int(10) unsigned NOT NULL DEFAULT '0',
  `hh_status` int(10) unsigned NOT NULL DEFAULT '1',
  `hh_date_added` datetime DEFAULT NULL,
  `hh_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`hh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hoc_ham`
--

/*!40000 ALTER TABLE `hoc_ham` DISABLE KEYS */;
INSERT INTO `hoc_ham` (`hh_id`,`hh_name`,`hh_order`,`hh_status`,`hh_date_added`,`hh_date_modified`) VALUES 
 (3,'Tháº¡c sÄ©',1,1,'2013-11-09 22:15:46','2013-11-09 22:28:15');
/*!40000 ALTER TABLE `hoc_ham` ENABLE KEYS */;


--
-- Definition of table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays` (
  `hld_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hld_name` varchar(255) NOT NULL,
  `hld_order` int(10) unsigned NOT NULL DEFAULT '0',
  `hld_status` int(10) unsigned NOT NULL DEFAULT '1',
  `hld_date_added` datetime DEFAULT NULL,
  `hld_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`hld_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holidays`
--

/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` (`hld_id`,`hld_name`,`hld_order`,`hld_status`,`hld_date_added`,`hld_date_modified`) VALUES 
 (4,'Giáº£i phÃ³ng miá»n nam',1,0,'2013-11-10 17:11:04','2013-11-10 17:12:58'),
 (5,'QUá»‘c táº¿ lao Ä‘á»™ng',2,1,'2013-11-10 17:11:13','2013-11-10 17:11:13'),
 (6,'Quá»‘c khÃ¡nh',3,1,'2013-11-10 17:11:20','2013-11-10 17:11:20'),
 (7,'Táº¿t dÆ°Æ¡ng lá»‹ch',4,1,'2013-11-10 17:11:30','2013-11-10 17:11:30');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;


--
-- Definition of table `huyen`
--

DROP TABLE IF EXISTS `huyen`;
CREATE TABLE `huyen` (
  `huyen_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `huyen_name` varchar(255) NOT NULL,
  `huyen_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `huyen_order` int(10) unsigned NOT NULL DEFAULT '0',
  `huyen_status` int(10) unsigned NOT NULL DEFAULT '1',
  `huyen_date_added` datetime DEFAULT NULL,
  `huyen_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`huyen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `huyen`
--

/*!40000 ALTER TABLE `huyen` DISABLE KEYS */;
/*!40000 ALTER TABLE `huyen` ENABLE KEYS */;


--
-- Definition of table `ngach_cong_chuc`
--

DROP TABLE IF EXISTS `ngach_cong_chuc`;
CREATE TABLE `ngach_cong_chuc` (
  `ncc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ncc_name` varchar(255) NOT NULL,
  `ncc_order` int(10) unsigned NOT NULL DEFAULT '0',
  `ncc_status` int(10) unsigned NOT NULL DEFAULT '1',
  `ncc_date_added` datetime DEFAULT NULL,
  `ncc_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`ncc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ngach_cong_chuc`
--

/*!40000 ALTER TABLE `ngach_cong_chuc` DISABLE KEYS */;
INSERT INTO `ngach_cong_chuc` (`ncc_id`,`ncc_name`,`ncc_order`,`ncc_status`,`ncc_date_added`,`ncc_date_modified`) VALUES 
 (4,'Ngáº¡ch chuyÃªn viÃªn',1,1,'2013-11-26 15:07:50','2013-11-26 15:09:51'),
 (5,'Ngáº¡ch káº¿ toÃ¡n viÃªn',2,1,'2013-11-26 15:07:58','2013-11-26 15:07:58');
/*!40000 ALTER TABLE `ngach_cong_chuc` ENABLE KEYS */;


--
-- Definition of table `phong_ban`
--

DROP TABLE IF EXISTS `phong_ban`;
CREATE TABLE `phong_ban` (
  `pb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pb_name` varchar(255) NOT NULL,
  `pb_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `pb_order` int(10) unsigned NOT NULL DEFAULT '0',
  `pb_status` int(10) unsigned NOT NULL DEFAULT '1',
  `pb_date_added` datetime DEFAULT NULL,
  `pb_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`pb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phong_ban`
--

/*!40000 ALTER TABLE `phong_ban` DISABLE KEYS */;
INSERT INTO `phong_ban` (`pb_id`,`pb_name`,`pb_parent`,`pb_order`,`pb_status`,`pb_date_added`,`pb_date_modified`) VALUES 
 (9,'Phong ban 1',0,0,1,NULL,'2013-11-17 22:50:46'),
 (11,'phong ban 3',0,0,1,NULL,NULL);
/*!40000 ALTER TABLE `phong_ban` ENABLE KEYS */;


--
-- Definition of table `tieu_chi_danh_gia_can_bo`
--

DROP TABLE IF EXISTS `tieu_chi_danh_gia_can_bo`;
CREATE TABLE `tieu_chi_danh_gia_can_bo` (
  `tcdgcb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tcdgcb_name` varchar(255) NOT NULL,
  `tcdgcb_order` int(10) unsigned NOT NULL DEFAULT '0',
  `tcdgcb_status` int(10) unsigned NOT NULL DEFAULT '1',
  `tcdgcb_date_added` datetime DEFAULT NULL,
  `tcdgcb_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`tcdgcb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tieu_chi_danh_gia_can_bo`
--

/*!40000 ALTER TABLE `tieu_chi_danh_gia_can_bo` DISABLE KEYS */;
INSERT INTO `tieu_chi_danh_gia_can_bo` (`tcdgcb_id`,`tcdgcb_name`,`tcdgcb_order`,`tcdgcb_status`,`tcdgcb_date_added`,`tcdgcb_date_modified`) VALUES 
 (4,'Vi pháº¡m chÃ­nh sÃ¡ch, ká»· luáº­t',1,1,'2013-11-10 16:58:59','2013-11-10 16:58:59'),
 (5,'Vi pháº¡m pháº©m cháº¥t chÃ­nh trá»‹',2,1,'2013-11-10 16:59:14','2013-11-10 16:59:14');
/*!40000 ALTER TABLE `tieu_chi_danh_gia_can_bo` ENABLE KEYS */;


--
-- Definition of table `tinh`
--

DROP TABLE IF EXISTS `tinh`;
CREATE TABLE `tinh` (
  `tinh_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tinh_name` varchar(255) NOT NULL,
  `tinh_order` int(10) unsigned NOT NULL DEFAULT '0',
  `tinh_status` int(10) unsigned NOT NULL DEFAULT '1',
  `tinh_date_added` datetime DEFAULT NULL,
  `tinh_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`tinh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tinh`
--

/*!40000 ALTER TABLE `tinh` DISABLE KEYS */;
INSERT INTO `tinh` (`tinh_id`,`tinh_name`,`tinh_order`,`tinh_status`,`tinh_date_added`,`tinh_date_modified`) VALUES 
 (4,'HÃ  Ná»™i',1,1,'2013-11-10 17:31:42','2013-11-10 17:31:42'),
 (5,'Há»“ chÃ­ minh',2,1,'2013-11-10 17:31:51','2013-11-10 17:31:51');
/*!40000 ALTER TABLE `tinh` ENABLE KEYS */;


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
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`employee_id`,`group_id`,`username`,`password`,`status`,`date_added`,`date_modified`) VALUES 
 (1,1,1,'hungnm','37a9b57da9afc663e11b5da3e01c3da5','1','2013-11-07 22:58:52','2013-11-07 22:58:52'),
 (2,2,1,'bichatn','37a9b57da9afc663e11b5da3e01c3da5','0','2013-11-07 22:58:52','2013-11-25 15:03:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

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
 (9,1,1382864274,'::1'),
 (10,1,1382970303,'::1'),
 (11,1,1382974240,'::1'),
 (12,1,1382974487,'::1'),
 (13,1,1382975121,'::1'),
 (14,1,1382975185,'::1'),
 (15,1,1382975229,'::1'),
 (16,1,1382975487,'::1'),
 (17,1,1382975592,'::1'),
 (18,1,1382975769,'::1'),
 (19,1,1382975791,'::1'),
 (20,1,1382975812,'::1'),
 (21,1,1382975830,'::1'),
 (22,1,1382975836,'::1'),
 (23,1,1382975843,'::1'),
 (24,1,1382975898,'::1'),
 (25,1,1382975904,'::1'),
 (26,1,1382978703,'::1'),
 (27,1,1383059322,'::1'),
 (28,1,1383063325,'::1'),
 (29,1,1383063459,'::1'),
 (30,1,1383063493,'::1'),
 (31,1,1383063526,'::1'),
 (32,1,1383589095,'::1'),
 (33,1,1383662520,'::1'),
 (34,1,1383663079,'::1'),
 (35,1,1383663099,'::1'),
 (36,1,1383744701,'::1'),
 (37,1,1383838887,'::1'),
 (38,1,1383923793,'::1'),
 (39,1,1383981128,'::1'),
 (40,1,1383984720,'::1'),
 (41,1,1383985004,'::1'),
 (42,1,1384076618,'::1'),
 (43,1,1384698698,'::1'),
 (44,1,1384702833,'::1'),
 (45,1,1385276349,'::1'),
 (46,1,1385277925,'::1'),
 (47,1,1385281393,'::1'),
 (48,1,1385349748,'::1'),
 (49,1,1385523456,'::1');
/*!40000 ALTER TABLE `users_log` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
