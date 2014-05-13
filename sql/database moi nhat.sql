-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.14


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
-- Definition of table `bac_luong`
--

DROP TABLE IF EXISTS `bac_luong`;
CREATE TABLE `bac_luong` (
  `bl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bl_name` varchar(255) NOT NULL,
  `bl_he_so_luong` text NOT NULL,
  `bl_status` int(10) unsigned NOT NULL DEFAULT '1',
  `bl_date_modified` datetime DEFAULT NULL,
  `bl_date_added` datetime DEFAULT NULL,
  `bl_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bac_luong`
--

/*!40000 ALTER TABLE `bac_luong` DISABLE KEYS */;
INSERT INTO `bac_luong` (`bl_id`,`bl_name`,`bl_he_so_luong`,`bl_status`,`bl_date_modified`,`bl_date_added`,`bl_order`) VALUES 
 (4,'Báº­c 1','',1,'2014-04-01 17:42:24','2014-04-01 17:42:24',1),
 (5,'Báº­c 2','',1,'2014-04-01 17:44:40','2014-04-01 17:44:40',1),
 (6,'Báº­c 3','a:3:{i:4;s:1:\"1\";i:5;s:1:\"2\";i:6;s:1:\"3\";}',1,'2014-05-07 11:37:58','2014-05-07 11:37:58',1);
/*!40000 ALTER TABLE `bac_luong` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bang_cap`
--

/*!40000 ALTER TABLE `bang_cap` DISABLE KEYS */;
INSERT INTO `bang_cap` (`bc_id`,`bc_name`,`bc_order`,`bc_status`,`bc_date_added`,`bc_date_modified`) VALUES 
 (8,'Cao há»c',2,1,'2013-11-09 22:37:08','2013-11-09 22:37:08'),
 (9,'Trung cáº¥p',1,1,'2014-02-23 16:57:26','2014-02-23 16:57:26'),
 (10,'Cap Ä‘áº³ng',2,1,'2014-02-23 16:57:33','2014-02-23 16:57:33'),
 (11,'Äáº¡i há»c',3,1,'2014-02-23 16:57:40','2014-02-23 16:57:40');
/*!40000 ALTER TABLE `bang_cap` ENABLE KEYS */;


--
-- Definition of table `bang_luong`
--

DROP TABLE IF EXISTS `bang_luong`;
CREATE TABLE `bang_luong` (
  `bl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bl_em_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bl_ptccb_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bl_date_added` datetime NOT NULL,
  `bl_date_modified` datetime NOT NULL,
  `bl_luong_toi_thieu` int(10) unsigned NOT NULL DEFAULT '0',
  `bl_giai_doan` int(10) unsigned NOT NULL DEFAULT '0',
  `bl_loai_luong` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: chinh thuc, 1: hop dong',
  `bl_bhxh` float NOT NULL DEFAULT '0',
  `bl_bhyt` float NOT NULL DEFAULT '0',
  `bl_pc_tang_them` float NOT NULL DEFAULT '0',
  `bl_pc_kiem_nhiem` float NOT NULL DEFAULT '0',
  `bl_hs_luong` float NOT NULL DEFAULT '0',
  `bl_hs_pc_cong_viec` float NOT NULL DEFAULT '0',
  `bl_hs_pc_trach_nhiem` float NOT NULL DEFAULT '0',
  `bl_hs_pc_khu_vuc` float NOT NULL DEFAULT '0',
  `bl_hs_pc_tnvk` float NOT NULL DEFAULT '0',
  `bl_tham_nien` int(10) unsigned NOT NULL DEFAULT '0',
  `bl_hs_pc_udn` float NOT NULL DEFAULT '0',
  `bl_hs_pc_cong_vu` float NOT NULL DEFAULT '0',
  `bl_hs_pc_khac` float NOT NULL DEFAULT '0',
  `bl_date` datetime NOT NULL,
  `bl_luong_thu_viec` float NOT NULL DEFAULT '0',
  `bl_time_tham_nien` datetime DEFAULT NULL,
  `bl_pc_thu_hut` float NOT NULL DEFAULT '0',
  `bl_pc_khac_type` int(10) unsigned NOT NULL DEFAULT '0',
  `bl_phan_loai` varchar(45) NOT NULL DEFAULT 'A',
  `bl_phan_loai_he_so` float NOT NULL DEFAULT '1.2',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bang_luong`
--

/*!40000 ALTER TABLE `bang_luong` DISABLE KEYS */;
INSERT INTO `bang_luong` (`bl_id`,`bl_em_id`,`bl_ptccb_id`,`bl_date_added`,`bl_date_modified`,`bl_luong_toi_thieu`,`bl_giai_doan`,`bl_loai_luong`,`bl_bhxh`,`bl_bhyt`,`bl_pc_tang_them`,`bl_pc_kiem_nhiem`,`bl_hs_luong`,`bl_hs_pc_cong_viec`,`bl_hs_pc_trach_nhiem`,`bl_hs_pc_khu_vuc`,`bl_hs_pc_tnvk`,`bl_tham_nien`,`bl_hs_pc_udn`,`bl_hs_pc_cong_vu`,`bl_hs_pc_khac`,`bl_date`,`bl_luong_thu_viec`,`bl_time_tham_nien`,`bl_pc_thu_hut`,`bl_pc_khac_type`,`bl_phan_loai`,`bl_phan_loai_he_so`) VALUES 
 (1,1,1,'2014-02-23 15:50:42','2014-02-23 18:11:07',1050000,0,0,7,1.5,0.5,0,3.66,0.55,0.05,0,0,19,20,25,0,'2014-02-01 00:00:07',0,NULL,0,0,'A',1.2),
 (2,1,1,'2014-02-23 16:30:00','2014-02-23 16:30:00',1050000,0,0,7,1.5,0.5,0,3.66,0.55,0.05,0,0,19,20,25,0,'2014-01-01 00:00:07',0,NULL,0,0,'A',1.2),
 (3,2,22,'2014-04-13 12:04:33','2014-04-13 12:04:33',1050000,0,0,7,1.5,0.5,9,1,2,4,0,6,14,7,8,10,'2014-04-01 00:00:07',0,NULL,3,1,'B',1),
 (4,2,22,'2014-04-13 12:05:35','2014-04-13 12:05:35',1050000,0,0,7,1.5,0.5,9,1,2,4,0,6,14,7,8,10,'2014-03-01 00:00:07',0,NULL,3,1,'A',1.2),
 (5,22,22,'2014-04-13 21:42:44','2014-04-13 21:42:44',1050000,0,0,7,1.5,0.5,9,1,2,4,0,6,44,7,8,10,'2014-02-01 00:00:07',0,NULL,3,0,'A',1.2),
 (6,22,22,'2014-04-13 21:42:55','2014-04-13 21:42:55',1050000,0,0,7,1.5,0.5,9,1,2,4,0,6,44,7,8,10,'2014-03-01 00:00:07',0,NULL,3,0,'A',1.2);
/*!40000 ALTER TABLE `bang_luong` ENABLE KEYS */;


--
-- Definition of table `cham_cong`
--

DROP TABLE IF EXISTS `cham_cong`;
CREATE TABLE `cham_cong` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_em_id` int(10) unsigned NOT NULL,
  `c_thang` int(10) unsigned NOT NULL,
  `c_nam` int(10) unsigned NOT NULL,
  `c_ngay_1` varchar(45) DEFAULT NULL,
  `c_ngay_2` varchar(45) DEFAULT NULL,
  `c_ngay_3` varchar(45) DEFAULT NULL,
  `c_ngay_4` varchar(45) DEFAULT NULL,
  `c_ngay_5` varchar(45) DEFAULT NULL,
  `c_ngay_6` varchar(45) DEFAULT NULL,
  `c_ngay_7` varchar(45) DEFAULT NULL,
  `c_ngay_8` varchar(45) DEFAULT NULL,
  `c_ngay_9` varchar(45) DEFAULT NULL,
  `c_ngay_10` varchar(45) DEFAULT NULL,
  `c_ngay_11` varchar(45) DEFAULT NULL,
  `c_ngay_12` varchar(45) DEFAULT NULL,
  `c_ngay_13` varchar(45) DEFAULT NULL,
  `c_ngay_14` varchar(45) DEFAULT NULL,
  `c_ngay_15` varchar(45) DEFAULT NULL,
  `c_ngay_16` varchar(45) DEFAULT NULL,
  `c_ngay_17` varchar(45) DEFAULT NULL,
  `c_ngay_18` varchar(45) DEFAULT NULL,
  `c_ngay_19` varchar(45) DEFAULT NULL,
  `c_ngay_20` varchar(45) DEFAULT NULL,
  `c_ngay_21` varchar(45) DEFAULT NULL,
  `c_ngay_22` varchar(45) DEFAULT NULL,
  `c_ngay_23` varchar(45) DEFAULT NULL,
  `c_ngay_24` varchar(45) DEFAULT NULL,
  `c_ngay_25` varchar(45) DEFAULT NULL,
  `c_ngay_26` varchar(45) DEFAULT NULL,
  `c_ngay_27` varchar(45) DEFAULT NULL,
  `c_ngay_28` varchar(45) DEFAULT NULL,
  `c_ngay_29` varchar(45) DEFAULT NULL,
  `c_ngay_30` varchar(45) DEFAULT NULL,
  `c_ngay_31` varchar(45) DEFAULT NULL,
  `c_don_vi_status` double NOT NULL DEFAULT '-1',
  `c_ptccb_status` double NOT NULL DEFAULT '-1',
  `c_date_created` datetime DEFAULT NULL,
  `c_date_modifyed` datetime DEFAULT NULL,
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cham_cong`
--

/*!40000 ALTER TABLE `cham_cong` DISABLE KEYS */;
INSERT INTO `cham_cong` (`c_id`,`c_em_id`,`c_thang`,`c_nam`,`c_ngay_1`,`c_ngay_2`,`c_ngay_3`,`c_ngay_4`,`c_ngay_5`,`c_ngay_6`,`c_ngay_7`,`c_ngay_8`,`c_ngay_9`,`c_ngay_10`,`c_ngay_11`,`c_ngay_12`,`c_ngay_13`,`c_ngay_14`,`c_ngay_15`,`c_ngay_16`,`c_ngay_17`,`c_ngay_18`,`c_ngay_19`,`c_ngay_20`,`c_ngay_21`,`c_ngay_22`,`c_ngay_23`,`c_ngay_24`,`c_ngay_25`,`c_ngay_26`,`c_ngay_27`,`c_ngay_28`,`c_ngay_29`,`c_ngay_30`,`c_ngay_31`,`c_don_vi_status`,`c_ptccb_status`,`c_date_created`,`c_date_modifyed`) VALUES 
 (2,1,2,2014,'9','','','','','','','9','8','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0','','','','4','','','',1,1,'2014-02-08 23:08:39','2014-02-08 23:18:29'),
 (3,22,1,2014,'10','10','10','9','8','10','10','10','11','12','9','8','10','10','10','10','10','9','8','10','10','10','10','10','9','8','10','10','10','10','10',-1,-1,'2014-05-13 13:55:25','2014-05-13 13:55:25');
/*!40000 ALTER TABLE `cham_cong` ENABLE KEYS */;


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
-- Definition of table `chuc_vu_cong_doan`
--

DROP TABLE IF EXISTS `chuc_vu_cong_doan`;
CREATE TABLE `chuc_vu_cong_doan` (
  `cvcdoan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cvcdoan_name` varchar(255) NOT NULL,
  `cvcdoan_order` int(10) unsigned NOT NULL DEFAULT '0',
  `cvcdoan_status` int(10) unsigned NOT NULL DEFAULT '1',
  `cvcdoan_date_added` datetime DEFAULT NULL,
  `cvcdoan_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`cvcdoan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chuc_vu_cong_doan`
--

/*!40000 ALTER TABLE `chuc_vu_cong_doan` DISABLE KEYS */;
INSERT INTO `chuc_vu_cong_doan` (`cvcdoan_id`,`cvcdoan_name`,`cvcdoan_order`,`cvcdoan_status`,`cvcdoan_date_added`,`cvcdoan_date_modified`) VALUES 
 (14,'Chá»©c vá»¥ 1',1,1,'2014-02-09 11:33:34','2014-02-09 11:33:34'),
 (15,'Chá»© vá»¥ 2',2,1,'2014-02-09 11:33:42','2014-02-09 11:33:42');
/*!40000 ALTER TABLE `chuc_vu_cong_doan` ENABLE KEYS */;


--
-- Definition of table `chuc_vu_dang`
--

DROP TABLE IF EXISTS `chuc_vu_dang`;
CREATE TABLE `chuc_vu_dang` (
  `cvdang_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cvdang_name` varchar(255) NOT NULL,
  `cvdang_order` int(10) unsigned NOT NULL DEFAULT '0',
  `cvdang_status` int(10) unsigned NOT NULL DEFAULT '1',
  `cvdang_date_added` datetime DEFAULT NULL,
  `cvdang_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`cvdang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chuc_vu_dang`
--

/*!40000 ALTER TABLE `chuc_vu_dang` DISABLE KEYS */;
INSERT INTO `chuc_vu_dang` (`cvdang_id`,`cvdang_name`,`cvdang_order`,`cvdang_status`,`cvdang_date_added`,`cvdang_date_modified`) VALUES 
 (9,'BÃ­ thÆ°',0,1,'2014-02-09 10:57:40','2014-02-09 10:57:40'),
 (10,'PhÃ³ bÃ­ thÆ°',1,1,'2014-02-09 10:58:01','2014-02-09 10:58:01');
/*!40000 ALTER TABLE `chuc_vu_dang` ENABLE KEYS */;


--
-- Definition of table `chuc_vu_doan`
--

DROP TABLE IF EXISTS `chuc_vu_doan`;
CREATE TABLE `chuc_vu_doan` (
  `cvdoan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cvdoan_name` varchar(255) NOT NULL,
  `cvdoan_order` int(10) unsigned NOT NULL DEFAULT '0',
  `cvdoan_status` int(10) unsigned NOT NULL DEFAULT '1',
  `cvdoan_date_added` datetime DEFAULT NULL,
  `cvdoan_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`cvdoan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chuc_vu_doan`
--

/*!40000 ALTER TABLE `chuc_vu_doan` DISABLE KEYS */;
INSERT INTO `chuc_vu_doan` (`cvdoan_id`,`cvdoan_name`,`cvdoan_order`,`cvdoan_status`,`cvdoan_date_added`,`cvdoan_date_modified`) VALUES 
 (9,'BÃ­ thÆ°',0,1,'2014-02-09 10:49:12','2014-02-09 10:49:46'),
 (12,'PhÃ³ bÃ­ thÆ°',1,1,'2014-02-09 10:50:51','2014-02-09 10:50:51'),
 (13,'ÄoÃ n viÃªn',2,1,'2014-02-09 10:50:58','2014-02-09 10:50:58');
/*!40000 ALTER TABLE `chuc_vu_doan` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dan_toc`
--

/*!40000 ALTER TABLE `dan_toc` DISABLE KEYS */;
INSERT INTO `dan_toc` (`dt_id`,`dt_name`,`dt_status`,`dt_order`,`dt_date_added`,`dt_date_modified`) VALUES 
 (1,'Kinh',1,0,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (2,'TÃ y',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (3,'ThÃ¡i',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (4,'MÆ°á»ng ',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (5,'Khmer',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (6,'Hoa ',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (7,'NÃ¹ng  ',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (8,'MÃ´ng',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (9,'Dao',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (10,'Gia Rai',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (11,'ÃŠ  ÄÃª',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (12,'Ba Na',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (13,'SÃ¡n Chay ',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (14,'ChÄƒm ',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (15,'CÆ¡ Ho',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (16,'XÆ¡ ÄÄƒng',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (17,'SÃ¡n DÃ¬u',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (18,'HrÃª',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (19,'RaGlay',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (20,'MnÃ´ng',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (21,'Thá»• (4)',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (22,'XtiÃªng',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (23,'KhÆ¡ mÃº',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (24,'Bru VÃ¢n Kiá»u',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (25,'CÆ¡ Tu',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (26,'GiÃ¡y',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (27,'TÃ  Ã”i',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (28,'Máº¡',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (29,'Giáº»-TriÃªng',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (30,'Co',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (31,'ChÆ¡ Ro',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (32,'Xinh Mun',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (33,'HÃ  NhÃ¬',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (34,'Chu Ru',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (35,'LÃ o',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (36,'La ChÃ­',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (37,'KhÃ¡ng',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (38,'PhÃ¹ LÃ¡',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (39,'La Há»§',1,2,'2014-05-13 11:19:52','2014-05-13 11:19:52'),
 (40,'La Ha',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (41,'PÃ  Tháº»n',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (42,'Lá»±',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (43,'NgÃ¡i',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (44,'Chá»©t',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (45,'LÃ´ LÃ´',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (46,'Máº£ng',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (47,'CÆ¡ Lao',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (48,'Bá»‘ Y',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (49,'Cá»‘ng',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (50,'Si La',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (51,'Pu PÃ©o',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (52,'RÆ¡ MÄƒm',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (53,'BrÃ¢u',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53'),
 (54,'Æ  Äu',1,2,'2014-05-13 11:19:53','2014-05-13 11:19:53');
/*!40000 ALTER TABLE `dan_toc` ENABLE KEYS */;


--
-- Definition of table `danh_gia`
--

DROP TABLE IF EXISTS `danh_gia`;
CREATE TABLE `danh_gia` (
  `dg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dg_em_id` int(10) unsigned NOT NULL,
  `dg_thang` int(10) unsigned NOT NULL,
  `dg_nam` int(10) unsigned NOT NULL,
  `dg_cong_viec` text NOT NULL,
  `dg_ket_qua_cong_viec` int(10) unsigned NOT NULL,
  `dg_so_ngay_nghi` float DEFAULT '0',
  `dg_ly_do_nghi` text,
  `dg_y_thuc_xay_dung` text,
  `dg_khuyet_diem` text,
  `dg_tc_danh_gia` text,
  `dg_ghi_chu` text,
  `dg_phan_loai` varchar(45) DEFAULT NULL,
  `dg_don_vi_status` varchar(1) DEFAULT NULL,
  `dg_ptccb_status` varchar(1) DEFAULT NULL,
  `dg_date_created` datetime DEFAULT NULL,
  `dg_date_modifyed` datetime DEFAULT NULL,
  PRIMARY KEY (`dg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `danh_gia`
--

/*!40000 ALTER TABLE `danh_gia` DISABLE KEYS */;
INSERT INTO `danh_gia` (`dg_id`,`dg_em_id`,`dg_thang`,`dg_nam`,`dg_cong_viec`,`dg_ket_qua_cong_viec`,`dg_so_ngay_nghi`,`dg_ly_do_nghi`,`dg_y_thuc_xay_dung`,`dg_khuyet_diem`,`dg_tc_danh_gia`,`dg_ghi_chu`,`dg_phan_loai`,`dg_don_vi_status`,`dg_ptccb_status`,`dg_date_created`,`dg_date_modifyed`) VALUES 
 (1,1,2,2014,'<p>C&ocirc;ng viá»‡c 1,</p>\r\n<p>c&ocirc;ng viá»‡c 2</p>',9,0,'<p>á»m</p>','<p>tá»‘t</p>','<p>kh&ocirc;ng c&oacute;</p>','a:2:{i:4;s:1:\"0\";i:5;s:1:\"2\";}','<p>te te</p>','A','A','A','2014-02-11 19:54:22','2014-02-16 13:42:46'),
 (2,13,2,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','2014-02-19 23:06:35','2014-02-19 23:06:35'),
 (3,1,3,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','2014-02-19 23:09:00','2014-02-19 23:09:00'),
 (4,13,3,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B','2014-02-19 23:09:03','2014-02-19 23:09:03'),
 (5,22,4,2014,'<p>zxzxc</p>',9,0,'<p>sdfdsf</p>','<p>fsdf</p>','<p>fsdfsd</p>','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','<p>fsdfsdf</p>','A','B','C','2014-04-03 23:12:26','2014-04-03 23:15:25'),
 (6,22,5,2014,'<p>dsfgdsf</p>',9,0,'<p>fsdfsd</p>','','<p>fsdfsd</p>','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','C','C','C','2014-04-13 12:08:13','2014-04-13 12:08:13'),
 (7,1,5,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B','2014-05-07 10:21:34','2014-05-07 10:21:34');
/*!40000 ALTER TABLE `danh_gia` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `danh_gia_ket_qua_cong_viec`
--

/*!40000 ALTER TABLE `danh_gia_ket_qua_cong_viec` DISABLE KEYS */;
INSERT INTO `danh_gia_ket_qua_cong_viec` (`dgkqcv_id`,`dgkqcv_name`,`dgkqcv_order`,`dgkqcv_status`,`dgkqcv_date_added`,`dgkqcv_date_modified`) VALUES 
 (9,'HoÃ n thÃ nh xuáº¥t sáº¯c',1,1,'2013-11-09 23:01:08','2013-11-09 23:01:08'),
 (10,'HoÃ n thÃ nh tá»‘t',2,1,'2013-11-09 23:01:19','2013-11-09 23:01:19'),
 (11,'HoÃ n thÃ nh cÃ´ng viá»‡c',3,1,'2013-11-09 23:01:39','2014-02-23 16:56:27'),
 (12,'ChÆ°a hoÃ n thÃ nh cÃ´ng viá»‡c',4,1,'2014-02-23 16:56:45','2014-02-23 16:56:45'),
 (13,'Káº¿t quáº£ ráº¥t kÃ©m',3,1,'2014-02-23 16:57:04','2014-02-23 16:57:04');
/*!40000 ALTER TABLE `danh_gia_ket_qua_cong_viec` ENABLE KEYS */;


--
-- Definition of table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `em_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `em_ten` varchar(45) NOT NULL,
  `em_ten_dem` varchar(45) DEFAULT NULL,
  `em_ho` varchar(45) NOT NULL,
  `em_ngay_sinh` datetime DEFAULT NULL,
  `em_so_chung_minh_thu` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `em_ten_khac` varchar(100) DEFAULT NULL,
  `em_anh_the` varchar(255) DEFAULT NULL,
  `em_gioi_tinh` int(10) unsigned NOT NULL DEFAULT '1',
  `em_home_phone` varchar(45) DEFAULT NULL,
  `em_phone` varchar(45) DEFAULT NULL,
  `em_noi_sinh` varchar(255) DEFAULT NULL,
  `em_noi_sinh_tinh` varchar(255) DEFAULT NULL,
  `em_noi_sinh_huyen` varchar(255) DEFAULT NULL,
  `em_que_quan` varchar(255) DEFAULT NULL,
  `em_noi_o` varchar(255) DEFAULT NULL,
  `em_noi_o_tinh` varchar(255) DEFAULT NULL,
  `em_noi_o_huyen` varchar(255) DEFAULT NULL,
  `em_que_quan_tinh` varchar(255) DEFAULT NULL,
  `em_que_quan_huyen` varchar(255) DEFAULT NULL,
  `em_dia_chi` varchar(255) DEFAULT NULL,
  `em_dia_chi_tinh` int(10) unsigned NOT NULL DEFAULT '0',
  `em_dia_chi_huyen` int(10) unsigned NOT NULL DEFAULT '0',
  `em_dan_toc` int(10) unsigned NOT NULL DEFAULT '0',
  `em_so_cong_chuc` varchar(255) DEFAULT NULL,
  `em_chuc_vu` int(10) unsigned NOT NULL DEFAULT '0',
  `em_phong_ban` int(10) unsigned NOT NULL DEFAULT '0',
  `em_ngay_tuyen_dung` datetime DEFAULT NULL,
  `em_ngach_cong_chuc` int(10) unsigned NOT NULL DEFAULT '0',
  `em_cong_viec` varchar(255) DEFAULT NULL,
  `em_chuyen_mon` varchar(255) DEFAULT NULL,
  `em_chuc_vu_dang` int(10) unsigned NOT NULL DEFAULT '0',
  `em_ngay_vao_dang` datetime DEFAULT NULL,
  `em_chuc_vu_doan` int(10) unsigned NOT NULL DEFAULT '0',
  `em_ngay_vao_doan` datetime DEFAULT NULL,
  `em_chuc_vu_cong_doan` int(10) unsigned NOT NULL DEFAULT '0',
  `em_quan_ly_nha_nuoc` int(10) unsigned DEFAULT NULL,
  `em_ly_luan_chinh_tri` int(10) unsigned DEFAULT NULL,
  `em_than_nhan_nuoc_ngoai` text,
  `em_tham_gia_to_chuc` text,
  `em_bi_bat` text,
  `em_qua_trinh_luong` text,
  `em_gia_dinh_vo` text,
  `em_gia_dinh_ban_than` text,
  `em_qua_trinh_cong_tac` text,
  `em_lich_su_dao_tao` text,
  `em_gia_dinh_chinh_sach` varchar(255) DEFAULT NULL,
  `em_thuong_binh` varchar(45) DEFAULT NULL,
  `em_nhom_mau` varchar(45) DEFAULT NULL,
  `em_can_nang` varchar(45) DEFAULT NULL,
  `em_chieu_cao` varchar(255) DEFAULT NULL,
  `em_tinh_trang_suc_khoe` varchar(255) DEFAULT NULL,
  `em_so_bhxh` varchar(255) DEFAULT NULL,
  `em_danh_hieu` varchar(255) DEFAULT NULL,
  `em_quan_ham` varchar(255) DEFAULT NULL,
  `em_ngay_xuat_ngu` datetime DEFAULT NULL,
  `em_ngay_nhap_ngu` datetime DEFAULT NULL,
  `em_ky_luat` varchar(255) DEFAULT NULL,
  `em_khen_thuong` varchar(255) DEFAULT NULL,
  `em_cong_viec_khi_tuyen_dung` varchar(255) DEFAULT NULL,
  `em_co_quan_tuyen_dung` varchar(255) DEFAULT NULL,
  `em_ton_giao` varchar(255) DEFAULT NULL,
  `em_van_hoa_pt` varchar(100) DEFAULT NULL,
  `em_hoc_ham` int(10) unsigned NOT NULL DEFAULT '0',
  `em_bang_cap` int(10) unsigned NOT NULL DEFAULT '0',
  `em_ngoai_ngu` int(10) unsigned NOT NULL DEFAULT '0',
  `em_tin_hoc` int(10) unsigned NOT NULL DEFAULT '0',
  `em_chung_chi_khac` int(10) unsigned NOT NULL DEFAULT '0',
  `em_anh_bang_cap` text,
  `em_status` int(10) unsigned NOT NULL DEFAULT '0',
  `em_delete` int(10) unsigned NOT NULL DEFAULT '0',
  `em_date_added` datetime DEFAULT NULL,
  `em_date_modified` datetime DEFAULT NULL,
  `em_cmt_ngay_cap` datetime DEFAULT NULL,
  `em_han_luan_chuyen` datetime DEFAULT NULL,
  `em_nghi_huu` int(10) unsigned NOT NULL DEFAULT '0',
  `em_ngay_nghi_huu` datetime DEFAULT NULL,
  PRIMARY KEY (`em_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`em_id`,`em_ten`,`em_ten_dem`,`em_ho`,`em_ngay_sinh`,`em_so_chung_minh_thu`,`em_ten_khac`,`em_anh_the`,`em_gioi_tinh`,`em_home_phone`,`em_phone`,`em_noi_sinh`,`em_noi_sinh_tinh`,`em_noi_sinh_huyen`,`em_que_quan`,`em_noi_o`,`em_noi_o_tinh`,`em_noi_o_huyen`,`em_que_quan_tinh`,`em_que_quan_huyen`,`em_dia_chi`,`em_dia_chi_tinh`,`em_dia_chi_huyen`,`em_dan_toc`,`em_so_cong_chuc`,`em_chuc_vu`,`em_phong_ban`,`em_ngay_tuyen_dung`,`em_ngach_cong_chuc`,`em_cong_viec`,`em_chuyen_mon`,`em_chuc_vu_dang`,`em_ngay_vao_dang`,`em_chuc_vu_doan`,`em_ngay_vao_doan`,`em_chuc_vu_cong_doan`,`em_quan_ly_nha_nuoc`,`em_ly_luan_chinh_tri`,`em_than_nhan_nuoc_ngoai`,`em_tham_gia_to_chuc`,`em_bi_bat`,`em_qua_trinh_luong`,`em_gia_dinh_vo`,`em_gia_dinh_ban_than`,`em_qua_trinh_cong_tac`,`em_lich_su_dao_tao`,`em_gia_dinh_chinh_sach`,`em_thuong_binh`,`em_nhom_mau`,`em_can_nang`,`em_chieu_cao`,`em_tinh_trang_suc_khoe`,`em_so_bhxh`,`em_danh_hieu`,`em_quan_ham`,`em_ngay_xuat_ngu`,`em_ngay_nhap_ngu`,`em_ky_luat`,`em_khen_thuong`,`em_cong_viec_khi_tuyen_dung`,`em_co_quan_tuyen_dung`,`em_ton_giao`,`em_van_hoa_pt`,`em_hoc_ham`,`em_bang_cap`,`em_ngoai_ngu`,`em_tin_hoc`,`em_chung_chi_khac`,`em_anh_bang_cap`,`em_status`,`em_delete`,`em_date_added`,`em_date_modified`,`em_cmt_ngay_cap`,`em_han_luan_chuyen`,`em_nghi_huu`,`em_ngay_nghi_huu`) VALUES 
 (1,'HÃ¹ng','Máº¡nh','Nguyá»…n','1970-01-07 00:00:00','131398081','Nobita','',1,'','0985679742','Äoan HÃ¹ng','','','VÄ©nh PhÃº','','2','16','','','ThÃ´n 12 -VÃ¢n Du',1,2,2,'HAV102',6,11,'1970-01-01 00:00:00',4,'Ha ah ha','he he he',9,'1970-01-01 00:00:00',12,'1970-01-01 00:00:00',14,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','1970-01-01 00:00:00','1970-01-01 00:00:00','','','','','','12/12',3,8,1,2,3,'N;',1,0,'2013-12-02 16:54:16','2014-05-13 11:58:43','1970-01-01 00:00:00','2037-02-01 00:00:07',0,'2014-04-09 12:35:51'),
 (2,'BÃ­ch','Ngá»c','Ã‚u','1970-01-07 00:00:00','13133123434','BÃ­ch','1385911581.png',0,'','09886838560','Báº£o Tháº¯ng',NULL,NULL,'HoÃ ng LiÃªn SÆ¡n',NULL,NULL,NULL,NULL,NULL,'XÃ³m 11',4,1,2,'HAV1023',6,11,'1981-06-16 00:00:07',5,'Káº¿ ToÃ¡n','Káº¿ toÃ¡n mÃ¡y',2,'2012-07-15 00:00:07',4,'2011-05-18 00:00:07',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/12',3,8,1,2,3,'a:3:{i:0;s:28:\"1620194362_OneTV  - Logo.png\";i:1;s:17:\"987576096_top.png\";i:2;s:24:\"681729117_Untitled-1.jpg\";}',1,0,'2013-12-01 22:26:21','2013-12-01 22:26:21',NULL,NULL,0,NULL),
 (13,'Äá»“ng','NghÄ©a','ÄÃ o','1970-01-07 00:00:00','3454543534543','Äá»“ng',NULL,1,'5345345','534534534','5345345',NULL,NULL,'534534',NULL,NULL,NULL,NULL,NULL,'5345345',5,2,2,'34534534',4,9,'2013-12-01 17:37:07',5,'5345345','5345345',2,'2013-12-31 17:37:07',2,'2013-12-28 17:37:07',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5443',3,8,1,2,3,'a:3:{i:0;s:22:\"1242417760_anh_the.jpg\";i:1;s:37:\"947727117_game garena on facebook.png\";i:2;s:24:\"34040717_legend team.jpg\";}',1,0,'2013-12-24 17:36:41','2014-04-06 23:08:50',NULL,'2000-01-01 00:00:07',0,NULL),
 (22,'HÃ¹ng',NULL,'Nguyá»…n Máº¡nh','0000-00-00 00:00:00','1313983434','Nobita',NULL,1,'11111','0985679742','Van Du','Phu Tho','Doan Hung','Van Du','1806 - Licogi 13','1','1','Phu Tho','Doan Hung','ThÃ´n 12 -VÃ¢n Du',22,129,3,'HAV102',4,9,'2014-04-01 00:00:00',4,'Lap Trinh','Lap Trinh',9,'0000-00-00 00:00:00',12,'0000-00-00 00:00:00',14,2,2,'<p>Ko co ai o nuoc ngoai</p>','<p>Ko tham giao to chu nao</p>','<p>Chua bi bat bao gio</p>','a:2:{i:1069303768;a:3:{s:10:\"ngay_thang\";s:6:\"2/2012\";s:8:\"ma_ngach\";s:6:\"NCNC/1\";s:5:\"he_so\";s:1:\"1\";}i:402963903;a:3:{s:10:\"ngay_thang\";s:6:\"2/2014\";s:8:\"ma_ngach\";s:5:\"JHK/2\";s:5:\"he_so\";s:3:\"1.2\";}}','a:1:{i:1461677398;a:4:{s:11:\"moi_quan_he\";s:2:\"Bo\";s:6:\"ho_ten\";s:4:\"Long\";s:8:\"nam_sinh\";s:4:\"1950\";s:8:\"chi_tiet\";s:0:\"\";}}','a:2:{i:155129744;a:4:{s:11:\"moi_quan_he\";s:2:\"Vo\";s:6:\"ho_ten\";s:4:\"Bich\";s:8:\"nam_sinh\";s:4:\"1986\";s:8:\"chi_tiet\";s:10:\"da ket hon\";}i:1624146099;a:4:{s:11:\"moi_quan_he\";s:2:\"Bo\";s:6:\"ho_ten\";s:5:\"Thinh\";s:8:\"nam_sinh\";s:4:\"1963\";s:8:\"chi_tiet\";s:0:\"\";}}','a:2:{i:395953171;a:2:{s:10:\"ngay_thang\";s:9:\"2008-2010\";s:8:\"chi_tiet\";s:6:\"iwicom\";}i:1914032958;a:2:{s:10:\"ngay_thang\";s:9:\"2010-2014\";s:8:\"chi_tiet\";s:3:\"cya\";}}','a:2:{i:366989537;a:5:{s:10:\"ten_truong\";s:9:\"Bach Khoa\";s:13:\"chuyen_nghanh\";s:4:\"CNTT\";s:10:\"ngay_thang\";s:9:\"2004-2008\";s:9:\"hinh_thuc\";s:9:\"Chinh quy\";s:8:\"van_bang\";s:8:\"Cao Dang\";}i:2118376300;a:5:{s:10:\"ten_truong\";s:4:\"Ptit\";s:13:\"chuyen_nghanh\";s:4:\"CNTT\";s:10:\"ngay_thang\";s:9:\"2010-2012\";s:9:\"hinh_thuc\";s:9:\"Chinh Quy\";s:8:\"van_bang\";s:7:\"Dai Hoc\";}}','Con thuong binh','1/4','A','60','170','Tot','1212','Anh Hung','Dai tuong','0000-00-00 00:00:00','0000-00-00 00:00:00','Che nay','Khen nay','Lap Trinh','CYA','Ko','12/12',3,8,1,2,3,'a:2:{i:1405174576;a:2:{s:4:\"name\";s:7:\"Ha ha 1\";s:3:\"anh\";s:45:\"577924554_vlcsnap-2013-09-16-18h05m22s194.png\";}i:1986697365;a:2:{s:4:\"name\";s:7:\"O kia 1\";s:3:\"anh\";s:45:\"764999684_vlcsnap-2013-09-16-13h52m39s159.png\";}}',1,0,'2014-03-28 14:32:39','2014-05-13 12:03:44','0000-00-00 00:00:00','2000-01-01 00:00:07',0,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


--
-- Definition of table `employees_edit`
--

DROP TABLE IF EXISTS `employees_edit`;
CREATE TABLE `employees_edit` (
  `eme_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `em_id` int(10) unsigned NOT NULL,
  `eme_ten` varchar(45) NOT NULL,
  `eme_ten_dem` varchar(45) DEFAULT NULL,
  `eme_ho` varchar(45) NOT NULL,
  `eme_ngay_sinh` datetime DEFAULT NULL,
  `eme_so_chung_minh_thu` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `eme_ten_khac` varchar(100) DEFAULT NULL,
  `eme_anh_the` varchar(255) DEFAULT NULL,
  `eme_gioi_tinh` int(10) unsigned NOT NULL DEFAULT '1',
  `eme_home_phone` varchar(45) DEFAULT NULL,
  `eme_phone` varchar(45) DEFAULT NULL,
  `eme_noi_sinh` varchar(255) DEFAULT NULL,
  `eme_que_quan` varchar(255) DEFAULT NULL,
  `eme_dia_chi` varchar(255) DEFAULT NULL,
  `eme_dia_chi_tinh` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_dia_chi_huyen` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_dan_toc` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_chuc_vu_dang` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_ngay_vao_dang` datetime DEFAULT NULL,
  `eme_chuc_vu_doan` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_ngay_vao_doan` datetime DEFAULT NULL,
  `eme_chuc_vu_cong_doan` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_van_hoa_pt` varchar(100) DEFAULT NULL,
  `eme_hoc_ham` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_bang_cap` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_ngoai_ngu` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_tin_hoc` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_chung_chi_khac` int(10) unsigned NOT NULL DEFAULT '0',
  `eme_anh_bang_cap` text,
  `eme_quan_ly_nha_nuoc` int(10) unsigned DEFAULT NULL,
  `eme_ly_luan_chinh_tri` int(10) unsigned DEFAULT NULL,
  `eme_than_nhan_nuoc_ngoai` text,
  `eme_tham_gia_to_chuc` text,
  `eme_bi_bat` text,
  `eme_qua_trinh_luong` text,
  `eme_gia_dinh_vo` text,
  `eme_gia_dinh_ban_than` text,
  `eme_qua_trinh_cong_tac` text,
  `eme_lich_su_dao_tao` text,
  `eme_gia_dinh_chinh_sach` varchar(255) DEFAULT NULL,
  `eme_thuong_binh` varchar(45) DEFAULT NULL,
  `eme_nhom_mau` varchar(45) DEFAULT NULL,
  `eme_can_nang` varchar(45) DEFAULT NULL,
  `eme_chieu_cao` varchar(255) DEFAULT NULL,
  `eme_tinh_trang_suc_khoe` varchar(255) DEFAULT NULL,
  `eme_so_bhxh` varchar(255) DEFAULT NULL,
  `eme_danh_hieu` varchar(255) DEFAULT NULL,
  `eme_quan_ham` varchar(255) DEFAULT NULL,
  `eme_ngay_xuat_ngu` datetime DEFAULT NULL,
  `eme_ngay_nhap_ngu` datetime DEFAULT NULL,
  `eme_noi_o_tinh` varchar(255) DEFAULT NULL,
  `eme_noi_o_huyen` varchar(255) DEFAULT NULL,
  `eme_noi_o` varchar(255) DEFAULT NULL,
  `eme_que_quan_tinh` varchar(255) DEFAULT NULL,
  `eme_que_quan_huyen` varchar(255) DEFAULT NULL,
  `eme_noi_sinh_tinh` varchar(255) DEFAULT NULL,
  `eme_noi_sinh_huyen` varchar(255) DEFAULT NULL,
  `eme_ton_giao` varchar(255) DEFAULT NULL,
  `eme_date_added` datetime DEFAULT NULL,
  `eme_date_modified` datetime DEFAULT NULL,
  `eme_cmt_ngay_cap` datetime DEFAULT NULL,
  PRIMARY KEY (`eme_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees_edit`
--

/*!40000 ALTER TABLE `employees_edit` DISABLE KEYS */;
INSERT INTO `employees_edit` (`eme_id`,`em_id`,`eme_ten`,`eme_ten_dem`,`eme_ho`,`eme_ngay_sinh`,`eme_so_chung_minh_thu`,`eme_ten_khac`,`eme_anh_the`,`eme_gioi_tinh`,`eme_home_phone`,`eme_phone`,`eme_noi_sinh`,`eme_que_quan`,`eme_dia_chi`,`eme_dia_chi_tinh`,`eme_dia_chi_huyen`,`eme_dan_toc`,`eme_chuc_vu_dang`,`eme_ngay_vao_dang`,`eme_chuc_vu_doan`,`eme_ngay_vao_doan`,`eme_chuc_vu_cong_doan`,`eme_van_hoa_pt`,`eme_hoc_ham`,`eme_bang_cap`,`eme_ngoai_ngu`,`eme_tin_hoc`,`eme_chung_chi_khac`,`eme_anh_bang_cap`,`eme_quan_ly_nha_nuoc`,`eme_ly_luan_chinh_tri`,`eme_than_nhan_nuoc_ngoai`,`eme_tham_gia_to_chuc`,`eme_bi_bat`,`eme_qua_trinh_luong`,`eme_gia_dinh_vo`,`eme_gia_dinh_ban_than`,`eme_qua_trinh_cong_tac`,`eme_lich_su_dao_tao`,`eme_gia_dinh_chinh_sach`,`eme_thuong_binh`,`eme_nhom_mau`,`eme_can_nang`,`eme_chieu_cao`,`eme_tinh_trang_suc_khoe`,`eme_so_bhxh`,`eme_danh_hieu`,`eme_quan_ham`,`eme_ngay_xuat_ngu`,`eme_ngay_nhap_ngu`,`eme_noi_o_tinh`,`eme_noi_o_huyen`,`eme_noi_o`,`eme_que_quan_tinh`,`eme_que_quan_huyen`,`eme_noi_sinh_tinh`,`eme_noi_sinh_huyen`,`eme_ton_giao`,`eme_date_added`,`eme_date_modified`,`eme_cmt_ngay_cap`) VALUES 
 (2,2,'BÃ­ch',NULL,'Ã‚u','1986-11-02 00:00:00','13133123434','BÃ­ch',NULL,0,'','09886838560','Báº£o Tháº¯ng','HoÃ ng LiÃªn SÆ¡n','XÃ³m 11',4,1,2,0,'2012-07-15 00:00:00',0,'2011-05-18 00:00:00',0,'12/12',3,8,1,2,3,'a:3:{i:959029566;a:2:{s:4:\"name\";s:1:\"1\";s:3:\"anh\";s:1:\"1\";}i:2024213796;a:2:{s:4:\"name\";s:1:\"9\";s:3:\"anh\";s:1:\"9\";}i:941971074;a:2:{s:4:\"name\";s:1:\"6\";s:3:\"anh\";s:1:\"6\";}}',0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','1970-01-01 00:00:00','1970-01-01 00:00:00','0','0','','','','','','','2014-04-06 21:57:12','2014-04-06 21:57:12','1970-01-01 00:00:00');
/*!40000 ALTER TABLE `employees_edit` ENABLE KEYS */;


--
-- Definition of table `employees_heso`
--

DROP TABLE IF EXISTS `employees_heso`;
CREATE TABLE `employees_heso` (
  `eh_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eh_em_id` int(10) unsigned NOT NULL,
  `eh_loai_luong` int(10) unsigned NOT NULL DEFAULT '0',
  `eh_giai_doan` int(10) unsigned NOT NULL DEFAULT '0',
  `eh_he_so` double NOT NULL DEFAULT '0',
  `eh_pc_cong_viec` double NOT NULL DEFAULT '0',
  `eh_pc_trach_nhiem` double NOT NULL DEFAULT '0',
  `eh_pc_tnvk_phan_tram` double NOT NULL DEFAULT '0',
  `eh_tham_niem` datetime NOT NULL,
  `eh_pc_udn_phan_tram` double NOT NULL DEFAULT '0',
  `eh_pc_cong_vu_phan_tram` double NOT NULL DEFAULT '0',
  `eh_pc_kiem_nhiem` double NOT NULL DEFAULT '0',
  `eh_pc_khac` double NOT NULL DEFAULT '0',
  `eh_han_dieu_chinh` datetime DEFAULT NULL,
  `eh_date_added` datetime DEFAULT NULL,
  `eh_date_modified` datetime DEFAULT NULL,
  `eh_pc_kv` double NOT NULL DEFAULT '0',
  `eh_pc_khac_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: he so, 1: %',
  `eh_pc_thu_hut` double NOT NULL DEFAULT '0',
  `eh_bac_luong` int(10) unsigned NOT NULL DEFAULT '0',
  `eh_pc_doc_hai` double NOT NULL DEFAULT '0',
  `eh_pc_doc_hai_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: he so, 1: tien co dinh',
  `eh_han_ap_dung` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`eh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees_heso`
--

/*!40000 ALTER TABLE `employees_heso` DISABLE KEYS */;
INSERT INTO `employees_heso` (`eh_id`,`eh_em_id`,`eh_loai_luong`,`eh_giai_doan`,`eh_he_so`,`eh_pc_cong_viec`,`eh_pc_trach_nhiem`,`eh_pc_tnvk_phan_tram`,`eh_tham_niem`,`eh_pc_udn_phan_tram`,`eh_pc_cong_vu_phan_tram`,`eh_pc_kiem_nhiem`,`eh_pc_khac`,`eh_han_dieu_chinh`,`eh_date_added`,`eh_date_modified`,`eh_pc_kv`,`eh_pc_khac_type`,`eh_pc_thu_hut`,`eh_bac_luong`,`eh_pc_doc_hai`,`eh_pc_doc_hai_type`,`eh_han_ap_dung`) VALUES 
 (1,1,0,0,1,2,4,6,'2000-01-01 00:00:07',7,8,9,10,'2015-01-01 00:00:07','2014-02-22 15:54:27','2014-04-06 22:27:01',0,0,3,4,0,0,'0000-00-00 00:00:00'),
 (2,2,0,0,1,2,4,6,'2000-01-01 00:00:07',7,8,9,10,'2024-01-01 00:00:07','2014-02-22 21:17:29','2014-04-13 10:50:50',0,1,3,4,0,0,'0000-00-00 00:00:00'),
 (3,13,0,0,1,2,4,6,'2001-12-01 00:00:07',7,8,9,10,'2002-12-01 00:00:07','2014-04-01 23:31:42','2014-04-01 23:34:11',0,0,3,4,0,0,'0000-00-00 00:00:00'),
 (4,22,0,0,1,2,4,6,'1970-01-01 00:00:07',7,8,9,10,'2036-01-01 00:00:07','2014-04-09 17:45:21','2014-04-09 17:45:31',0,0,3,4,0,0,'0000-00-00 00:00:00'),
 (5,1,0,0,1,2,4,6,'2000-01-01 00:00:07',7,8,9,10,'2015-01-01 00:00:07','2014-05-13 11:41:25','2014-05-13 11:41:25',0,0,3,5,0,0,'1970-01-01 00:00:07'),
 (6,13,0,0,1,2,4,6,'1999-12-01 00:00:07',7,8,9,10,'2014-04-01 00:00:07','2014-05-13 14:00:55','2014-05-13 14:03:18',0,0,3,4,0,0,'1970-01-01 00:00:07'),
 (7,13,0,0,1,2,4,6,'1998-12-01 00:00:07',7,8,9,10,'2014-04-01 00:00:07','2014-05-13 14:03:35','2014-05-13 14:03:35',0,0,3,4,0,0,'2014-04-01 00:00:07');
/*!40000 ALTER TABLE `employees_heso` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`group_id`,`group_name`,`group_status`,`group_order`,`group_permissions`,`group_date_modified`,`group_date_added`) VALUES 
 (1,'NhÃ³m Admin',1,1,'1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,2001,2002,2003,2004,2005,2006,2007,2008,2009,3001,3002,3003,3004,3005,4001,4002,4003,4004,4005,4006,4007,4008,4009,4010,4011,4012,4013,4014,5001,5002,5003,5004,5005,5006,5007,5008,','2014-05-07 10:08:02',NULL),
 (6,'NhÃ³m nhÃ¢n viÃªn',1,2,'2001,2002,2003,2004,2005,2006,2007,2008,','2014-03-28 16:51:39','2013-11-09 16:41:59');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


--
-- Definition of table `he_so`
--

DROP TABLE IF EXISTS `he_so`;
CREATE TABLE `he_so` (
  `hs_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hs_luong_co_ban` float NOT NULL DEFAULT '0',
  `hs_he_so_luong_thuc_tap` float NOT NULL DEFAULT '0',
  `hs_bhyt` float NOT NULL DEFAULT '0',
  `hs_bhxh` float NOT NULL DEFAULT '0',
  `hs_date_modified` datetime DEFAULT NULL,
  `hs_ngay_bat_dau` datetime NOT NULL,
  PRIMARY KEY (`hs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `he_so`
--

/*!40000 ALTER TABLE `he_so` DISABLE KEYS */;
INSERT INTO `he_so` (`hs_id`,`hs_luong_co_ban`,`hs_he_so_luong_thuc_tap`,`hs_bhyt`,`hs_bhxh`,`hs_date_modified`,`hs_ngay_bat_dau`) VALUES 
 (4,2000000,85,0,0,'2013-12-06 15:56:14','2012-05-01 00:00:00'),
 (5,1050000,85,1.5,7,'2014-04-15 13:04:07','2014-01-01 00:00:00');
/*!40000 ALTER TABLE `he_so` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hoc_ham`
--

/*!40000 ALTER TABLE `hoc_ham` DISABLE KEYS */;
INSERT INTO `hoc_ham` (`hh_id`,`hh_name`,`hh_order`,`hh_status`,`hh_date_added`,`hh_date_modified`) VALUES 
 (3,'Tháº¡c sÄ©',1,1,'2013-11-09 22:15:46','2013-11-09 22:28:15'),
 (4,'Cá»­ nhÃ¢n',2,1,'2014-02-23 16:58:10','2014-02-23 16:58:10');
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
  `hld_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`hld_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holidays`
--

/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` (`hld_id`,`hld_name`,`hld_order`,`hld_status`,`hld_date_added`,`hld_date_modified`,`hld_code`) VALUES 
 (10,'CÃ³ máº·t lÃ m viá»‡c',1,1,'2014-05-13 13:47:53','2014-05-13 13:49:06','x'),
 (11,'Nghá»‰ 1 buá»•i',1,1,'2014-05-13 13:48:13','2014-05-13 13:49:11','-'),
 (12,'Nghá»‰ á»‘m',1,1,'2014-05-13 13:49:25','2014-05-13 13:49:25','á»');
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
) ENGINE=InnoDB AUTO_INCREMENT=698 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `huyen`
--

/*!40000 ALTER TABLE `huyen` DISABLE KEYS */;
INSERT INTO `huyen` (`huyen_id`,`huyen_name`,`huyen_parent`,`huyen_order`,`huyen_status`,`huyen_date_added`,`huyen_date_modified`) VALUES 
 (1,'Ba ÄÃ¬nh',1,0,1,'2014-05-13 11:13:25','2014-05-13 11:13:25'),
 (2,'HoÃ n Kiáº¿m',1,0,1,'2014-05-13 11:13:25','2014-05-13 11:13:25'),
 (3,'TÃ¢y Há»“',1,0,1,'2014-05-13 11:13:25','2014-05-13 11:13:25'),
 (4,'Long BiÃªn',1,0,1,'2014-05-13 11:13:25','2014-05-13 11:13:25'),
 (5,'Cáº§u Giáº¥y',1,0,1,'2014-05-13 11:13:25','2014-05-13 11:13:25'),
 (6,'Äá»‘ng Äa',1,0,1,'2014-05-13 11:13:25','2014-05-13 11:13:25'),
 (7,'Hai BÃ  TrÆ°ng',1,0,1,'2014-05-13 11:13:25','2014-05-13 11:13:25'),
 (8,'HoÃ ng Mai',1,0,1,'2014-05-13 11:13:25','2014-05-13 11:13:25'),
 (9,'Thanh XuÃ¢n',1,0,1,'2014-05-13 11:13:25','2014-05-13 11:13:25'),
 (10,'SÃ³c SÆ¡n',1,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (11,'ÄÃ´ng Anh',1,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (12,'Gia LÃ¢m',1,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (13,'Tá»« LiÃªm',1,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (14,'Thanh TrÃ¬',1,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (15,'HÃ  Giang',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (16,'Äá»“ng VÄƒn',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (17,'MÃ¨o Váº¡c',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (18,'YÃªn Minh',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (19,'Quáº£n Báº¡',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (20,'Vá»‹ XuyÃªn',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (21,'Báº¯c MÃª',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (22,'HoÃ ng Su PhÃ¬',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (23,'XÃ­n Máº§n',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (24,'Báº¯c Quang',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (25,'Quang BÃ¬nh',2,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (26,'Cao Báº±ng',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (27,'Báº£o LÃ¢m',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (28,'Báº£o Láº¡c',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (29,'ThÃ´ng NÃ´ng',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (30,'HÃ  Quáº£ng',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (31,'TrÃ  LÄ©nh',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (32,'TrÃ¹ng KhÃ¡nh',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (33,'Háº¡ Lang',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (34,'Quáº£ng UyÃªn',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (35,'Phá»¥c HoÃ ',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (36,'HoÃ  An',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (37,'NguyÃªn BÃ¬nh',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (38,'Tháº¡ch An',4,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (39,'Báº¯c Káº¡n',6,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (40,'PÃ¡c Náº·m',6,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (41,'Ba Bá»ƒ',6,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (42,'NgÃ¢n SÆ¡n',6,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (43,'Báº¡ch ThÃ´ng',6,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (44,'Chá»£ Äá»“n',6,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (45,'Chá»£ Má»›i',6,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (46,'Na RÃ¬',6,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (47,'TuyÃªn Quang',8,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (48,'NÃ  Hang',8,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (49,'ChiÃªm HÃ³a',8,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (50,'HÃ m YÃªn',8,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (51,'YÃªn SÆ¡n',8,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (52,'SÆ¡n DÆ°Æ¡ng',8,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (53,'LÃ o Cai',10,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (54,'BÃ¡t XÃ¡t',10,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (55,'MÆ°á»ng KhÆ°Æ¡ng',10,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (56,'Si Ma Cai',10,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (57,'Báº¯c HÃ ',10,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (58,'Báº£o Tháº¯ng',10,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (59,'Báº£o YÃªn',10,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (60,'Sa Pa',10,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (61,'VÄƒn BÃ n',10,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (62,'Äiá»‡n BiÃªn Phá»§',11,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (63,'MÆ°á»ng Lay',11,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (64,'MÆ°á»ng NhÃ©',11,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (65,'MÆ°á»ng ChÃ ',11,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (66,'Tá»§a ChÃ¹a',11,0,1,'2014-05-13 11:13:26','2014-05-13 11:13:26'),
 (67,'Tuáº§n GiÃ¡o',11,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (68,'Äiá»‡n BiÃªn',11,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (69,'Äiá»‡n BiÃªn ÄÃ´ng',11,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (70,'MÆ°á»ng áº¢ng',11,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (71,'Lai ChÃ¢u',12,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (72,'Tam ÄÆ°á»ng',12,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (73,'MÆ°á»ng TÃ¨',12,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (74,'SÃ¬n Há»“',12,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (75,'Phong Thá»•',12,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (76,'Than UyÃªn',12,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (77,'TÃ¢n UyÃªn',12,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (78,'SÆ¡n La',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (79,'Quá»³nh Nhai',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (80,'Thuáº­n ChÃ¢u',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (81,'MÆ°á»ng La',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (82,'Báº¯c YÃªn',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (83,'PhÃ¹ YÃªn',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (84,'Má»™c ChÃ¢u',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (85,'YÃªn ChÃ¢u',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (86,'Mai SÆ¡n',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (87,'SÃ´ng MÃ£',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (88,'Sá»‘p Cá»™p',14,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (89,'YÃªn BÃ¡i',15,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (90,'NghÄ©a Lá»™',15,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (91,'Lá»¥c YÃªn',15,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (92,'VÄƒn YÃªn',15,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (93,'MÃ¹ Cang Cháº£i',15,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (94,'Tráº¥n YÃªn',15,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (95,'Tráº¡m Táº¥u',15,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (96,'VÄƒn Cháº¥n',15,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (97,'YÃªn BÃ¬nh',15,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (98,'HÃ²a BÃ¬nh',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (99,'ÄÃ  Báº¯c',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (100,'Ká»³ SÆ¡n',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (101,'LÆ°Æ¡ng SÆ¡n',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (102,'Kim BÃ´i',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (103,'Cao Phong',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (104,'TÃ¢n Láº¡c',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (105,'Mai ChÃ¢u',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (106,'Láº¡c SÆ¡n',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (107,'YÃªn Thá»§y',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (108,'Láº¡c Thá»§y',17,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (109,'ThÃ¡i NguyÃªn',19,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (110,'SÃ´ng CÃ´ng',19,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (111,'Äá»‹nh HÃ³a',19,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (112,'PhÃº LÆ°Æ¡ng',19,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (113,'Äá»“ng Há»·',19,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (114,'VÃµ Nhai',19,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (115,'Äáº¡i Tá»«',19,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (116,'Phá»• YÃªn',19,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (117,'PhÃº BÃ¬nh',19,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (118,'Láº¡ng SÆ¡n',20,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (119,'TrÃ ng Äá»‹nh',20,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (120,'BÃ¬nh Gia',20,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (121,'VÄƒn LÃ£ng',20,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (122,'Cao Lá»™c',20,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (123,'VÄƒn Quan',20,0,1,'2014-05-13 11:13:27','2014-05-13 11:13:27'),
 (124,'Báº¯c SÆ¡n',20,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (125,'Há»¯u LÅ©ng',20,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (126,'Chi LÄƒng',20,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (127,'Lá»™c BÃ¬nh',20,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (128,'ÄÃ¬nh Láº­p',20,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (129,'Háº¡ Long',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (130,'MÃ³ng CÃ¡i',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (131,'Cáº©m Pháº£',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (132,'UÃ´ng BÃ­',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (133,'BÃ¬nh LiÃªu',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (134,'TiÃªn YÃªn',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (135,'Äáº§m HÃ ',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (136,'Háº£i HÃ ',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (137,'Ba Cháº½',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (138,'VÃ¢n Äá»“n',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (139,'HoÃ nh Bá»“',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (140,'ÄÃ´ng Triá»u',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (141,'YÃªn HÆ°ng',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (142,'CÃ´ TÃ´',22,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (143,'Báº¯c Giang',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (144,'YÃªn Tháº¿',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (145,'TÃ¢n YÃªn',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (146,'Láº¡ng Giang',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (147,'Lá»¥c Nam',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (148,'Lá»¥c Ngáº¡n',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (149,'SÆ¡n Äá»™ng',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (150,'YÃªn DÅ©ng',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (151,'Viá»‡t YÃªn',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (152,'Hiá»‡p HÃ²a',24,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (153,'Viá»‡t TrÃ¬',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (154,'PhÃº Thá»',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (155,'Äoan HÃ¹ng',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (156,'Háº¡ HoÃ ',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (157,'Thanh Ba',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (158,'PhÃ¹ Ninh',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (159,'YÃªn Láº­p',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (160,'Cáº©m KhÃª',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (161,'Tam NÃ´ng',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (162,'LÃ¢m Thao',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (163,'Thanh SÆ¡n',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (164,'Thanh Thuá»·',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (165,'TÃ¢n SÆ¡n',25,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (166,'VÄ©nh YÃªn',26,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (167,'PhÃºc YÃªn',26,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (168,'Láº­p Tháº¡ch',26,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (169,'Tam DÆ°Æ¡ng',26,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (170,'Tam Äáº£o',26,0,1,'2014-05-13 11:13:28','2014-05-13 11:13:28'),
 (171,'BÃ¬nh XuyÃªn',26,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (172,'MÃª Linh',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (173,'YÃªn Láº¡c',26,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (174,'VÄ©nh TÆ°á»ng',26,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (175,'SÃ´ng LÃ´',26,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (176,'Báº¯c Ninh',27,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (177,'YÃªn Phong',27,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (178,'Quáº¿ VÃµ',27,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (179,'TiÃªn Du',27,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (180,'Tá»« SÆ¡n',27,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (181,'Thuáº­n ThÃ nh',27,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (182,'Gia BÃ¬nh',27,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (183,'LÆ°Æ¡ng TÃ i',27,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (184,'HÃ  ÄÃ´ng',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (185,'SÆ¡n TÃ¢y',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (186,'Ba VÃ¬',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (187,'PhÃºc Thá»',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (188,'Äan PhÆ°á»£ng',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (189,'HoÃ i Äá»©c',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (190,'Quá»‘c Oai',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (191,'Tháº¡ch Tháº¥t',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (192,'ChÆ°Æ¡ng Má»¹',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (193,'Thanh Oai',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (194,'ThÆ°á»ng TÃ­n',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (195,'PhÃº XuyÃªn',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (196,'á»¨ng HÃ²a',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (197,'Má»¹ Äá»©c',1,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (198,'Háº£i DÆ°Æ¡ng',30,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (199,'ChÃ­ Linh',30,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (200,'Nam SÃ¡ch',30,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (201,'Kinh MÃ´n',30,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (202,'Kim ThÃ nh',30,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (203,'Thanh HÃ ',30,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (204,'Cáº©m GiÃ ng',30,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (205,'BÃ¬nh Giang',30,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (206,'Gia Lá»™c',30,0,1,'2014-05-13 11:13:29','2014-05-13 11:13:29'),
 (207,'Tá»© Ká»³',30,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (208,'Ninh Giang',30,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (209,'Thanh Miá»‡n',30,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (210,'Há»“ng BÃ ng',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (211,'NgÃ´ Quyá»n',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (212,'LÃª ChÃ¢n',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (213,'Háº£i An',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (214,'Kiáº¿n An',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (215,'Äá»“ SÆ¡n',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (216,'Kinh DÆ°Æ¡ng',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (217,'Thuá»· NguyÃªn',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (218,'An DÆ°Æ¡ng',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (219,'An LÃ£o',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (220,'Kiáº¿n Thá»¥y',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (221,'TiÃªn LÃ£ng',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (222,'VÄ©nh Báº£o',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (223,'CÃ¡t Háº£i',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (224,'Báº¡ch Long VÄ©',31,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (225,'HÆ°ng YÃªn',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (226,'VÄƒn LÃ¢m',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (227,'VÄƒn Giang',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (228,'YÃªn Má»¹',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (229,'Má»¹ HÃ o',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (230,'Ã‚n Thi',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (231,'KhoÃ¡i ChÃ¢u',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (232,'Kim Äá»™ng',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (233,'TiÃªn Lá»¯',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (234,'PhÃ¹ Cá»«',33,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (235,'ThÃ¡i BÃ¬nh',34,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (236,'Quá»³nh Phá»¥',34,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (237,'HÆ°ng HÃ ',34,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (238,'ÄÃ´ng HÆ°ng',34,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (239,'ThÃ¡i Thá»¥y',34,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (240,'Tiá»n Háº£i',34,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (241,'Kiáº¿n XÆ°Æ¡ng',34,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (242,'VÅ© ThÆ°',34,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (243,'Phá»§ LÃ½',35,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (244,'Duy TiÃªn',35,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (245,'Kim Báº£ng',35,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (246,'Thanh LiÃªm',35,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (247,'BÃ¬nh Lá»¥c',35,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (248,'LÃ½ NhÃ¢n',35,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (249,'Nam Äá»‹nh',36,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (250,'Má»¹ Lá»™c',36,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (251,'Vá»¥ Báº£n',36,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (252,'Ã YÃªn',36,0,1,'2014-05-13 11:13:30','2014-05-13 11:13:30'),
 (253,'NghÄ©a HÆ°ng',36,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (254,'Nam Trá»±c',36,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (255,'Trá»±c Ninh',36,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (256,'XuÃ¢n TrÆ°á»ng',36,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (257,'Giao Thá»§y',36,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (258,'Háº£i Háº­u',36,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (259,'Ninh BÃ¬nh',37,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (260,'Tam Äiá»‡p',37,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (261,'Nho Quan',37,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (262,'Gia Viá»…n',37,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (263,'Hoa LÆ°',37,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (264,'YÃªn KhÃ¡nh',37,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (265,'Kim SÆ¡n',37,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (266,'YÃªn MÃ´',37,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (267,'Thanh HÃ³a',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (268,'Bá»‰m SÆ¡n',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (269,'Sáº§m SÆ¡n',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (270,'MÆ°á»ng LÃ¡t',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (271,'Quan HÃ³a',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (272,'BÃ¡ ThÆ°á»›c',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (273,'Quan SÆ¡n',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (274,'Lang ChÃ¡nh',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (275,'Ngá»c Láº·c',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (276,'Cáº©m Thá»§y',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (277,'Tháº¡ch ThÃ nh',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (278,'HÃ  Trung',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (279,'VÄ©nh Lá»™c',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (280,'YÃªn Äá»‹nh',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (281,'Thá» XuÃ¢n',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (282,'ThÆ°á»ng XuÃ¢n',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (283,'Triá»‡u SÆ¡n',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (284,'Thiá»‡u HoÃ¡',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (285,'Hoáº±ng HÃ³a',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (286,'Háº­u Lá»™c',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (287,'Nga SÆ¡n',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (288,'NhÆ° XuÃ¢n',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (289,'NhÆ° Thanh',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (290,'NÃ´ng Cá»‘ng',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (291,'ÄÃ´ng SÆ¡n',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (292,'Quáº£ng XÆ°Æ¡ng',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (293,'TÄ©nh Gia',38,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (294,'Vinh',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (295,'Cá»­a LÃ²',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (296,'ThÃ¡i HoÃ ',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (297,'Quáº¿ Phong',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (298,'Quá»³ ChÃ¢u',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (299,'Ká»³ SÆ¡n',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (300,'TÆ°Æ¡ng DÆ°Æ¡ng',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (301,'NghÄ©a ÄÃ n',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (302,'Quá»³ Há»£p',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (303,'Quá»³nh LÆ°u',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (304,'Con CuÃ´ng',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (305,'TÃ¢n Ká»³',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (306,'Anh SÆ¡n',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (307,'Diá»…n ChÃ¢u',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (308,'YÃªn ThÃ nh',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (309,'ÄÃ´ LÆ°Æ¡ng',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (310,'Thanh ChÆ°Æ¡ng',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (311,'Nghi Lá»™c',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (312,'Nam ÄÃ n',40,0,1,'2014-05-13 11:13:31','2014-05-13 11:13:31'),
 (313,'HÆ°ng NguyÃªn',40,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (314,'HÃ  TÄ©nh',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (315,'Há»“ng LÄ©nh',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (316,'HÆ°Æ¡ng SÆ¡n',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (317,'Äá»©c Thá»',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (318,'VÅ© Quang',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (319,'Nghi XuÃ¢n',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (320,'Can Lá»™c',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (321,'HÆ°Æ¡ng KhÃª',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (322,'Tháº¡ch HÃ ',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (323,'Cáº©m XuyÃªn',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (324,'Ká»³ Anh',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (325,'Lá»™c HÃ ',42,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (326,'Äá»“ng Há»›i',44,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (327,'Minh HÃ³a',44,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (328,'TuyÃªn HÃ³a',44,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (329,'Quáº£ng Tráº¡ch',44,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (330,'Bá»‘ Tráº¡ch',44,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (331,'Quáº£ng Ninh',44,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (332,'Lá»‡ Thá»§y',44,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (333,'ÄÃ´ng HÃ ',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (334,'Quáº£ng Trá»‹',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (335,'VÄ©nh Linh',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (336,'HÆ°á»›ng HÃ³a',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (337,'Gio Linh',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (338,'Äa KrÃ´ng',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (339,'Cam Lá»™',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (340,'Triá»‡u Phong',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (341,'Háº£i LÄƒng',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (342,'Cá»“n Cá»',45,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (343,'Huáº¿',46,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (344,'Phong Äiá»n',46,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (345,'Quáº£ng Äiá»n',46,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (346,'PhÃº Vang',46,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (347,'HÆ°Æ¡ng Thá»§y',46,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (348,'HÆ°Æ¡ng TrÃ ',46,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (349,'A LÆ°á»›i',46,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (350,'PhÃº Lá»™c',46,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (351,'Nam ÄÃ´ng',46,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (352,'LiÃªn Chiá»ƒu',48,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (353,'Thanh KhÃª',48,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (354,'Háº£i ChÃ¢u',48,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (355,'SÆ¡n TrÃ ',48,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (356,'NgÅ© HÃ nh SÆ¡n',48,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (357,'Cáº©m Lá»‡',48,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (358,'HoÃ  Vang',48,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (359,'HoÃ ng Sa',48,0,1,'2014-05-13 11:13:32','2014-05-13 11:13:32'),
 (360,'Tam Ká»³',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (361,'Há»™i An',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (362,'TÃ¢y Giang',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (363,'ÄÃ´ng Giang',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (364,'Äáº¡i Lá»™c',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (365,'Äiá»‡n BÃ n',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (366,'Duy XuyÃªn',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (367,'Quáº¿ SÆ¡n',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (368,'Nam Giang',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (369,'PhÆ°á»›c SÆ¡n',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (370,'Hiá»‡p Äá»©c',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (371,'ThÄƒng BÃ¬nh',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (372,'TiÃªn PhÆ°á»›c',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (373,'Báº¯c TrÃ  My',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (374,'Nam TrÃ  My',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (375,'NÃºi ThÃ nh',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (376,'PhÃº Ninh',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (377,'NÃ´ng SÆ¡n',49,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (378,'Quáº£ng NgÃ£i',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (379,'BÃ¬nh SÆ¡n',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (380,'TrÃ  Bá»“ng',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (381,'TÃ¢y TrÃ ',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (382,'SÆ¡n Tá»‹nh',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (383,'TÆ° NghÄ©a',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (384,'SÆ¡n HÃ ',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (385,'SÆ¡n TÃ¢y',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (386,'Minh Long',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (387,'NghÄ©a HÃ nh',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (388,'Má»™ Äá»©c',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (389,'Äá»©c Phá»•',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (390,'Ba TÆ¡',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (391,'LÃ½ SÆ¡n',51,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (392,'Qui NhÆ¡n',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (393,'An LÃ£o',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (394,'HoÃ i NhÆ¡n',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (395,'HoÃ i Ã‚n',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (396,'PhÃ¹ Má»¹',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (397,'VÄ©nh Tháº¡nh',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (398,'TÃ¢y SÆ¡n',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (399,'PhÃ¹ CÃ¡t',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (400,'An NhÆ¡n',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (401,'Tuy PhÆ°á»›c',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (402,'VÃ¢n Canh',52,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (403,'Tuy HÃ²a',54,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (404,'SÃ´ng Cáº§u',54,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (405,'Äá»“ng XuÃ¢n',54,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (406,'Tuy An',54,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (407,'SÆ¡n HÃ²a',54,0,1,'2014-05-13 11:13:33','2014-05-13 11:13:33'),
 (408,'SÃ´ng Hinh',54,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (409,'TÃ¢y HoÃ ',54,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (410,'PhÃº HoÃ ',54,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (411,'ÄÃ´ng HoÃ ',54,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (412,'Nha Trang',56,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (413,'Cam Ranh',56,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (414,'Cam LÃ¢m',56,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (415,'Váº¡n Ninh',56,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (416,'Ninh HÃ²a',56,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (417,'KhÃ¡nh VÄ©nh',56,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (418,'DiÃªn KhÃ¡nh',56,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (419,'KhÃ¡nh SÆ¡n',56,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (420,'TrÆ°á»ng Sa',56,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (421,'Phan Rang-ThÃ¡p ChÃ m',58,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (422,'BÃ¡c Ãi',58,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (423,'Ninh SÆ¡n',58,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (424,'Ninh Háº£i',58,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (425,'Ninh PhÆ°á»›c',58,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (426,'Thuáº­n Báº¯c',58,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (427,'Thuáº­n Nam',58,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (428,'Phan Thiáº¿t',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (429,'La Gi',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (430,'Tuy Phong',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (431,'Báº¯c BÃ¬nh',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (432,'HÃ m Thuáº­n Báº¯c',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (433,'HÃ m Thuáº­n Nam',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (434,'TÃ¡nh Linh',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (435,'Äá»©c Linh',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (436,'HÃ m TÃ¢n',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (437,'PhÃº QuÃ­',60,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (438,'Kon Tum',62,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (439,'Äáº¯k Glei',62,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (440,'Ngá»c Há»“i',62,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (441,'Äáº¯k TÃ´',62,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (442,'Kon PlÃ´ng',62,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (443,'Kon Ráº«y',62,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (444,'Äáº¯k HÃ ',62,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (445,'Sa Tháº§y',62,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (446,'Tu MÆ¡ RÃ´ng',62,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (447,'Pleiku',64,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (448,'An KhÃª',64,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (449,'Ayun Pa',64,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (450,'Kbang',64,0,1,'2014-05-13 11:13:34','2014-05-13 11:13:34'),
 (451,'ÄÄƒk Äoa',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (452,'ChÆ° PÄƒh',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (453,'Ia Grai',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (454,'Mang Yang',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (455,'KÃ´ng Chro',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (456,'Äá»©c CÆ¡',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (457,'ChÆ° PrÃ´ng',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (458,'ChÆ° SÃª',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (459,'ÄÄƒk PÆ¡',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (460,'Ia Pa',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (461,'KrÃ´ng Pa',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (462,'PhÃº Thiá»‡n',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (463,'ChÆ° PÆ°h',64,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (464,'BuÃ´n Ma Thuá»™t',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (465,'BuÃ´n Há»“',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (466,'Ea H\'leo',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (467,'Ea SÃºp',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (468,'BuÃ´n ÄÃ´n',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (469,'CÆ° M\'gar',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (470,'KrÃ´ng BÃºk',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (471,'KrÃ´ng NÄƒng',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (472,'Ea Kar',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (473,'M\'Ä‘ráº¯k',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (474,'KrÃ´ng BÃ´ng',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (475,'KrÃ´ng Páº¯c',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (476,'KrÃ´ng A Na',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (477,'Láº¯k',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (478,'CÆ° Kuin',66,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (479,'Gia NghÄ©a',67,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (480,'Äáº¯k Glong',67,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (481,'CÆ° JÃºt',67,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (482,'Äáº¯k Mil',67,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (483,'KrÃ´ng NÃ´',67,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (484,'Äáº¯k Song',67,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (485,'Äáº¯k R\'láº¥p',67,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (486,'Tuy Äá»©c',67,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (487,'ÄÃ  Láº¡t',68,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (488,'Báº£o Lá»™c',68,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (489,'Äam RÃ´ng',68,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (490,'Láº¡c DÆ°Æ¡ng',68,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (491,'LÃ¢m HÃ ',68,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (492,'ÄÆ¡n DÆ°Æ¡ng',68,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (493,'Äá»©c Trá»ng',68,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (494,'Di Linh',68,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (495,'Báº£o LÃ¢m',68,0,1,'2014-05-13 11:13:35','2014-05-13 11:13:35'),
 (496,'Äáº¡ Huoai',68,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (497,'Äáº¡ Táº»h',68,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (498,'CÃ¡t TiÃªn',68,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (499,'PhÆ°á»›c Long',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (500,'Äá»“ng XoÃ i',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (501,'BÃ¬nh Long',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (502,'BÃ¹ Gia Máº­p',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (503,'Lá»™c Ninh',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (504,'BÃ¹ Äá»‘p',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (505,'Há»›n Quáº£n',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (506,'Äá»“ng PhÃ¹',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (507,'BÃ¹ ÄÄƒng',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (508,'ChÆ¡n ThÃ nh',70,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (509,'TÃ¢y Ninh',72,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (510,'TÃ¢n BiÃªn',72,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (511,'TÃ¢n ChÃ¢u',72,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (512,'DÆ°Æ¡ng Minh ChÃ¢u',72,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (513,'ChÃ¢u ThÃ nh',72,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (514,'HÃ²a ThÃ nh',72,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (515,'GÃ² Dáº§u',72,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (516,'Báº¿n Cáº§u',72,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (517,'Tráº£ng BÃ ng',72,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (518,'Thá»§ Dáº§u Má»™t',74,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (519,'Dáº§u Tiáº¿ng',74,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (520,'Báº¿n CÃ¡t',74,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (521,'PhÃº GiÃ¡o',74,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (522,'TÃ¢n UyÃªn',74,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (523,'DÄ© An',74,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (524,'Thuáº­n An',74,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (525,'BiÃªn HÃ²a',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (526,'Long KhÃ¡nh',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (527,'TÃ¢n PhÃº',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (528,'VÄ©nh Cá»­u',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (529,'Äá»‹nh QuÃ¡n',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (530,'Tráº£ng Bom',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (531,'Thá»‘ng Nháº¥t',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (532,'Cáº©m Má»¹',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (533,'Long ThÃ nh',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (534,'XuÃ¢n Lá»™c',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (535,'NhÆ¡n Tráº¡ch',75,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (536,'VÅ©ng Táº§u',77,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (537,'BÃ  Rá»‹a',77,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (538,'ChÃ¢u Äá»©c',77,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (539,'XuyÃªn Má»™c',77,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (540,'Long Äiá»n',77,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (541,'Äáº¥t Äá»',77,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (542,'TÃ¢n ThÃ nh',77,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (543,'CÃ´n Äáº£o',77,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (544,'1',79,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (545,'12',79,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (546,'Thá»§ Äá»©c',79,0,1,'2014-05-13 11:13:36','2014-05-13 11:13:36'),
 (547,'9',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (548,'GÃ² Váº¥p',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (549,'BÃ¬nh Tháº¡nh',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (550,'TÃ¢n BÃ¬nh',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (551,'TÃ¢n PhÃº',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (552,'PhÃº Nhuáº­n',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (553,'2',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (554,'3',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (555,'10',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (556,'11',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (557,'4',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (558,'5',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (559,'6',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (560,'8',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (561,'BÃ¬nh TÃ¢n',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (562,'7',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (563,'Cá»§ Chi',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (564,'HÃ³c MÃ´n',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (565,'BÃ¬nh ChÃ¡nh',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (566,'NhÃ  BÃ¨',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (567,'Cáº§n Giá»',79,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (568,'TÃ¢n An',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (569,'TÃ¢n HÆ°ng',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (570,'VÄ©nh HÆ°ng',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (571,'Má»™c HÃ³a',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (572,'TÃ¢n Tháº¡nh',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (573,'Tháº¡nh HÃ³a',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (574,'Äá»©c Huá»‡',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (575,'Äá»©c HÃ²a',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (576,'Báº¿n Lá»©c',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (577,'Thá»§ Thá»«a',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (578,'TÃ¢n Trá»¥',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (579,'Cáº§n ÄÆ°á»›c',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (580,'Cáº§n Giuá»™c',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (581,'ChÃ¢u ThÃ nh',80,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (582,'Má»¹ Tho',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (583,'GÃ² CÃ´ng',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (584,'TÃ¢n PhÆ°á»›c',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (585,'CÃ¡i BÃ¨',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (586,'Cai Láº­y',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (587,'ChÃ¢u ThÃ nh',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (588,'Chá»£ Gáº¡o',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (589,'GÃ² CÃ´ng TÃ¢y',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (590,'GÃ² CÃ´ng ÄÃ´ng',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (591,'TÃ¢n PhÃº ÄÃ´ng',82,0,1,'2014-05-13 11:13:37','2014-05-13 11:13:37'),
 (592,'Báº¿n Tre',83,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (593,'ChÃ¢u ThÃ nh',83,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (594,'Chá»£ LÃ¡ch',83,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (595,'Má» CÃ y Nam',83,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (596,'Giá»“ng TrÃ´m',83,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (597,'BÃ¬nh Äáº¡i',83,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (598,'Ba Tri',83,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (599,'Tháº¡nh PhÃº',83,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (600,'Má» CÃ y Báº¯c',83,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (601,'TrÃ  Vinh',84,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (602,'CÃ ng Long',84,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (603,'Cáº§u KÃ¨',84,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (604,'Tiá»ƒu Cáº§n',84,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (605,'ChÃ¢u ThÃ nh',84,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (606,'Cáº§u Ngang',84,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (607,'TrÃ  CÃº',84,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (608,'DuyÃªn Háº£i',84,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (609,'VÄ©nh Long',86,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (610,'Long Há»“',86,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (611,'Mang ThÃ­t',86,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (612,'VÅ©ng LiÃªm',86,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (613,'Tam BÃ¬nh',86,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (614,'BÃ¬nh Minh',86,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (615,'TrÃ  Ã”n',86,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (616,'BÃ¬nh TÃ¢n',86,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (617,'Cao LÃ£nh',87,0,1,'2014-05-13 11:13:38','2014-05-13 11:13:38'),
 (618,'Sa ÄÃ©c',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (619,'Há»“ng Ngá»±',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (620,'TÃ¢n Há»“ng',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (621,'Há»“ng Ngá»±',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (622,'Tam NÃ´ng',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (623,'ThÃ¡p MÆ°á»i',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (624,'Cao LÃ£nh',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (625,'Thanh BÃ¬nh',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (626,'Láº¥p VÃ²',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (627,'Lai Vung',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (628,'ChÃ¢u ThÃ nh',87,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (629,'Long XuyÃªn',89,0,1,'2014-05-13 11:13:39','2014-05-13 11:13:39'),
 (630,'ChÃ¢u Äá»‘c',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (631,'An PhÃº',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (632,'TÃ¢n ChÃ¢u',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (633,'PhÃº TÃ¢n',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (634,'ChÃ¢u PhÃº',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (635,'Tá»‹nh BiÃªn',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (636,'Tri TÃ´n',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (637,'ChÃ¢u ThÃ nh',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (638,'Chá»£ Má»›i',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (639,'Thoáº¡i SÆ¡n',89,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (640,'Ráº¡ch GiÃ¡',91,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (641,'HÃ  TiÃªn',91,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (642,'KiÃªn LÆ°Æ¡ng',91,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (643,'HÃ²n Äáº¥t',91,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (644,'TÃ¢n Hiá»‡p',91,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (645,'ChÃ¢u ThÃ nh',91,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (646,'Giá»“ng Giá»ng',91,0,1,'2014-05-13 11:13:40','2014-05-13 11:13:40'),
 (647,'GÃ² Quao',91,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (648,'An BiÃªn',91,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (649,'An Minh',91,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (650,'VÄ©nh Thuáº­n',91,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (651,'PhÃº Quá»‘c',91,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (652,'KiÃªn Háº£i',91,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (653,'U Minh ThÆ°á»£ng',91,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (654,'Giang ThÃ nh',91,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (655,'Ninh Kiá»u',92,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (656,'Ã” MÃ´n',92,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (657,'BÃ¬nh Thuá»·',92,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (658,'CÃ¡i RÄƒng',92,0,1,'2014-05-13 11:13:41','2014-05-13 11:13:41'),
 (659,'Thá»‘t Ná»‘t',92,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (660,'VÄ©nh Tháº¡nh',92,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (661,'Cá» Äá»',92,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (662,'Phong Äiá»n',92,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (663,'Thá»›i Lai',92,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (664,'Vá»‹ Thanh',93,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (665,'NgÃ£ Báº£y',93,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (666,'ChÃ¢u ThÃ nh A',93,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (667,'ChÃ¢u ThÃ nh',93,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (668,'Phá»¥ng Hiá»‡p',93,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (669,'Vá»‹ Thuá»·',93,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (670,'Long Má»¹',93,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (671,'SÃ³c TrÄƒng',94,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (672,'ChÃ¢u ThÃ nh',94,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (673,'Káº¿ SÃ¡ch',94,0,1,'2014-05-13 11:13:42','2014-05-13 11:13:42'),
 (674,'Má»¹ TÃº',94,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (675,'CÃ¹ Lao Dung',94,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (676,'Long PhÃº',94,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (677,'Má»¹ XuyÃªn',94,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (678,'NgÃ£ NÄƒm',94,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (679,'Tháº¡nh Trá»‹',94,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (680,'VÄ©nh ChÃ¢u',94,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (681,'Tráº§n Äá»',94,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (682,'Báº¡c LiÃªu',95,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (683,'Há»“ng DÃ¢n',95,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (684,'PhÆ°á»›c Long',95,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (685,'VÄ©nh Lá»£i',95,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (686,'GiÃ¡ Rai',95,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (687,'ÄÃ´ng Háº£i',95,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (688,'HoÃ  BÃ¬nh',95,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (689,'CÃ  Mau',96,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (690,'U Minh',96,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (691,'Thá»›i BÃ¬nh',96,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (692,'Tráº§n VÄƒn Thá»i',96,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (693,'CÃ¡i NÆ°á»›c',96,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (694,'Äáº§m DÆ¡i',96,0,1,'2014-05-13 11:13:43','2014-05-13 11:13:43'),
 (695,'NÄƒm CÄƒn',96,0,1,'2014-05-13 11:13:44','2014-05-13 11:13:44'),
 (696,'PhÃº TÃ¢n',96,0,1,'2014-05-13 11:13:44','2014-05-13 11:13:44'),
 (697,'Ngá»c Hiá»ƒn',96,0,1,'2014-05-13 11:13:44','2014-05-13 11:13:44');
/*!40000 ALTER TABLE `huyen` ENABLE KEYS */;


--
-- Definition of table `khen_thuong`
--

DROP TABLE IF EXISTS `khen_thuong`;
CREATE TABLE `khen_thuong` (
  `kt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kt_can_bo_to_chuc` int(10) unsigned NOT NULL,
  `kt_em_id` int(10) unsigned NOT NULL,
  `kt_date` datetime NOT NULL,
  `kt_ly_do` text NOT NULL,
  `kt_chi_tiet` text,
  `kt_status` int(10) unsigned NOT NULL DEFAULT '1',
  `kt_date_added` datetime NOT NULL,
  `kt_date_modified` datetime NOT NULL,
  `kt_don_vi` int(10) unsigned NOT NULL DEFAULT '0',
  `kt_ptccb_viewed` int(10) unsigned NOT NULL DEFAULT '0',
  `kt_money` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khen_thuong`
--

/*!40000 ALTER TABLE `khen_thuong` DISABLE KEYS */;
INSERT INTO `khen_thuong` (`kt_id`,`kt_can_bo_to_chuc`,`kt_em_id`,`kt_date`,`kt_ly_do`,`kt_chi_tiet`,`kt_status`,`kt_date_added`,`kt_date_modified`,`kt_don_vi`,`kt_ptccb_viewed`,`kt_money`) VALUES 
 (1,1,1,'2014-02-15 00:00:07','LÃ m tá»‘t cÃ´ng viÃªc','<p>dsfds<strong> dsg</strong></p>\n<p>Goo man<em>fdggfdfdgf</em></p>',1,'2013-12-15 21:49:01','2014-02-24 11:41:32',0,1,0),
 (3,1,1,'2014-02-18 00:00:07','Sao tháº¿ nhi','<p>fsdfsd</p>',1,'2014-02-18 17:17:03','2014-02-24 11:34:59',0,1,0),
 (7,1,1,'2014-02-18 00:00:07','fgdfg','<p>gdfgdf</p>',1,'2014-02-18 17:20:20','2014-02-18 17:20:20',0,0,0),
 (9,1,1,'2014-02-18 00:00:07','Ka ka ka','<p>Anh khen chu nha</p>',1,'2014-02-18 17:22:07','2014-02-18 23:51:36',1,1,5000000),
 (11,1,1,'2014-02-23 00:00:07','hi hi','<p>ha ha</p>',1,'2014-02-23 11:20:25','2014-02-24 11:41:38',1,1,0),
 (12,1,1,'2014-02-24 00:00:07','De xuat jhen thuong','<p>dsfsdfdsf</p>',0,'2014-02-24 11:19:53','2014-02-24 11:44:44',1,0,0),
 (13,0,13,'2014-05-05 00:00:07','1212123123123','<p>3213123</p>',0,'2014-05-05 11:15:18','2014-05-05 11:15:18',22,0,0),
 (14,0,13,'2014-05-05 00:00:07','retretertert','<p>tá»ƒtr</p>',0,'2014-05-05 11:16:15','2014-05-05 11:16:15',22,0,0),
 (15,0,13,'2014-05-05 00:00:07','dfdfdfgdfgdfgfd','<p>qdqwewqe</p>',0,'2014-05-05 11:18:39','2014-05-05 11:18:39',22,0,12232323),
 (16,22,1,'2014-05-05 00:00:07','1131232','<p>312323</p>',1,'2014-05-05 11:26:29','2014-05-05 11:35:33',0,1,1222222);
/*!40000 ALTER TABLE `khen_thuong` ENABLE KEYS */;


--
-- Definition of table `ky_luat`
--

DROP TABLE IF EXISTS `ky_luat`;
CREATE TABLE `ky_luat` (
  `kl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kl_can_bo_to_chuc` int(10) unsigned NOT NULL,
  `kl_em_id` int(10) unsigned NOT NULL,
  `kl_date` datetime NOT NULL,
  `kl_ly_do` text NOT NULL,
  `kl_chi_tiet` text,
  `kl_status` int(10) unsigned NOT NULL DEFAULT '1',
  `kl_date_added` datetime NOT NULL,
  `kl_date_modified` datetime NOT NULL,
  `kl_don_vi` int(10) unsigned NOT NULL DEFAULT '0',
  `kl_ptccb_viewed` int(10) unsigned NOT NULL DEFAULT '0',
  `kl_money` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ky_luat`
--

/*!40000 ALTER TABLE `ky_luat` DISABLE KEYS */;
INSERT INTO `ky_luat` (`kl_id`,`kl_can_bo_to_chuc`,`kl_em_id`,`kl_date`,`kl_ly_do`,`kl_chi_tiet`,`kl_status`,`kl_date_added`,`kl_date_modified`,`kl_don_vi`,`kl_ptccb_viewed`,`kl_money`) VALUES 
 (1,1,1,'2014-02-11 00:00:07','Chua lam tot cong viec','<p>sadsad ]d</p>\n<p><strong>sadf</strong></p>\n<p>sd</p>\n<p>sdasd</p>',1,'2013-12-15 21:58:46','2014-02-24 11:57:15',0,1,200000),
 (2,1,1,'0000-00-00 00:00:00','Làm chØH÷','<p>Anh phÝÚ	XXÝ]NÈŒÜ',1,'2014-02-18 17:25:43','2014-02-18 17:25:43',0,0,20000),
 (3,0,1,'0000-00-00 00:00:00','lam chØH÷','<p>ANh phÝÚ	XXÝ]NÏÜ',1,'2014-02-18 17:36:58','2014-02-18 17:36:58',1,0,200000),
 (4,1,1,'2014-02-24 00:00:07','Hu lam','<p>fasdfasdfs</p>',0,'2014-02-24 11:57:37','2014-02-24 11:58:20',1,1,0),
 (5,22,13,'2014-05-05 00:00:07','123232','<p>123123123</p>',1,'2014-05-05 11:20:06','2014-05-05 11:35:18',22,1,222222),
 (6,22,1,'0000-00-00 00:00:00','dff','<p>dsfsdf</p>',1,'2014-05-05 11:26:38','2014-05-05 11:26:38',0,1,333333);
/*!40000 ALTER TABLE `ky_luat` ENABLE KEYS */;


--
-- Definition of table `lam_them_gio`
--

DROP TABLE IF EXISTS `lam_them_gio`;
CREATE TABLE `lam_them_gio` (
  `ltg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ltg_em_id` int(10) unsigned NOT NULL,
  `ltg_ngay` datetime NOT NULL,
  `ltg_chi_tiet` text NOT NULL,
  `ltg_gio_bat_dau` int(10) unsigned NOT NULL,
  `ltg_phut_bat_dau` int(10) unsigned NOT NULL,
  `ltg_gio_ket_thuc` int(10) unsigned NOT NULL,
  `ltg_phut_ket_thuc` int(10) unsigned NOT NULL,
  `ltg_date_added` datetime NOT NULL,
  `ltg_don_vi_status` float NOT NULL DEFAULT '-1',
  `ltg_tccb_status` float NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ltg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lam_them_gio`
--

/*!40000 ALTER TABLE `lam_them_gio` DISABLE KEYS */;
INSERT INTO `lam_them_gio` (`ltg_id`,`ltg_em_id`,`ltg_ngay`,`ltg_chi_tiet`,`ltg_gio_bat_dau`,`ltg_phut_bat_dau`,`ltg_gio_ket_thuc`,`ltg_phut_ket_thuc`,`ltg_date_added`,`ltg_don_vi_status`,`ltg_tccb_status`) VALUES 
 (6,1,'2014-02-12 15:39:07','<p>h&acirc;hahaha</p>',1,10,18,19,'2013-12-27 11:53:32',1,-1),
 (7,22,'2014-04-03 00:00:00','<p>werwer ert áº»t</p>',0,0,0,0,'2014-04-03 23:38:56',1,-1);
/*!40000 ALTER TABLE `lam_them_gio` ENABLE KEYS */;


--
-- Definition of table `ly_luan_chinh_tri`
--

DROP TABLE IF EXISTS `ly_luan_chinh_tri`;
CREATE TABLE `ly_luan_chinh_tri` (
  `llct_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `llct_name` varchar(255) NOT NULL,
  `llct_order` int(10) unsigned NOT NULL DEFAULT '0',
  `llct_status` int(10) unsigned NOT NULL DEFAULT '1',
  `llct_date_added` datetime DEFAULT NULL,
  `llct_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`llct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ly_luan_chinh_tri`
--

/*!40000 ALTER TABLE `ly_luan_chinh_tri` DISABLE KEYS */;
INSERT INTO `ly_luan_chinh_tri` (`llct_id`,`llct_name`,`llct_order`,`llct_status`,`llct_date_added`,`llct_date_modified`) VALUES 
 (1,'Ly luan 1',1,1,'2014-03-28 15:23:20','2014-03-28 15:23:20'),
 (2,'Ly luan 2',1,1,'2014-03-28 15:23:25','2014-03-28 15:23:25');
/*!40000 ALTER TABLE `ly_luan_chinh_tri` ENABLE KEYS */;


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
  `ncc_ma_ngach` varchar(45) NOT NULL,
  `ncc_nam_nang_bac` int(10) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`ncc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ngach_cong_chuc`
--

/*!40000 ALTER TABLE `ngach_cong_chuc` DISABLE KEYS */;
INSERT INTO `ngach_cong_chuc` (`ncc_id`,`ncc_name`,`ncc_order`,`ncc_status`,`ncc_date_added`,`ncc_date_modified`,`ncc_ma_ngach`,`ncc_nam_nang_bac`) VALUES 
 (4,'Ngáº¡ch chuyÃªn viÃªn',1,1,'2013-11-26 15:07:50','2014-05-07 11:06:59','123345',4),
 (5,'Ngáº¡ch káº¿ toÃ¡n viÃªn',2,1,'2013-11-26 15:07:58','2014-05-07 11:07:13','0123123',3),
 (6,'dfsdfsdf',1,1,'2014-05-07 11:10:05','2014-05-07 11:10:05','3423434',4);
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
 (9,'Chi cá»¥c cáº£ng XuÃ¢n Háº£i',0,0,1,NULL,'2014-02-23 16:54:50'),
 (11,'Chi cá»¥c Há»“ng LÄ©nh',0,0,1,NULL,'2014-02-23 16:55:14');
/*!40000 ALTER TABLE `phong_ban` ENABLE KEYS */;


--
-- Definition of table `quan_ly_nha_nuoc`
--

DROP TABLE IF EXISTS `quan_ly_nha_nuoc`;
CREATE TABLE `quan_ly_nha_nuoc` (
  `qlnn_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qlnn_name` varchar(255) NOT NULL,
  `qlnn_order` int(10) unsigned NOT NULL DEFAULT '0',
  `qlnn_status` int(10) unsigned NOT NULL DEFAULT '1',
  `qlnn_date_added` datetime DEFAULT NULL,
  `qlnn_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`qlnn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quan_ly_nha_nuoc`
--

/*!40000 ALTER TABLE `quan_ly_nha_nuoc` DISABLE KEYS */;
INSERT INTO `quan_ly_nha_nuoc` (`qlnn_id`,`qlnn_name`,`qlnn_order`,`qlnn_status`,`qlnn_date_added`,`qlnn_date_modified`) VALUES 
 (1,'Quan ly 1',1,1,'2014-03-28 15:23:05','2014-03-28 15:23:05'),
 (2,'Quan ly 2',2,1,'2014-03-28 15:23:11','2014-03-28 15:23:11');
/*!40000 ALTER TABLE `quan_ly_nha_nuoc` ENABLE KEYS */;


--
-- Definition of table `thong_bao`
--

DROP TABLE IF EXISTS `thong_bao`;
CREATE TABLE `thong_bao` (
  `tb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tb_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tb_to` int(10) unsigned NOT NULL,
  `tb_tieu_de` text,
  `tb_noi_dung` text,
  `tb_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: chua doc, 1: da doc',
  `tb_date_added` datetime DEFAULT NULL,
  `tb_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`tb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thong_bao`
--

/*!40000 ALTER TABLE `thong_bao` DISABLE KEYS */;
INSERT INTO `thong_bao` (`tb_id`,`tb_from`,`tb_to`,`tb_tieu_de`,`tb_noi_dung`,`tb_status`,`tb_date_added`,`tb_date_modified`) VALUES 
 (6,1,13,'Hung gui','<p>Nhandc chua</p>',0,'2014-02-14 22:40:44','2014-02-14 22:40:44'),
 (7,1,0,'Hung gui','<p>Nhandc chua</p>',0,'2014-02-14 22:40:44','2014-02-14 22:40:44'),
 (9,1,0,'','',0,'2014-02-14 22:44:16','2014-02-14 22:44:16'),
 (11,1,0,'sdf','<p>fd</p>',0,'2014-02-14 22:46:09','2014-02-14 22:46:09'),
 (12,0,22,'[ThÃ´ng bÃ¡o] CÃ³ yÃªu cáº§u cáº­p nháº­t thÃ´ng tin.','CÃ¡n bá»™ Nguyá»…n Máº¡nh HÃ¹ng Ä‘Ã£ khai bÃ¡o thÃ´ng tin cÃ¡ nhÃ¢n má»›i<br/> Báº¡n hÃ£y vÃ o <strong>Tá»• chá»©c cÃ¡n bá»™ => QL yÃªu cáº§u cáº­p nháº­t thÃ´ng tin</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:07:08','2014-04-03 23:07:08'),
 (13,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i<br/> Báº¡n hÃ£y vÃ o <strong>ÄÆ¡n vá»‹ => Duyá»‡t phÃ¢n loáº¡i cÃ¡n bá»™</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:13:57','2014-04-03 23:13:57'),
 (14,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i<br/> Báº¡n hÃ£y vÃ o <strong>ÄÆ¡n vá»‹ => Duyá»‡t phÃ¢n loáº¡i cÃ¡n bá»™</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:14:32','2014-04-03 23:14:32'),
 (15,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i<br/> Báº¡n hÃ£y vÃ o <strong>ÄÆ¡n vá»‹ => Duyá»‡t phÃ¢n loáº¡i cÃ¡n bá»™</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:15:25','2014-04-03 23:15:25'),
 (16,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y vÃ o <strong>Tá»• chá»©c cÃ¡n bá»™ => Duyá»‡t phÃ¢n loáº¡i cÃ¡n bá»™</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:25:11','2014-04-03 23:25:11'),
 (17,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i<br/> Báº¡n hÃ£y vÃ o <strong>ÄÆ¡n vá»‹ => Duyá»‡t nghá»‰ phÃ©p</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:29:24','2014-04-03 23:29:24'),
 (18,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i<br/> Báº¡n hÃ£y vÃ o <strong>Tá»• chá»©c cÃ¡n bá»™ => Duyá»‡t nghá»‰ phÃ©p</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:33:11','2014-04-03 23:33:11'),
 (19,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y vÃ o <strong>ÄÆ¡n vá»‹ => Duyá»‡t thÃªm giá»</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:38:56','2014-04-03 23:38:56'),
 (20,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y vÃ o <strong>Tá»• chá»©c cÃ¡n bá»™ => Duyá»‡t thÃªm giá»</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:39:35','2014-04-03 23:39:35'),
 (21,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y vÃ o <strong>Tá»• chá»©c cÃ¡n bá»™ => Duyá»‡t cháº¥m cÃ´ng</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-03 23:43:54','2014-04-03 23:43:54'),
 (22,0,22,'[ThÃ´ng bÃ¡o] CÃ³ yÃªu cáº§u cáº­p nháº­t thÃ´ng tin.','CÃ¡n bá»™ <strong>Ã‚u BÃ­ch</strong> Ä‘Ã£ khai bÃ¡o thÃ´ng tin cÃ¡ nhÃ¢n má»›i<br/> Báº¡n hÃ£y vÃ o <strong>Tá»• chá»©c cÃ¡n bá»™ => QL yÃªu cáº§u cáº­p nháº­t thÃ´ng tin</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-04-06 21:57:12','2014-04-06 21:57:12'),
 (23,22,1,'Gui cho chu thong ba','<p>hahaha</p>',0,'2014-04-06 22:22:33','2014-04-06 22:22:33'),
 (24,0,1,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: TrÆ°á»Ÿng Ä‘Æ¡n vá»‹</br>\n                PhÃ²ng ban: Chi cá»¥c cáº£ng XuÃ¢n Háº£i</br>\n                Ngáº¡ch cÃ´ng chá»©c: Ngáº¡ch káº¿ toÃ¡n viÃªn</br>\n                CÃ´ng viá»‡c: Ha ah ha</br>\n                ChuyÃªn mÃ´n: he he he</br>',0,'2014-04-06 23:07:54','2014-04-06 23:07:54'),
 (25,0,1,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: GiÃ¡m Ä‘á»‘c</br>\n                PhÃ²ng ban: Chi cá»¥c cáº£ng XuÃ¢n Háº£i</br>\n                Ngáº¡ch cÃ´ng chá»©c: Ngáº¡ch káº¿ toÃ¡n viÃªn</br>\n                CÃ´ng viá»‡c: Ha ah ha</br>\n                ChuyÃªn mÃ´n: he he he</br>',0,'2014-04-06 23:08:05','2014-04-06 23:08:05'),
 (26,0,1,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: GiÃ¡m Ä‘á»‘c</br>\n                PhÃ²ng ban: Chi cá»¥c Há»“ng LÄ©nh</br>\n                Ngáº¡ch cÃ´ng chá»©c: Ngáº¡ch káº¿ toÃ¡n viÃªn</br>\n                CÃ´ng viá»‡c: Ha ah ha</br>\n                ChuyÃªn mÃ´n: he he he</br>',0,'2014-04-06 23:08:16','2014-04-06 23:08:16'),
 (27,0,1,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: GiÃ¡m Ä‘á»‘c</br>\n                PhÃ²ng ban: Chi cá»¥c Há»“ng LÄ©nh</br>\n                Ngáº¡ch cÃ´ng chá»©c: Ngáº¡ch káº¿ toÃ¡n viÃªn</br>\n                CÃ´ng viá»‡c: Ha ah ha</br>\n                ChuyÃªn mÃ´n: he he he</br>',0,'2014-04-06 23:08:34','2014-04-06 23:08:34'),
 (28,0,13,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: GiÃ¡m Ä‘á»‘c</br>\n                PhÃ²ng ban: Chi cá»¥c cáº£ng XuÃ¢n Háº£i</br>\n                Ngáº¡ch cÃ´ng chá»©c: Ngáº¡ch káº¿ toÃ¡n viÃªn</br>\n                CÃ´ng viá»‡c: 5345345</br>\n                ChuyÃªn mÃ´n: 5345345</br>',0,'2014-04-06 23:08:50','2014-04-06 23:08:50'),
 (29,0,22,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: GiÃ¡m Ä‘á»‘c</br>\n                PhÃ²ng ban: Chi cá»¥c cáº£ng XuÃ¢n Háº£i</br>\n                Ngáº¡ch cÃ´ng chá»©c: Ngáº¡ch chuyÃªn viÃªn</br>\n                CÃ´ng viá»‡c: Lap Trinh</br>\n                ChuyÃªn mÃ´n: Lap Trinh</br>',1,'2014-04-06 23:09:04','2014-04-06 23:09:04'),
 (30,0,1,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: GiÃ¡m Ä‘á»‘c</br>\n                PhÃ²ng ban: Chi cá»¥c Há»“ng LÄ©nh</br>\n                Ngáº¡ch cÃ´ng chá»©c: Ngáº¡ch káº¿ toÃ¡n viÃªn</br>\n                CÃ´ng viá»‡c: Ha ah ha</br>\n                ChuyÃªn mÃ´n: he he he</br>',0,'2014-04-06 23:17:37','2014-04-06 23:17:37'),
 (31,0,1,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: TrÆ°á»Ÿng Ä‘Æ¡n vá»‹</br>\n                PhÃ²ng ban: Chi cá»¥c Há»“ng LÄ©nh</br>\n                Ngáº¡ch cÃ´ng chá»©c: Ngáº¡ch chuyÃªn viÃªn</br>\n                CÃ´ng viá»‡c: Ha ah ha</br>\n                ChuyÃªn mÃ´n: he he he</br>',0,'2014-04-06 23:17:49','2014-04-06 23:17:49'),
 (32,0,1,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: TrÆ°á»Ÿng Ä‘Æ¡n vá»‹</br>\n                PhÃ²ng ban: Chi cá»¥c Há»“ng LÄ©nh</br>\n                Ngáº¡ch cÃ´ng chá»©c: Ngáº¡ch chuyÃªn viÃªn</br>\n                CÃ´ng viá»‡c: Ha ah ha</br>\n                ChuyÃªn mÃ´n: he he he</br>',0,'2014-04-06 23:18:05','2014-04-06 23:18:05'),
 (33,0,1,'[Nghá»‰ hÆ°u] Báº¡n vá»«a Ä‘Æ°á»£c duyá»‡t nghá»‰ hÆ°u','PhÃ²ng tá»• chá»©c vá»«a chuyá»ƒn tráº¡ng thÃ¡i cá»§a báº¡n sang nghá»‰ hÆ°u.',0,'2014-04-09 12:35:51','2014-04-09 12:35:51'),
 (34,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i<br/> Báº¡n hÃ£y vÃ o <strong>ÄÆ¡n vá»‹ => Duyá»‡t phÃ¢n loáº¡i cÃ¡n bá»™</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-04-13 12:08:03','2014-04-13 12:08:03'),
 (35,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i<br/> Báº¡n hÃ£y vÃ o <strong>ÄÆ¡n vá»‹ => Duyá»‡t phÃ¢n loáº¡i cÃ¡n bá»™</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-04-13 12:08:13','2014-04-13 12:08:13'),
 (36,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y vÃ o <strong>Tá»• chá»©c cÃ¡n bá»™ => Duyá»‡t phÃ¢n loáº¡i cÃ¡n bá»™</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-04-13 12:09:06','2014-04-13 12:09:06'),
 (37,0,22,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i<br/> Báº¡n hÃ£y vÃ o <strong>ÄÆ¡n vá»‹ => Duyá»‡t phÃ¢n loáº¡i cÃ¡n bá»™</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-04-13 12:10:52','2014-04-13 12:10:52'),
 (38,0,22,'[ThÃ´ng bÃ¡o] CÃ³ yÃªu cáº§u cáº­p nháº­t thÃ´ng tin.','CÃ¡n bá»™ <strong>Nguyá»…n Máº¡nh HÃ¹ng</strong> Ä‘Ã£ khai bÃ¡o thÃ´ng tin cÃ¡ nhÃ¢n má»›i<br/> Báº¡n hÃ£y vÃ o <strong>Tá»• chá»©c cÃ¡n bá»™ => QL yÃªu cáº§u cáº­p nháº­t thÃ´ng tin</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-04-15 15:18:28','2014-04-15 15:18:28'),
 (39,0,22,'[ThÃ´ng bÃ¡o] CÃ³ yÃªu cáº§u cáº­p nháº­t thÃ´ng tin.','CÃ¡n bá»™ <strong>Nguyá»…n Máº¡nh HÃ¹ng</strong> Ä‘Ã£ khai bÃ¡o thÃ´ng tin cÃ¡ nhÃ¢n má»›i<br/> Báº¡n hÃ£y vÃ o <strong>Tá»• chá»©c cÃ¡n bá»™ => QL yÃªu cáº§u cáº­p nháº­t thÃ´ng tin</strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-04-15 15:43:25','2014-04-15 15:43:25'),
 (40,0,1,'[Khen ThÆ°á»Ÿng] 1131232','<p>312323</p>',0,'2014-05-05 11:26:29','2014-05-05 11:26:29'),
 (41,0,1,'[Ká»· luáº­t/khiá»ƒn trÃ¡ch] dff','<p>dsfsdf</p>',0,'2014-05-05 11:26:38','2014-05-05 11:26:38'),
 (42,0,1,'[Khen ThÆ°á»Ÿng] 1131232','<p>312323</p>',0,'2014-05-05 11:29:51','2014-05-05 11:29:51'),
 (43,0,1,'[Ky luáº­t/Khiá»ƒn trÃ¡ch] 123232','<p>123123123</p>',0,'2014-05-05 11:31:34','2014-05-05 11:31:34'),
 (44,0,1,'[Ky luáº­t/Khiá»ƒn trÃ¡ch] 123232','<p>123123123</p>',0,'2014-05-05 11:32:12','2014-05-05 11:32:12'),
 (45,0,1,'[Ky luáº­t/Khiá»ƒn trÃ¡ch] 123232','<p>123123123</p>',0,'2014-05-05 11:34:59','2014-05-05 11:34:59'),
 (46,0,1,'[Ky luáº­t/Khiá»ƒn trÃ¡ch] 123232','<p>123123123</p>',0,'2014-05-05 11:35:18','2014-05-05 11:35:18'),
 (47,0,1,'[Khen ThÆ°á»Ÿng] 1131232','<p>312323</p>',0,'2014-05-05 11:35:33','2014-05-05 11:35:33'),
 (48,0,22,'[ThÃ´ng bÃ¡o] CÃ³ yÃªu cáº§u cáº­p nháº­t thÃ´ng tin.','CÃ¡n bá»™ <strong>Nguyá»…n Máº¡nh HÃ¹ng</strong> Ä‘Ã£ khai bÃ¡o thÃ´ng tin cÃ¡ nhÃ¢n má»›i<br/> Báº¡n hÃ£y vÃ o <strong><a href=\"/phanloaicanbo/web/tochuccanbo/capnhatthongtin\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-05-05 14:24:14','2014-05-05 14:24:14'),
 (49,0,22,'[ThÃ´ng bÃ¡o] CÃ³ yÃªu cáº§u cáº­p nháº­t thÃ´ng tin.','CÃ¡n bá»™ <strong>Nguyá»…n Máº¡nh HÃ¹ng</strong> Ä‘Ã£ khai bÃ¡o thÃ´ng tin cÃ¡ nhÃ¢n má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/capnhatthongtin\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-13 12:03:32','2014-05-13 12:03:32');
/*!40000 ALTER TABLE `thong_bao` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tinh`
--

/*!40000 ALTER TABLE `tinh` DISABLE KEYS */;
INSERT INTO `tinh` (`tinh_id`,`tinh_name`,`tinh_order`,`tinh_status`,`tinh_date_added`,`tinh_date_modified`) VALUES 
 (1,'HÃ  Ná»™i',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (2,'HÃ  Giang',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (4,'Cao Báº±ng',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (6,'Báº¯c Káº¡n',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (8,'TuyÃªn Quang',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (10,'LÃ o Cai',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (11,'Äiá»‡n BiÃªn',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (12,'Lai ChÃ¢u',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (14,'SÆ¡n La',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (15,'YÃªn BÃ¡i',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (17,'HÃ²a BÃ¬nh',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (19,'ThÃ¡i NguyÃªn',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (20,'Láº¡ng SÆ¡n',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (22,'Quáº£ng Ninh',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (24,'Báº¯c Giang',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (25,'PhÃº Thá»',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (26,'VÄ©nh PhÃºc',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (27,'Báº¯c Ninh',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (30,'Háº£i DÆ°Æ¡ng',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (31,'Háº£i PhÃ²ng',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (33,'HÆ°ng YÃªn',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (34,'ThÃ¡i BÃ¬nh',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (35,'HÃ  Nam',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (36,'Nam Äá»‹nh',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (37,'Ninh BÃ¬nh',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (38,'Thanh HÃ³a',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (40,'Nghá»‡ An',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (42,'HÃ  TÄ©nh',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (44,'Quáº£ng BÃ¬nh',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (45,'Quáº£ng Trá»‹',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (46,'Thá»«a ThiÃªn Huáº¿',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (48,'ÄÃ  Náºµng',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (49,'Quáº£ng Nam',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (51,'Quáº£ng NgÃ£i',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (52,'BÃ¬nh Äá»‹nh',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (54,'PhÃº YÃªn',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (56,'KhÃ¡nh HÃ²a',0,1,'2014-05-13 11:10:08','2014-05-13 11:10:08'),
 (58,'Ninh Thuáº­n',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (60,'BÃ¬nh Thuáº­n',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (62,'Kon Tum',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (64,'Gia Lai',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (66,'Äáº¯k Láº¯k',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (67,'Äáº¯k NÃ´ng',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (68,'LÃ¢m Äá»“ng',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (70,'BÃ¬nh PhÆ°á»›c',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (72,'TÃ¢y Ninh',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (74,'BÃ¬nh DÆ°Æ¡ng',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (75,'Äá»“ng Nai',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (77,'BÃ  Rá»‹a - VÅ©ng TÃ u',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (79,'Há»“ ChÃ­ Minh',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (80,'Long An',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (82,'Tiá»n Giang',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (83,'Báº¿n Tre',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (84,'TrÃ  Vinh',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (86,'VÄ©nh Long',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (87,'Äá»“ng ThÃ¡p',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (89,'An Giang',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (91,'KiÃªn Giang',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (92,'Cáº§n ThÆ¡',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (93,'Háº­u Giang',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (94,'SÃ³c TrÄƒng',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (95,'Báº¡c LiÃªu',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09'),
 (96,'CÃ  Mau',0,1,'2014-05-13 11:10:09','2014-05-13 11:10:09');
/*!40000 ALTER TABLE `tinh` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `em_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0' COMMENT '0: de-active, 1: active',
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`em_id`,`group_id`,`username`,`password`,`status`,`date_added`,`date_modified`) VALUES 
 (1,22,1,'hungnm','37a9b57da9afc663e11b5da3e01c3da5','1','2013-11-07 22:58:52','2014-03-28 15:25:25'),
 (3,2,6,'bichatn','37a9b57da9afc663e11b5da3e01c3da5','1','2013-11-30 14:51:44','2014-02-23 16:53:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;

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
 (49,1,1385523456,'::1'),
 (50,1,1385795617,'::1'),
 (51,1,1385797693,'::1'),
 (52,1,1385797861,'::1'),
 (53,1,1385891103,'::1'),
 (54,1,1385911369,'::1'),
 (55,1,1385962278,'::1'),
 (56,1,1385972204,'::1'),
 (57,1,1385974390,'::1'),
 (58,1,1386402867,'::1'),
 (59,1,1386402915,'::1'),
 (60,1,1386410167,'::1'),
 (61,1,1386418281,'::1'),
 (62,1,1386769946,'::1'),
 (63,1,1386774233,'::1'),
 (64,1,1387009367,'::1'),
 (65,1,1387011751,'::1'),
 (66,1,1387034973,'::1'),
 (67,1,1387035657,'192.168.0.101'),
 (68,1,1387035700,'192.168.0.101'),
 (69,1,1387098330,'192.168.0.102'),
 (70,1,1387118686,'192.168.0.102'),
 (71,1,1387710738,'::1'),
 (72,1,1387724735,'::1'),
 (73,1,1387807947,'::1'),
 (74,1,1388152776,'::1'),
 (75,1,1391834944,'::1'),
 (76,1,1391860341,'::1'),
 (77,1,1391916262,'::1'),
 (78,1,1392132268,'::1'),
 (79,1,1392303347,'::1'),
 (80,1,1392390001,'::1'),
 (81,1,1392396823,'::1'),
 (82,1,1392469836,'::1'),
 (83,1,1392523107,'::1'),
 (84,1,1392538322,'::1'),
 (85,1,1392559734,'::1'),
 (86,1,1392560278,'::1'),
 (87,1,1392817855,'::1'),
 (88,1,1393041972,'::1'),
 (89,1,1393077298,'::1'),
 (90,1,1393125709,'::1'),
 (91,1,1393211848,'127.0.0.1'),
 (92,1,1395043724,'127.0.0.1'),
 (93,1,1395741955,'127.0.0.1'),
 (94,1,1395889028,'127.0.0.1'),
 (95,1,1395977291,'127.0.0.1'),
 (96,1,1395995134,'127.0.0.1'),
 (97,3,1396000255,'127.0.0.1'),
 (98,1,1396000277,'127.0.0.1'),
 (99,3,1396000304,'127.0.0.1'),
 (100,1,1396000345,'127.0.0.1'),
 (101,3,1396000577,'127.0.0.1'),
 (102,1,1396000941,'127.0.0.1'),
 (103,1,1396363766,'::1'),
 (104,1,1396365404,'::1'),
 (105,1,1396452938,'::1'),
 (106,1,1396539632,'::1'),
 (107,3,1396796215,'::1'),
 (108,1,1396796245,'::1'),
 (109,1,1397017835,'::1'),
 (110,1,1397023672,'192.168.0.102'),
 (111,1,1397039795,'192.168.0.103'),
 (112,1,1397056458,'192.168.0.103'),
 (113,1,1397360478,'::1'),
 (114,1,1397382197,'::1'),
 (115,3,1399262226,'127.0.0.1'),
 (116,1,1399263162,'127.0.0.1'),
 (117,1,1399953615,'127.0.0.1'),
 (118,1,1399962392,'127.0.0.1'),
 (119,1,1399962442,'127.0.0.1');
/*!40000 ALTER TABLE `users_log` ENABLE KEYS */;


--
-- Definition of table `xin_nghi_phep`
--

DROP TABLE IF EXISTS `xin_nghi_phep`;
CREATE TABLE `xin_nghi_phep` (
  `xnp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xnp_em_id` int(10) unsigned NOT NULL,
  `xnp_from_date` datetime NOT NULL,
  `xnp_to_date` datetime NOT NULL,
  `xnp_date_created` datetime NOT NULL,
  `xnp_don_vi_status` float NOT NULL DEFAULT '-1',
  `xnp_ptccb_status` float NOT NULL DEFAULT '-1',
  `xnp_ly_do` text NOT NULL,
  `xnp_chi_tiet` text,
  PRIMARY KEY (`xnp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xin_nghi_phep`
--

/*!40000 ALTER TABLE `xin_nghi_phep` DISABLE KEYS */;
INSERT INTO `xin_nghi_phep` (`xnp_id`,`xnp_em_id`,`xnp_from_date`,`xnp_to_date`,`xnp_date_created`,`xnp_don_vi_status`,`xnp_ptccb_status`,`xnp_ly_do`,`xnp_chi_tiet`) VALUES 
 (3,1,'2014-02-02 21:42:07','2014-02-07 21:42:07','2013-12-27 21:42:29',1,-1,'Nghi om','<p>ah ang nay naoRet qua nen muon xin nghi</p>'),
 (4,22,'2014-04-10 00:00:00','2014-04-24 00:00:00','2014-04-03 23:29:24',1,-1,'dfdsfdsf ftg rft','<p>fdsfdsfsdf ert&nbsp;</p>');
/*!40000 ALTER TABLE `xin_nghi_phep` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
