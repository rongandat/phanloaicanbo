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
-- Definition of table `bac_luong`
--

DROP TABLE IF EXISTS `bac_luong`;
CREATE TABLE `bac_luong` (
  `bl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bl_name` varchar(255) NOT NULL,
  `bl_he_so_luong` double NOT NULL,
  `bl_pc_chuc_vu` double NOT NULL,
  `bl_pc_trach_nhiem` double NOT NULL,
  `bl_pc_khu_vuc` double NOT NULL,
  `bl_pc_tnvk` double NOT NULL,
  `bl_pc_udn` double NOT NULL,
  `bl_pc_cong_vu` double NOT NULL,
  `bl_pc_kiem_nhiem` double NOT NULL,
  `bl_pc_khac` double NOT NULL,
  `bl_pc_khac_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '''0: he_so, 1: %''',
  `bl_pc_thu_hut` double NOT NULL,
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
INSERT INTO `bac_luong` (`bl_id`,`bl_name`,`bl_he_so_luong`,`bl_pc_chuc_vu`,`bl_pc_trach_nhiem`,`bl_pc_khu_vuc`,`bl_pc_tnvk`,`bl_pc_udn`,`bl_pc_cong_vu`,`bl_pc_kiem_nhiem`,`bl_pc_khac`,`bl_pc_khac_type`,`bl_pc_thu_hut`,`bl_status`,`bl_date_modified`,`bl_date_added`,`bl_order`) VALUES 
 (4,'Báº­c 1',1,2,4,5,6,7,8,9,10,0,3,1,'2014-04-01 17:42:24','2014-04-01 17:42:24',1),
 (5,'Báº­c 2',1,2,4,5,6,7,8,9,10,1,3,1,'2014-04-01 17:44:40','2014-04-01 17:44:40',1),
 (6,'Báº­c 3',1.1,2.1,4.1,5.1,6.1,7.1,8.1,9.1,10.1,0,3.1,1,'2014-04-15 13:03:47','2014-04-15 13:03:47',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cham_cong`
--

/*!40000 ALTER TABLE `cham_cong` DISABLE KEYS */;
INSERT INTO `cham_cong` (`c_id`,`c_em_id`,`c_thang`,`c_nam`,`c_ngay_1`,`c_ngay_2`,`c_ngay_3`,`c_ngay_4`,`c_ngay_5`,`c_ngay_6`,`c_ngay_7`,`c_ngay_8`,`c_ngay_9`,`c_ngay_10`,`c_ngay_11`,`c_ngay_12`,`c_ngay_13`,`c_ngay_14`,`c_ngay_15`,`c_ngay_16`,`c_ngay_17`,`c_ngay_18`,`c_ngay_19`,`c_ngay_20`,`c_ngay_21`,`c_ngay_22`,`c_ngay_23`,`c_ngay_24`,`c_ngay_25`,`c_ngay_26`,`c_ngay_27`,`c_ngay_28`,`c_ngay_29`,`c_ngay_30`,`c_ngay_31`,`c_don_vi_status`,`c_ptccb_status`,`c_date_created`,`c_date_modifyed`) VALUES 
 (2,1,2,2014,'9','','','','','','','9','8','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0','','','','4','','','',1,0,'2014-02-08 23:08:39','2014-02-08 23:18:29'),
 (3,1,5,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',-1,1,'2014-05-10 23:36:33','2014-05-10 23:36:33'),
 (4,2,5,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',-1,1,'2014-05-10 23:36:33','2014-05-10 23:36:33'),
 (5,13,5,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',-1,1,'2014-05-10 23:36:33','2014-05-10 23:36:33'),
 (6,22,5,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',-1,1,'2014-05-10 23:36:33','2014-05-10 23:36:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dan_toc`
--

/*!40000 ALTER TABLE `dan_toc` DISABLE KEYS */;
INSERT INTO `dan_toc` (`dt_id`,`dt_name`,`dt_status`,`dt_order`,`dt_date_added`,`dt_date_modified`) VALUES 
 (2,'TÃ y',1,0,'2013-11-09 17:09:09','2013-11-09 17:27:53'),
 (3,'Kinh',1,2,'2014-02-23 16:58:23','2014-02-23 16:58:23'),
 (4,'NÃ¹ng',1,3,'2014-02-23 16:58:31','2014-02-23 16:58:31'),
 (5,'Dao',1,0,'2014-02-23 16:58:35','2014-02-23 16:58:35'),
 (6,'ThÃ¡i',1,0,'2014-02-23 16:58:41','2014-02-23 16:58:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

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
 (6,22,5,2014,'<p>dsfgdsf</p>',9,0,'<p>fsdfsd</p>','','<p>fsdfsd</p>','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','C','C','C','2014-04-13 12:08:13','2014-04-13 12:08:13');
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
 (1,'HÃ¹ng','Máº¡nh','Nguyá»…n','1970-01-07 00:00:00','131398081','Nobita','',1,'','0985679742','Äoan HÃ¹ng','','','VÄ©nh PhÃº','','0','0','','','ThÃ´n 12 -VÃ¢n Du',4,1,2,'HAV102',6,11,'1970-01-01 00:00:00',4,'Ha ah ha','he he he',9,'1970-01-01 00:00:00',12,'1970-01-01 00:00:00',14,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','1970-01-01 00:00:00','1970-01-01 00:00:00','','','','','','12/12',3,8,1,2,3,'N;',1,0,'2013-12-02 16:54:16','2014-04-06 23:18:05','1970-01-01 00:00:00','2037-02-01 00:00:07',0,'2014-04-09 12:35:51'),
 (2,'BÃ­ch','Ngá»c','Ã‚u','1970-01-07 00:00:00','13133123434','BÃ­ch','1385911581.png',0,'','09886838560','Báº£o Tháº¯ng',NULL,NULL,'HoÃ ng LiÃªn SÆ¡n',NULL,NULL,NULL,NULL,NULL,'XÃ³m 11',4,1,2,'HAV1023',6,11,'1981-06-16 00:00:07',5,'Káº¿ ToÃ¡n','Káº¿ toÃ¡n mÃ¡y',2,'2012-07-15 00:00:07',4,'2011-05-18 00:00:07',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12/12',3,8,1,2,3,'a:3:{i:0;s:28:\"1620194362_OneTV  - Logo.png\";i:1;s:17:\"987576096_top.png\";i:2;s:24:\"681729117_Untitled-1.jpg\";}',1,0,'2013-12-01 22:26:21','2013-12-01 22:26:21',NULL,NULL,0,NULL),
 (13,'Äá»“ng','NghÄ©a','ÄÃ o','1970-01-07 00:00:00','3454543534543','Äá»“ng',NULL,1,'5345345','534534534','5345345',NULL,NULL,'534534',NULL,NULL,NULL,NULL,NULL,'5345345',5,2,2,'34534534',4,9,'2013-12-01 17:37:07',5,'5345345','5345345',2,'2013-12-31 17:37:07',2,'2013-12-28 17:37:07',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5443',3,8,1,2,3,'a:3:{i:0;s:22:\"1242417760_anh_the.jpg\";i:1;s:37:\"947727117_game garena on facebook.png\";i:2;s:24:\"34040717_legend team.jpg\";}',1,0,'2013-12-24 17:36:41','2014-04-06 23:08:50',NULL,'2000-01-01 00:00:07',0,NULL),
 (22,'HÃ¹ng',NULL,'Nguyá»…n Máº¡nh','0000-00-00 00:00:00','1313983434','Nobita',NULL,1,'11111','0985679742','Van Du','Phu Tho','Doan Hung','Van Du','1806 - Licogi 13','4','0','Phu Tho','Doan Hung','ThÃ´n 12 -VÃ¢n Du',5,0,3,'HAV102',4,9,'2014-04-01 00:00:00',4,'Lap Trinh','Lap Trinh',9,'0000-00-00 00:00:00',12,'0000-00-00 00:00:00',14,2,2,'<p>Ko co ai o nuoc ngoai</p>','<p>Ko tham giao to chu nao</p>','<p>Chua bi bat bao gio</p>','a:2:{i:2081459929;a:3:{s:10:\"ngay_thang\";s:6:\"2/2012\";s:8:\"ma_ngach\";s:6:\"NCNC/1\";s:5:\"he_so\";s:1:\"1\";}i:1696554268;a:3:{s:10:\"ngay_thang\";s:6:\"2/2014\";s:8:\"ma_ngach\";s:5:\"JHK/2\";s:5:\"he_so\";s:3:\"1.2\";}}','a:1:{i:231187764;a:4:{s:11:\"moi_quan_he\";s:2:\"Bo\";s:6:\"ho_ten\";s:4:\"Long\";s:8:\"nam_sinh\";s:4:\"1950\";s:8:\"chi_tiet\";s:0:\"\";}}','a:2:{i:574903200;a:4:{s:11:\"moi_quan_he\";s:2:\"Vo\";s:6:\"ho_ten\";s:4:\"Bich\";s:8:\"nam_sinh\";s:4:\"1986\";s:8:\"chi_tiet\";s:10:\"da ket hon\";}i:1855268049;a:4:{s:11:\"moi_quan_he\";s:2:\"Bo\";s:6:\"ho_ten\";s:5:\"Thinh\";s:8:\"nam_sinh\";s:4:\"1963\";s:8:\"chi_tiet\";s:0:\"\";}}','a:2:{i:550272686;a:2:{s:10:\"ngay_thang\";s:9:\"2008-2010\";s:8:\"chi_tiet\";s:6:\"iwicom\";}i:532099776;a:2:{s:10:\"ngay_thang\";s:9:\"2010-2014\";s:8:\"chi_tiet\";s:3:\"cya\";}}','a:2:{i:722698121;a:5:{s:10:\"ten_truong\";s:9:\"Bach Khoa\";s:13:\"chuyen_nghanh\";s:4:\"CNTT\";s:10:\"ngay_thang\";s:9:\"2004-2008\";s:9:\"hinh_thuc\";s:9:\"Chinh quy\";s:8:\"van_bang\";s:8:\"Cao Dang\";}i:1459784563;a:5:{s:10:\"ten_truong\";s:4:\"Ptit\";s:13:\"chuyen_nghanh\";s:4:\"CNTT\";s:10:\"ngay_thang\";s:9:\"2010-2012\";s:9:\"hinh_thuc\";s:9:\"Chinh Quy\";s:8:\"van_bang\";s:7:\"Dai Hoc\";}}','Con thuong binh','1/4','A','60','170','Tot','1212','Anh Hung','Dai tuong','0000-00-00 00:00:00','0000-00-00 00:00:00','Che nay','Khen nay','Lap Trinh','CYA','Ko','12/12',3,8,1,2,3,'a:2:{i:817955845;a:2:{s:4:\"name\";s:7:\"Ha ha 1\";s:3:\"anh\";s:45:\"577924554_vlcsnap-2013-09-16-18h05m22s194.png\";}i:222190678;a:2:{s:4:\"name\";s:7:\"O kia 1\";s:3:\"anh\";s:45:\"764999684_vlcsnap-2013-09-16-13h52m39s159.png\";}}',1,0,'2014-03-28 14:32:39','2014-04-15 15:43:36','0000-00-00 00:00:00','2000-01-01 00:00:07',0,NULL);
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
 (2,2,'BÃ­ch',NULL,'Ã‚u','1986-11-02 00:00:00','13133123434','BÃ­ch',NULL,0,'','09886838560','Báº£o Tháº¯ng','HoÃ ng LiÃªn SÆ¡n','XÃ³m 11',4,1,2,0,'2012-07-15 00:00:00',0,'2011-05-18 00:00:00',0,'12/12',3,8,1,2,3,'a:3:{i:959029566;a:2:{s:4:\"name\";s:1:\"1\";s:3:\"anh\";s:1:\"1\";}i:2024213796;a:2:{s:4:\"name\";s:1:\"9\";s:3:\"anh\";s:1:\"9\";}i:941971074;a:2:{s:4:\"name\";s:1:\"6\";s:3:\"anh\";s:1:\"6\";}}',0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','1970-01-01 00:00:00','1970-01-01 00:00:00','0','0','','','','','','','2014-04-06 21:57:12','2014-04-06 21:57:12','1970-01-01 00:00:00'),
 (3,22,'HÃ¹ng',NULL,'Nguyá»…n Máº¡nh','0000-00-00 00:00:00','1313983434','Nobita',NULL,1,'11111','0985679742','Van Du','Van Du','ThÃ´n 12 -VÃ¢n Du',5,0,3,9,'0000-00-00 00:00:00',12,'0000-00-00 00:00:00',14,'12/12',3,8,1,2,3,'a:2:{i:1562499008;a:2:{s:4:\"name\";s:7:\"Ha ha 1\";s:3:\"anh\";s:45:\"577924554_vlcsnap-2013-09-16-18h05m22s194.png\";}i:264250516;a:2:{s:4:\"name\";s:7:\"O kia 1\";s:3:\"anh\";s:45:\"764999684_vlcsnap-2013-09-16-13h52m39s159.png\";}}',2,2,'<p>Ko co ai o nuoc ngoai</p>','<p>Ko tham giao to chu nao</p>','<p>Chua bi bat bao gio</p>','a:2:{i:1042151391;a:3:{s:10:\"ngay_thang\";s:6:\"2/2012\";s:8:\"ma_ngach\";s:6:\"NCNC/1\";s:5:\"he_so\";s:1:\"1\";}i:935479256;a:3:{s:10:\"ngay_thang\";s:6:\"2/2014\";s:8:\"ma_ngach\";s:5:\"JHK/2\";s:5:\"he_so\";s:3:\"1.2\";}}','a:1:{i:455664968;a:4:{s:11:\"moi_quan_he\";s:2:\"Bo\";s:6:\"ho_ten\";s:4:\"Long\";s:8:\"nam_sinh\";s:4:\"1950\";s:8:\"chi_tiet\";s:0:\"\";}}','a:2:{i:104171604;a:4:{s:11:\"moi_quan_he\";s:2:\"Vo\";s:6:\"ho_ten\";s:4:\"Bich\";s:8:\"nam_sinh\";s:4:\"1986\";s:8:\"chi_tiet\";s:10:\"da ket hon\";}i:262452365;a:4:{s:11:\"moi_quan_he\";s:2:\"Bo\";s:6:\"ho_ten\";s:5:\"Thinh\";s:8:\"nam_sinh\";s:4:\"1963\";s:8:\"chi_tiet\";s:0:\"\";}}','a:2:{i:1996535334;a:2:{s:10:\"ngay_thang\";s:9:\"2008-2010\";s:8:\"chi_tiet\";s:6:\"iwicom\";}i:456480339;a:2:{s:10:\"ngay_thang\";s:9:\"2010-2014\";s:8:\"chi_tiet\";s:3:\"cya\";}}','a:2:{i:1725375094;a:5:{s:10:\"ten_truong\";s:9:\"Bach Khoa\";s:13:\"chuyen_nghanh\";s:4:\"CNTT\";s:10:\"ngay_thang\";s:9:\"2004-2008\";s:9:\"hinh_thuc\";s:9:\"Chinh quy\";s:8:\"van_bang\";s:8:\"Cao Dang\";}i:1446314324;a:5:{s:10:\"ten_truong\";s:4:\"Ptit\";s:13:\"chuyen_nghanh\";s:4:\"CNTT\";s:10:\"ngay_thang\";s:9:\"2010-2012\";s:9:\"hinh_thuc\";s:9:\"Chinh Quy\";s:8:\"van_bang\";s:7:\"Dai Hoc\";}}','Con thuong binh','1/4','A','60','170','Tot','1212','Anh Hung','Dai tuong','0000-00-00 00:00:00','0000-00-00 00:00:00','4','0','1806 - Licogi 13','Phu Tho','Doan Hung','Phu Tho','Doan Hung','Ko','2014-05-05 14:24:14','2014-05-05 14:24:14','0000-00-00 00:00:00');
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
  `eh_pc_doc_hai_type` int(10) unsigned NOT NULL COMMENT '0: he so, 1: tien co dinh',
  `eh_han_ap_dung` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`eh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees_heso`
--

/*!40000 ALTER TABLE `employees_heso` DISABLE KEYS */;
INSERT INTO `employees_heso` (`eh_id`,`eh_em_id`,`eh_loai_luong`,`eh_giai_doan`,`eh_he_so`,`eh_pc_cong_viec`,`eh_pc_trach_nhiem`,`eh_pc_tnvk_phan_tram`,`eh_tham_niem`,`eh_pc_udn_phan_tram`,`eh_pc_cong_vu_phan_tram`,`eh_pc_kiem_nhiem`,`eh_pc_khac`,`eh_han_dieu_chinh`,`eh_date_added`,`eh_date_modified`,`eh_pc_kv`,`eh_pc_khac_type`,`eh_pc_thu_hut`,`eh_bac_luong`,`eh_pc_doc_hai`,`eh_pc_doc_hai_type`,`eh_han_ap_dung`) VALUES 
 (1,1,0,0,1,2,4,6,'2000-01-01 00:00:07',7,8,9,10,'2015-01-01 00:00:07','2014-02-22 15:54:27','2014-05-11 14:27:02',0,0,3,4,200000,1,'0000-00-00 00:00:00'),
 (2,2,0,0,1,2,4,6,'2000-01-01 00:00:07',7,8,9,10,'2024-01-01 00:00:07','2014-02-22 21:17:29','2014-04-13 10:50:50',0,1,3,4,0,0,'0000-00-00 00:00:00'),
 (3,13,0,0,1,2,4,6,'2001-12-01 00:00:07',7,8,9,10,'2002-12-01 00:00:07','2014-04-01 23:31:42','2014-04-01 23:34:11',0,0,3,4,0,0,'0000-00-00 00:00:00'),
 (4,22,0,0,1,2,4,6,'1970-01-01 00:00:07',7,8,9,10,'2036-01-01 00:00:07','2014-04-09 17:45:21','2014-04-09 17:45:31',0,0,3,4,0,0,'0000-00-00 00:00:00'),
 (5,1,0,0,1,2,4,6,'2000-01-01 00:00:07',7,8,9,10,'2015-02-01 00:00:07','2014-05-11 15:08:57','2014-05-11 15:08:57',0,0,3,4,300000,1,'2014-02-01 00:00:07'),
 (6,1,0,0,1,2,4,6,'2000-01-01 00:00:07',7,8,9,10,'2012-02-01 00:00:07','2014-05-11 15:09:15','2014-05-11 15:14:59',0,0,3,4,400000,1,'2014-03-01 00:00:07'),
 (7,13,0,0,1,2,4,6,'2000-12-01 00:00:07',7,8,9,10,'2014-04-01 00:00:07','2014-05-11 15:30:57','2014-05-11 15:30:57',0,0,3,4,0,0,'2014-04-01 00:00:07');
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
 (1,'NhÃ³m Admin',1,1,'1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,2001,2002,2003,2004,2005,2006,2007,2008,3001,3002,3003,3004,3005,4001,4002,4003,4004,4005,4006,4007,4008,4009,4010,4011,4012,4013,4014,5001,5002,5003,5004,5005,5006,5007,5008,','2014-04-15 12:59:08',NULL),
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
  PRIMARY KEY (`hld_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holidays`
--

/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` (`hld_id`,`hld_name`,`hld_order`,`hld_status`,`hld_date_added`,`hld_date_modified`) VALUES 
 (4,'Giáº£i phÃ³ng miá»n nam',1,0,'2013-11-10 17:11:04','2013-11-10 17:12:58'),
 (5,'Quá»‘c táº¿ lao Ä‘á»™ng',2,1,'2013-11-10 17:11:13','2014-02-23 16:56:04'),
 (6,'Quá»‘c khÃ¡nh',3,1,'2013-11-10 17:11:20','2013-11-10 17:11:20'),
 (7,'Táº¿t dÆ°Æ¡ng lá»‹ch',4,1,'2013-11-10 17:11:30','2013-11-10 17:11:30'),
 (8,'Nghá»‰ chá»§ nháº­t',0,1,'2014-02-08 22:21:29','2014-02-08 22:21:29'),
 (9,'Nghá»‰ thá»© 7',1,1,'2014-02-08 22:21:38','2014-02-08 22:21:38');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;


--
-- Definition of table `huyen`
--

DROP TABLE IF EXISTS `huyen`;
CREATE TABLE `huyen` (
  `huyen_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `huyen_name` varchar(100) NOT NULL,
  `huyen_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `huyen_order` int(10) unsigned NOT NULL DEFAULT '0',
  `huyen_status` int(10) unsigned NOT NULL DEFAULT '1',
  `huyen_date_added` datetime DEFAULT NULL,
  `huyen_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`huyen_id`) USING BTREE,
  KEY `provinceid` (`huyen_parent`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=974 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `huyen`
--

/*!40000 ALTER TABLE `huyen` DISABLE KEYS */;
INSERT INTO `huyen` (`huyen_id`,`huyen_name`,`huyen_parent`,`huyen_order`,`huyen_status`,`huyen_date_added`,`huyen_date_modified`) VALUES 
 (1,'Ba Đình',1,0,1,NULL,NULL),
 (2,'Hoàn Kiếm',1,0,1,NULL,NULL),
 (3,'Tây Hồ',1,0,1,NULL,NULL),
 (4,'Long Biên',1,0,1,NULL,NULL),
 (5,'Cầu Giấy',1,0,1,NULL,NULL),
 (6,'Đống Đa',1,0,1,NULL,NULL),
 (7,'Hai Bà Trưng',1,0,1,NULL,NULL),
 (8,'Hoàng Mai',1,0,1,NULL,NULL),
 (9,'Thanh Xuân',1,0,1,NULL,NULL),
 (16,'Sóc Sơn',1,0,1,NULL,NULL),
 (17,'Đông Anh',1,0,1,NULL,NULL),
 (18,'Gia Lâm',1,0,1,NULL,NULL),
 (19,'Từ Liêm',1,0,1,NULL,NULL),
 (20,'Thanh Trì',1,0,1,NULL,NULL),
 (24,'Hà Giang',2,0,1,NULL,NULL),
 (26,'Đồng Văn',2,0,1,NULL,NULL),
 (27,'Mèo Vạc',2,0,1,NULL,NULL),
 (28,'Yên Minh',2,0,1,NULL,NULL),
 (29,'Quản Bạ',2,0,1,NULL,NULL),
 (30,'Vị Xuyên',2,0,1,NULL,NULL),
 (31,'Bắc Mê',2,0,1,NULL,NULL),
 (32,'Hoàng Su Phì',2,0,1,NULL,NULL),
 (33,'Xín Mần',2,0,1,NULL,NULL),
 (34,'Bắc Quang',2,0,1,NULL,NULL),
 (35,'Quang Bình',2,0,1,NULL,NULL),
 (40,'Cao Bằng',4,0,1,NULL,NULL),
 (42,'Bảo Lâm',4,0,1,NULL,NULL),
 (43,'Bảo Lạc',4,0,1,NULL,NULL),
 (44,'Thông Nông',4,0,1,NULL,NULL),
 (45,'Hà Quảng',4,0,1,NULL,NULL),
 (46,'Trà Lĩnh',4,0,1,NULL,NULL),
 (47,'Trùng Khánh',4,0,1,NULL,NULL),
 (48,'Hạ Lang',4,0,1,NULL,NULL),
 (49,'Quảng Uyên',4,0,1,NULL,NULL),
 (50,'Phục Hoà',4,0,1,NULL,NULL),
 (51,'Hoà An',4,0,1,NULL,NULL),
 (52,'Nguyên Bình',4,0,1,NULL,NULL),
 (53,'Thạch An',4,0,1,NULL,NULL),
 (58,'Bắc Kạn',6,0,1,NULL,NULL),
 (60,'Pác Nặm',6,0,1,NULL,NULL),
 (61,'Ba Bể',6,0,1,NULL,NULL),
 (62,'Ngân Sơn',6,0,1,NULL,NULL),
 (63,'Bạch Thông',6,0,1,NULL,NULL),
 (64,'Chợ Đồn',6,0,1,NULL,NULL),
 (65,'Chợ Mới',6,0,1,NULL,NULL),
 (66,'Na Rì',6,0,1,NULL,NULL),
 (70,'Tuyên Quang',8,0,1,NULL,NULL),
 (72,'Nà Hang',8,0,1,NULL,NULL),
 (73,'Chiêm Hóa',8,0,1,NULL,NULL),
 (74,'Hàm Yên',8,0,1,NULL,NULL),
 (75,'Yên Sơn',8,0,1,NULL,NULL),
 (76,'Sơn Dương',8,0,1,NULL,NULL),
 (80,'Lào Cai',10,0,1,NULL,NULL),
 (82,'Bát Xát',10,0,1,NULL,NULL),
 (83,'Mường Khương',10,0,1,NULL,NULL),
 (84,'Si Ma Cai',10,0,1,NULL,NULL),
 (85,'Bắc Hà',10,0,1,NULL,NULL),
 (86,'Bảo Thắng',10,0,1,NULL,NULL),
 (87,'Bảo Yên',10,0,1,NULL,NULL),
 (88,'Sa Pa',10,0,1,NULL,NULL),
 (89,'Văn Bàn',10,0,1,NULL,NULL),
 (94,'Điện Biên Phủ',11,0,1,NULL,NULL),
 (95,'Mường Lay',11,0,1,NULL,NULL),
 (96,'Mường Nhé',11,0,1,NULL,NULL),
 (97,'Mường Chà',11,0,1,NULL,NULL),
 (98,'Tủa Chùa',11,0,1,NULL,NULL),
 (99,'Tuần Giáo',11,0,1,NULL,NULL),
 (100,'Điện Biên',11,0,1,NULL,NULL),
 (101,'Điện Biên Đông',11,0,1,NULL,NULL),
 (102,'Mường Ảng',11,0,1,NULL,NULL),
 (104,'Lai Châu',12,0,1,NULL,NULL),
 (106,'Tam Đường',12,0,1,NULL,NULL),
 (107,'Mường Tè',12,0,1,NULL,NULL),
 (108,'Sìn Hồ',12,0,1,NULL,NULL),
 (109,'Phong Thổ',12,0,1,NULL,NULL),
 (110,'Than Uyên',12,0,1,NULL,NULL),
 (111,'Tân Uyên',12,0,1,NULL,NULL),
 (116,'Sơn La',14,0,1,NULL,NULL),
 (118,'Quỳnh Nhai',14,0,1,NULL,NULL),
 (119,'Thuận Châu',14,0,1,NULL,NULL),
 (120,'Mường La',14,0,1,NULL,NULL),
 (121,'Bắc Yên',14,0,1,NULL,NULL),
 (122,'Phù Yên',14,0,1,NULL,NULL),
 (123,'Mộc Châu',14,0,1,NULL,NULL),
 (124,'Yên Châu',14,0,1,NULL,NULL),
 (125,'Mai Sơn',14,0,1,NULL,NULL),
 (126,'Sông Mã',14,0,1,NULL,NULL),
 (127,'Sốp Cộp',14,0,1,NULL,NULL),
 (132,'Yên Bái',15,0,1,NULL,NULL),
 (133,'Nghĩa Lộ',15,0,1,NULL,NULL),
 (135,'Lục Yên',15,0,1,NULL,NULL),
 (136,'Văn Yên',15,0,1,NULL,NULL),
 (137,'Mù Cang Chải',15,0,1,NULL,NULL),
 (138,'Trấn Yên',15,0,1,NULL,NULL),
 (139,'Trạm Tấu',15,0,1,NULL,NULL),
 (140,'Văn Chấn',15,0,1,NULL,NULL),
 (141,'Yên Bình',15,0,1,NULL,NULL),
 (148,'Hòa Bình',17,0,1,NULL,NULL),
 (150,'Đà Bắc',17,0,1,NULL,NULL),
 (151,'Kỳ Sơn',17,0,1,NULL,NULL),
 (152,'Lương Sơn',17,0,1,NULL,NULL),
 (153,'Kim Bôi',17,0,1,NULL,NULL),
 (154,'Cao Phong',17,0,1,NULL,NULL),
 (155,'Tân Lạc',17,0,1,NULL,NULL),
 (156,'Mai Châu',17,0,1,NULL,NULL),
 (157,'Lạc Sơn',17,0,1,NULL,NULL),
 (158,'Yên Thủy',17,0,1,NULL,NULL),
 (159,'Lạc Thủy',17,0,1,NULL,NULL),
 (164,'Thái Nguyên',19,0,1,NULL,NULL),
 (165,'Sông Công',19,0,1,NULL,NULL),
 (167,'Định Hóa',19,0,1,NULL,NULL),
 (168,'Phú Lương',19,0,1,NULL,NULL),
 (169,'Đồng Hỷ',19,0,1,NULL,NULL),
 (170,'Võ Nhai',19,0,1,NULL,NULL),
 (171,'Đại Từ',19,0,1,NULL,NULL),
 (172,'Phổ Yên',19,0,1,NULL,NULL),
 (173,'Phú Bình',19,0,1,NULL,NULL),
 (178,'Lạng Sơn',20,0,1,NULL,NULL),
 (180,'Tràng Định',20,0,1,NULL,NULL),
 (181,'Bình Gia',20,0,1,NULL,NULL),
 (182,'Văn Lãng',20,0,1,NULL,NULL),
 (183,'Cao Lộc',20,0,1,NULL,NULL),
 (184,'Văn Quan',20,0,1,NULL,NULL),
 (185,'Bắc Sơn',20,0,1,NULL,NULL),
 (186,'Hữu Lũng',20,0,1,NULL,NULL),
 (187,'Chi Lăng',20,0,1,NULL,NULL),
 (188,'Lộc Bình',20,0,1,NULL,NULL),
 (189,'Đình Lập',20,0,1,NULL,NULL),
 (193,'Hạ Long',22,0,1,NULL,NULL),
 (194,'Móng Cái',22,0,1,NULL,NULL),
 (195,'Cẩm Phả',22,0,1,NULL,NULL),
 (196,'Uông Bí',22,0,1,NULL,NULL),
 (198,'Bình Liêu',22,0,1,NULL,NULL),
 (199,'Tiên Yên',22,0,1,NULL,NULL),
 (200,'Đầm Hà',22,0,1,NULL,NULL),
 (201,'Hải Hà',22,0,1,NULL,NULL),
 (202,'Ba Chẽ',22,0,1,NULL,NULL),
 (203,'Vân Đồn',22,0,1,NULL,NULL),
 (204,'Hoành Bồ',22,0,1,NULL,NULL),
 (205,'Đông Triều',22,0,1,NULL,NULL),
 (206,'Yên Hưng',22,0,1,NULL,NULL),
 (207,'Cô Tô',22,0,1,NULL,NULL),
 (213,'Bắc Giang',24,0,1,NULL,NULL),
 (215,'Yên Thế',24,0,1,NULL,NULL),
 (216,'Tân Yên',24,0,1,NULL,NULL),
 (217,'Lạng Giang',24,0,1,NULL,NULL),
 (218,'Lục Nam',24,0,1,NULL,NULL),
 (219,'Lục Ngạn',24,0,1,NULL,NULL),
 (220,'Sơn Động',24,0,1,NULL,NULL),
 (221,'Yên Dũng',24,0,1,NULL,NULL),
 (222,'Việt Yên',24,0,1,NULL,NULL),
 (223,'Hiệp Hòa',24,0,1,NULL,NULL),
 (227,'Việt Trì',25,0,1,NULL,NULL),
 (228,'Phú Thọ',25,0,1,NULL,NULL),
 (230,'Đoan Hùng',25,0,1,NULL,NULL),
 (231,'Hạ Hoà',25,0,1,NULL,NULL),
 (232,'Thanh Ba',25,0,1,NULL,NULL),
 (233,'Phù Ninh',25,0,1,NULL,NULL),
 (234,'Yên Lập',25,0,1,NULL,NULL),
 (235,'Cẩm Khê',25,0,1,NULL,NULL),
 (236,'Tam Nông',25,0,1,NULL,NULL),
 (237,'Lâm Thao',25,0,1,NULL,NULL),
 (238,'Thanh Sơn',25,0,1,NULL,NULL),
 (239,'Thanh Thuỷ',25,0,1,NULL,NULL),
 (240,'Tân Sơn',25,0,1,NULL,NULL),
 (243,'Vĩnh Yên',26,0,1,NULL,NULL),
 (244,'Phúc Yên',26,0,1,NULL,NULL),
 (246,'Lập Thạch',26,0,1,NULL,NULL),
 (247,'Tam Dương',26,0,1,NULL,NULL),
 (248,'Tam Đảo',26,0,1,NULL,NULL),
 (249,'Bình Xuyên',26,0,1,NULL,NULL),
 (250,'Mê Linh',1,0,1,NULL,NULL),
 (251,'Yên Lạc',26,0,1,NULL,NULL),
 (252,'Vĩnh Tường',26,0,1,NULL,NULL),
 (253,'Sông Lô',26,0,1,NULL,NULL),
 (256,'Bắc Ninh',27,0,1,NULL,NULL),
 (258,'Yên Phong',27,0,1,NULL,NULL),
 (259,'Quế Võ',27,0,1,NULL,NULL),
 (260,'Tiên Du',27,0,1,NULL,NULL),
 (261,'Từ Sơn',27,0,1,NULL,NULL),
 (262,'Thuận Thành',27,0,1,NULL,NULL),
 (263,'Gia Bình',27,0,1,NULL,NULL),
 (264,'Lương Tài',27,0,1,NULL,NULL),
 (268,'Hà Đông',1,0,1,NULL,NULL),
 (269,'Sơn Tây',1,0,1,NULL,NULL),
 (271,'Ba Vì',1,0,1,NULL,NULL),
 (272,'Phúc Thọ',1,0,1,NULL,NULL),
 (273,'Đan Phượng',1,0,1,NULL,NULL),
 (274,'Hoài Đức',1,0,1,NULL,NULL),
 (275,'Quốc Oai',1,0,1,NULL,NULL),
 (276,'Thạch Thất',1,0,1,NULL,NULL),
 (277,'Chương Mỹ',1,0,1,NULL,NULL),
 (278,'Thanh Oai',1,0,1,NULL,NULL),
 (279,'Thường Tín',1,0,1,NULL,NULL),
 (280,'Phú Xuyên',1,0,1,NULL,NULL),
 (281,'Ứng Hòa',1,0,1,NULL,NULL),
 (282,'Mỹ Đức',1,0,1,NULL,NULL),
 (288,'Hải Dương',30,0,1,NULL,NULL),
 (290,'Chí Linh',30,0,1,NULL,NULL),
 (291,'Nam Sách',30,0,1,NULL,NULL),
 (292,'Kinh Môn',30,0,1,NULL,NULL),
 (293,'Kim Thành',30,0,1,NULL,NULL),
 (294,'Thanh Hà',30,0,1,NULL,NULL),
 (295,'Cẩm Giàng',30,0,1,NULL,NULL),
 (296,'Bình Giang',30,0,1,NULL,NULL),
 (297,'Gia Lộc',30,0,1,NULL,NULL),
 (298,'Tứ Kỳ',30,0,1,NULL,NULL),
 (299,'Ninh Giang',30,0,1,NULL,NULL),
 (300,'Thanh Miện',30,0,1,NULL,NULL),
 (303,'Hồng Bàng',31,0,1,NULL,NULL),
 (304,'Ngô Quyền',31,0,1,NULL,NULL),
 (305,'Lê Chân',31,0,1,NULL,NULL),
 (306,'Hải An',31,0,1,NULL,NULL),
 (307,'Kiến An',31,0,1,NULL,NULL),
 (308,'Đồ Sơn',31,0,1,NULL,NULL),
 (309,'Kinh Dương',31,0,1,NULL,NULL),
 (311,'Thuỷ Nguyên',31,0,1,NULL,NULL),
 (312,'An Dương',31,0,1,NULL,NULL),
 (313,'An Lão',31,0,1,NULL,NULL),
 (314,'Kiến Thụy',31,0,1,NULL,NULL),
 (315,'Tiên Lãng',31,0,1,NULL,NULL),
 (316,'Vĩnh Bảo',31,0,1,NULL,NULL),
 (317,'Cát Hải',31,0,1,NULL,NULL),
 (318,'Bạch Long Vĩ',31,0,1,NULL,NULL),
 (323,'Hưng Yên',33,0,1,NULL,NULL),
 (325,'Văn Lâm',33,0,1,NULL,NULL),
 (326,'Văn Giang',33,0,1,NULL,NULL),
 (327,'Yên Mỹ',33,0,1,NULL,NULL),
 (328,'Mỹ Hào',33,0,1,NULL,NULL),
 (329,'Ân Thi',33,0,1,NULL,NULL),
 (330,'Khoái Châu',33,0,1,NULL,NULL),
 (331,'Kim Động',33,0,1,NULL,NULL),
 (332,'Tiên Lữ',33,0,1,NULL,NULL),
 (333,'Phù Cừ',33,0,1,NULL,NULL),
 (336,'Thái Bình',34,0,1,NULL,NULL),
 (338,'Quỳnh Phụ',34,0,1,NULL,NULL),
 (339,'Hưng Hà',34,0,1,NULL,NULL),
 (340,'Đông Hưng',34,0,1,NULL,NULL),
 (341,'Thái Thụy',34,0,1,NULL,NULL),
 (342,'Tiền Hải',34,0,1,NULL,NULL),
 (343,'Kiến Xương',34,0,1,NULL,NULL),
 (344,'Vũ Thư',34,0,1,NULL,NULL),
 (347,'Phủ Lý',35,0,1,NULL,NULL),
 (349,'Duy Tiên',35,0,1,NULL,NULL),
 (350,'Kim Bảng',35,0,1,NULL,NULL),
 (351,'Thanh Liêm',35,0,1,NULL,NULL),
 (352,'Bình Lục',35,0,1,NULL,NULL),
 (353,'Lý Nhân',35,0,1,NULL,NULL),
 (356,'Nam Định',36,0,1,NULL,NULL),
 (358,'Mỹ Lộc',36,0,1,NULL,NULL),
 (359,'Vụ Bản',36,0,1,NULL,NULL),
 (360,'Ý Yên',36,0,1,NULL,NULL),
 (361,'Nghĩa Hưng',36,0,1,NULL,NULL),
 (362,'Nam Trực',36,0,1,NULL,NULL),
 (363,'Trực Ninh',36,0,1,NULL,NULL),
 (364,'Xuân Trường',36,0,1,NULL,NULL),
 (365,'Giao Thủy',36,0,1,NULL,NULL),
 (366,'Hải Hậu',36,0,1,NULL,NULL),
 (369,'Ninh Bình',37,0,1,NULL,NULL),
 (370,'Tam Điệp',37,0,1,NULL,NULL),
 (372,'Nho Quan',37,0,1,NULL,NULL),
 (373,'Gia Viễn',37,0,1,NULL,NULL),
 (374,'Hoa Lư',37,0,1,NULL,NULL),
 (375,'Yên Khánh',37,0,1,NULL,NULL),
 (376,'Kim Sơn',37,0,1,NULL,NULL),
 (377,'Yên Mô',37,0,1,NULL,NULL),
 (380,'Thanh Hóa',38,0,1,NULL,NULL),
 (381,'Bỉm Sơn',38,0,1,NULL,NULL),
 (382,'Sầm Sơn',38,0,1,NULL,NULL),
 (384,'Mường Lát',38,0,1,NULL,NULL),
 (385,'Quan Hóa',38,0,1,NULL,NULL),
 (386,'Bá Thước',38,0,1,NULL,NULL),
 (387,'Quan Sơn',38,0,1,NULL,NULL),
 (388,'Lang Chánh',38,0,1,NULL,NULL),
 (389,'Ngọc Lặc',38,0,1,NULL,NULL),
 (390,'Cẩm Thủy',38,0,1,NULL,NULL),
 (391,'Thạch Thành',38,0,1,NULL,NULL),
 (392,'Hà Trung',38,0,1,NULL,NULL),
 (393,'Vĩnh Lộc',38,0,1,NULL,NULL),
 (394,'Yên Định',38,0,1,NULL,NULL),
 (395,'Thọ Xuân',38,0,1,NULL,NULL),
 (396,'Thường Xuân',38,0,1,NULL,NULL),
 (397,'Triệu Sơn',38,0,1,NULL,NULL),
 (398,'Thiệu Hoá',38,0,1,NULL,NULL),
 (399,'Hoằng Hóa',38,0,1,NULL,NULL),
 (400,'Hậu Lộc',38,0,1,NULL,NULL),
 (401,'Nga Sơn',38,0,1,NULL,NULL),
 (402,'Như Xuân',38,0,1,NULL,NULL),
 (403,'Như Thanh',38,0,1,NULL,NULL),
 (404,'Nông Cống',38,0,1,NULL,NULL),
 (405,'Đông Sơn',38,0,1,NULL,NULL),
 (406,'Quảng Xương',38,0,1,NULL,NULL),
 (407,'Tĩnh Gia',38,0,1,NULL,NULL),
 (412,'Vinh',40,0,1,NULL,NULL),
 (413,'Cửa Lò',40,0,1,NULL,NULL),
 (414,'Thái Hoà',40,0,1,NULL,NULL),
 (415,'Quế Phong',40,0,1,NULL,NULL),
 (416,'Quỳ Châu',40,0,1,NULL,NULL),
 (417,'Kỳ Sơn',40,0,1,NULL,NULL),
 (418,'Tương Dương',40,0,1,NULL,NULL),
 (419,'Nghĩa Đàn',40,0,1,NULL,NULL),
 (420,'Quỳ Hợp',40,0,1,NULL,NULL),
 (421,'Quỳnh Lưu',40,0,1,NULL,NULL),
 (422,'Con Cuông',40,0,1,NULL,NULL),
 (423,'Tân Kỳ',40,0,1,NULL,NULL),
 (424,'Anh Sơn',40,0,1,NULL,NULL),
 (425,'Diễn Châu',40,0,1,NULL,NULL),
 (426,'Yên Thành',40,0,1,NULL,NULL),
 (427,'Đô Lương',40,0,1,NULL,NULL),
 (428,'Thanh Chương',40,0,1,NULL,NULL),
 (429,'Nghi Lộc',40,0,1,NULL,NULL),
 (430,'Nam Đàn',40,0,1,NULL,NULL),
 (431,'Hưng Nguyên',40,0,1,NULL,NULL),
 (436,'Hà Tĩnh',42,0,1,NULL,NULL),
 (437,'Hồng Lĩnh',42,0,1,NULL,NULL),
 (439,'Hương Sơn',42,0,1,NULL,NULL),
 (440,'Đức Thọ',42,0,1,NULL,NULL),
 (441,'Vũ Quang',42,0,1,NULL,NULL),
 (442,'Nghi Xuân',42,0,1,NULL,NULL),
 (443,'Can Lộc',42,0,1,NULL,NULL),
 (444,'Hương Khê',42,0,1,NULL,NULL),
 (445,'Thạch Hà',42,0,1,NULL,NULL),
 (446,'Cẩm Xuyên',42,0,1,NULL,NULL),
 (447,'Kỳ Anh',42,0,1,NULL,NULL),
 (448,'Lộc Hà',42,0,1,NULL,NULL),
 (450,'Đồng Hới',44,0,1,NULL,NULL),
 (452,'Minh Hóa',44,0,1,NULL,NULL),
 (453,'Tuyên Hóa',44,0,1,NULL,NULL),
 (454,'Quảng Trạch',44,0,1,NULL,NULL),
 (455,'Bố Trạch',44,0,1,NULL,NULL),
 (456,'Quảng Ninh',44,0,1,NULL,NULL),
 (457,'Lệ Thủy',44,0,1,NULL,NULL),
 (461,'Đông Hà',45,0,1,NULL,NULL),
 (462,'Quảng Trị',45,0,1,NULL,NULL),
 (464,'Vĩnh Linh',45,0,1,NULL,NULL),
 (465,'Hướng Hóa',45,0,1,NULL,NULL),
 (466,'Gio Linh',45,0,1,NULL,NULL),
 (467,'Đa Krông',45,0,1,NULL,NULL),
 (468,'Cam Lộ',45,0,1,NULL,NULL),
 (469,'Triệu Phong',45,0,1,NULL,NULL),
 (470,'Hải Lăng',45,0,1,NULL,NULL),
 (471,'Cồn Cỏ',45,0,1,NULL,NULL),
 (474,'Huế',46,0,1,NULL,NULL),
 (476,'Phong Điền',46,0,1,NULL,NULL),
 (477,'Quảng Điền',46,0,1,NULL,NULL),
 (478,'Phú Vang',46,0,1,NULL,NULL),
 (479,'Hương Thủy',46,0,1,NULL,NULL),
 (480,'Hương Trà',46,0,1,NULL,NULL),
 (481,'A Lưới',46,0,1,NULL,NULL),
 (482,'Phú Lộc',46,0,1,NULL,NULL),
 (483,'Nam Đông',46,0,1,NULL,NULL),
 (490,'Liên Chiểu',48,0,1,NULL,NULL),
 (491,'Thanh Khê',48,0,1,NULL,NULL),
 (492,'Hải Châu',48,0,1,NULL,NULL),
 (493,'Sơn Trà',48,0,1,NULL,NULL),
 (494,'Ngũ Hành Sơn',48,0,1,NULL,NULL),
 (495,'Cẩm Lệ',48,0,1,NULL,NULL),
 (497,'Hoà Vang',48,0,1,NULL,NULL),
 (498,'Hoàng Sa',48,0,1,NULL,NULL),
 (502,'Tam Kỳ',49,0,1,NULL,NULL),
 (503,'Hội An',49,0,1,NULL,NULL),
 (504,'Tây Giang',49,0,1,NULL,NULL),
 (505,'Đông Giang',49,0,1,NULL,NULL),
 (506,'Đại Lộc',49,0,1,NULL,NULL),
 (507,'Điện Bàn',49,0,1,NULL,NULL),
 (508,'Duy Xuyên',49,0,1,NULL,NULL),
 (509,'Quế Sơn',49,0,1,NULL,NULL),
 (510,'Nam Giang',49,0,1,NULL,NULL),
 (511,'Phước Sơn',49,0,1,NULL,NULL),
 (512,'Hiệp Đức',49,0,1,NULL,NULL),
 (513,'Thăng Bình',49,0,1,NULL,NULL),
 (514,'Tiên Phước',49,0,1,NULL,NULL),
 (515,'Bắc Trà My',49,0,1,NULL,NULL),
 (516,'Nam Trà My',49,0,1,NULL,NULL),
 (517,'Núi Thành',49,0,1,NULL,NULL),
 (518,'Phú Ninh',49,0,1,NULL,NULL),
 (519,'Nông Sơn',49,0,1,NULL,NULL),
 (522,'Quảng Ngãi',51,0,1,NULL,NULL),
 (524,'Bình Sơn',51,0,1,NULL,NULL),
 (525,'Trà Bồng',51,0,1,NULL,NULL),
 (526,'Tây Trà',51,0,1,NULL,NULL),
 (527,'Sơn Tịnh',51,0,1,NULL,NULL),
 (528,'Tư Nghĩa',51,0,1,NULL,NULL),
 (529,'Sơn Hà',51,0,1,NULL,NULL),
 (530,'Sơn Tây',51,0,1,NULL,NULL),
 (531,'Minh Long',51,0,1,NULL,NULL),
 (532,'Nghĩa Hành',51,0,1,NULL,NULL),
 (533,'Mộ Đức',51,0,1,NULL,NULL),
 (534,'Đức Phổ',51,0,1,NULL,NULL),
 (535,'Ba Tơ',51,0,1,NULL,NULL),
 (536,'Lý Sơn',51,0,1,NULL,NULL),
 (540,'Qui Nhơn',52,0,1,NULL,NULL),
 (542,'An Lão',52,0,1,NULL,NULL),
 (543,'Hoài Nhơn',52,0,1,NULL,NULL),
 (544,'Hoài Ân',52,0,1,NULL,NULL),
 (545,'Phù Mỹ',52,0,1,NULL,NULL),
 (546,'Vĩnh Thạnh',52,0,1,NULL,NULL),
 (547,'Tây Sơn',52,0,1,NULL,NULL),
 (548,'Phù Cát',52,0,1,NULL,NULL),
 (549,'An Nhơn',52,0,1,NULL,NULL),
 (550,'Tuy Phước',52,0,1,NULL,NULL),
 (551,'Vân Canh',52,0,1,NULL,NULL),
 (555,'Tuy Hòa',54,0,1,NULL,NULL),
 (557,'Sông Cầu',54,0,1,NULL,NULL),
 (558,'Đồng Xuân',54,0,1,NULL,NULL),
 (559,'Tuy An',54,0,1,NULL,NULL),
 (560,'Sơn Hòa',54,0,1,NULL,NULL),
 (561,'Sông Hinh',54,0,1,NULL,NULL),
 (562,'Tây Hoà',54,0,1,NULL,NULL),
 (563,'Phú Hoà',54,0,1,NULL,NULL),
 (564,'Đông Hoà',54,0,1,NULL,NULL),
 (568,'Nha Trang',56,0,1,NULL,NULL),
 (569,'Cam Ranh',56,0,1,NULL,NULL),
 (570,'Cam Lâm',56,0,1,NULL,NULL),
 (571,'Vạn Ninh',56,0,1,NULL,NULL),
 (572,'Ninh Hòa',56,0,1,NULL,NULL),
 (573,'Khánh Vĩnh',56,0,1,NULL,NULL),
 (574,'Diên Khánh',56,0,1,NULL,NULL),
 (575,'Khánh Sơn',56,0,1,NULL,NULL),
 (576,'Trường Sa',56,0,1,NULL,NULL),
 (582,'Phan Rang-Tháp Chàm',58,0,1,NULL,NULL),
 (584,'Bác Ái',58,0,1,NULL,NULL),
 (585,'Ninh Sơn',58,0,1,NULL,NULL),
 (586,'Ninh Hải',58,0,1,NULL,NULL),
 (587,'Ninh Phước',58,0,1,NULL,NULL),
 (588,'Thuận Bắc',58,0,1,NULL,NULL),
 (589,'Thuận Nam',58,0,1,NULL,NULL),
 (593,'Phan Thiết',60,0,1,NULL,NULL),
 (594,'La Gi',60,0,1,NULL,NULL),
 (595,'Tuy Phong',60,0,1,NULL,NULL),
 (596,'Bắc Bình',60,0,1,NULL,NULL),
 (597,'Hàm Thuận Bắc',60,0,1,NULL,NULL),
 (598,'Hàm Thuận Nam',60,0,1,NULL,NULL),
 (599,'Tánh Linh',60,0,1,NULL,NULL),
 (600,'Đức Linh',60,0,1,NULL,NULL),
 (601,'Hàm Tân',60,0,1,NULL,NULL),
 (602,'Phú Quí',60,0,1,NULL,NULL),
 (608,'Kon Tum',62,0,1,NULL,NULL),
 (610,'Đắk Glei',62,0,1,NULL,NULL),
 (611,'Ngọc Hồi',62,0,1,NULL,NULL),
 (612,'Đắk Tô',62,0,1,NULL,NULL),
 (613,'Kon Plông',62,0,1,NULL,NULL),
 (614,'Kon Rẫy',62,0,1,NULL,NULL),
 (615,'Đắk Hà',62,0,1,NULL,NULL),
 (616,'Sa Thầy',62,0,1,NULL,NULL),
 (617,'Tu Mơ Rông',62,0,1,NULL,NULL),
 (622,'Pleiku',64,0,1,NULL,NULL),
 (623,'An Khê',64,0,1,NULL,NULL),
 (624,'Ayun Pa',64,0,1,NULL,NULL),
 (625,'Kbang',64,0,1,NULL,NULL),
 (626,'Đăk Đoa',64,0,1,NULL,NULL),
 (627,'Chư Păh',64,0,1,NULL,NULL),
 (628,'Ia Grai',64,0,1,NULL,NULL),
 (629,'Mang Yang',64,0,1,NULL,NULL),
 (630,'Kông Chro',64,0,1,NULL,NULL),
 (631,'Đức Cơ',64,0,1,NULL,NULL),
 (632,'Chư Prông',64,0,1,NULL,NULL),
 (633,'Chư Sê',64,0,1,NULL,NULL),
 (634,'Đăk Pơ',64,0,1,NULL,NULL),
 (635,'Ia Pa',64,0,1,NULL,NULL),
 (637,'Krông Pa',64,0,1,NULL,NULL),
 (638,'Phú Thiện',64,0,1,NULL,NULL),
 (639,'Chư Pưh',64,0,1,NULL,NULL),
 (643,'Buôn Ma Thuột',66,0,1,NULL,NULL),
 (644,'Buôn Hồ',66,0,1,NULL,NULL),
 (645,'Ea H\'leo',66,0,1,NULL,NULL),
 (646,'Ea Súp',66,0,1,NULL,NULL),
 (647,'Buôn Đôn',66,0,1,NULL,NULL),
 (648,'Cư M\'gar',66,0,1,NULL,NULL),
 (649,'Krông Búk',66,0,1,NULL,NULL),
 (650,'Krông Năng',66,0,1,NULL,NULL),
 (651,'Ea Kar',66,0,1,NULL,NULL),
 (652,'M\'đrắk',66,0,1,NULL,NULL),
 (653,'Krông Bông',66,0,1,NULL,NULL),
 (654,'Krông Pắc',66,0,1,NULL,NULL),
 (655,'Krông A Na',66,0,1,NULL,NULL),
 (656,'Lắk',66,0,1,NULL,NULL),
 (657,'Cư Kuin',66,0,1,NULL,NULL),
 (660,'Gia Nghĩa',67,0,1,NULL,NULL),
 (661,'Đắk Glong',67,0,1,NULL,NULL),
 (662,'Cư Jút',67,0,1,NULL,NULL),
 (663,'Đắk Mil',67,0,1,NULL,NULL),
 (664,'Krông Nô',67,0,1,NULL,NULL),
 (665,'Đắk Song',67,0,1,NULL,NULL),
 (666,'Đắk R\'lấp',67,0,1,NULL,NULL),
 (667,'Tuy Đức',67,0,1,NULL,NULL),
 (672,'Đà Lạt',68,0,1,NULL,NULL),
 (673,'Bảo Lộc',68,0,1,NULL,NULL),
 (674,'Đam Rông',68,0,1,NULL,NULL),
 (675,'Lạc Dương',68,0,1,NULL,NULL),
 (676,'Lâm Hà',68,0,1,NULL,NULL),
 (677,'Đơn Dương',68,0,1,NULL,NULL),
 (678,'Đức Trọng',68,0,1,NULL,NULL),
 (679,'Di Linh',68,0,1,NULL,NULL),
 (680,'Bảo Lâm',68,0,1,NULL,NULL),
 (681,'Đạ Huoai',68,0,1,NULL,NULL),
 (682,'Đạ Tẻh',68,0,1,NULL,NULL),
 (683,'Cát Tiên',68,0,1,NULL,NULL),
 (688,'Phước Long',70,0,1,NULL,NULL),
 (689,'Đồng Xoài',70,0,1,NULL,NULL),
 (690,'Bình Long',70,0,1,NULL,NULL),
 (691,'Bù Gia Mập',70,0,1,NULL,NULL),
 (692,'Lộc Ninh',70,0,1,NULL,NULL),
 (693,'Bù Đốp',70,0,1,NULL,NULL),
 (694,'Hớn Quản',70,0,1,NULL,NULL),
 (695,'Đồng Phù',70,0,1,NULL,NULL),
 (696,'Bù Đăng',70,0,1,NULL,NULL),
 (697,'Chơn Thành',70,0,1,NULL,NULL),
 (703,'Tây Ninh',72,0,1,NULL,NULL),
 (705,'Tân Biên',72,0,1,NULL,NULL),
 (706,'Tân Châu',72,0,1,NULL,NULL),
 (707,'Dương Minh Châu',72,0,1,NULL,NULL),
 (708,'Châu Thành',72,0,1,NULL,NULL),
 (709,'Hòa Thành',72,0,1,NULL,NULL),
 (710,'Gò Dầu',72,0,1,NULL,NULL),
 (711,'Bến Cầu',72,0,1,NULL,NULL),
 (712,'Trảng Bàng',72,0,1,NULL,NULL),
 (718,'Thủ Dầu Một',74,0,1,NULL,NULL),
 (720,'Dầu Tiếng',74,0,1,NULL,NULL),
 (721,'Bến Cát',74,0,1,NULL,NULL),
 (722,'Phú Giáo',74,0,1,NULL,NULL),
 (723,'Tân Uyên',74,0,1,NULL,NULL),
 (724,'Dĩ An',74,0,1,NULL,NULL),
 (725,'Thuận An',74,0,1,NULL,NULL),
 (731,'Biên Hòa',75,0,1,NULL,NULL),
 (732,'Long Khánh',75,0,1,NULL,NULL),
 (734,'Tân Phú',75,0,1,NULL,NULL),
 (735,'Vĩnh Cửu',75,0,1,NULL,NULL),
 (736,'Định Quán',75,0,1,NULL,NULL),
 (737,'Trảng Bom',75,0,1,NULL,NULL),
 (738,'Thống Nhất',75,0,1,NULL,NULL),
 (739,'Cẩm Mỹ',75,0,1,NULL,NULL),
 (740,'Long Thành',75,0,1,NULL,NULL),
 (741,'Xuân Lộc',75,0,1,NULL,NULL),
 (742,'Nhơn Trạch',75,0,1,NULL,NULL),
 (747,'Vũng Tầu',77,0,1,NULL,NULL),
 (748,'Bà Rịa',77,0,1,NULL,NULL),
 (750,'Châu Đức',77,0,1,NULL,NULL),
 (751,'Xuyên Mộc',77,0,1,NULL,NULL),
 (752,'Long Điền',77,0,1,NULL,NULL),
 (753,'Đất Đỏ',77,0,1,NULL,NULL),
 (754,'Tân Thành',77,0,1,NULL,NULL),
 (755,'Côn Đảo',77,0,1,NULL,NULL),
 (760,'1',79,0,1,NULL,NULL),
 (761,'12',79,0,1,NULL,NULL),
 (762,'Thủ Đức',79,0,1,NULL,NULL),
 (763,'9',79,0,1,NULL,NULL),
 (764,'Gò Vấp',79,0,1,NULL,NULL),
 (765,'Bình Thạnh',79,0,1,NULL,NULL),
 (766,'Tân Bình',79,0,1,NULL,NULL),
 (767,'Tân Phú',79,0,1,NULL,NULL),
 (768,'Phú Nhuận',79,0,1,NULL,NULL),
 (769,'2',79,0,1,NULL,NULL),
 (770,'3',79,0,1,NULL,NULL),
 (771,'10',79,0,1,NULL,NULL),
 (772,'11',79,0,1,NULL,NULL),
 (773,'4',79,0,1,NULL,NULL),
 (774,'5',79,0,1,NULL,NULL),
 (775,'6',79,0,1,NULL,NULL),
 (776,'8',79,0,1,NULL,NULL),
 (777,'Bình Tân',79,0,1,NULL,NULL),
 (778,'7',79,0,1,NULL,NULL),
 (783,'Củ Chi',79,0,1,NULL,NULL),
 (784,'Hóc Môn',79,0,1,NULL,NULL),
 (785,'Bình Chánh',79,0,1,NULL,NULL),
 (786,'Nhà Bè',79,0,1,NULL,NULL),
 (787,'Cần Giờ',79,0,1,NULL,NULL),
 (794,'Tân An',80,0,1,NULL,NULL),
 (796,'Tân Hưng',80,0,1,NULL,NULL),
 (797,'Vĩnh Hưng',80,0,1,NULL,NULL),
 (798,'Mộc Hóa',80,0,1,NULL,NULL),
 (799,'Tân Thạnh',80,0,1,NULL,NULL),
 (800,'Thạnh Hóa',80,0,1,NULL,NULL),
 (801,'Đức Huệ',80,0,1,NULL,NULL),
 (802,'Đức Hòa',80,0,1,NULL,NULL),
 (803,'Bến Lức',80,0,1,NULL,NULL),
 (804,'Thủ Thừa',80,0,1,NULL,NULL),
 (805,'Tân Trụ',80,0,1,NULL,NULL),
 (806,'Cần Đước',80,0,1,NULL,NULL),
 (807,'Cần Giuộc',80,0,1,NULL,NULL),
 (808,'Châu Thành',80,0,1,NULL,NULL),
 (815,'Mỹ Tho',82,0,1,NULL,NULL),
 (816,'Gò Công',82,0,1,NULL,NULL),
 (818,'Tân Phước',82,0,1,NULL,NULL),
 (819,'Cái Bè',82,0,1,NULL,NULL),
 (820,'Cai Lậy',82,0,1,NULL,NULL),
 (821,'Châu Thành',82,0,1,NULL,NULL),
 (822,'Chợ Gạo',82,0,1,NULL,NULL),
 (823,'Gò Công Tây',82,0,1,NULL,NULL),
 (824,'Gò Công Đông',82,0,1,NULL,NULL),
 (825,'Tân Phú Đông',82,0,1,NULL,NULL),
 (829,'Bến Tre',83,0,1,NULL,NULL),
 (831,'Châu Thành',83,0,1,NULL,NULL),
 (832,'Chợ Lách',83,0,1,NULL,NULL),
 (833,'Mỏ Cày Nam',83,0,1,NULL,NULL),
 (834,'Giồng Trôm',83,0,1,NULL,NULL),
 (835,'Bình Đại',83,0,1,NULL,NULL),
 (836,'Ba Tri',83,0,1,NULL,NULL),
 (837,'Thạnh Phú',83,0,1,NULL,NULL),
 (838,'Mỏ Cày Bắc',83,0,1,NULL,NULL),
 (842,'Trà Vinh',84,0,1,NULL,NULL),
 (844,'Càng Long',84,0,1,NULL,NULL),
 (845,'Cầu Kè',84,0,1,NULL,NULL),
 (846,'Tiểu Cần',84,0,1,NULL,NULL),
 (847,'Châu Thành',84,0,1,NULL,NULL),
 (848,'Cầu Ngang',84,0,1,NULL,NULL),
 (849,'Trà Cú',84,0,1,NULL,NULL),
 (850,'Duyên Hải',84,0,1,NULL,NULL),
 (855,'Vĩnh Long',86,0,1,NULL,NULL),
 (857,'Long Hồ',86,0,1,NULL,NULL),
 (858,'Mang Thít',86,0,1,NULL,NULL),
 (859,'Vũng Liêm',86,0,1,NULL,NULL),
 (860,'Tam Bình',86,0,1,NULL,NULL),
 (861,'Bình Minh',86,0,1,NULL,NULL),
 (862,'Trà Ôn',86,0,1,NULL,NULL),
 (863,'Bình Tân',86,0,1,NULL,NULL),
 (866,'Cao Lãnh',87,0,1,NULL,NULL),
 (867,'Sa Đéc',87,0,1,NULL,NULL),
 (868,'Hồng Ngự',87,0,1,NULL,NULL),
 (869,'Tân Hồng',87,0,1,NULL,NULL),
 (870,'Hồng Ngự',87,0,1,NULL,NULL),
 (871,'Tam Nông',87,0,1,NULL,NULL),
 (872,'Tháp Mười',87,0,1,NULL,NULL),
 (873,'Cao Lãnh',87,0,1,NULL,NULL),
 (874,'Thanh Bình',87,0,1,NULL,NULL),
 (875,'Lấp Vò',87,0,1,NULL,NULL),
 (876,'Lai Vung',87,0,1,NULL,NULL),
 (877,'Châu Thành',87,0,1,NULL,NULL),
 (883,'Long Xuyên',89,0,1,NULL,NULL),
 (884,'Châu Đốc',89,0,1,NULL,NULL),
 (886,'An Phú',89,0,1,NULL,NULL),
 (887,'Tân Châu',89,0,1,NULL,NULL),
 (888,'Phú Tân',89,0,1,NULL,NULL),
 (889,'Châu Phú',89,0,1,NULL,NULL),
 (890,'Tịnh Biên',89,0,1,NULL,NULL),
 (891,'Tri Tôn',89,0,1,NULL,NULL),
 (892,'Châu Thành',89,0,1,NULL,NULL),
 (893,'Chợ Mới',89,0,1,NULL,NULL),
 (894,'Thoại Sơn',89,0,1,NULL,NULL),
 (899,'Rạch Giá',91,0,1,NULL,NULL),
 (900,'Hà Tiên',91,0,1,NULL,NULL),
 (902,'Kiên Lương',91,0,1,NULL,NULL),
 (903,'Hòn Đất',91,0,1,NULL,NULL),
 (904,'Tân Hiệp',91,0,1,NULL,NULL),
 (905,'Châu Thành',91,0,1,NULL,NULL),
 (906,'Giồng Giềng',91,0,1,NULL,NULL),
 (907,'Gò Quao',91,0,1,NULL,NULL),
 (908,'An Biên',91,0,1,NULL,NULL),
 (909,'An Minh',91,0,1,NULL,NULL),
 (910,'Vĩnh Thuận',91,0,1,NULL,NULL),
 (911,'Phú Quốc',91,0,1,NULL,NULL),
 (912,'Kiên Hải',91,0,1,NULL,NULL),
 (913,'U Minh Thượng',91,0,1,NULL,NULL),
 (914,'Giang Thành',91,0,1,NULL,NULL),
 (916,'Ninh Kiều',92,0,1,NULL,NULL),
 (917,'Ô Môn',92,0,1,NULL,NULL),
 (918,'Bình Thuỷ',92,0,1,NULL,NULL),
 (919,'Cái Răng',92,0,1,NULL,NULL),
 (923,'Thốt Nốt',92,0,1,NULL,NULL),
 (924,'Vĩnh Thạnh',92,0,1,NULL,NULL),
 (925,'Cờ Đỏ',92,0,1,NULL,NULL),
 (926,'Phong Điền',92,0,1,NULL,NULL),
 (927,'Thới Lai',92,0,1,NULL,NULL),
 (930,'Vị Thanh',93,0,1,NULL,NULL),
 (931,'Ngã Bảy',93,0,1,NULL,NULL),
 (932,'Châu Thành A',93,0,1,NULL,NULL),
 (933,'Châu Thành',93,0,1,NULL,NULL),
 (934,'Phụng Hiệp',93,0,1,NULL,NULL),
 (935,'Vị Thuỷ',93,0,1,NULL,NULL),
 (936,'Long Mỹ',93,0,1,NULL,NULL),
 (941,'Sóc Trăng',94,0,1,NULL,NULL),
 (942,'Châu Thành',94,0,1,NULL,NULL),
 (943,'Kế Sách',94,0,1,NULL,NULL),
 (944,'Mỹ Tú',94,0,1,NULL,NULL),
 (945,'Cù Lao Dung',94,0,1,NULL,NULL),
 (946,'Long Phú',94,0,1,NULL,NULL),
 (947,'Mỹ Xuyên',94,0,1,NULL,NULL),
 (948,'Ngã Năm',94,0,1,NULL,NULL),
 (949,'Thạnh Trị',94,0,1,NULL,NULL),
 (950,'Vĩnh Châu',94,0,1,NULL,NULL),
 (951,'Trần Đề',94,0,1,NULL,NULL),
 (954,'Bạc Liêu',95,0,1,NULL,NULL),
 (956,'Hồng Dân',95,0,1,NULL,NULL),
 (957,'Phước Long',95,0,1,NULL,NULL),
 (958,'Vĩnh Lợi',95,0,1,NULL,NULL),
 (959,'Giá Rai',95,0,1,NULL,NULL),
 (960,'Đông Hải',95,0,1,NULL,NULL),
 (961,'Hoà Bình',95,0,1,NULL,NULL),
 (964,'Cà Mau',96,0,1,NULL,NULL),
 (966,'U Minh',96,0,1,NULL,NULL),
 (967,'Thới Bình',96,0,1,NULL,NULL),
 (968,'Trần Văn Thời',96,0,1,NULL,NULL),
 (969,'Cái Nước',96,0,1,NULL,NULL),
 (970,'Đầm Dơi',96,0,1,NULL,NULL),
 (971,'Năm Căn',96,0,1,NULL,NULL),
 (972,'Phú Tân',96,0,1,NULL,NULL),
 (973,'Ngọc Hiển',96,0,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

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
 (49,22,1,'Hungnm yeu cau cham cong ngay','<p>edsfdsfsd</p>',0,'2014-05-10 23:07:02','2014-05-10 23:07:02'),
 (50,22,22,'Yeu cau cham cong ngay','<p>&aacute;dasds</p>',0,'2014-05-10 23:07:42','2014-05-10 23:07:42');
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
  `tinh_name` varchar(100) NOT NULL,
  `tinh_order` int(10) unsigned NOT NULL DEFAULT '0',
  `tinh_status` int(10) unsigned NOT NULL DEFAULT '1',
  `tinh_date_added` datetime DEFAULT NULL,
  `tinh_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`tinh_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tinh`
--

/*!40000 ALTER TABLE `tinh` DISABLE KEYS */;
INSERT INTO `tinh` (`tinh_id`,`tinh_name`,`tinh_order`,`tinh_status`,`tinh_date_added`,`tinh_date_modified`) VALUES 
 (1,'HÃ  Ná»™i',0,1,NULL,'2014-05-11 16:35:13'),
 (2,'Hà Giang',0,1,NULL,NULL),
 (4,'Cao Bằng',0,1,NULL,NULL),
 (6,'Bắc Kạn',0,1,NULL,NULL),
 (8,'Tuyên Quang',0,1,NULL,NULL),
 (10,'Lào Cai',0,1,NULL,NULL),
 (11,'Điện Biên',0,1,NULL,NULL),
 (12,'Lai Châu',0,1,NULL,NULL),
 (14,'Sơn La',0,1,NULL,NULL),
 (15,'Yên Bái',0,1,NULL,NULL),
 (17,'Hòa Bình',0,1,NULL,NULL),
 (19,'Thái Nguyên',0,1,NULL,NULL),
 (20,'Lạng Sơn',0,1,NULL,NULL),
 (22,'Quảng Ninh',0,1,NULL,NULL),
 (24,'Bắc Giang',0,1,NULL,NULL),
 (25,'Phú Thọ',0,1,NULL,NULL),
 (26,'Vĩnh Phúc',0,1,NULL,NULL),
 (27,'Báº¯c Ninh',0,1,NULL,'2014-05-11 16:35:28'),
 (30,'Háº£i DÆ°Æ¡ng',0,1,NULL,'2014-05-11 16:35:41'),
 (31,'Hải Phòng',0,1,NULL,NULL),
 (33,'Hưng Yên',0,1,NULL,NULL),
 (34,'Thái Bình',0,1,NULL,NULL),
 (35,'Hà Nam',0,1,NULL,NULL),
 (36,'Nam Định',0,1,NULL,NULL),
 (37,'Ninh Bình',0,1,NULL,NULL),
 (38,'Thanh Hóa',0,1,NULL,NULL),
 (40,'Nghệ An',0,1,NULL,NULL),
 (42,'Hà Tĩnh',0,1,NULL,NULL),
 (44,'Quảng Bình',0,1,NULL,NULL),
 (45,'Quảng Trị',0,1,NULL,NULL),
 (46,'Thừa Thiên Huế',0,1,NULL,NULL),
 (48,'Đà Nẵng',0,1,NULL,NULL),
 (49,'Quảng Nam',0,1,NULL,NULL),
 (51,'Quáº£ng NgÃ£i',0,1,NULL,'2014-05-11 23:22:14'),
 (52,'BÃ¬nh Äá»‹nh',0,1,NULL,'2014-05-11 23:21:54'),
 (54,'PhÃº YÃªn',0,1,NULL,'2014-05-11 22:52:48'),
 (56,'KhÃ¡nh HÃ²a',0,1,NULL,'2014-05-11 22:52:28'),
 (58,'Ninh Thuáº­n',0,1,NULL,'2014-05-11 22:52:11'),
 (60,'BÃ¬nh Thuáº­n',0,1,NULL,'2014-05-11 22:51:53'),
 (62,'Kon Tum',0,1,NULL,NULL),
 (64,'Gia Lai',0,1,NULL,NULL),
 (66,'Äáº¯c Láº¯c',0,1,NULL,'2014-05-11 22:51:31'),
 (67,'Äáº¯c NÃ´ng',0,1,NULL,'2014-05-11 22:51:14'),
 (68,'LÃ¢m Äá»“ng',0,1,NULL,'2014-05-11 22:50:54'),
 (70,'BÃ¬nh PhÆ°á»›c',0,1,NULL,'2014-05-11 22:50:35'),
 (72,'TÃ¢y Ninh',0,1,NULL,'2014-05-11 22:48:29'),
 (74,'Bình Dương',0,1,NULL,NULL),
 (75,'Đồng Nai',0,1,NULL,NULL),
 (77,'Bà Rịa - Vũng Tàu',0,1,NULL,NULL),
 (79,'Hồ Chí Minh',0,1,NULL,NULL),
 (80,'Long An',0,1,NULL,NULL),
 (82,'Tiền Giang',0,1,NULL,NULL),
 (83,'Bến Tre',0,1,NULL,NULL),
 (84,'Trà Vinh',0,1,NULL,NULL),
 (86,'Vĩnh Long',0,1,NULL,NULL),
 (87,'Đồng Tháp',0,1,NULL,NULL),
 (89,'An Giang',0,1,NULL,NULL),
 (91,'Kiên Giang',0,1,NULL,NULL),
 (92,'Cần Thơ',0,1,NULL,NULL),
 (93,'Hậu Giang',0,1,NULL,NULL),
 (94,'Sóc Trăng',0,1,NULL,NULL),
 (95,'Bạc Liêu',0,1,NULL,NULL),
 (96,'CÃ  Mau',0,1,NULL,'2014-05-11 22:48:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;

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
 (117,1,1399734390,'::1'),
 (118,1,1399779489,'::1'),
 (119,1,1399822591,'::1'),
 (120,1,1399822795,'192.168.5.101'),
 (121,1,1399823262,'192.168.5.102');
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
