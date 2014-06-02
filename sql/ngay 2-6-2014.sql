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
  `bl_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bl_he_so_luong` text COLLATE utf8_unicode_ci NOT NULL,
  `bl_status` int(10) unsigned NOT NULL DEFAULT '1',
  `bl_date_modified` datetime DEFAULT NULL,
  `bl_date_added` datetime DEFAULT NULL,
  `bl_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bac_luong`
--

/*!40000 ALTER TABLE `bac_luong` DISABLE KEYS */;
INSERT INTO `bac_luong` (`bl_id`,`bl_name`,`bl_he_so_luong`,`bl_status`,`bl_date_modified`,`bl_date_added`,`bl_order`) VALUES 
 (1,'1','a:9:{i:4;s:4:\"2.34\";i:5;s:3:\"4.4\";i:6;s:4:\"1.86\";i:7;s:4:\"1.65\";i:8;s:3:\"2.1\";i:9;s:4:\"1.35\";i:10;s:3:\"1.5\";i:11;s:4:\"2.05\";i:12;s:1:\"1\";}',1,'2014-05-14 19:04:22','2014-05-14 19:04:22',0),
 (2,'2','a:9:{i:4;s:4:\"2.67\";i:5;s:4:\"4.74\";i:6;s:4:\"2.06\";i:7;s:4:\"1.83\";i:8;s:4:\"2.41\";i:9;s:4:\"1.53\";i:10;s:4:\"1.68\";i:11;s:4:\"2.23\";i:12;s:4:\"1.18\";}',1,'2014-05-14 19:05:47','2014-05-14 19:05:47',0),
 (3,'3','a:9:{i:4;s:1:\"3\";i:5;s:4:\"5.08\";i:6;s:4:\"2.26\";i:7;s:4:\"2.01\";i:8;s:4:\"2.72\";i:9;s:4:\"1.71\";i:10;s:4:\"1.86\";i:11;s:4:\"2.41\";i:12;s:4:\"1.36\";}',1,'2014-05-14 19:07:06','2014-05-14 19:07:06',0),
 (4,'4','a:9:{i:4;s:4:\"3.33\";i:5;s:4:\"5.42\";i:6;s:4:\"2.46\";i:7;s:4:\"2.19\";i:8;s:4:\"3.03\";i:9;s:4:\"1.89\";i:10;s:4:\"2.04\";i:11;s:4:\"2.59\";i:12;s:4:\"1.54\";}',1,'2014-05-14 19:08:34','2014-05-14 19:08:34',0),
 (5,'5','a:9:{i:4;s:4:\"3.66\";i:5;s:4:\"5.76\";i:6;s:4:\"2.66\";i:7;s:4:\"2.37\";i:8;s:4:\"3.34\";i:9;s:4:\"2.07\";i:10;s:4:\"2.22\";i:11;s:4:\"2.77\";i:12;s:4:\"1.72\";}',1,'2014-05-14 19:09:46','2014-05-14 19:09:46',0),
 (6,'6','a:9:{i:4;s:4:\"3.99\";i:5;s:3:\"6.1\";i:6;s:4:\"2.86\";i:7;s:4:\"2.55\";i:8;s:4:\"3.65\";i:9;s:4:\"2.25\";i:10;s:3:\"2.4\";i:11;s:4:\"2.95\";i:12;s:3:\"1.9\";}',1,'2014-05-14 19:10:57','2014-05-14 19:10:57',0),
 (7,'7','a:9:{i:4;s:4:\"4.32\";i:5;s:4:\"6.44\";i:6;s:4:\"3.06\";i:7;s:4:\"2.73\";i:8;s:4:\"3.96\";i:9;s:4:\"2.43\";i:10;s:4:\"2.58\";i:11;s:4:\"3.13\";i:12;s:4:\"2.08\";}',1,'2014-05-14 19:12:33','2014-05-14 19:12:33',0),
 (8,'8','a:9:{i:4;s:4:\"4.65\";i:5;s:4:\"6.78\";i:6;s:4:\"3.26\";i:7;s:4:\"2.91\";i:8;s:4:\"4.27\";i:9;s:4:\"2.61\";i:10;s:4:\"2.76\";i:11;s:4:\"3.31\";i:12;s:4:\"2.26\";}',1,'2014-05-14 19:13:32','2014-05-14 19:13:32',0),
 (9,'9','a:9:{i:4;s:4:\"4.98\";i:5;s:4:\"6.78\";i:6;s:4:\"3.46\";i:7;s:4:\"3.09\";i:8;s:4:\"4.58\";i:9;s:4:\"2.79\";i:10;s:4:\"2.94\";i:11;s:4:\"3.49\";i:12;s:4:\"2.44\";}',1,'2014-05-14 19:15:14','2014-05-14 19:15:14',0),
 (10,'10','a:9:{i:4;s:4:\"4.98\";i:5;s:4:\"6.78\";i:6;s:4:\"3.66\";i:7;s:4:\"3.27\";i:8;s:4:\"4.89\";i:9;s:4:\"2.97\";i:10;s:4:\"3.12\";i:11;s:4:\"3.67\";i:12;s:4:\"2.62\";}',1,'2014-05-14 19:16:25','2014-05-14 19:16:25',0),
 (11,'11','a:9:{i:4;s:4:\"4.98\";i:5;s:4:\"6.78\";i:6;s:4:\"3.86\";i:7;s:4:\"3.45\";i:8;s:4:\"4.89\";i:9;s:4:\"3.15\";i:10;s:3:\"3.3\";i:11;s:4:\"3.85\";i:12;s:3:\"2.8\";}',1,'2014-05-14 19:17:35','2014-05-14 19:17:35',0),
 (12,'12','a:9:{i:4;s:4:\"4.98\";i:5;s:4:\"6.78\";i:6;s:4:\"4.06\";i:7;s:4:\"3.63\";i:8;s:4:\"4.89\";i:9;s:4:\"3.33\";i:10;s:4:\"3.48\";i:11;s:4:\"4.03\";i:12;s:4:\"2.98\";}',1,'2014-05-14 19:18:41','2014-05-14 19:18:41',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bang_cap`
--

/*!40000 ALTER TABLE `bang_cap` DISABLE KEYS */;
INSERT INTO `bang_cap` (`bc_id`,`bc_name`,`bc_order`,`bc_status`,`bc_date_added`,`bc_date_modified`) VALUES 
 (8,'Tháº¡c sÄ©',4,1,'2013-11-09 22:37:08','2014-04-16 22:41:41'),
 (9,'Trung cáº¥p',1,1,'2014-02-23 16:57:26','2014-02-23 16:57:26'),
 (10,'Cao Ä‘áº³ng',2,1,'2014-02-23 16:57:33','2014-02-25 21:16:37'),
 (11,'Äáº¡i há»c',3,1,'2014-02-23 16:57:40','2014-02-23 16:57:40'),
 (12,'Tiáº¿n sÄ©',5,1,'2014-04-16 22:42:02','2014-04-16 22:42:02');
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
  `bl_giai_doan` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: chinh thuc, 1: thu viec',
  `bl_loai_luong` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: bien che, 1: hop dong',
  `bl_bhxh` float NOT NULL DEFAULT '0',
  `bl_bhyt` float NOT NULL DEFAULT '0',
  `bl_pc_tang_them` float NOT NULL DEFAULT '0',
  `bl_pc_kiem_nhiem` float NOT NULL DEFAULT '0',
  `bl_hs_luong` float NOT NULL DEFAULT '0',
  `bl_hs_pc_cong_viec` float NOT NULL DEFAULT '0',
  `bl_hs_pc_trach_nhiem` float NOT NULL DEFAULT '0',
  `bl_hs_pc_khu_vuc` float NOT NULL DEFAULT '0',
  `bl_hs_pc_tnvk` float NOT NULL DEFAULT '0',
  `bl_tham_nien` float NOT NULL DEFAULT '0' COMMENT 'phu cap tham nien (%)',
  `bl_hs_pc_udn` float NOT NULL DEFAULT '0',
  `bl_hs_pc_cong_vu` float NOT NULL DEFAULT '0',
  `bl_hs_pc_khac` float NOT NULL DEFAULT '0',
  `bl_date` datetime NOT NULL,
  `bl_luong_thu_viec` float NOT NULL DEFAULT '0',
  `bl_time_tham_nien` datetime DEFAULT NULL,
  `bl_pc_thu_hut` float NOT NULL DEFAULT '0',
  `bl_pc_khac_type` int(10) unsigned NOT NULL DEFAULT '0',
  `bl_phan_loai` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `bl_phan_loai_he_so` float NOT NULL DEFAULT '0',
  `bl_pc_doc_hai` float NOT NULL DEFAULT '0',
  `bl_pc_doc_hai_type` int(10) unsigned NOT NULL DEFAULT '0',
  `bl_tong_he_so` float NOT NULL DEFAULT '0',
  `bl_tong_he_so_ca_nhan` float NOT NULL DEFAULT '0',
  `bl_tong_he_so_plld` float NOT NULL DEFAULT '0',
  `bl_tam_chi_dau_vao` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bang_luong`
--

/*!40000 ALTER TABLE `bang_luong` DISABLE KEYS */;
INSERT INTO `bang_luong` (`bl_id`,`bl_em_id`,`bl_ptccb_id`,`bl_date_added`,`bl_date_modified`,`bl_luong_toi_thieu`,`bl_giai_doan`,`bl_loai_luong`,`bl_bhxh`,`bl_bhyt`,`bl_pc_tang_them`,`bl_pc_kiem_nhiem`,`bl_hs_luong`,`bl_hs_pc_cong_viec`,`bl_hs_pc_trach_nhiem`,`bl_hs_pc_khu_vuc`,`bl_hs_pc_tnvk`,`bl_tham_nien`,`bl_hs_pc_udn`,`bl_hs_pc_cong_vu`,`bl_hs_pc_khac`,`bl_date`,`bl_luong_thu_viec`,`bl_time_tham_nien`,`bl_pc_thu_hut`,`bl_pc_khac_type`,`bl_phan_loai`,`bl_phan_loai_he_so`,`bl_pc_doc_hai`,`bl_pc_doc_hai_type`,`bl_tong_he_so`,`bl_tong_he_so_ca_nhan`,`bl_tong_he_so_plld`,`bl_tam_chi_dau_vao`) VALUES 
 (4,1,1,'2014-04-15 01:06:45','2014-04-16 21:35:55',1150000,0,0,8,1.5,0.5,9.1,3.66,0,0,0,0,1,0,0,1,'2014-04-01 00:00:07',0,NULL,20,0,'A',1.2,0,0,0,0,0,0),
 (5,1,1,'2014-04-16 21:36:07','2014-04-16 21:36:07',1150000,0,0,8,1.5,0.5,9.1,1.1,2.1,4.1,5.1,6.1,13,7.1,8.1,10.1,'2014-03-01 00:00:07',0,NULL,3.1,0,'A',1.2,0,0,0,0,0,0),
 (6,13,13,'2014-04-16 21:38:08','2014-04-16 21:38:08',1150000,0,0,8,1.5,0.5,0,3,0.3,0,0,0,9,20,25,0,'2014-04-01 00:00:07',0,NULL,0,0,'A',1.2,0,0,0,0,0,0),
 (7,1,1,'2014-04-16 21:38:09','2014-04-16 21:38:09',1150000,0,0,8,1.5,0.5,9.1,1.1,2.1,4.1,5.1,6.1,13,7.1,8.1,10.1,'2014-02-01 00:00:07',0,NULL,3.1,0,'A',1.2,0,0,0,0,0,0),
 (8,19,13,'2014-04-17 22:59:09','2014-04-17 22:59:09',1150000,0,0,8,1.5,0.5,0,2.34,0,0,0,0,1,20,25,0,'2014-03-01 00:00:07',0,NULL,0,0,'A',1.2,0,0,0,0,0,0),
 (9,19,13,'2014-04-17 22:59:35','2014-04-17 22:59:35',1150000,0,0,8,1.5,0.5,0,2.34,0,0,0,0,1,20,25,0,'2014-04-01 00:00:07',0,NULL,0,0,'A',1.2,0,0,0,0,0,0),
 (10,67,69,'2014-05-15 03:53:48','2014-05-15 23:01:51',1150000,0,0,8,1.5,0.5,0,4.32,0.5,0,0,0,23,20,25,0,'2014-04-01 00:00:07',0,NULL,0,0,'A',1.2,0,0,0,0,0,0),
 (11,73,69,'2014-05-15 22:52:39','2014-05-15 22:52:39',1150000,0,0,8,1.5,0.5,0,2.34,0,0,0,0,1,20,25,0,'2014-05-01 00:00:07',0,NULL,0,0,'A',1.2,0,0,0,0,0,0),
 (12,73,69,'2014-05-15 22:52:55','2014-05-15 22:56:16',1150000,0,0,8,1.5,0.5,0,2.34,0,0,0,0,1,20,25,0,'2014-04-01 00:00:07',0,NULL,0,0,'',0,0,0,0,0,0,0),
 (13,68,69,'2014-05-15 22:53:46','2014-05-15 22:53:46',1150000,0,0,8,1.5,0.5,0,4.74,0.3,0,0,0,19,15,25,0,'2014-04-01 00:00:07',0,NULL,0,0,'',0,0,0,0,0,0,0),
 (14,69,69,'2014-05-15 22:54:11','2014-05-15 22:54:11',1150000,0,0,8,1.5,0.5,0,3,0.3,0,0,0,8,20,25,0,'2014-04-01 00:00:07',0,NULL,0,0,'A',1.2,0,0,0,0,0,0),
 (15,70,69,'2014-05-15 22:54:37','2014-05-15 22:54:37',1150000,0,0,8,1.5,0.5,0,3.66,0,0,0,0,12,20,25,0,'2014-04-01 00:00:07',0,NULL,0,0,'',0,0,0,0,0,0,0),
 (16,71,69,'2014-05-15 22:55:03','2014-05-15 22:55:03',1150000,0,0,8,1.5,0.5,0,2.67,0,0,0,0,3,20,25,0,'2014-04-01 00:00:07',0,NULL,0,0,'',0,0,0,0,0,0,0),
 (17,72,69,'2014-05-15 22:55:38','2014-05-15 22:55:38',1150000,0,0,8,1.5,0.5,0,2.34,0,0,0,0,1,20,25,0,'2014-04-01 00:00:07',0,NULL,0,0,'',0,0,0,0,0,0,0),
 (18,70,73,'2014-05-16 04:47:41','2014-05-16 04:47:41',1150000,0,0,8,1.5,0.5,0,4.32,0,0,0.5,0,12,20,25,0,'2014-05-01 00:00:07',0,NULL,0,0,'A',1.2,0,0,0,0,0,0),
 (20,67,69,'2014-05-31 21:50:15','2014-06-02 06:34:09',1150000,0,0,8,1.5,0.5,0,4.32,0.5,0.15,0,0,22,20,25,0,'2014-05-01 00:00:07',0,'1992-04-01 00:00:07',0,0,'A',1.2,0,0,8.19,5.78,6.93,4709250),
 (21,69,69,'2014-05-31 21:57:00','2014-06-01 14:53:48',1150000,0,0,8,1.5,0.5,0,3,0.3,0.3,0,0,8,20,0,0,'2014-05-01 00:00:07',0,'2006-05-01 00:00:07',0,0,'A',1.2,0,0,4.52,3.96,4.75,2599000),
 (22,67,69,'2014-06-01 11:47:56','2014-06-01 11:47:56',1150000,0,0,8,1.5,0.5,0,4.32,0.5,0.15,0,0,22,20,0,0,'2014-06-01 00:00:07',0,'1992-04-01 00:00:07',0,0,NULL,1.2,0,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cham_cong`
--

/*!40000 ALTER TABLE `cham_cong` DISABLE KEYS */;
INSERT INTO `cham_cong` (`c_id`,`c_em_id`,`c_thang`,`c_nam`,`c_ngay_1`,`c_ngay_2`,`c_ngay_3`,`c_ngay_4`,`c_ngay_5`,`c_ngay_6`,`c_ngay_7`,`c_ngay_8`,`c_ngay_9`,`c_ngay_10`,`c_ngay_11`,`c_ngay_12`,`c_ngay_13`,`c_ngay_14`,`c_ngay_15`,`c_ngay_16`,`c_ngay_17`,`c_ngay_18`,`c_ngay_19`,`c_ngay_20`,`c_ngay_21`,`c_ngay_22`,`c_ngay_23`,`c_ngay_24`,`c_ngay_25`,`c_ngay_26`,`c_ngay_27`,`c_ngay_28`,`c_ngay_29`,`c_ngay_30`,`c_ngay_31`,`c_don_vi_status`,`c_ptccb_status`,`c_date_created`,`c_date_modifyed`) VALUES 
 (2,1,2,2014,'9','','','','','','','9','8','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0','','','','4','','','',-1,-1,'2014-02-08 23:08:39','2014-02-08 23:18:29'),
 (3,17,2,2014,'9','8','0','0','-2','-2','-2','9','8','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0','0','0','0','0','','','',-1,1,'2014-02-28 03:30:37','2014-02-28 03:30:37'),
 (4,13,2,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',-1,-1,'2014-03-05 22:10:15','2014-03-05 22:10:15'),
 (5,1,4,2014,'-2','8','4','9','5','','-2','0','0','','','','','','','','','','','','','','','','','','','','','','',-1,-1,'2014-04-15 00:42:06','2014-04-15 00:42:06'),
 (6,13,3,2014,'9','9','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0',-1,1,'2014-04-16 03:26:56','2014-04-16 21:31:34'),
 (7,13,4,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','9','8','0','0','0','',-1,1,'2014-04-16 03:32:37','2014-04-16 03:32:37'),
 (8,19,3,2014,'0','8','0','0','0','0','0','9','8','0','0','0','0','0','9','0','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0',-1,1,'2014-04-17 22:39:16','2014-04-17 22:39:16'),
 (9,19,4,2014,'0','0','0','0','9','8','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0','','','','0','9','8','0','0','0','',1,1,'2014-04-17 22:42:05','2014-04-17 22:42:05'),
 (10,13,5,2014,'23','23','23','','23','23','23','23','23','23','','23','24','23','15','23','23','','23','23','23','23','23','23','','23','23','23','23','23','13',-1,-1,'2014-05-14 19:28:36','2014-05-14 19:28:36'),
 (11,73,4,2014,'13','23','23','23','','','23','23','23','23','23','','23','23','14','23','23','23','','','23','23','23','23','23','23','','23','23','22','',-1,-1,'2014-05-15 02:48:07','2014-05-15 02:48:07'),
 (12,68,4,2014,'23','23','23','23','','','23','13','23','23','23','','','13','23','23','23','23','','','23','23','23','23','23','','','13','23','23','',-1,-1,'2014-05-15 03:09:56','2014-05-15 03:09:56'),
 (13,70,5,2014,'23','13','','','23','23','21','23','23','','','23','23','23','23','14','','','23','23','23','23','20','','','23','23','23','23','23','',-1,-1,'2014-05-15 03:28:17','2014-05-15 03:28:17'),
 (14,70,4,2014,'23','23','23','23','','','23','14','23','23','23','','','23','23','23','23','23','','23','23','23','21','23','23','','','13','23','23','',-1,-1,'2014-05-15 03:29:09','2014-05-15 03:29:09'),
 (15,71,4,2014,'23','23','23','23','','','23','23','23','23','23','','','23','23','23','23','23','','','23','23','23','23','23','','','23','13','23','',-1,-1,'2014-05-15 03:31:35','2014-05-15 03:31:35'),
 (16,72,5,2014,'23','23','','','23','13','23','23','13','','','23','23','23','23','23','','','23','23','23','23','23','','','23','23','23','23','23','',-1,-1,'2014-05-15 03:33:23','2014-05-15 03:33:23'),
 (17,72,4,2014,'23','23','23','23','','','23','23','23','23','23','','23','23','23','23','23','23','','','23','23','23','23','23','','','13','23','23','',-1,-1,'2014-05-15 03:39:01','2014-05-15 03:39:01'),
 (18,67,4,2014,'23','23','23','23','','','23','23','23','23','13','','','23','23','23','23','23','','','23','23','13','23','23','','','23','23','23','',-1,-1,'2014-05-15 03:40:29','2014-05-15 03:40:29'),
 (19,69,4,2014,'23','23','23','23','','','23','23','23','23','13','','','23','23','23','23','23','','','23','23','23','23','23','','','23','23','23','',-1,-1,'2014-05-15 03:42:05','2014-05-15 03:42:05'),
 (20,330,4,2014,'23','23','23','23','','23','23','23','23','23','23','','','23','23','23','23','23','23','','23','23','23','23','23','','','14','23','22','',1,-1,'2014-05-16 03:40:35','2014-05-16 03:43:11'),
 (21,67,5,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',-1,-1,'2014-05-16 04:04:30','2014-05-18 11:16:59'),
 (22,68,5,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1,-1,'2014-05-16 04:04:30','2014-05-16 04:04:30'),
 (23,69,5,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',1,1,'2014-05-16 04:04:30','2014-05-16 04:04:30'),
 (24,71,5,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',-1,-1,'2014-05-16 04:04:30','2014-05-16 04:04:30'),
 (25,73,5,2014,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',-1,-1,'2014-05-16 04:04:30','2014-05-16 04:04:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chuc_vu`
--

/*!40000 ALTER TABLE `chuc_vu` DISABLE KEYS */;
INSERT INTO `chuc_vu` (`cv_id`,`cv_name`,`cv_order`,`cv_status`,`cv_date_added`,`cv_date_modified`) VALUES 
 (4,'Cá»¥c trÆ°á»Ÿng',1,1,'2013-11-10 21:38:30','2014-02-25 02:32:38'),
 (6,'PhÃ³ Cá»¥c trÆ°á»Ÿng',2,1,'2013-11-10 21:38:47','2014-02-25 02:32:55'),
 (7,'Chi cá»¥c trÆ°á»Ÿng',4,1,'2014-02-25 02:33:09','2014-04-16 22:36:56'),
 (8,'PhÃ³ Chi cá»¥c trÆ°á»Ÿng',7,1,'2014-02-25 02:33:21','2014-04-16 22:37:16'),
 (9,'Äá»™i trÆ°á»Ÿng thuá»™c Cá»¥c',5,1,'2014-02-25 02:33:31','2014-02-25 02:33:31'),
 (10,'PhÃ³ Äá»™i trÆ°á»Ÿng thuá»™c Cá»¥c',6,1,'2014-02-25 02:33:45','2014-02-25 02:33:45'),
 (11,'Äá»™i trÆ°á»Ÿng thuá»™c Chi cá»¥c',9,1,'2014-02-25 02:33:57','2014-02-25 02:50:21'),
 (12,'PhÃ³ Äá»™i trÆ°á»Ÿng thuá»™c Chi cá»¥c',10,1,'2014-02-25 02:34:11','2014-02-25 02:50:39'),
 (13,'TrÆ°á»Ÿng phÃ²ng',3,1,'2014-02-25 02:49:44','2014-04-16 22:36:31'),
 (14,'PhÃ³ TrÆ°á»Ÿng phÃ²ng',8,1,'2014-02-25 02:49:55','2014-02-25 02:49:55'),
 (15,'ChÃ¡nh VÄƒn phÃ²ng',3,1,'2014-02-25 21:00:00','2014-02-25 21:12:56'),
 (16,'Tá»• trÆ°á»Ÿng',11,1,'2014-04-16 22:37:59','2014-04-16 22:37:59'),
 (17,'PhÃ³ Tá»• trÆ°á»Ÿng',12,1,'2014-04-16 22:38:11','2014-04-16 22:38:11'),
 (18,'CÃ´ng chá»©c',13,1,'2014-04-17 05:12:58','2014-04-17 05:12:58'),
 (19,'PhÃ³ ChÃ¡nh VÄƒn phÃ²ng',7,1,'2014-04-17 20:55:04','2014-04-17 20:55:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chuc_vu_cong_doan`
--

/*!40000 ALTER TABLE `chuc_vu_cong_doan` DISABLE KEYS */;
INSERT INTO `chuc_vu_cong_doan` (`cvcdoan_id`,`cvcdoan_name`,`cvcdoan_order`,`cvcdoan_status`,`cvcdoan_date_added`,`cvcdoan_date_modified`) VALUES 
 (14,'Chá»§ tá»‹ch CÃ´ng Ä‘oÃ n cÆ¡ sá»Ÿ',1,1,'2014-02-09 11:33:34','2014-02-25 02:38:21'),
 (15,'PhÃ³ Chá»§ tá»‹ch CÃ´ng Ä‘oÃ n cÆ¡ sá»Ÿ',2,1,'2014-02-09 11:33:42','2014-02-25 02:38:40'),
 (16,'Chá»§ tá»‹ch cÃ´ng Ä‘oÃ n bá»™ pháº­n',4,1,'2014-02-25 02:39:06','2014-02-25 02:39:06'),
 (17,'UV BCH CÃ´ng Ä‘oÃ n cÆ¡ sá»Ÿ',3,1,'2014-02-25 02:39:18','2014-02-25 02:39:18'),
 (18,'PhÃ³ Chá»§ tá»‹ch CÃ´ng Ä‘oÃ n bá»™ pháº­n',5,1,'2014-02-25 02:39:36','2014-02-25 02:39:36'),
 (19,'UV BCH CÃ´ng Ä‘oÃ n bá»™ pháº­n',6,1,'2014-02-25 02:39:51','2014-02-25 02:39:51');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chuc_vu_dang`
--

/*!40000 ALTER TABLE `chuc_vu_dang` DISABLE KEYS */;
INSERT INTO `chuc_vu_dang` (`cvdang_id`,`cvdang_name`,`cvdang_order`,`cvdang_status`,`cvdang_date_added`,`cvdang_date_modified`) VALUES 
 (9,'BÃ­ thÆ° Äáº£ng á»§y',1,1,'2014-02-09 10:57:40','2014-02-25 02:35:40'),
 (10,'PhÃ³ BÃ­ thÆ° Äáº£ng á»§y',2,1,'2014-02-09 10:58:01','2014-02-25 02:35:55'),
 (11,'BÃ­ thÆ° Chi bá»™',4,1,'2014-02-25 02:36:11','2014-02-25 02:36:55'),
 (12,'PhÃ³ BÃ­ thÆ° Chi bá»™',5,1,'2014-02-25 02:36:24','2014-02-25 02:37:05'),
 (13,'UV BCH Äáº£ng bá»™',3,1,'2014-02-25 02:36:44','2014-02-25 02:36:44'),
 (14,'UV BCH Chi bá»™',6,1,'2014-02-25 02:37:27','2014-02-25 02:37:27'),
 (15,'Äáº£ng viÃªn',7,1,'2014-02-25 02:37:50','2014-02-25 02:37:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chuc_vu_doan`
--

/*!40000 ALTER TABLE `chuc_vu_doan` DISABLE KEYS */;
INSERT INTO `chuc_vu_doan` (`cvdoan_id`,`cvdoan_name`,`cvdoan_order`,`cvdoan_status`,`cvdoan_date_added`,`cvdoan_date_modified`) VALUES 
 (9,'BÃ­ thÆ° ÄoÃ n cÆ¡ sá»Ÿ',0,1,'2014-02-09 10:49:12','2014-02-25 02:27:15'),
 (12,'PhÃ³ bÃ­ thÆ° ÄoÃ n cÆ¡ sá»Ÿ',1,1,'2014-02-09 10:50:51','2014-02-25 02:27:29'),
 (13,'UV BCH ÄoÃ n cÆ¡ sá»Ÿ',2,1,'2014-02-09 10:50:58','2014-02-25 02:27:48'),
 (14,'BÃ­ thÆ° Chi Ä‘oÃ n',3,1,'2014-02-25 02:28:02','2014-02-25 02:28:16'),
 (15,'PhÃ³ BÃ­ thÆ° Chi Ä‘oÃ n',4,1,'2014-02-25 02:28:34','2014-02-25 02:28:34'),
 (16,'UV BCH Chi Ä‘oÃ n',5,1,'2014-02-25 02:28:49','2014-02-25 02:28:49'),
 (17,'ÄoÃ n viÃªn',6,1,'2014-02-25 02:29:07','2014-02-25 02:29:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chung_chi`
--

/*!40000 ALTER TABLE `chung_chi` DISABLE KEYS */;
INSERT INTO `chung_chi` (`cc_id`,`cc_name`,`cc_type`,`cc_order`,`cc_status`,`cc_date_added`,`cc_date_modified`) VALUES 
 (1,'Anh A',1,1,1,'2013-11-27 11:14:35','2014-04-16 22:44:46'),
 (2,'VÄƒn phÃ²ng C',2,3,1,'2013-11-27 11:15:04','2014-04-16 22:42:55'),
 (4,'VÄƒn phÃ²ng A',2,1,1,'2014-04-16 22:43:16','2014-04-16 22:43:16'),
 (5,'VÄƒn phÃ²ng B',2,2,1,'2014-04-16 22:43:29','2014-04-16 22:43:29'),
 (6,'Anh B',1,2,1,'2014-04-16 22:45:02','2014-04-16 22:45:02'),
 (7,'Anh C',1,3,1,'2014-04-16 22:45:12','2014-04-16 22:45:12'),
 (8,'Anh B1 ChÃ¢u Ã‚u',1,4,1,'2014-04-16 22:45:56','2014-04-16 22:45:56'),
 (9,'Cá»­ nhÃ¢n',1,0,1,'2014-04-16 22:46:27','2014-04-16 22:47:10'),
 (10,'Cá»­ nhÃ¢n',2,0,1,'2014-04-16 22:47:38','2014-04-16 22:47:38'),
 (11,'PhÃ¡p',1,4,1,'2014-04-16 22:48:05','2014-04-16 22:48:05'),
 (12,'Nga',1,6,1,'2014-04-16 22:48:14','2014-04-16 22:48:14'),
 (13,'Trung',1,7,1,'2014-04-16 22:48:22','2014-04-16 22:48:22'),
 (14,'Äá»©c',1,8,1,'2014-04-16 22:48:33','2014-04-16 22:48:33'),
 (15,'Nháº­t',1,9,1,'2014-04-16 22:48:41','2014-04-16 22:48:41'),
 (16,'LÃ o',1,10,1,'2014-04-16 22:49:58','2014-04-16 22:49:58'),
 (17,'LÃ o',1,10,1,'2014-04-16 22:50:43','2014-04-16 22:50:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `danh_gia`
--

/*!40000 ALTER TABLE `danh_gia` DISABLE KEYS */;
INSERT INTO `danh_gia` (`dg_id`,`dg_em_id`,`dg_thang`,`dg_nam`,`dg_cong_viec`,`dg_ket_qua_cong_viec`,`dg_so_ngay_nghi`,`dg_ly_do_nghi`,`dg_y_thuc_xay_dung`,`dg_khuyet_diem`,`dg_tc_danh_gia`,`dg_ghi_chu`,`dg_phan_loai`,`dg_don_vi_status`,`dg_ptccb_status`,`dg_date_created`,`dg_date_modifyed`) VALUES 
 (1,1,2,2014,'<p>C&ocirc;ng viá»‡c 1,</p>\r\n<p>c&ocirc;ng viá»‡c 2</p>',9,0,'<p>á»m</p>','<p>tá»‘t</p>','<p>kh&ocirc;ng c&oacute;</p>','a:2:{i:4;s:1:\"0\";i:5;s:1:\"2\";}','<p>te te</p>','A','A','A','2014-02-11 19:54:22','2014-02-16 13:42:46'),
 (2,13,2,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','2014-02-19 23:06:35','2014-02-19 23:06:35'),
 (3,1,3,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','2014-02-19 23:09:00','2014-02-19 23:09:00'),
 (4,13,3,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B','2014-02-19 23:09:03','2014-02-19 23:09:03'),
 (5,17,2,2014,'<p>jkhkjh</p>\r\n<p>jhgjh</p>\r\n<p>jhgk</p>',9,1,'<p>jiohioh</p>','<p>uá»µtugj</p>','<p>á»‹iljljl</p>','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','<p>uhiughuig</p>','A',NULL,NULL,'2014-02-28 03:33:37','2014-02-28 03:33:37'),
 (6,13,4,2014,'<p>B&aacute;o c&aacute;o tá»•ng há»£p</p>',9,0,'','<p>Tá»‘t</p>','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','A','A','2014-04-14 02:25:16','2014-04-14 02:25:16'),
 (7,1,4,2014,'<p>Lam viec A</p>',9,0,'<p>Ko nghi buoi nao</p>','<p>dsad</p>','<p>Ä‘as</p>','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','<p>Ä‘as</p>','A',NULL,'A','2014-04-15 00:42:43','2014-04-15 00:42:43'),
 (8,19,4,2014,'<p>- N&acirc;ng lÆ°Æ¡ng th&aacute;ng 4/2014</p>\r\n<p>- Xáº¿p loáº¡i ABC th&aacute;ng 3</p>\r\n<p>- Äiá»u Ä‘á»™ng lu&acirc;n chuyá»ƒn Ä‘á»£t 1/2014</p>\r\n<p>- Cháº¡y thá»­ pháº§n má»m TCCB</p>',9,3,'<p>Nghá»‰ ph&eacute;p</p>','<p>Tá»‘t</p>','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','A','A','2014-04-17 22:44:54','2014-04-17 22:44:54'),
 (9,19,3,2014,'<p>- N&acirc;ng lÆ°Æ¡ng 3/2014</p>\r\n<p>- Xáº¿p loáº¡i th&aacute;ng 2</p>\r\n<p>- Theo d&otilde;i cáº­p nháº­t pháº§n má»m</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A',NULL,NULL,'2014-04-17 22:45:55','2014-04-17 22:45:55'),
 (10,30,4,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','2014-04-17 22:53:30','2014-04-17 22:53:30'),
 (11,29,4,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','2014-04-17 22:53:33','2014-04-17 22:53:33'),
 (12,28,4,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','2014-04-17 22:53:37','2014-04-17 22:53:37'),
 (13,23,4,2014,'<p>r34tewyeuywt55u</p>\r\n<p>\\hshf</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','A','A','2014-04-25 21:44:15','2014-04-25 21:44:15'),
 (14,13,5,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','2014-05-14 23:17:01','2014-05-14 23:17:01'),
 (15,73,4,2014,'<p>Quáº£n l&yacute; th&ocirc;ng tin CBCC</p>\r\n<p>Xáº¿p loáº¡i ABC</p>\r\n<p>N&acirc;ng lÆ°Æ¡ng</p>\r\n<p>Äiá»u Ä‘á»™ng</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','','','2014-05-15 02:51:37','2014-05-15 02:51:37'),
 (16,68,4,2014,'<p>Phá»¥ tr&aacute;ch Ä&agrave;o táº¡o, Thi Ä‘ua khen thÆ°á»Ÿng</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','','','2014-05-15 03:11:20','2014-05-15 03:11:20'),
 (17,70,4,2014,'<p>BHXH</p>\r\n<p>Thai sáº£n</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','','','2014-05-15 03:29:51','2014-05-15 03:29:51'),
 (18,71,4,2014,'<p>Ä&agrave;o táº¡o</p>\r\n<p>Thi Ä‘ua khen thÆ°á»Ÿng</p>\r\n<p>Ti&ecirc;u ch&iacute; Ä‘&aacute;nh gi&aacute; c&aacute;n bá»™</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','','','2014-05-15 03:32:15','2014-05-15 03:32:15'),
 (19,72,5,2014,'<p>HÄLÄ</p>\r\n<p>B&aacute;o c&aacute;o TCCB</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A',NULL,NULL,'2014-05-15 03:33:53','2014-05-15 03:33:53'),
 (20,72,4,2014,'<p>HÄLÄ</p>\r\n<p>B&aacute;o c&aacute;o TCCB</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','','','2014-05-15 03:39:21','2014-05-15 03:39:21'),
 (21,67,4,2014,'<p>Phá»¥ tr&aacute;ch chung ph&ograve;ng TCCB</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','','','2014-05-15 03:40:53','2014-05-15 03:40:53'),
 (22,69,4,2014,'<p>Phá»¥ tr&aacute;ch cháº¿ Ä‘á»™ ch&iacute;nh s&aacute;ch CBCC</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','','','2014-05-15 03:42:41','2014-05-15 03:42:41'),
 (23,330,4,2014,'<p>Thanh tra ná»™i bá»™ theo káº¿ hoáº¡ch táº¡i c&aacute;c Ä‘Æ¡n vá»‹ cÆ¡ sá»Ÿ</p>',9,0,'','','','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A',NULL,NULL,'2014-05-16 03:45:11','2014-05-16 03:45:11'),
 (24,68,5,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B','2014-05-16 04:32:06','2014-05-16 04:32:06'),
 (25,67,5,2014,'',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','2014-05-18 22:27:24','2014-05-18 22:27:24'),
 (26,69,5,2014,'<p>sdfsdfsd</p>',9,0,'<p>fsdfds</p>','<p>fdsfsdf</p>','<p>fdsfsd</p>','a:2:{i:4;s:1:\"0\";i:5;s:1:\"0\";}','','A','A','B','2014-06-01 13:18:47','2014-06-01 13:18:47');
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
 (9,'HoÃ n thÃ nh xuáº¥t sáº¯c nhiá»‡m vá»¥',1,1,'2013-11-09 23:01:08','2014-02-25 02:29:57'),
 (10,'HoÃ n thÃ nh tá»‘t nhiá»‡m vá»¥',2,1,'2013-11-09 23:01:19','2014-02-25 02:30:25'),
 (11,'HoÃ n thÃ nh nhiá»‡m vá»¥ nhÆ°ng cÃ²n háº¡n cháº¿ vá» nÄƒng lá»±c',3,1,'2013-11-09 23:01:39','2014-02-25 02:30:58'),
 (13,'KhÃ´ng hoÃ n thÃ nh nhiá»‡m vá»¥',4,1,'2014-02-23 16:57:04','2014-02-25 02:31:20');
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
  `em_cmt_ngay_cap` datetime DEFAULT NULL,
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
  `em_han_luan_chuyen` datetime DEFAULT NULL,
  `em_nghi_huu` int(10) unsigned NOT NULL DEFAULT '0',
  `em_ngay_nghi_huu` datetime DEFAULT NULL,
  `em_time_cong_tac` datetime DEFAULT NULL,
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
  PRIMARY KEY (`em_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`em_id`,`em_ten`,`em_ten_dem`,`em_ho`,`em_ngay_sinh`,`em_so_chung_minh_thu`,`em_cmt_ngay_cap`,`em_ten_khac`,`em_anh_the`,`em_gioi_tinh`,`em_home_phone`,`em_phone`,`em_noi_sinh`,`em_noi_sinh_tinh`,`em_noi_sinh_huyen`,`em_que_quan`,`em_noi_o`,`em_noi_o_tinh`,`em_noi_o_huyen`,`em_que_quan_tinh`,`em_que_quan_huyen`,`em_dia_chi`,`em_dia_chi_tinh`,`em_dia_chi_huyen`,`em_dan_toc`,`em_so_cong_chuc`,`em_chuc_vu`,`em_phong_ban`,`em_han_luan_chuyen`,`em_nghi_huu`,`em_ngay_nghi_huu`,`em_time_cong_tac`,`em_ngay_tuyen_dung`,`em_ngach_cong_chuc`,`em_cong_viec`,`em_chuyen_mon`,`em_chuc_vu_dang`,`em_ngay_vao_dang`,`em_chuc_vu_doan`,`em_ngay_vao_doan`,`em_chuc_vu_cong_doan`,`em_quan_ly_nha_nuoc`,`em_ly_luan_chinh_tri`,`em_than_nhan_nuoc_ngoai`,`em_tham_gia_to_chuc`,`em_bi_bat`,`em_qua_trinh_luong`,`em_gia_dinh_vo`,`em_gia_dinh_ban_than`,`em_qua_trinh_cong_tac`,`em_lich_su_dao_tao`,`em_gia_dinh_chinh_sach`,`em_thuong_binh`,`em_nhom_mau`,`em_can_nang`,`em_chieu_cao`,`em_tinh_trang_suc_khoe`,`em_so_bhxh`,`em_danh_hieu`,`em_quan_ham`,`em_ngay_xuat_ngu`,`em_ngay_nhap_ngu`,`em_ky_luat`,`em_khen_thuong`,`em_cong_viec_khi_tuyen_dung`,`em_co_quan_tuyen_dung`,`em_ton_giao`,`em_van_hoa_pt`,`em_hoc_ham`,`em_bang_cap`,`em_ngoai_ngu`,`em_tin_hoc`,`em_chung_chi_khac`,`em_anh_bang_cap`,`em_status`,`em_delete`,`em_date_added`,`em_date_modified`) VALUES 
 (67,'Oanh',NULL,'Nguyá»…n Thá»‹ Kim','1970-09-15 00:00:00','','0000-00-00 00:00:00','',NULL,0,'','','Tháº¡ch Trá»‹','HÃ  TÄ©nh','Tháº¡ch HÃ ','Tháº¡ch Trá»‹','83/HÃ  Huy Táº­p','42','314','HÃ  TÄ©nh','Tháº¡ch HÃ ','83/ HÃ  Huy Táº­p',42,314,1,'T30-HQ91-0001',13,19,NULL,0,NULL,'2011-04-01 00:00:00','1991-05-01 00:00:00',4,'Phá»¥ trÃ¡ch phÃ²ng Tá»• chá»©c cÃ¡n bá»™','TCCB - Thanh tra',13,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,4,5,'','','','a:1:{i:747231127;a:3:{s:10:\"ngay_thang\";s:6:\"6/2012\";s:8:\"ma_ngach\";s:8:\"08.051/8\";s:5:\"he_so\";s:4:\"3.99\";}}','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','KhÃ´ng','Báº±ng khen BTC','Sinh viÃªn','Tá»•ng cá»¥c Háº£i quan','KhÃ´ng','12/12',4,11,6,5,0,'N;',1,0,'2014-05-14 23:27:52','2014-05-16 03:46:26'),
 (68,'BÃ¬nh',NULL,'Nguyá»…n ÄÃ¬nh','1972-09-10 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ94-0002',14,19,NULL,0,NULL,'2010-09-01 00:00:00','0000-00-00 00:00:00',5,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-14 23:27:52','2014-05-15 03:04:56'),
 (69,'Äá»“ng',NULL,'ÄÃ o NghÄ©a','1982-02-16 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ05-0003',14,19,NULL,0,NULL,'2014-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-14 23:27:52','2014-05-16 03:47:49'),
 (70,'PhÆ°á»£ng',NULL,'LÃª Thá»‹ Kim ','1979-02-06 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ02-0009',18,19,NULL,0,NULL,'2014-05-01 00:00:00',NULL,4,'','',0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-14 23:27:52','2014-05-15 03:06:11'),
 (71,'TÃº',NULL,'BÃ¹i Minh ','1984-06-11 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0023',18,19,NULL,0,NULL,'2014-05-01 00:00:00',NULL,4,'','',0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-14 23:27:52','2014-05-15 03:06:27'),
 (72,'PhÆ°Æ¡ng',NULL,'Äáº­u Minh','1989-09-17 00:00:00','','0000-00-00 00:00:00','',NULL,0,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0016',18,19,NULL,0,NULL,'2014-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-14 23:27:52','2014-05-16 03:49:08'),
 (73,'Vinh',NULL,'NgÃ´ Thá»‹ Ngá»c','1990-05-31 00:00:00','','0000-00-00 00:00:00','',NULL,0,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0020',18,19,NULL,0,NULL,'2014-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-14 23:27:52','2014-05-16 03:49:40'),
 (296,'Thá»',NULL,'LÆ°Æ¡ng TrÆ°á»ng ','1972-06-21 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ94-0012',0,23,NULL,0,NULL,'2011-11-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (297,'Lá»¥c',NULL,'Tráº§n ÄÃ¬nh ','1956-05-19 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ77-0001',0,23,NULL,0,NULL,'1997-02-01 00:00:00',NULL,5,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (298,'HÃ²a',NULL,'Äinh VÄƒn ','1973-10-26 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ96-0004',0,23,NULL,0,NULL,'2012-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (299,'Long',NULL,'Nguyá»…n ÄÃ¬nh ','1965-10-13 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ92-0005',0,23,NULL,0,NULL,'2013-08-01 00:00:00',NULL,5,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (300,'DÅ©ng',NULL,'LÃª ','1976-05-08 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ02-0003',0,20,NULL,0,NULL,'2000-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (301,'HÃ ',NULL,'Tráº§n Thá»‹ Song ','1973-12-12 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ95-0002',0,20,NULL,0,NULL,'2009-04-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (302,'Háº¡nh',NULL,'Pháº¡m Thá»‹ Má»¹ ','1980-06-01 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ05-0005',0,20,NULL,0,NULL,'2005-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (303,'Anh',NULL,'Nguyá»…n Thá»‹ Ngá»c ','1970-02-15 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ93-0001',0,20,NULL,0,NULL,'2011-01-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (304,'DuyÃªn',NULL,'Nguyá»…n Thá»‹ ','1981-04-20 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ09-0001',0,20,NULL,0,NULL,'2012-06-01 00:00:00',NULL,9,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (305,'HiÃªn',NULL,'LÃª Thá»‹ ','1965-07-09 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ11-0001',0,20,NULL,0,NULL,'2010-10-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (306,'PhÃº',NULL,'VÃµ Minh ','1983-01-29 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0018',0,20,NULL,0,NULL,'2010-07-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (307,'PhÆ°Æ¡ng',NULL,'Nguyá»…n Thá»‹ Viá»‡t ','1984-03-23 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0029',0,20,NULL,0,NULL,'2012-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (308,'PhÆ°á»£ng',NULL,'Nguyá»…n Thá»‹ ','1986-11-05 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0019',0,20,NULL,0,NULL,'2012-06-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (309,'Tháº£o',NULL,'Äáº·ng Thá»‹ Äá»©c ','1986-03-13 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0027',0,20,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (310,'Viá»‡t',NULL,'PhÃ­ Ngá»c ','1983-09-21 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0050',0,20,NULL,0,NULL,'2010-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (311,'HÃ o',NULL,'Phan Anh ','1988-05-01 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0006',0,20,NULL,0,NULL,'2013-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (312,'ThÆ°Æ¡ng',NULL,'HoÃ ng Minh ','1985-03-15 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0022',0,20,NULL,0,NULL,'2014-04-14 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (313,'Tuáº¥n',NULL,'Nguyá»…n ÄÃ¬nh ','1984-09-02 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0047',0,20,NULL,0,NULL,'2014-04-14 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (314,'Anh',NULL,'BÃ¹i Thá»‹ Kim ','1974-12-22 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,20,NULL,0,NULL,'2005-12-01 00:00:00',NULL,12,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (315,'DÅ©ng',NULL,'Nguyá»…n Sá»¹ ','1978-09-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,20,NULL,0,NULL,'2013-01-01 00:00:00',NULL,11,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (316,'Long',NULL,'Nguyá»…n XuÃ¢n ','1973-10-24 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,20,NULL,0,NULL,'2011-07-01 00:00:00',NULL,11,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (317,'Nam',NULL,'Tráº§n HoÃ i ','1983-11-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,20,NULL,0,NULL,'2012-12-01 00:00:00',NULL,11,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (318,'TrÆ°á»ng',NULL,'Nguyá»…n Há»¯u ','1980-10-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,20,NULL,0,NULL,'2013-05-07 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (319,'HÃ ',NULL,'VÃµ Thá»‹ Thu ','1989-06-30 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,20,NULL,0,NULL,'2013-06-03 00:00:00',NULL,12,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (320,'Thao',NULL,'LÃª VÄƒn ','1968-11-20 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,20,NULL,0,NULL,'2013-02-01 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (321,'Tuáº¥n',NULL,'Há»“ Anh ','1977-07-07 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,20,NULL,0,NULL,'2013-04-25 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (329,'An',NULL,'ÄÃ o XuÃ¢n ','1972-07-01 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ94-0001',0,18,NULL,0,NULL,'2012-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (330,'ThÃ nh',NULL,'Nguyá»…n ChÃ­ ','1985-08-18 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ09-0006',0,18,NULL,0,NULL,'2012-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (331,'Hiá»n',NULL,'Nguyá»…n Thá»‹ BÃ­ch ','1986-10-06 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ08-0002',0,18,NULL,0,NULL,'2011-07-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (332,'BÃ¬nh',NULL,'VÃµ ThÃºy Diá»…m ','1990-01-04 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0001',0,18,NULL,0,NULL,'2013-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (333,'ThÃ nh',NULL,'Pháº¡m Tiáº¿n ','1977-03-24 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ02-0012',0,17,NULL,0,NULL,'2011-08-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:42','2014-05-15 04:37:42'),
 (334,'Háº¡nh',NULL,'LÃª VÄƒn ','1969-10-15 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ94-0003',0,17,NULL,0,NULL,'2013-01-01 00:00:00',NULL,5,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (335,'Anh',NULL,'ThÃ¡i Äá»©c ','1985-08-23 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ11-0011',0,17,NULL,0,NULL,'2011-11-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (336,'HÃ ',NULL,'TrÆ°Æ¡ng Thá»‹ Thanh ','1982-10-12 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ05-0007',0,17,NULL,0,NULL,'2011-04-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (337,'HÃ ',NULL,'Nguyá»…n ÄÃ¬nh ','1978-01-30 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ09-0002',0,17,NULL,0,NULL,'2010-06-01 00:00:00',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (338,'Hiá»n',NULL,'Nguyá»…n Thá»‹ ','1985-12-26 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0041',0,17,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (339,'Tuáº¥n',NULL,'Tráº§n Thanh ','1984-01-29 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0048',0,17,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (340,'Tuyáº¿t',NULL,'Nguyá»…n Thá»‹ ','1986-08-09 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ09-0007',0,17,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (341,'Huyá»n',NULL,'Äáº·ng Thanh ','1989-03-16 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0007',0,17,NULL,0,NULL,'2013-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (342,'LiÃªn',NULL,'Nguyá»…n Thá»‹ ','1981-08-24 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ06-0007',0,17,NULL,0,NULL,'2014-04-16 00:00:00',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (343,'Linh',NULL,'Nguyá»…n ChÃ­ ','1987-10-24 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0009',0,17,NULL,0,NULL,'2013-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (344,'DÅ©ng',NULL,'Nguyá»…n ChÃ­ ','1977-10-25 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ02-0001',0,16,NULL,0,NULL,'2012-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (345,'DÅ©ng',NULL,'Äáº·ng HÃ¹ng ','1984-02-03 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0014',0,16,NULL,0,NULL,'2013-02-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (346,'HÃ ',NULL,'Tráº§n Thá»‹ ThÃºy ','1981-04-20 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ05-0006',0,16,NULL,0,NULL,'2010-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (347,'HÃ²a',NULL,'Pháº¡m VÃµ KhÃ¡nh ','1987-02-21 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0037',0,16,NULL,0,NULL,'2010-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (348,'HoÃ i',NULL,'LÃª Thá»‹ Thanh ','1970-07-01 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ92-0002',0,16,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (349,'PhÃºc',NULL,'Há»“ Thanh ','1983-02-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0015',0,16,NULL,0,NULL,'2013-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (350,'Äá»©c',NULL,'LÃª Minh','1979-03-25 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ01-0001',10,22,NULL,0,NULL,'2014-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:40:04'),
 (351,'TÃ i',NULL,'Pháº¡m VÄƒn','1985-08-03 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ10-0008',16,22,NULL,0,NULL,'2014-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:40:46'),
 (352,'LÃ¢m',NULL,'Nguyá»…n Ngá»c','1974-02-10 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ96-0006',16,22,NULL,0,NULL,'2013-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:41:36'),
 (353,'LÃª',NULL,'Nguyá»…n ThÃ nh','1981-01-07 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ06-0006',17,22,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:42:20'),
 (354,'Hiá»ƒu',NULL,'Nguyá»…n Máº¡nh','1964-04-16 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ96-0005',18,22,NULL,0,NULL,'2013-02-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:44:38'),
 (355,'Lá»¥c',NULL,'Nguyá»…n VÄƒn','1964-09-10 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ89-0002',18,22,NULL,0,NULL,'2011-07-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:45:08'),
 (356,'ThÃ nh',NULL,'TrÆ°Æ¡ng VÄƒn','1967-07-17 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ11-0003',18,22,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',7,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:45:49'),
 (357,'ThÃ¢n',NULL,'Äinh Nguyá»…n','1977-02-10 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ01-0004',18,22,NULL,0,NULL,'2013-01-01 00:00:00','0000-00-00 00:00:00',6,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:46:26'),
 (358,'Liá»‡u',NULL,'HoÃ ng Thá»‹','1984-06-26 00:00:00','','0000-00-00 00:00:00','',NULL,0,'','','','','','','','0','0','','','',0,0,0,'T30-HQ08-0003',18,22,NULL,0,NULL,'2014-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:47:15'),
 (359,'Trang',NULL,'BÃ¹i Thá»‹ Quá»³nh','1984-12-25 00:00:00','','0000-00-00 00:00:00','',NULL,0,'','','','','','','','0','0','','','',0,0,0,'T30-HQ08-0005',18,22,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:47:39'),
 (360,'Äá»©c',NULL,'VÃµ TÃ¡ Tiáº¿n','1988-05-06 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0003',18,22,NULL,0,NULL,'2014-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:48:07'),
 (361,'Giang',NULL,'Tráº§n Háº­u','1982-03-17 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'HÄLÄ 68',0,22,NULL,0,NULL,'2013-04-01 00:00:00','0000-00-00 00:00:00',11,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:54:45'),
 (362,'Ninh',NULL,'BÃ¹i ThÃºc','1958-12-20 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ81-0001',9,21,NULL,0,NULL,'2011-04-01 00:00:00','0000-00-00 00:00:00',5,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:49:45'),
 (363,'SÆ¡n',NULL,'Nguyá»…n Thanh','1965-11-13 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ88-0001',10,21,NULL,0,NULL,'2011-07-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:50:23'),
 (364,'SÆ¡n',NULL,'Nguyá»…n','1959-11-08 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ95-0006',18,21,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',6,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:50:53'),
 (365,'Tuáº¥n',NULL,'Tráº§n Anh','1973-03-05 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ92-0007',18,21,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',6,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:51:26'),
 (366,'Tháº¯ng',NULL,'Pháº¡m Máº¡nh','1966-04-13 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ94-0009',18,21,NULL,0,NULL,'2013-01-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:51:53'),
 (367,'Háº£i',NULL,'Pháº¡m Minh','1977-11-19 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0005',18,21,NULL,0,NULL,'2013-03-01 00:00:00','0000-00-00 00:00:00',8,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:52:36'),
 (368,'LiÃªm',NULL,'Tráº§n VÄƒn','1983-02-10 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0008',18,21,NULL,0,NULL,'2013-03-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:53:07'),
 (369,'NhÃ¢n',NULL,'VÄƒn HoÃ i','1986-04-24 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0012',18,21,NULL,0,NULL,'2014-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:53:41'),
 (370,'QuÃ¢n',NULL,'Tráº§n ÄÃ¬nh','1978-05-18 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'HÄLÄ 68',0,21,NULL,0,NULL,'2011-10-01 00:00:00','0000-00-00 00:00:00',11,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:43','2014-05-15 04:55:18'),
 (371,'ThÃ nh',NULL,'ÄÃ o ChÃ­ ','1975-12-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ97-0001',0,15,NULL,0,NULL,'2014-05-09 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (372,'BÃ¬nh',NULL,'Tráº§n Trá»ng ','1981-09-19 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ06-0002',0,15,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (373,'DÅ©ng',NULL,'Nguyá»…n Há»“ng ','1978-08-06 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ02-0002',0,15,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (374,'Cá»«',NULL,'Tráº§n Quá»‘c ','1969-08-30 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ93-0002',0,15,NULL,0,NULL,'2013-04-16 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (375,'Anh',NULL,'Nguyá»…n Thá»‹ VÃ¢n ','1987-11-20 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0010',0,15,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (376,'HoÃ i',NULL,'Biá»‡n Thá»‹ ','1987-05-15 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0026',0,15,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (377,'Dung',NULL,'Äáº­u Thá»‹ Thuá»³ ','1986-06-14 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0032',0,15,NULL,0,NULL,'2013-04-16 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (378,'LÆ°Æ¡ng',NULL,'Nguyá»…n BÃ¡ ','1987-12-26 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0010',0,15,NULL,0,NULL,'2014-04-14 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (379,'SÆ¡n',NULL,'Tráº§n TrÆ°á»ng ','1990-08-16 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0017',0,15,NULL,0,NULL,'2013-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (380,'Thu',NULL,'HoÃ ng Thá»‹ ','1986-10-06 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0018',0,15,NULL,0,NULL,'2013-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (381,'Háº±ng',NULL,'Pháº¡m Thá»‹ Thu ','1986-03-11 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0036',0,15,NULL,0,NULL,'2014-04-14 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (382,'Huyá»n',NULL,'Nguyá»…n Thá»‹ ThÆ°Æ¡ng ','1987-04-26 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0017',0,15,NULL,0,NULL,'2014-04-18 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (383,'Trá»ng',NULL,'Tráº§n VÄƒn ','1963-06-16 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,15,NULL,0,NULL,'2013-03-12 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (384,'Tháº¡ch',NULL,'LÃª Ngá»c ','1978-02-27 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,15,NULL,0,NULL,'2012-07-01 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (385,'PhÃº',NULL,'BÃ¹i VÄƒn ','1959-05-22 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ82-0003',0,11,NULL,0,NULL,'2012-06-01 00:00:00',NULL,5,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (386,'TÃ i',NULL,'HoÃ ng Trá»ng ','1963-09-02 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ87-0003',0,11,NULL,0,NULL,'2011-08-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (387,'Anh',NULL,'Tráº§n Thá»‹ Lan ','1984-01-31 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ06-0001',0,11,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (388,'HÃ¹ng',NULL,'VÃµ Minh ','1954-08-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ80-0001',0,11,NULL,0,NULL,'2012-02-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (389,'Huyá»n',NULL,'Äinh Thá»‹ TÃº ','1985-08-09 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0016',0,11,NULL,0,NULL,'2012-12-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (390,'Huyá»‡n',NULL,'Nguyá»…n VÄƒn ','1955-08-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ76-0001',0,11,NULL,0,NULL,'2010-07-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:43','2014-05-15 04:37:43'),
 (391,'LÃ i',NULL,'LÃª Thá»‹ Má»™ng ','1972-11-17 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ92-0004',0,11,NULL,0,NULL,'2012-05-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (392,'TÄ©nh',NULL,'LÃª VÄƒn ','1962-02-17 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ85-0001',0,11,NULL,0,NULL,'2012-10-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (393,'Thao',NULL,'Nguyá»…n NhÆ° ','1978-09-05 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ00-0002',0,11,NULL,0,NULL,'2013-01-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (394,'TrÆ°á»ng',NULL,'LÃª Duy ','1979-04-17 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ06-0008',0,11,NULL,0,NULL,'2013-01-01 00:00:00',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (395,'Äá»©c',NULL,'HoÃ ng Minh ','1988-01-16 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0002',0,11,NULL,0,NULL,'2013-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (396,'ThÃ¡i',NULL,'LÃª Thanh ','1990-04-01 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,11,NULL,0,NULL,'2013-05-07 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (397,'Äá»‹nh',NULL,'Biá»‡n VÄƒn ','1967-05-20 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,11,NULL,0,NULL,'2012-12-01 00:00:00',NULL,11,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (398,'HÃ ',NULL,'Tráº§n VÄƒn ','1971-05-19 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,11,NULL,0,NULL,'2013-01-01 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (399,'Trung',NULL,'Nguyá»…n BÃ¡','1968-08-12 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ92-0006',7,12,NULL,0,NULL,'2013-08-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:07:12'),
 (400,'Ngá»c',NULL,'LÃ½ Trá»ng','1970-06-13 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ94-0005',8,12,NULL,0,NULL,'2014-05-01 00:00:00','0000-00-00 00:00:00',5,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:07:41'),
 (401,'Minh',NULL,'Nguyá»…n XuÃ¢n','1965-05-10 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ87-0002',8,12,NULL,0,NULL,'2014-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:08:18'),
 (402,'SÆ¡n',NULL,'Nguyá»…n Tiáº¿n','1974-09-03 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ02-0010',8,12,NULL,0,NULL,'2011-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:08:45'),
 (403,'Thanh',NULL,'Tráº§n Háº­u','1979-09-10 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ01-0003',11,12,NULL,0,NULL,'2012-10-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:09:30'),
 (404,'Tháº¯ng',NULL,'Pháº¡m Ngá»c','1965-12-20 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ98-0005',12,12,NULL,0,NULL,'2013-01-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:10:32'),
 (405,'Háº£i',NULL,'Kiá»u Há»“ng','1960-12-06 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ84-0001',12,12,NULL,0,NULL,'2011-07-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:11:06'),
 (406,'LÆ°Æ¡ng',NULL,'LÃª VÄƒn','1976-06-10 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ98-0003',12,12,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:11:47'),
 (407,'Tiá»‡p',NULL,'Pháº¡m Viá»‡t','1979-05-15 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ10-0006',12,12,NULL,0,NULL,'2014-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:12:46'),
 (408,'An',NULL,'Nguyá»…n Kháº¯c','1984-10-16 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ10-0030',18,12,NULL,0,NULL,'2013-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:13:29'),
 (409,'HoÃ n',NULL,'Nguyá»…n VÄƒn','1981-08-28 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ06-0005',18,12,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',6,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:13:54'),
 (410,'Huy77',NULL,'Pháº¡m Quang','1977-01-06 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ98-0001',18,12,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',6,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:14:21'),
 (411,'Linh',NULL,'HÃ  Ngá»c','1988-09-29 00:00:00','','0000-00-00 00:00:00','',NULL,0,'','','','','','','','0','0','','','',0,0,0,'T30-HQ11-0012',18,12,NULL,0,NULL,'2011-11-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:14:51'),
 (412,'SÆ¡n',NULL,'Nguyá»…n Há»¯u','1966-02-05 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ95-0005',18,12,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',6,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:15:24'),
 (413,'ThÃ´ng',NULL,'Nguyá»…n ÄÃ¬nh','1988-12-14 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ11-0008',18,12,NULL,0,NULL,'2011-09-01 00:00:00','0000-00-00 00:00:00',8,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:15:56'),
 (414,'Hiáº¿u',NULL,'Nguyá»…n ÄÃ¬nh','1971-07-01 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0021',18,12,NULL,0,NULL,'2013-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:16:27'),
 (415,'PhÃºc',NULL,'Nguyá»…n VÄƒn','1973-02-15 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0022',18,12,NULL,0,NULL,'2011-05-01 00:00:00','0000-00-00 00:00:00',7,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:16:56'),
 (416,'Viá»‡t',NULL,'Tráº§n Quá»‘c','1957-02-02 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ80-0003',18,12,NULL,0,NULL,'2012-05-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:06:22'),
 (417,'Long',NULL,'VÃµ ThÃ nh','1970-08-05 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ98-0002',18,12,NULL,0,NULL,'2013-08-01 00:00:00','0000-00-00 00:00:00',6,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:05:16'),
 (418,'HÃ 89',NULL,'Nguyá»…n Thá»‹ Ngá»c','1989-09-02 00:00:00','','0000-00-00 00:00:00','',NULL,0,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0004',18,12,NULL,0,NULL,'2013-03-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:04:39'),
 (419,'NhÆ°',NULL,'DÆ°Æ¡ng Nguyá»…n Tá»‘','1990-03-08 00:00:00','','0000-00-00 00:00:00','',NULL,0,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0013',18,12,NULL,0,NULL,'2013-03-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:04:17'),
 (420,'Tuáº¥n',NULL,'Há»“ Ngá»c','1988-07-02 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0019',18,12,NULL,0,NULL,'2013-03-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:03:50'),
 (421,'Nhung',NULL,'Nguyá»…n Thá»‹ Trang','1990-11-27 00:00:00','','0000-00-00 00:00:00','',NULL,0,'','','','','','','','0','0','','','',0,0,0,'T30-HQ13-0014',18,12,NULL,0,NULL,'2014-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:03:21'),
 (422,'Tháº¯ng',NULL,'Nguyá»…n VÄƒn','1986-12-23 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ10-0028',18,12,NULL,0,NULL,'2014-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:02:54'),
 (423,'BÃ¬nh',NULL,'Cao Thanh','1983-02-24 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'T30-HQ10-0011',18,12,NULL,0,NULL,'2014-04-01 00:00:00','0000-00-00 00:00:00',4,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:02:21'),
 (424,'Chiáº¿n',NULL,'LÃª Äá»©c','1983-04-16 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'HÄLÄ 68',0,12,NULL,0,NULL,'2013-05-01 00:00:00','0000-00-00 00:00:00',10,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 05:01:52'),
 (425,'BÃ¬nh',NULL,'BÃ¹i Quang','1970-10-10 00:00:00','','0000-00-00 00:00:00','',NULL,1,'','','','','','','','0','0','','','',0,0,0,'HÄLÄ 68',0,12,NULL,0,NULL,'2012-12-01 00:00:00','0000-00-00 00:00:00',11,'','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,0,'','','','N;','N;','N;','N;','N;','','','','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','',0,0,0,0,0,'N;',1,0,'2014-05-15 04:37:44','2014-05-15 04:56:13'),
 (426,'HÆ°á»›ng',NULL,'Nguyá»…n Máº¡nh ','1970-05-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ92-0003',0,9,NULL,0,NULL,'2012-06-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (427,'DÅ©ng',NULL,'LÃª TrÃ­ ','1974-10-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ96-0002',0,9,NULL,0,NULL,'2011-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (428,'HÃ 82',NULL,'Nguyá»…n Thá»‹ Ngá»c ','1982-07-07 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ06-0003',0,9,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (429,'Huyá»n',NULL,'Nguyá»…n Thá»‹ Thanh ','1979-09-28 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ02-0007',0,9,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (430,'LuÃ¢n',NULL,'LÃª VÄƒn ','1955-12-08 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ76-0002',0,9,NULL,0,NULL,'2012-05-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (431,'TÃ¢n',NULL,'HoÃ ng Há»¯u ','1971-08-08 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ95-0007',0,9,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (432,'Trung',NULL,'Äáº·ng Quá»‘c ','1984-06-07 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0003',0,9,NULL,0,NULL,'2014-04-16 00:00:00',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (433,'Háº£i',NULL,'LÃª ','1966-11-11 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ95-0003',0,9,NULL,0,NULL,'2013-04-16 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44');
INSERT INTO `employees` (`em_id`,`em_ten`,`em_ten_dem`,`em_ho`,`em_ngay_sinh`,`em_so_chung_minh_thu`,`em_cmt_ngay_cap`,`em_ten_khac`,`em_anh_the`,`em_gioi_tinh`,`em_home_phone`,`em_phone`,`em_noi_sinh`,`em_noi_sinh_tinh`,`em_noi_sinh_huyen`,`em_que_quan`,`em_noi_o`,`em_noi_o_tinh`,`em_noi_o_huyen`,`em_que_quan_tinh`,`em_que_quan_huyen`,`em_dia_chi`,`em_dia_chi_tinh`,`em_dia_chi_huyen`,`em_dan_toc`,`em_so_cong_chuc`,`em_chuc_vu`,`em_phong_ban`,`em_han_luan_chuyen`,`em_nghi_huu`,`em_ngay_nghi_huu`,`em_time_cong_tac`,`em_ngay_tuyen_dung`,`em_ngach_cong_chuc`,`em_cong_viec`,`em_chuyen_mon`,`em_chuc_vu_dang`,`em_ngay_vao_dang`,`em_chuc_vu_doan`,`em_ngay_vao_doan`,`em_chuc_vu_cong_doan`,`em_quan_ly_nha_nuoc`,`em_ly_luan_chinh_tri`,`em_than_nhan_nuoc_ngoai`,`em_tham_gia_to_chuc`,`em_bi_bat`,`em_qua_trinh_luong`,`em_gia_dinh_vo`,`em_gia_dinh_ban_than`,`em_qua_trinh_cong_tac`,`em_lich_su_dao_tao`,`em_gia_dinh_chinh_sach`,`em_thuong_binh`,`em_nhom_mau`,`em_can_nang`,`em_chieu_cao`,`em_tinh_trang_suc_khoe`,`em_so_bhxh`,`em_danh_hieu`,`em_quan_ham`,`em_ngay_xuat_ngu`,`em_ngay_nhap_ngu`,`em_ky_luat`,`em_khen_thuong`,`em_cong_viec_khi_tuyen_dung`,`em_co_quan_tuyen_dung`,`em_ton_giao`,`em_van_hoa_pt`,`em_hoc_ham`,`em_bang_cap`,`em_ngoai_ngu`,`em_tin_hoc`,`em_chung_chi_khac`,`em_anh_bang_cap`,`em_status`,`em_delete`,`em_date_added`,`em_date_modified`) VALUES 
 (434,'Nga',NULL,'Táº¡ Thá»‹ Kiá»u ','1985-08-30 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ13-0011',0,9,NULL,0,NULL,'2013-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (435,'HÃ¹ng68',NULL,'Tráº§n Máº¡nh ','1978-01-26 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,9,NULL,0,NULL,'2011-05-01 00:00:00',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (436,'PhÃºc',NULL,'Tráº§n ÄÄƒng ','1987-01-01 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,9,NULL,0,NULL,'2014-01-01 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (437,'Linh',NULL,'Nguyá»…n Há»“ng ','1971-10-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ93-0003',0,14,NULL,0,NULL,'2013-08-18 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (438,'Thá»‘ng',NULL,'LÃª Trá»ng ','1971-08-06 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ95-0008',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (439,'Tháº¯ng',NULL,'Cao Äá»©c ','1977-08-15 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ00-0001',0,14,NULL,0,NULL,'2014-05-10 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:44','2014-05-15 04:37:44'),
 (440,'Tiáº¿n',NULL,'Nguyá»…n Duy ','1955-06-02 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ77-0004',0,14,NULL,0,NULL,'2013-08-19 00:00:00',NULL,5,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (441,'CÆ°á»ng',NULL,'ÄÃ o Viáº¿t ','1982-05-24 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ05-0002',0,14,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (442,'Viá»‡t',NULL,'BÃ¹i Tháº¿ ','1978-04-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ00-0005',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (443,'TÃ i',NULL,'Nguyá»…n Quang ','1975-03-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ98-0004',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (444,'HÃ¹ng',NULL,'LÃª Máº¡nh ','1976-04-19 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ01-0002',0,14,NULL,0,NULL,'2012-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (445,'XuÃ¢n',NULL,'Nguyá»…n Thá»‹ ','1983-07-22 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ06-0009',0,14,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (446,'HÃ o',NULL,'LÃª Song ','1975-07-17 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ06-0004',0,14,NULL,0,NULL,'2011-04-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (447,'HÃ ',NULL,'ThÃ¡i VÄƒn ','1970-08-06 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ02-0006',0,14,NULL,0,NULL,'2012-05-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (448,'HÃ ',NULL,'Äinh Viá»‡t ','1974-10-17 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ05-0004',0,14,NULL,0,NULL,'2013-04-16 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (449,'Hiá»ƒn',NULL,'Nguyá»…n Thá»‹ Kim ','1982-11-07 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ05-0008',0,14,NULL,0,NULL,'2013-04-16 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (450,'Tháº¯ng',NULL,'Pháº¡m Anh ','1979-08-31 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ02-0011',0,14,NULL,0,NULL,'2013-04-21 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (451,'Diá»‡u',NULL,'Nguyá»…n ÄÃ¬nh ','1984-07-20 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0034',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (452,'Háº£i',NULL,'Tráº§n Thanh ','1974-07-31 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ96-0003',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (453,'Háº±ng',NULL,'Pháº¡m Thá»‹ Minh ','1983-09-16 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ09-0003',0,14,NULL,0,NULL,'2013-02-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (454,'HÃ¹ng',NULL,'Nguyá»…n Thanh ','1974-10-13 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0007',0,14,NULL,0,NULL,'2012-05-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (455,'HÃ¹ng',NULL,'Nguyá»…n Máº¡nh ','1984-09-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ11-0005',0,14,NULL,0,NULL,'2011-09-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (456,'HÆ°ng',NULL,'Tráº§n VÄƒn ','1987-07-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0040',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (457,'Nga',NULL,'Tráº§n Thá»‹ Tá»‘ ','1978-12-17 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ09-0005',0,14,NULL,0,NULL,'2012-05-01 00:00:00',NULL,9,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (458,'NghÄ©a',NULL,'Phan Trá»ng ','1983-09-17 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ11-0006',0,14,NULL,0,NULL,'2012-12-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (459,'TÆ°á»ng',NULL,'Nguyá»…n CÃ¡t ','1955-02-25 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ86-0002',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (460,'Thanh',NULL,'LÃª ÄÃ¬nh ','1966-09-01 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ94-0010',0,14,NULL,0,NULL,'2011-07-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (461,'ThÃ¬n',NULL,'Äáº·ng VÄƒn ','1966-10-18 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0001',0,14,NULL,0,NULL,'2012-05-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (462,'Thá»©c',NULL,'LÃª ÄÃ¬nh ','1974-12-25 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0009',0,14,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (463,'SÆ¡n',NULL,'Nguyá»…n NhÆ° ','1978-10-15 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ08-0004',0,14,NULL,0,NULL,'2013-04-16 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (464,'TÃ¹ng',NULL,'Biá»‡n DÆ°Æ¡ng ','1984-10-29 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0004',0,14,NULL,0,NULL,'2014-04-14 00:00:00',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (465,'Minh',NULL,'Tráº§n VÄƒn ','1983-10-05 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0002',0,14,NULL,0,NULL,'2014-04-17 00:00:00',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (466,'Huy81',NULL,'Pháº¡m Quang ','1981-09-21 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ09-0004',0,14,NULL,0,NULL,'2014-04-15 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (467,'Chi',NULL,'Nguyá»…n KhÃ¡nh ','1986-07-10 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0012',0,14,NULL,0,NULL,'2014-04-18 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (468,'Sang',NULL,'Tráº§n VÄƒn ','1984-10-01 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ11-0007',0,14,NULL,0,NULL,'2014-04-14 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (469,'PhÆ°Æ¡ng',NULL,'HÃ  Tiáº¿n ','1978-11-09 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ00-0003',0,14,NULL,0,NULL,'2014-04-14 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (470,'Vinh',NULL,'HoÃ ng Trá»ng ','1984-10-04 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0025',0,14,NULL,0,NULL,'2013-08-18 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (471,'HÃ¹ng',NULL,'VÃµ ÄÄƒng ','1980-11-05 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,14,NULL,0,NULL,'2013-04-26 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (472,'DÅ©ng',NULL,'Nguyá»…n VÄƒn ','1971-05-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,14,NULL,0,NULL,'2013-04-25 00:00:00',NULL,11,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (473,'Háº£i',NULL,'VÃµ Quang ','1979-01-18 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (474,'KhÃ¡nh',NULL,'Nguyá»…n Quá»‘c ','1988-02-18 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (475,'CÆ°Æ¡ng',NULL,'LÃª Äá»©c ','1985-06-30 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,14,NULL,0,NULL,'2013-01-01 00:00:00',NULL,11,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (476,'Anh',NULL,'Nguyá»…n Viá»‡t ','1991-10-23 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,14,NULL,0,NULL,'2013-10-15 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (477,'VÅ©',NULL,'LÃª KhÃ¡nh ','1989-11-05 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,14,NULL,0,NULL,'2013-10-15 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (478,'Má»¹',NULL,'Nguyá»…n Thá»‹ ','1991-04-27 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,14,NULL,0,NULL,'2013-11-13 00:00:00',NULL,12,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (479,'DÆ°Æ¡ng',NULL,'LÃª Tiáº¿n ','1988-05-25 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HLV',0,14,NULL,0,NULL,'2012-04-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:45','2014-05-15 04:37:45'),
 (480,'Huá»³nh',NULL,'HoÃ ng HÃ¹ng ','1991-10-13 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HLV',0,14,NULL,0,NULL,'2012-04-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (481,'KiÃªn',NULL,'HoÃ ng Trá»ng ','1983-06-05 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HLV',0,14,NULL,0,NULL,'2012-09-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (482,'SÃ¢m',NULL,'Nguyá»…n Tiáº¿n ','1956-05-19 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ95-0004',0,13,NULL,0,NULL,'2012-10-01 00:00:00',NULL,5,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (483,'HiÃªn',NULL,'Nguyá»…n Há»¯u ','1964-07-02 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ87-0001',0,13,NULL,0,NULL,'2014-05-16 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (484,'PhÃºc',NULL,'Tráº§n Thanh ','1971-06-22 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ94-0008',0,13,NULL,0,NULL,'2014-05-16 00:00:00',NULL,5,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (485,'NÆ°u',NULL,'Nguyá»…n ','1954-11-05 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ77-0003',0,13,NULL,0,NULL,'2013-08-18 00:00:00',NULL,5,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (486,'Äá»©c',NULL,'Nguyá»…n Minh ','1979-01-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ02-0005',0,13,NULL,0,NULL,'2011-08-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (487,'HÃ¹ng',NULL,'Tráº§n Máº¡nh ','1978-09-17 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ05-0009',0,13,NULL,0,NULL,'2013-01-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (488,'BÃ¬nh',NULL,'LÃª Thanh ','1966-08-28 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ95-0001',0,13,NULL,0,NULL,'2013-04-16 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (489,'BÃ­nh',NULL,'NgÃ´ VÄƒn ','1986-09-28 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ11-0004',0,13,NULL,0,NULL,'2013-02-01 00:00:00',NULL,8,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (490,'Chiáº¿n',NULL,'TrÆ°Æ¡ng XuÃ¢n ','1982-05-02 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0013',0,13,NULL,0,NULL,'2011-09-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (491,'Chiáº¿n',NULL,'Nguyá»…n BÃ¡ ','1987-05-22 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0031',0,13,NULL,0,NULL,'2010-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (492,'DÅ©ng',NULL,'HÃ  VÄƒn ','1975-05-01 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ99-0001',0,13,NULL,0,NULL,'2012-05-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (493,'Phong',NULL,'Tráº§n ÄÃ¬nh ','1975-08-15 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ94-0007',0,13,NULL,0,NULL,'2014-04-14 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (494,'DÅ©ng',NULL,'Nguyá»…n Tiáº¿n ','1983-05-13 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0033',0,13,NULL,0,NULL,'2010-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (495,'Háº£i',NULL,'Äáº·ng Há»¯u ','1981-03-21 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ09-0008',0,13,NULL,0,NULL,'2012-05-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (496,'HoÃ ng',NULL,'Nguyá»…n ÄÃ¬nh ','1984-01-15 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0038',0,13,NULL,0,NULL,'2010-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (497,'HÃ¹ng',NULL,'Nguyá»…n Anh ','1986-06-15 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0039',0,13,NULL,0,NULL,'2010-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (498,'Huá»³nh',NULL,'Pháº¡m Quang ','1958-09-02 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ11-0002',0,13,NULL,0,NULL,'2012-05-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (499,'Long',NULL,'Nguyá»…n ÄÄƒng ','1983-10-02 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0042',0,13,NULL,0,NULL,'2012-05-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (500,'Nhung',NULL,'Kiá»u Äá»©c ','1962-06-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ94-0006',0,13,NULL,0,NULL,'2012-05-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (501,'Quá»³nh',NULL,'VÃµ XuÃ¢n ','1983-04-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0020',0,13,NULL,0,NULL,'2013-02-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (502,'Tuáº¥n',NULL,'Pháº¡m BÃ¡ ','1987-05-15 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0046',0,13,NULL,0,NULL,'2013-02-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (503,'TÃºy',NULL,'Äinh VÄƒn ','1986-12-26 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0024',0,13,NULL,0,NULL,'2010-07-01 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (504,'Tháº¡ch',NULL,'Pháº¡m Ngá»c ','1987-08-26 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0021',0,13,NULL,0,NULL,'2010-10-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (505,'ThÆ°',NULL,'VÃµ ÄÃ¬nh ','1982-12-22 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ09-0009',0,13,NULL,0,NULL,'2013-02-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (506,'Trá»ng',NULL,'Nguyá»…n VÄƒn ','1984-06-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0005',0,13,NULL,0,NULL,'2012-05-01 00:00:00',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (507,'VÃµ',NULL,'DÆ°Æ¡ng ÄÃ¬nh ','1960-03-04 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ84-0002',0,13,NULL,0,NULL,'2010-03-01 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (508,'Thá»§y',NULL,'ÄÆ°á»ng Thá»‹ Thanh ','1986-08-12 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0044',0,13,NULL,0,NULL,'2013-04-16 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (509,'ChÃ¢u',NULL,'LÃª Thá»‹ Minh ','1986-05-10 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ08-0001',0,13,NULL,0,NULL,'2014-04-14 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (510,'ToÃ n',NULL,'Nguyá»…n Song ','1986-11-01 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0045',0,13,NULL,0,NULL,'2013-04-16 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (511,'DuyÃªn',NULL,'Nguyá»…n Thá»‹ Háº£i ','1986-01-10 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0015',0,13,NULL,0,NULL,'2014-04-14 00:00:00',NULL,6,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (512,'Trang',NULL,'Tráº§n Thá»‹ Huyá»n ','1987-01-21 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ10-0049',0,13,NULL,0,NULL,'2013-04-18 00:00:00',NULL,4,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (513,'XuÃ¢n',NULL,'Nguyá»…n VÄƒn ','1983-03-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'T30-HQ11-0010',0,13,NULL,0,NULL,'2013-02-01 00:00:00',NULL,8,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (514,'LÃ½',NULL,'Nguyá»…n XuÃ¢n ','1980-10-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,13,NULL,0,NULL,'2013-12-13 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (515,'ToÃ n',NULL,'Nguyá»…n VÄ©nh ','1977-05-05 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,13,NULL,0,NULL,'2013-05-07 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (516,'An',NULL,'Nguyá»…n HoÃ i ','1975-09-12 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,13,NULL,0,NULL,'2011-02-01 00:00:00',NULL,11,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (517,'Äá»‹nh',NULL,'Phan CÃ´ng ','1982-05-05 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,13,NULL,0,NULL,'2013-01-01 00:00:00',NULL,11,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (518,'Tá»‹nh',NULL,'Nguyá»…n Thanh ','1970-05-10 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,13,NULL,0,NULL,'2011-07-01 00:00:00',NULL,10,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (519,'Háº¡nh',NULL,'BÃ¹i Thá»‹ PhÆ°Æ¡ng ','1989-11-20 00:00:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HÄLÄ 68',0,13,NULL,0,NULL,'2014-02-10 00:00:00',NULL,12,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (520,'Tuáº¥n',NULL,'Pháº¡m Anh ','1988-08-08 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HLV',0,13,NULL,0,NULL,'2012-08-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46'),
 (521,'Quang',NULL,'Nguyá»…n VÄƒn ','1985-08-04 00:00:00',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'HLV',0,13,NULL,0,NULL,'2012-04-01 00:00:00',NULL,7,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,1,0,'2014-05-15 04:37:46','2014-05-15 04:37:46');
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
  `eme_cmt_ngay_cap` datetime DEFAULT NULL,
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
  PRIMARY KEY (`eme_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees_edit`
--

/*!40000 ALTER TABLE `employees_edit` DISABLE KEYS */;
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
  `eh_pc_tham_nien` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`eh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees_heso`
--

/*!40000 ALTER TABLE `employees_heso` DISABLE KEYS */;
INSERT INTO `employees_heso` (`eh_id`,`eh_em_id`,`eh_loai_luong`,`eh_giai_doan`,`eh_he_so`,`eh_pc_cong_viec`,`eh_pc_trach_nhiem`,`eh_pc_tnvk_phan_tram`,`eh_tham_niem`,`eh_pc_udn_phan_tram`,`eh_pc_cong_vu_phan_tram`,`eh_pc_kiem_nhiem`,`eh_pc_khac`,`eh_han_dieu_chinh`,`eh_date_added`,`eh_date_modified`,`eh_pc_kv`,`eh_pc_khac_type`,`eh_pc_thu_hut`,`eh_bac_luong`,`eh_pc_doc_hai`,`eh_pc_doc_hai_type`,`eh_han_ap_dung`,`eh_pc_tham_nien`) VALUES 
 (1,1,0,0,1.1,2.1,4.1,6.1,'2000-11-01 00:00:07',7.1,8.1,9.1,10.1,'2019-01-01 00:00:07','2014-02-22 15:54:27','2014-04-15 01:05:42',5.1,0,3.1,2,0,0,'0000-00-00 00:00:00',13),
 (2,2,0,0,4.06,0,0,11,'0000-00-00 00:00:00',25,25,0,0,'2016-01-01 00:00:07','2014-02-22 21:17:29','2014-02-22 21:17:29',0,0,0,0,0,0,'0000-00-00 00:00:00',0),
 (3,17,0,0,4,5,0.2,12,'0000-00-00 00:00:00',12,25,0.3,0.1,'2014-01-01 00:00:00','2014-02-25 21:59:32','2014-02-25 21:59:37',0,0,0,0,0,0,'0000-00-00 00:00:00',0),
 (4,18,0,0,4.32,0.6,0,0,'0000-00-00 00:00:00',20,25,0,0,'2014-01-01 00:00:00','2014-02-28 02:04:05','2014-02-28 02:04:05',0,0,0,0,0,0,'0000-00-00 00:00:00',0),
 (5,13,0,0,3,0.3,0,0,'2005-04-01 00:00:07',20,25,0,0,'2014-04-01 00:00:07','2014-04-16 21:25:19','2014-04-17 05:21:18',0,0,0,1,0,0,'0000-00-00 00:00:00',9),
 (6,19,0,0,2.34,0,0,0,'2013-02-01 00:00:07',20,25,0,0,'2017-02-01 00:00:07','2014-04-16 22:26:12','2014-04-16 22:26:12',0,0,0,1,0,0,'0000-00-00 00:00:00',1),
 (7,20,0,0,4.32,0.5,0.15,0,'1991-03-01 00:00:07',20,25,0,0,'2015-03-01 00:00:07','2014-04-17 21:13:58','2014-04-17 21:14:04',0,0,0,2,0,0,'0000-00-00 00:00:00',23),
 (8,21,0,0,4.32,0.6,0,0,'1993-11-01 00:00:07',20,25,0,0,'2016-11-01 00:00:07','2014-04-17 21:16:34','2014-04-17 21:16:34',0.5,0,70,2,0,0,'0000-00-00 00:00:00',20),
 (9,22,0,0,3.99,0.55,0,0,'1992-04-01 00:00:07',20,25,0,0,'2015-04-01 00:00:07','2014-04-17 21:36:57','2014-04-17 21:36:57',0.2,0,70,2,0,0,'0000-00-00 00:00:00',22),
 (10,23,0,0,3.66,0,0,0,'2002-10-01 00:00:07',20,25,0,0,'2017-01-01 00:00:07','2014-04-17 21:38:13','2014-04-17 21:38:13',0,0,0,2,0,0,'0000-00-00 00:00:00',11),
 (11,24,0,0,2.34,0,0,0,'2010-07-01 00:00:07',20,25,0,0,'2014-07-01 00:00:07','2014-04-17 21:39:21','2014-04-17 21:39:34',0,0,0,1,0,0,'0000-00-00 00:00:00',3),
 (12,25,0,0,3,0.3,0,0,'2005-04-01 00:00:07',20,25,0,0,'2015-04-01 00:00:07','2014-04-17 21:41:26','2014-04-17 21:41:43',0.5,0,70,2,0,0,'0000-00-00 00:00:00',9),
 (13,26,0,0,3.66,0.5,0,0,'2002-01-01 00:00:07',20,25,0,0,'2016-01-01 00:00:07','2014-04-17 21:46:10','2014-04-17 21:46:10',0,0,0,2,0,0,'0000-00-00 00:00:00',12),
 (14,27,0,0,2.67,0,0,0,'2010-06-01 00:00:07',20,25,0,0,'2014-06-01 00:00:07','2014-04-17 21:52:04','2014-04-17 21:52:04',0.5,0,70,1,0,0,'0000-00-00 00:00:00',4),
 (15,28,0,0,2.34,0,0,6,'2013-02-01 00:00:07',20,25,0,0,'2017-02-01 00:00:07','2014-04-17 21:52:55','2014-04-17 21:52:55',0,0,0,1,0,0,'0000-00-00 00:00:00',1),
 (16,29,0,0,3.33,0.5,0.35,0,'2002-01-01 00:00:07',20,25,0,0,'2014-04-01 00:00:07','2014-04-17 21:56:30','2014-04-17 21:57:40',0,0,0,2,0,0,'0000-00-00 00:00:00',12),
 (17,30,0,0,3,0.5,0.3,0,'2005-02-01 00:00:07',20,25,0,0,'2014-05-01 00:00:07','2014-04-17 22:06:22','2014-04-17 22:06:22',0,0,0,2,0,0,'0000-00-00 00:00:00',9),
 (18,13,0,0,4.74,0.3,0,0,'2005-04-01 00:00:07',20,25,0,0,'2014-04-01 00:00:07','2014-05-14 19:40:30','2014-05-14 19:40:30',0,0,0,2,0,0,'2010-11-01 00:00:07',9),
 (25,37,0,1,3.33,1.1,1.2,7.6,'2002-02-01 00:00:00',12,1,2,1,'2011-05-01 00:00:00','2014-05-14 20:20:38','2014-05-14 20:20:38',2.4,0,3,4,12,0,'2011-05-01 00:00:00',12),
 (26,38,1,0,2.34,1.2,1.3,2.5,'2002-02-01 00:00:00',10,2.4,1,1.2,'2012-01-04 00:00:00','2014-05-14 20:20:38','2014-05-14 20:20:38',1.5,1,4,1,200000,1,'2012-01-04 00:00:00',12),
 (27,30,0,0,3,0.5,0.3,0,'2005-02-01 00:00:07',20,25,0,0,'2014-05-01 00:00:07','2014-05-14 22:27:33','2014-05-14 22:27:33',0,0,0,3,0,0,'1900-11-01 00:00:07',9),
 (28,30,0,0,3,0.5,0.3,0,'2005-02-01 00:00:07',20,25,0,0,'2014-05-01 00:00:07','2014-05-14 22:28:18','2014-05-14 22:28:23',0,0,0,3,0,0,'2011-05-01 00:00:07',9),
 (29,39,0,1,3.33,1.1,1.2,7.6,'2002-02-01 00:00:00',12,1,2,1,'2011-05-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',2.4,0,3,4,12,0,'2011-05-01 00:00:00',12),
 (30,40,1,0,2.34,1.2,1.3,2.5,'2002-02-01 00:00:00',10,2.4,1,1.2,'2012-01-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',1.5,1,4,1,200000,1,'2012-01-01 00:00:00',12),
 (31,41,0,0,4.32,0.9,0,0,'1994-12-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,7,0,0,'2013-12-01 00:00:00',19),
 (32,42,0,0,5.76,0.7,0,0,'1977-10-01 00:00:00',15,25,0,0,'2012-11-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,5,0,0,'2012-11-01 00:00:00',36),
 (33,43,0,0,3.99,0.7,0,0,'1996-06-01 00:00:00',20,25,0,0,'2012-06-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,6,0,0,'2012-06-01 00:00:00',18),
 (34,44,0,0,5.42,0.7,0,0,'1992-12-01 00:00:00',15,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,4,0,0,'2013-01-01 00:00:00',21),
 (35,45,0,0,3.66,0.5,0,0,'2002-02-01 00:00:00',20,25,0,0,'2014-05-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,5,0,0,'2014-05-01 00:00:00',12),
 (36,46,0,0,3.66,0.3,0,0,'1995-09-01 00:00:00',20,25,0,0,'2012-04-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,5,0,0,'2012-04-01 00:00:00',18),
 (37,47,0,0,3,0.5,0,0,'2005-03-01 00:00:00',20,25,0,0,'2011-06-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,3,0,0,'2011-06-01 00:00:00',9),
 (38,48,0,0,3.26,0,0,0,'1993-07-01 00:00:00',25,25,0,0,'2013-12-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,8,0,0,'2013-12-01 00:00:00',20),
 (39,49,0,0,1.89,0,0,0,'2006-03-01 00:00:00',25,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,4,0,0,'2014-03-01 00:00:00',8),
 (40,50,0,0,3.63,0,0,0,'1997-07-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,12,0,0,'2013-06-01 00:00:00',16),
 (41,51,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (42,52,0,0,3,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,3,0,0,'2013-11-01 00:00:00',3),
 (43,53,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (44,54,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-08-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2011-08-01 00:00:00',3),
 (45,55,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (46,56,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (47,57,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (48,58,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (49,59,1,0,2.44,0,0,0,'1997-05-01 00:00:00',0,25,0,0,'2012-05-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,9,0,0,'2012-05-01 00:00:00',17),
 (50,60,1,0,2.23,0,0,0,'2011-02-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,2,0,0,'2013-02-01 00:00:00',3),
 (51,61,1,0,2.59,0,0,0,'2006-08-01 00:00:00',0,25,0,0,'2012-08-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,4,0,0,'2012-08-01 00:00:00',7),
 (52,62,1,0,2.23,0,0,0,'2011-02-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,2,0,0,'2013-02-01 00:00:00',3),
 (53,63,1,0,1.5,0,0,0,'2013-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2013-05-01 00:00:00',1),
 (54,64,1,0,1,0,0,0,'2013-06-01 00:00:00',0,25,0,0,'2013-06-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2013-06-01 00:00:00',1),
 (55,65,1,0,2.4,0,0,0,'1997-05-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,6,0,0,'2013-02-01 00:00:00',17),
 (56,66,1,0,2.22,0,0,0,'2006-03-01 00:00:00',0,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,5,0,0,'2014-03-01 00:00:00',8),
 (57,67,0,0,4.32,0.5,0.15,0,'1992-04-01 00:00:07',20,25,0,0,'2012-10-01 00:00:07','2014-05-14 23:27:52','2014-05-31 21:36:53',0,0,0,7,0,0,'2012-10-01 00:00:00',22),
 (58,68,0,0,4.74,0.3,0,0,'1994-11-01 00:00:00',15,25,0,0,'2011-06-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,2,0,0,'2011-06-01 00:00:00',19),
 (59,69,0,0,3,0.3,0,0,'2005-05-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,3,0,0,'2012-05-01 00:00:00',9),
 (60,70,0,0,3.66,0,0,0,'2002-02-01 00:00:00',20,25,0,0,'2014-02-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,5,0,0,'2014-02-01 00:00:00',12),
 (61,71,0,0,2.67,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2014-01-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,2,0,0,'2014-01-01 00:00:00',3),
 (62,72,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (63,73,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (64,74,0,0,4.32,0.5,0,0,'1994-11-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,7,0,0,'2013-11-01 00:00:00',19),
 (65,75,0,0,2.67,0,0,0,'2009-01-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,2,0,0,'2013-01-01 00:00:00',5),
 (66,76,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,2,0,0,'2012-12-01 00:00:00',5),
 (67,77,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (68,78,0,0,3.66,0.5,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-02-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,5,0,0,'2013-02-01 00:00:00',12),
 (69,79,0,0,4.74,0.3,0,0,'1994-11-01 00:00:00',15,25,0,0,'2012-06-01 00:00:00','2014-05-14 23:27:52','2014-05-14 23:27:52',0,0,0,2,0,0,'2012-06-01 00:00:00',19),
 (70,80,0,0,2.34,0,0,0,'2011-11-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2012-11-01 00:00:00',2),
 (71,81,0,0,3,0,0,0,'2005-07-01 00:00:00',20,25,0,0,'2012-06-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,3,0,0,'2012-06-01 00:00:00',8),
 (72,82,0,0,3.33,0,0,0,'2004-09-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,4,0,0,'2012-12-01 00:00:00',9),
 (73,83,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (74,84,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (75,85,0,0,2.67,0,0,0,'2009-04-01 00:00:00',20,25,0,0,'2012-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,2,0,0,'2012-10-01 00:00:00',5),
 (76,86,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (77,87,0,0,3,0,0,0,'2005-01-01 00:00:00',20,25,0,0,'2012-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,3,0,0,'2012-01-01 00:00:00',9),
 (78,88,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2013-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2013-03-01 00:00:00',1),
 (79,89,0,0,3.33,0.5,0,0,'2002-02-01 00:00:00',20,25,0,0,'2012-02-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,4,0,0,'2012-02-01 00:00:00',12),
 (80,90,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (81,91,0,0,3,0,0,0,'2005-05-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,3,0,0,'2012-05-01 00:00:00',9),
 (82,92,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (83,93,0,0,3.99,0,0,0,'1992-12-01 00:00:00',20,25,0,0,'2013-07-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,6,0,0,'2013-07-01 00:00:00',21),
 (84,94,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2011-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-11-01 00:00:00',1),
 (85,95,0,0,3.33,0.6,0,0,'2001-07-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,4,0,0,'2013-01-01 00:00:00',12),
 (86,96,0,0,3.33,0.3,0,0,'2003-09-01 00:00:00',20,25,0,0,'2013-08-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,4,0,0,'2013-08-01 00:00:00',10),
 (87,97,0,0,3.99,0.3,0,0,'1996-11-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,6,0,0,'2013-11-01 00:00:00',17),
 (88,98,0,0,3,0.2,0,0,'2006-11-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,3,0,0,'2013-11-01 00:00:00',7),
 (89,99,0,0,3.99,0,0,0,'1996-06-01 00:00:00',20,25,0,0,'2013-06-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,6,0,0,'2013-06-01 00:00:00',18),
 (90,100,0,0,4.32,0,0,0,'1989-07-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,7,0,0,'2011-10-01 00:00:00',24),
 (91,101,0,0,3.63,0,0,9,'1994-12-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,12,0,0,'2013-06-01 00:00:00',19),
 (92,102,0,0,3.26,0,0,0,'2001-07-01 00:00:00',25,25,0,0,'2014-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,8,0,0,'2014-01-01 00:00:00',12),
 (93,103,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,2,0,0,'2012-12-01 00:00:00',5),
 (94,104,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,2,0,0,'2012-12-01 00:00:00',5),
 (95,105,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (96,106,1,0,2.05,0,0,0,'2013-01-01 00:00:00',0,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2013-01-01 00:00:00',1),
 (97,107,0,0,5.42,0.6,0,0,'1984-03-01 00:00:00',15,25,0,0,'2011-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,4,0,0,'2011-11-01 00:00:00',30),
 (98,108,0,0,3.99,0.4,0,0,'1988-03-01 00:00:00',20,25,0,0,'2012-09-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,6,0,0,'2012-09-01 00:00:00',26),
 (99,109,0,0,3.66,0,0,0,'1995-10-01 00:00:00',25,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,10,0,0,'2013-11-01 00:00:00',18),
 (100,110,0,0,4.06,0,0,7,'1992-12-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,12,0,0,'2013-06-01 00:00:00',21),
 (101,111,0,0,4.65,0,0,0,'1986-09-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,8,0,0,'2011-10-01 00:00:00',27),
 (102,112,0,0,2.72,0,0,0,'2013-03-01 00:00:00',25,25,0,0,'2012-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,3,0,0,'2012-03-01 00:00:00',1),
 (103,113,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2012-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,1,0,0,'2012-10-01 00:00:00',1),
 (104,114,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2013-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,1,0,0,'2013-03-01 00:00:00',1),
 (105,115,1,0,2.23,0,0,0,'2008-11-01 00:00:00',0,25,0,0,'2013-08-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,2,0,0,'2013-08-01 00:00:00',5),
 (106,116,0,0,3.99,0.55,0,0,'1997-05-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,6,0,0,'2013-12-01 00:00:00',17),
 (107,117,0,0,3,0.25,0,0,'2006-08-01 00:00:00',20,25,0,0,'2013-08-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,3,0,0,'2013-08-01 00:00:00',7),
 (108,118,0,0,3.33,0.25,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,4,0,0,'2013-11-01 00:00:00',12),
 (109,119,0,0,3.66,0.15,0,0,'1993-11-01 00:00:00',25,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,10,0,0,'2013-01-01 00:00:00',20),
 (110,120,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (111,121,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-08-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-08-01 00:00:00',3),
 (112,122,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (113,123,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (114,124,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (115,125,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (116,126,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (117,127,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (118,128,1,0,2.4,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2013-07-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,6,0,0,'2013-07-01 00:00:00',11),
 (119,129,1,0,2.4,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0,0,0,6,0,0,'2013-01-01 00:00:00',11),
 (120,130,0,0,5.08,0.55,0,0,'1982-10-01 00:00:00',15,25,0,0,'2012-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,3,0,0,'2012-01-01 00:00:00',31),
 (121,131,0,0,4.32,0.35,0,0,'1982-02-01 00:00:00',20,25,0,0,'2013-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,7,0,0,'2013-03-01 00:00:00',32),
 (122,132,0,0,3,0,0,0,'2006-08-01 00:00:00',20,25,0,0,'2012-08-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,3,0,0,'2012-08-01 00:00:00',7),
 (123,133,0,0,3.63,0,0,20,'1972-06-01 00:00:00',25,25,0,0,'2014-02-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,12,0,0,'2014-02-01 00:00:00',42),
 (124,134,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (125,135,0,0,4.06,0,0,17,'1976-10-01 00:00:00',25,25,0,0,'2014-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,12,0,0,'2014-01-01 00:00:00',37),
 (126,136,0,0,3.86,0,0,0,'1992-12-01 00:00:00',25,25,0,0,'2013-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,11,0,0,'2013-10-01 00:00:00',21),
 (127,137,0,0,3.63,0,0,15,'1985-10-01 00:00:00',25,25,0,0,'2013-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,12,0,0,'2013-10-01 00:00:00',28),
 (128,138,0,0,3.06,0,0,0,'2000-12-01 00:00:00',25,25,0,0,'2012-06-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,7,0,0,'2012-06-01 00:00:00',13),
 (129,139,0,0,3.33,0,0,0,'2004-09-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,4,0,0,'2013-12-01 00:00:00',9),
 (130,140,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (131,141,1,0,1.5,0,0,0,'2013-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,1,0,0,'2013-05-01 00:00:00',1),
 (132,142,1,0,3.13,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,7,0,0,'2013-01-01 00:00:00',11),
 (133,143,1,0,2.94,0,0,0,'1997-04-01 00:00:00',0,25,0,0,'2013-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.1,0,0,9,0,0,'2013-10-01 00:00:00',17),
 (134,144,0,0,3.99,0.55,0,0,'1992-05-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,6,0,0,'2012-05-01 00:00:00',22),
 (135,145,0,0,4.74,0.35,0,0,'1994-11-01 00:00:00',15,25,0,0,'2012-06-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,2,0,0,'2012-06-01 00:00:00',19),
 (136,146,0,0,4.32,0.35,0,0,'1987-06-01 00:00:00',20,25,0,0,'2012-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,7,0,0,'2012-10-01 00:00:00',27),
 (137,147,0,0,3.66,0.35,0,0,'2002-02-01 00:00:00',20,25,0,0,'2014-05-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,5,0,0,'2014-05-01 00:00:00',12),
 (138,148,0,0,3.33,0.25,0,0,'2001-07-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,4,0,0,'2012-12-01 00:00:00',12),
 (139,149,0,0,3.99,0.15,0,0,'1998-01-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,6,0,0,'2013-01-01 00:00:00',16),
 (140,150,0,0,4.98,0.15,0,0,'1978-10-01 00:00:00',20,25,0,0,'2012-07-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,9,0,0,'2012-07-01 00:00:00',35),
 (141,151,0,0,3.66,0.25,0,0,'1998-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,5,0,0,'2011-10-01 00:00:00',15),
 (142,152,0,0,3,0.15,0,0,'2005-04-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,3,0,0,'2011-07-01 00:00:00',9),
 (143,153,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,1,0,0,'2011-10-01 00:00:00',3),
 (144,154,0,0,2.46,0,0,0,'2006-08-01 00:00:00',25,25,0,0,'2013-02-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,4,0,0,'2013-02-01 00:00:00',7),
 (145,155,0,0,3.26,0,0,0,'1998-10-01 00:00:00',25,25,0,0,'2013-04-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,8,0,0,'2013-04-01 00:00:00',15),
 (146,156,0,0,2.34,0,0,0,'2011-11-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,1,0,0,'2012-11-01 00:00:00',2),
 (147,157,0,0,4.06,0,0,7,'1995-08-01 00:00:00',25,25,0,0,'2013-09-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,12,0,0,'2013-09-01 00:00:00',18),
 (148,158,0,0,2.1,0,0,0,'2011-09-01 00:00:00',25,25,0,0,'2012-09-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,1,0,0,'2012-09-01 00:00:00',2),
 (149,159,0,0,4.32,0,0,0,'2013-06-01 00:00:00',20,25,0,0,'2012-10-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,7,0,0,'2012-10-01 00:00:00',1),
 (150,160,0,0,2.55,0,0,0,'1991-03-01 00:00:00',25,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,6,0,0,'2013-01-01 00:00:00',23),
 (151,161,0,0,4.98,0,0,0,'1975-03-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,9,0,0,'2012-11-01 00:00:00',39),
 (152,162,0,0,4.06,0,0,0,'1990-03-01 00:00:00',25,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,12,0,0,'2013-11-01 00:00:00',24),
 (153,163,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,1,0,0,'2014-03-01 00:00:00',1),
 (154,164,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,1,0,0,'2014-03-01 00:00:00',1),
 (155,165,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:53','2014-05-14 23:27:53',0.2,0,70,1,0,0,'2014-03-01 00:00:00',1),
 (156,166,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,70,1,0,0,'2014-03-01 00:00:00',1),
 (157,167,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-08-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,70,1,0,0,'2011-08-01 00:00:00',3),
 (158,168,0,0,2.67,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2013-07-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,70,2,0,0,'2013-07-01 00:00:00',3),
 (159,169,1,0,1.5,0,0,0,'2013-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,70,1,0,0,'2013-05-01 00:00:00',1),
 (160,170,1,0,2.59,0,0,0,'2007-08-01 00:00:00',0,25,0,0,'2014-02-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,70,4,0,0,'2014-02-01 00:00:00',6),
 (161,171,0,0,3.99,0.55,0,0,'1992-12-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,6,0,0,'2012-05-01 00:00:00',21),
 (162,172,0,0,3.99,0.35,0,0,'1996-11-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,6,0,0,'2013-11-01 00:00:00',17),
 (163,173,0,0,3,0,0,0,'2006-11-01 00:00:00',20,25,0,0,'2013-05-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,3,0,0,'2013-05-01 00:00:00',7),
 (164,174,0,0,3.33,0,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-02-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,4,0,0,'2013-02-01 00:00:00',12),
 (165,175,0,0,4.06,0,0,13,'1976-10-01 00:00:00',25,25,0,0,'2014-04-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,12,0,0,'2014-04-01 00:00:00',37),
 (166,176,0,0,3.99,0,0,0,'1995-07-01 00:00:00',20,25,0,0,'2013-10-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,6,0,0,'2013-10-01 00:00:00',18),
 (167,177,0,0,2.26,0,0,0,'2007-12-01 00:00:00',25,25,0,0,'2012-06-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,3,0,0,'2012-06-01 00:00:00',6),
 (168,178,0,0,4.06,0,0,13,'1995-08-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,12,0,0,'2013-06-01 00:00:00',18),
 (169,179,0,0,2.67,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-02-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,2,0,0,'2014-02-01 00:00:00',1),
 (170,180,1,0,2.4,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,6,0,0,'2013-01-01 00:00:00',11),
 (171,181,1,0,1.5,0,0,0,'2014-03-01 00:00:00',0,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0,0,70,1,0,0,'2014-03-01 00:00:00',0),
 (172,182,0,0,4.32,0.6,0,0,'1993-12-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,7,0,0,'2013-12-01 00:00:00',20),
 (173,183,0,0,3.99,0.4,0,0,'1995-12-01 00:00:00',20,25,0,0,'2011-12-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,6,0,0,'2011-12-01 00:00:00',18),
 (174,184,0,0,3.66,0.4,0,0,'2000-07-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,5,0,0,'2014-03-01 00:00:00',13),
 (175,185,0,0,5.76,0.4,0,0,'1977-10-01 00:00:00',15,25,0,0,'2012-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,5,0,0,'2012-01-01 00:00:00',36),
 (176,186,0,0,3,0.3,0,0,'2005-05-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,3,0,0,'2012-05-01 00:00:00',9),
 (177,187,0,0,3.33,0.3,0,0,'2000-07-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,4,0,0,'2012-12-01 00:00:00',13),
 (178,188,0,0,3.99,0.3,0,0,'1998-08-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,6,0,0,'2013-11-01 00:00:00',15),
 (179,189,0,0,3.66,0.2,0,0,'2001-02-01 00:00:00',20,25,0,0,'2013-05-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,5,0,0,'2013-05-01 00:00:00',13),
 (180,190,0,0,3,0.3,0,0,'2006-08-01 00:00:00',20,25,0,0,'2013-08-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,3,0,0,'2013-08-01 00:00:00',7),
 (181,191,0,0,2.67,0.2,0,0,'2003-01-01 00:00:00',20,25,0,0,'2011-08-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'2011-08-01 00:00:00',11),
 (182,192,0,0,4.06,0.2,0,0,'1989-03-01 00:00:00',25,25,0,0,'2013-07-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,12,0,0,'2013-07-01 00:00:00',25),
 (183,193,0,0,3.99,0.2,0,0,'2005-07-01 00:00:00',20,25,0,0,'2014-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,6,0,0,'2014-01-01 00:00:00',8),
 (184,194,0,0,3,0.2,0,0,'2005-03-01 00:00:00',20,25,0,0,'2012-03-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,3,0,0,'2012-03-01 00:00:00',9),
 (185,195,0,0,3.33,0,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-08-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,4,0,0,'2013-08-01 00:00:00',12),
 (186,196,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,1,0,0,'2011-10-01 00:00:00',3),
 (187,197,0,0,3.66,0,0,0,'1997-01-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,5,0,0,'2011-10-01 00:00:00',17),
 (188,198,0,0,2.67,0,0,0,'2009-01-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'2013-01-01 00:00:00',5),
 (189,199,0,0,3.06,0,0,0,'1993-03-01 00:00:00',25,25,0,0,'2012-06-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,7,0,0,'2012-06-01 00:00:00',21),
 (190,200,0,0,3,0,0,0,'2011-09-01 00:00:00',20,25,0,0,'1970-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,3,0,0,'1970-01-01 00:00:00',2),
 (191,201,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,1,0,0,'2011-10-01 00:00:00',3),
 (192,202,0,0,2.07,0,0,0,'2005-01-01 00:00:00',25,25,0,0,'2014-04-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,5,0,0,'2014-04-01 00:00:00',9),
 (193,203,0,0,2.06,0,0,0,'2011-09-01 00:00:00',25,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'2014-03-01 00:00:00',2),
 (194,204,0,0,3.48,0,0,28,'1986-06-01 00:00:00',25,25,0,0,'2013-12-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,12,0,0,'2013-12-01 00:00:00',28),
 (195,205,0,0,3.66,0,0,0,'1994-10-01 00:00:00',25,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,10,0,0,'2013-11-01 00:00:00',19),
 (196,206,0,0,3.63,0,0,27,'2003-06-01 00:00:00',25,25,0,0,'2013-09-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,12,0,0,'2013-09-01 00:00:00',11),
 (197,207,0,0,3.99,0,0,0,'1993-02-01 00:00:00',20,25,0,0,'2013-07-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,6,0,0,'2013-07-01 00:00:00',21),
 (198,208,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'2012-12-01 00:00:00',5),
 (199,209,0,0,3,0,0,0,'2007-09-01 00:00:00',20,25,0,0,'2013-09-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,3,0,0,'2013-09-01 00:00:00',6),
 (200,210,0,0,2.26,0,0,0,'2007-12-01 00:00:00',20,25,0,0,'2012-06-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,3,0,0,'2012-06-01 00:00:00',6),
 (201,211,0,0,2.67,0,0,0,'2009-01-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'2013-01-01 00:00:00',5),
 (202,212,0,0,2.67,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2013-10-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'2013-10-01 00:00:00',3),
 (203,213,0,0,2.34,0,0,0,'2011-09-01 00:00:00',20,25,0,0,'2012-09-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,1,0,0,'2012-09-01 00:00:00',2),
 (204,214,0,0,3.26,0,0,0,'2000-12-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,8,0,0,'2013-06-01 00:00:00',13),
 (205,215,0,0,2.67,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'2011-07-01 00:00:00',3),
 (206,216,1,0,2.22,0,0,0,'2005-03-01 00:00:00',0,25,0,0,'2013-03-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,5,0,0,'2013-03-01 00:00:00',9),
 (207,217,1,0,2.77,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2012-07-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,5,0,0,'2012-07-01 00:00:00',11),
 (208,218,1,0,1.86,0,0,0,'2005-01-01 00:00:00',0,25,0,0,'2013-12-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,3,0,0,'2013-12-01 00:00:00',9),
 (209,219,1,0,1.5,0,0,0,'2013-04-01 00:00:00',0,25,0,0,'2013-04-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,1,0,0,'2013-04-01 00:00:00',1),
 (210,220,1,0,2.23,0,0,0,'2011-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'2013-05-01 00:00:00',3),
 (211,221,1,0,1.5,0,0,0,'1970-01-01 00:00:00',0,25,0,0,'2013-10-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,1,0,0,'2013-10-01 00:00:00',44),
 (212,222,1,0,1.5,0,0,0,'1970-01-01 00:00:00',0,25,0,0,'2013-10-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,1,0,0,'2013-10-01 00:00:00',44),
 (213,223,1,0,1,0,0,0,'1970-01-01 00:00:00',0,25,0,0,'2013-11-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,1,0,0,'2013-11-01 00:00:00',44),
 (214,224,1,0,1.83,0,0,0,'2010-10-01 00:00:00',0,25,0,0,'1970-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'1970-01-01 00:00:00',3),
 (215,225,1,0,1.83,0,0,0,'2010-10-01 00:00:00',0,25,0,0,'1970-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'1970-01-01 00:00:00',3),
 (216,226,1,0,1.83,0,0,0,'2010-10-01 00:00:00',0,25,0,0,'1970-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.5,0,70,2,0,0,'1970-01-01 00:00:00',3),
 (217,227,0,0,5.76,0.55,0,0,'1995-09-01 00:00:00',15,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,0,5,0,0,'2013-01-01 00:00:00',18),
 (218,228,0,0,4.65,0.4,0,0,'1986-11-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,0,8,0,0,'2014-03-01 00:00:00',27),
 (219,229,0,0,4.74,0.35,0,0,'1994-12-01 00:00:00',15,25,0,0,'2012-06-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,0,2,0,0,'2012-06-01 00:00:00',19),
 (220,230,0,0,5.42,0.35,0,0,'1977-06-01 00:00:00',15,25,0,0,'2013-12-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,0,4,0,0,'2013-12-01 00:00:00',37),
 (221,231,0,0,3.33,0.25,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-02-01 00:00:00','2014-05-14 23:27:54','2014-05-14 23:27:54',0.2,0,0,4,0,0,'2013-02-01 00:00:00',12),
 (222,232,0,0,3.33,0.25,0,0,'2005-07-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,4,0,0,'2013-01-01 00:00:00',8),
 (223,233,0,0,4.98,0.25,0,6,'1995-08-01 00:00:00',20,25,0,0,'2013-10-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,9,0,0,'2013-10-01 00:00:00',18),
 (224,234,0,0,2.1,0,0,0,'2011-09-01 00:00:00',25,25,0,0,'2012-09-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2012-09-01 00:00:00',2),
 (225,235,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (226,236,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (227,237,0,0,3.26,0,0,0,'1999-03-01 00:00:00',25,25,0,0,'2013-02-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,8,0,0,'2013-02-01 00:00:00',15),
 (228,238,0,0,3.66,0,0,0,'1994-11-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,5,0,0,'2012-11-01 00:00:00',19),
 (229,239,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (230,240,0,0,2.91,0,0,0,'2002-05-01 00:00:00',25,25,0,0,'2014-05-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,8,0,0,'2014-05-01 00:00:00',12),
 (231,241,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (232,242,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (233,243,0,0,3.63,0,0,5,'1997-09-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,12,0,0,'2013-06-01 00:00:00',16),
 (234,244,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (235,245,0,0,3.86,0,0,0,'1982-02-01 00:00:00',25,25,0,0,'2012-04-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,11,0,0,'2012-04-01 00:00:00',32),
 (236,246,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (237,247,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (238,248,0,0,2.06,0,0,0,'2010-07-01 00:00:00',25,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,2,0,0,'2013-01-01 00:00:00',3),
 (239,249,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (240,250,0,0,2.91,0,0,0,'2002-05-01 00:00:00',25,25,0,0,'2014-05-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,8,0,0,'2014-05-01 00:00:00',12),
 (241,251,0,0,2.67,0,0,0,'2009-11-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,2,0,0,'2012-11-01 00:00:00',4),
 (242,252,0,0,4.98,0,0,0,'1979-03-01 00:00:00',20,25,0,0,'2013-04-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,9,0,0,'2013-04-01 00:00:00',35),
 (243,253,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (244,254,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,2,0,0,'2012-12-01 00:00:00',5),
 (245,255,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:55','2014-05-14 23:27:55',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (246,256,0,0,2.06,0,0,0,'2010-07-01 00:00:00',25,25,0,0,'2013-01-01 00:00:00','2014-05-14 23:27:56','2014-05-14 23:27:56',0.2,0,0,2,0,0,'2013-01-01 00:00:00',3),
 (247,257,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-14 23:27:56','2014-05-14 23:27:56',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (248,258,0,0,2.1,0,0,0,'2011-09-01 00:00:00',25,25,0,0,'2012-09-01 00:00:00','2014-05-14 23:27:56','2014-05-14 23:27:56',0.2,0,0,1,0,0,'2012-09-01 00:00:00',2),
 (249,259,1,0,1.5,0,0,0,'1970-01-01 00:00:00',0,25,0,0,'2013-12-01 00:00:00','2014-05-14 23:27:56','2014-05-14 23:27:56',0.2,0,0,1,0,0,'2013-12-01 00:00:00',44),
 (250,260,1,0,1.5,0,0,0,'2013-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-14 23:27:56','2014-05-14 23:27:56',0.2,0,0,1,0,0,'2013-05-01 00:00:00',1),
 (251,261,1,0,2.23,0,0,0,'2011-02-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-14 23:27:56','2014-05-14 23:27:56',0.2,0,0,2,0,0,'2013-02-01 00:00:00',3),
 (252,262,0,0,4.32,0.9,0,0,'1994-12-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-15 02:18:01','2014-05-15 02:18:01',0,0,0,7,0,0,'2013-12-01 00:00:00',19),
 (253,263,0,0,5.76,0.7,0,0,'1977-10-01 00:00:00',15,25,0,0,'2012-11-01 00:00:00','2014-05-15 02:18:02','2014-05-15 02:18:02',0,0,0,5,0,0,'2012-11-01 00:00:00',36),
 (254,264,0,0,3.99,0.7,0,0,'1996-06-01 00:00:00',20,25,0,0,'2012-06-01 00:00:00','2014-05-15 02:18:02','2014-05-15 02:18:02',0,0,0,6,0,0,'2012-06-01 00:00:00',18),
 (255,265,0,0,5.42,0.7,0,0,'1992-12-01 00:00:00',15,25,0,0,'2013-01-01 00:00:00','2014-05-15 02:18:02','2014-05-15 02:18:02',0,0,0,4,0,0,'2013-01-01 00:00:00',21),
 (256,266,0,0,3.66,0.5,0,0,'2002-02-01 00:00:00',20,25,0,0,'2014-05-01 00:00:00','2014-05-15 02:18:02','2014-05-15 02:18:02',0,0,0,5,0,0,'2014-05-01 00:00:00',12),
 (257,267,0,0,3.66,0.3,0,0,'1995-09-01 00:00:00',20,25,0,0,'2012-04-01 00:00:00','2014-05-15 02:18:02','2014-05-15 02:18:02',0,0,0,5,0,0,'2012-04-01 00:00:00',18),
 (258,268,0,0,3,0.5,0,0,'2005-03-01 00:00:00',20,25,0,0,'2011-06-01 00:00:00','2014-05-15 02:18:02','2014-05-15 02:18:02',0,0,0,3,0,0,'2011-06-01 00:00:00',9),
 (259,269,1,0,2.22,0,0,0,'2006-03-01 00:00:00',0,25,0,0,'2014-03-01 00:00:00','2014-05-15 03:46:46','2014-05-15 03:46:46',0,0,0,5,0,0,'2014-03-01 00:00:00',8),
 (260,270,0,0,4.32,0.9,0,0,'1994-12-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,7,0,0,'2013-12-01 00:00:00',19),
 (261,271,0,0,5.76,0.7,0,0,'1977-10-01 00:00:00',15,25,0,0,'2012-11-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,5,0,0,'2012-11-01 00:00:00',36),
 (262,272,0,0,3.99,0.7,0,0,'1996-06-01 00:00:00',20,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,6,0,0,'2012-06-01 00:00:00',18),
 (263,273,0,0,5.42,0.7,0,0,'1992-12-01 00:00:00',15,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,4,0,0,'2013-01-01 00:00:00',21),
 (264,274,0,0,3.66,0.5,0,0,'2002-02-01 00:00:00',20,25,0,0,'2014-05-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,5,0,0,'2014-05-01 00:00:00',12),
 (265,275,0,0,3.66,0.3,0,0,'1995-09-01 00:00:00',20,25,0,0,'2012-04-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,5,0,0,'2012-04-01 00:00:00',18),
 (266,276,0,0,3,0.5,0,0,'2005-03-01 00:00:00',20,25,0,0,'2011-06-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,3,0,0,'2011-06-01 00:00:00',9),
 (267,277,0,0,3.26,0,0,0,'1993-07-01 00:00:00',25,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,8,0,0,'2013-12-01 00:00:00',20),
 (268,278,0,0,1.89,0,0,0,'2006-03-01 00:00:00',25,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,4,0,0,'2014-03-01 00:00:00',8),
 (269,279,0,0,3.63,0,0,0,'1997-07-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,12,0,0,'2013-06-01 00:00:00',16),
 (270,280,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (271,281,0,0,3,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,3,0,0,'2013-11-01 00:00:00',3),
 (272,282,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (273,283,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-08-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,1,0,0,'2011-08-01 00:00:00',3),
 (274,284,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (275,285,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (276,286,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (277,287,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (278,288,1,0,2.44,0,0,0,'1997-05-01 00:00:00',0,25,0,0,'2012-05-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,9,0,0,'2012-05-01 00:00:00',17),
 (279,289,1,0,2.23,0,0,0,'2011-02-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,2,0,0,'2013-02-01 00:00:00',3),
 (280,290,1,0,2.59,0,0,0,'2006-08-01 00:00:00',0,25,0,0,'2012-08-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,4,0,0,'2012-08-01 00:00:00',7),
 (281,291,1,0,2.23,0,0,0,'2011-02-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,2,0,0,'2013-02-01 00:00:00',3),
 (282,292,1,0,1.5,0,0,0,'2013-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-15 04:04:25','2014-05-15 04:04:25',0,0,0,1,0,0,'2013-05-01 00:00:00',1),
 (283,293,1,0,1,0,0,0,'2013-06-01 00:00:00',0,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:04:26','2014-05-15 04:04:26',0,0,0,1,0,0,'2013-06-01 00:00:00',1),
 (284,294,1,0,2.4,0,0,0,'1997-05-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:04:26','2014-05-15 04:04:26',0,0,0,6,0,0,'2013-02-01 00:00:00',17),
 (285,295,1,0,2.22,0,0,0,'2006-03-01 00:00:00',0,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:04:26','2014-05-15 04:04:26',0,0,0,5,0,0,'2014-03-01 00:00:00',8),
 (286,296,0,0,4.32,0.9,0,0,'1994-12-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,7,0,0,'2013-12-01 00:00:00',19),
 (287,297,0,0,5.76,0.7,0,0,'1977-10-01 00:00:00',15,25,0,0,'2012-11-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,5,0,0,'2012-11-01 00:00:00',36),
 (288,298,0,0,3.99,0.7,0,0,'1996-06-01 00:00:00',20,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,6,0,0,'2012-06-01 00:00:00',18),
 (289,299,0,0,5.42,0.7,0,0,'1992-12-01 00:00:00',15,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,4,0,0,'2013-01-01 00:00:00',21),
 (290,300,0,0,3.66,0.5,0,0,'2002-02-01 00:00:00',20,25,0,0,'2014-05-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,5,0,0,'2014-05-01 00:00:00',12),
 (291,301,0,0,3.66,0.3,0,0,'1995-09-01 00:00:00',20,25,0,0,'2012-04-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,5,0,0,'2012-04-01 00:00:00',18),
 (292,302,0,0,3,0.5,0,0,'2005-03-01 00:00:00',20,25,0,0,'2011-06-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,3,0,0,'2011-06-01 00:00:00',9),
 (293,303,0,0,3.26,0,0,0,'1993-07-01 00:00:00',25,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,8,0,0,'2013-12-01 00:00:00',20),
 (294,304,0,0,1.89,0,0,0,'2006-03-01 00:00:00',25,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,4,0,0,'2014-03-01 00:00:00',8),
 (295,305,0,0,3.63,0,0,0,'1997-07-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,12,0,0,'2013-06-01 00:00:00',16),
 (296,306,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (297,307,0,0,3,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,3,0,0,'2013-11-01 00:00:00',3),
 (298,308,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (299,309,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-08-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2011-08-01 00:00:00',3),
 (300,310,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (301,311,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (302,312,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (303,313,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (304,314,1,0,2.44,0,0,0,'1997-05-01 00:00:00',0,25,0,0,'2012-05-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,9,0,0,'2012-05-01 00:00:00',17),
 (305,315,1,0,2.23,0,0,0,'2011-02-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,2,0,0,'2013-02-01 00:00:00',3),
 (306,316,1,0,2.59,0,0,0,'2006-08-01 00:00:00',0,25,0,0,'2012-08-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,4,0,0,'2012-08-01 00:00:00',7),
 (307,317,1,0,2.23,0,0,0,'2011-02-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,2,0,0,'2013-02-01 00:00:00',3),
 (308,318,1,0,1.5,0,0,0,'2013-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2013-05-01 00:00:00',1),
 (309,319,1,0,1,0,0,0,'2013-06-01 00:00:00',0,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2013-06-01 00:00:00',1),
 (310,320,1,0,2.4,0,0,0,'1997-05-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,6,0,0,'2013-02-01 00:00:00',17),
 (311,321,1,0,2.22,0,0,0,'2006-03-01 00:00:00',0,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,5,0,0,'2014-03-01 00:00:00',8),
 (312,322,0,0,4.32,0.5,0,0,'1991-04-01 00:00:00',20,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,7,0,0,'2012-10-01 00:00:00',23),
 (313,323,0,0,4.74,0.3,0,0,'1994-11-01 00:00:00',15,25,0,0,'2011-06-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,2,0,0,'2011-06-01 00:00:00',19),
 (314,324,0,0,3,0.3,0,0,'2005-05-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,3,0,0,'2012-05-01 00:00:00',9),
 (315,325,0,0,3.66,0,0,0,'2002-02-01 00:00:00',20,25,0,0,'2014-02-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,5,0,0,'2014-02-01 00:00:00',12),
 (316,326,0,0,2.67,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2014-01-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,2,0,0,'2014-01-01 00:00:00',3),
 (317,327,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (318,328,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (319,329,0,0,4.32,0.5,0,0,'1994-11-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,7,0,0,'2013-11-01 00:00:00',19),
 (320,330,0,0,2.67,0,0,0,'2009-01-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,2,0,0,'2013-01-01 00:00:00',5),
 (321,331,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,2,0,0,'2012-12-01 00:00:00',5),
 (322,332,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (323,333,0,0,3.66,0.5,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:37:42','2014-05-15 04:37:42',0,0,0,5,0,0,'2013-02-01 00:00:00',12),
 (324,334,0,0,4.74,0.3,0,0,'1994-11-01 00:00:00',15,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,2,0,0,'2012-06-01 00:00:00',19),
 (325,335,0,0,2.34,0,0,0,'2011-11-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2012-11-01 00:00:00',2),
 (326,336,0,0,3,0,0,0,'2005-07-01 00:00:00',20,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,3,0,0,'2012-06-01 00:00:00',8),
 (327,337,0,0,3.33,0,0,0,'2004-09-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,4,0,0,'2012-12-01 00:00:00',9),
 (328,338,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (329,339,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (330,340,0,0,2.67,0,0,0,'2009-04-01 00:00:00',20,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,2,0,0,'2012-10-01 00:00:00',5),
 (331,341,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (332,342,0,0,3,0,0,0,'2005-01-01 00:00:00',20,25,0,0,'2012-01-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,3,0,0,'2012-01-01 00:00:00',9),
 (333,343,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2013-03-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2013-03-01 00:00:00',1),
 (334,344,0,0,3.33,0.5,0,0,'2002-02-01 00:00:00',20,25,0,0,'2012-02-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,4,0,0,'2012-02-01 00:00:00',12),
 (335,345,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (336,346,0,0,3,0,0,0,'2005-05-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,3,0,0,'2012-05-01 00:00:00',9),
 (337,347,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (338,348,0,0,3.99,0,0,0,'1992-12-01 00:00:00',20,25,0,0,'2013-07-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,6,0,0,'2013-07-01 00:00:00',21),
 (339,349,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2011-11-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-11-01 00:00:00',1),
 (340,350,0,0,3.33,0.6,0,0,'2001-07-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,4,0,0,'2013-01-01 00:00:00',12),
 (341,351,0,0,3.33,0.3,0,0,'2003-09-01 00:00:00',20,25,0,0,'2013-08-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,4,0,0,'2013-08-01 00:00:00',10),
 (342,352,0,0,3.99,0.3,0,0,'1996-11-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,6,0,0,'2013-11-01 00:00:00',17),
 (343,353,0,0,3,0.2,0,0,'2006-11-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,3,0,0,'2013-11-01 00:00:00',7),
 (344,354,0,0,3.99,0,0,0,'1996-06-01 00:00:00',20,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,6,0,0,'2013-06-01 00:00:00',18),
 (345,355,0,0,4.32,0,0,0,'1989-07-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,7,0,0,'2011-10-01 00:00:00',24),
 (346,356,0,0,3.63,0,0,9,'1994-12-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,12,0,0,'2013-06-01 00:00:00',19),
 (347,357,0,0,3.26,0,0,0,'2001-07-01 00:00:00',25,25,0,0,'2014-01-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,8,0,0,'2014-01-01 00:00:00',12),
 (348,358,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,2,0,0,'2012-12-01 00:00:00',5),
 (349,359,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,2,0,0,'2012-12-01 00:00:00',5),
 (350,360,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (351,361,1,0,2.05,0,0,0,'2013-01-01 00:00:00',0,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2013-01-01 00:00:00',1),
 (352,362,0,0,5.42,0.6,0,0,'1984-03-01 00:00:00',15,25,0,0,'2011-11-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,4,0,0,'2011-11-01 00:00:00',30),
 (353,363,0,0,3.99,0.4,0,0,'1988-03-01 00:00:00',20,25,0,0,'2012-09-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,6,0,0,'2012-09-01 00:00:00',26),
 (354,364,0,0,3.66,0,0,0,'1995-10-01 00:00:00',25,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,10,0,0,'2013-11-01 00:00:00',18),
 (355,365,0,0,4.06,0,0,7,'1992-12-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,12,0,0,'2013-06-01 00:00:00',21),
 (356,366,0,0,4.65,0,0,0,'1986-09-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,8,0,0,'2011-10-01 00:00:00',27),
 (357,367,0,0,2.72,0,0,0,'2013-03-01 00:00:00',25,25,0,0,'2012-03-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,3,0,0,'2012-03-01 00:00:00',1),
 (358,368,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,1,0,0,'2012-10-01 00:00:00',1),
 (359,369,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2013-03-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,1,0,0,'2013-03-01 00:00:00',1),
 (360,370,1,0,2.23,0,0,0,'2008-11-01 00:00:00',0,25,0,0,'2013-08-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,2,0,0,'2013-08-01 00:00:00',5),
 (361,371,0,0,3.99,0.55,0,0,'1997-05-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,6,0,0,'2013-12-01 00:00:00',17),
 (362,372,0,0,3,0.25,0,0,'2006-08-01 00:00:00',20,25,0,0,'2013-08-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,3,0,0,'2013-08-01 00:00:00',7),
 (363,373,0,0,3.33,0.25,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,4,0,0,'2013-11-01 00:00:00',12),
 (364,374,0,0,3.66,0.15,0,0,'1993-11-01 00:00:00',25,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,10,0,0,'2013-01-01 00:00:00',20),
 (365,375,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (366,376,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-08-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-08-01 00:00:00',3),
 (367,377,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (368,378,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (369,379,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (370,380,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (371,381,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (372,382,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (373,383,1,0,2.4,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2013-07-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,6,0,0,'2013-07-01 00:00:00',11),
 (374,384,1,0,2.4,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0,0,0,6,0,0,'2013-01-01 00:00:00',11),
 (375,385,0,0,5.08,0.55,0,0,'1982-10-01 00:00:00',15,25,0,0,'2012-01-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,3,0,0,'2012-01-01 00:00:00',31),
 (376,386,0,0,4.32,0.35,0,0,'1982-02-01 00:00:00',20,25,0,0,'2013-03-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,7,0,0,'2013-03-01 00:00:00',32),
 (377,387,0,0,3,0,0,0,'2006-08-01 00:00:00',20,25,0,0,'2012-08-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,3,0,0,'2012-08-01 00:00:00',7),
 (378,388,0,0,3.63,0,0,20,'1972-06-01 00:00:00',25,25,0,0,'2014-02-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,12,0,0,'2014-02-01 00:00:00',42),
 (379,389,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:43','2014-05-15 04:37:43',0.1,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (380,390,0,0,4.06,0,0,17,'1976-10-01 00:00:00',25,25,0,0,'2014-01-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.1,0,0,12,0,0,'2014-01-01 00:00:00',37),
 (381,391,0,0,3.86,0,0,0,'1992-12-01 00:00:00',25,25,0,0,'2013-10-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.1,0,0,11,0,0,'2013-10-01 00:00:00',21),
 (382,392,0,0,3.63,0,0,15,'1985-10-01 00:00:00',25,25,0,0,'2013-10-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.1,0,0,12,0,0,'2013-10-01 00:00:00',28),
 (383,393,0,0,3.06,0,0,0,'2000-12-01 00:00:00',25,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.1,0,0,7,0,0,'2012-06-01 00:00:00',13),
 (384,394,0,0,3.33,0,0,0,'2004-09-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.1,0,0,4,0,0,'2013-12-01 00:00:00',9),
 (385,395,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.1,0,0,1,0,0,'2014-03-01 00:00:00',1),
 (386,396,1,0,1.5,0,0,0,'2013-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.1,0,0,1,0,0,'2013-05-01 00:00:00',1),
 (387,397,1,0,3.13,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.1,0,0,7,0,0,'2013-01-01 00:00:00',11),
 (388,398,1,0,2.94,0,0,0,'1997-04-01 00:00:00',0,25,0,0,'2013-10-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.1,0,0,9,0,0,'2013-10-01 00:00:00',17),
 (389,399,0,0,3.99,0.55,0,0,'1992-05-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,6,0,0,'2012-05-01 00:00:00',22),
 (390,400,0,0,4.74,0.35,0,0,'1994-11-01 00:00:00',15,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,2,0,0,'2012-06-01 00:00:00',19),
 (391,401,0,0,4.32,0.35,0,0,'1987-06-01 00:00:00',20,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,7,0,0,'2012-10-01 00:00:00',27),
 (392,402,0,0,3.66,0.35,0,0,'2002-02-01 00:00:00',20,25,0,0,'2014-05-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,5,0,0,'2014-05-01 00:00:00',12),
 (393,403,0,0,3.33,0.25,0,0,'2001-07-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,4,0,0,'2012-12-01 00:00:00',12),
 (394,404,0,0,3.99,0.15,0,0,'1998-01-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,6,0,0,'2013-01-01 00:00:00',16),
 (395,405,0,0,4.98,0.15,0,0,'1978-10-01 00:00:00',20,25,0,0,'2012-07-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,9,0,0,'2012-07-01 00:00:00',35),
 (396,406,0,0,3.66,0.25,0,0,'1998-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,5,0,0,'2011-10-01 00:00:00',15),
 (397,407,0,0,3,0.15,0,0,'2005-04-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,3,0,0,'2011-07-01 00:00:00',9),
 (398,408,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,1,0,0,'2011-10-01 00:00:00',3);
INSERT INTO `employees_heso` (`eh_id`,`eh_em_id`,`eh_loai_luong`,`eh_giai_doan`,`eh_he_so`,`eh_pc_cong_viec`,`eh_pc_trach_nhiem`,`eh_pc_tnvk_phan_tram`,`eh_tham_niem`,`eh_pc_udn_phan_tram`,`eh_pc_cong_vu_phan_tram`,`eh_pc_kiem_nhiem`,`eh_pc_khac`,`eh_han_dieu_chinh`,`eh_date_added`,`eh_date_modified`,`eh_pc_kv`,`eh_pc_khac_type`,`eh_pc_thu_hut`,`eh_bac_luong`,`eh_pc_doc_hai`,`eh_pc_doc_hai_type`,`eh_han_ap_dung`,`eh_pc_tham_nien`) VALUES 
 (399,409,0,0,2.46,0,0,0,'2006-08-01 00:00:00',25,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,4,0,0,'2013-02-01 00:00:00',7),
 (400,410,0,0,3.26,0,0,0,'1998-10-01 00:00:00',25,25,0,0,'2013-04-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,8,0,0,'2013-04-01 00:00:00',15),
 (401,411,0,0,2.34,0,0,0,'2011-11-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,1,0,0,'2012-11-01 00:00:00',2),
 (402,412,0,0,4.06,0,0,7,'1995-08-01 00:00:00',25,25,0,0,'2013-09-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,12,0,0,'2013-09-01 00:00:00',18),
 (403,413,0,0,2.1,0,0,0,'2011-09-01 00:00:00',25,25,0,0,'2012-09-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,1,0,0,'2012-09-01 00:00:00',2),
 (404,414,0,0,4.32,0,0,0,'2013-06-01 00:00:00',20,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,7,0,0,'2012-10-01 00:00:00',1),
 (405,415,0,0,2.55,0,0,0,'1991-03-01 00:00:00',25,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,6,0,0,'2013-01-01 00:00:00',23),
 (406,416,0,0,4.98,0,0,0,'1975-03-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,9,0,0,'2012-11-01 00:00:00',39),
 (407,417,0,0,4.06,0,0,0,'1990-03-01 00:00:00',25,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,12,0,0,'2013-11-01 00:00:00',24),
 (408,418,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,1,0,0,'2014-03-01 00:00:00',1),
 (409,419,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,1,0,0,'2014-03-01 00:00:00',1),
 (410,420,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,1,0,0,'2014-03-01 00:00:00',1),
 (411,421,0,0,2.34,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,1,0,0,'2014-03-01 00:00:00',1),
 (412,422,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-08-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,1,0,0,'2011-08-01 00:00:00',3),
 (413,423,0,0,2.67,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2013-07-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,2,0,0,'2013-07-01 00:00:00',3),
 (414,424,1,0,1.5,0,0,0,'2013-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,1,0,0,'2013-05-01 00:00:00',1),
 (415,425,1,0,2.59,0,0,0,'2007-08-01 00:00:00',0,25,0,0,'2014-02-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.2,0,70,4,0,0,'2014-02-01 00:00:00',6),
 (416,426,0,0,3.99,0.55,0,0,'1992-12-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,6,0,0,'2012-05-01 00:00:00',21),
 (417,427,0,0,3.99,0.35,0,0,'1996-11-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,6,0,0,'2013-11-01 00:00:00',17),
 (418,428,0,0,3,0,0,0,'2006-11-01 00:00:00',20,25,0,0,'2013-05-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,3,0,0,'2013-05-01 00:00:00',7),
 (419,429,0,0,3.33,0,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,4,0,0,'2013-02-01 00:00:00',12),
 (420,430,0,0,4.06,0,0,13,'1976-10-01 00:00:00',25,25,0,0,'2014-04-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,12,0,0,'2014-04-01 00:00:00',37),
 (421,431,0,0,3.99,0,0,0,'1995-07-01 00:00:00',20,25,0,0,'2013-10-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,6,0,0,'2013-10-01 00:00:00',18),
 (422,432,0,0,2.26,0,0,0,'2007-12-01 00:00:00',25,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,3,0,0,'2012-06-01 00:00:00',6),
 (423,433,0,0,4.06,0,0,13,'1995-08-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,12,0,0,'2013-06-01 00:00:00',18),
 (424,434,0,0,2.67,0,0,0,'2013-03-01 00:00:00',20,25,0,0,'2014-02-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,2,0,0,'2014-02-01 00:00:00',1),
 (425,435,1,0,2.4,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,6,0,0,'2013-01-01 00:00:00',11),
 (426,436,1,0,1.5,0,0,0,'2014-03-01 00:00:00',0,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0,0,70,1,0,0,'2014-03-01 00:00:00',0),
 (427,437,0,0,4.32,0.6,0,0,'1993-12-01 00:00:00',20,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.5,0,70,7,0,0,'2013-12-01 00:00:00',20),
 (428,438,0,0,3.99,0.4,0,0,'1995-12-01 00:00:00',20,25,0,0,'2011-12-01 00:00:00','2014-05-15 04:37:44','2014-05-15 04:37:44',0.5,0,70,6,0,0,'2011-12-01 00:00:00',18),
 (429,439,0,0,3.66,0.4,0,0,'2000-07-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,5,0,0,'2014-03-01 00:00:00',13),
 (430,440,0,0,5.76,0.4,0,0,'1977-10-01 00:00:00',15,25,0,0,'2012-01-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,5,0,0,'2012-01-01 00:00:00',36),
 (431,441,0,0,3,0.3,0,0,'2005-05-01 00:00:00',20,25,0,0,'2012-05-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,3,0,0,'2012-05-01 00:00:00',9),
 (432,442,0,0,3.33,0.3,0,0,'2000-07-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,4,0,0,'2012-12-01 00:00:00',13),
 (433,443,0,0,3.99,0.3,0,0,'1998-08-01 00:00:00',20,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,6,0,0,'2013-11-01 00:00:00',15),
 (434,444,0,0,3.66,0.2,0,0,'2001-02-01 00:00:00',20,25,0,0,'2013-05-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,5,0,0,'2013-05-01 00:00:00',13),
 (435,445,0,0,3,0.3,0,0,'2006-08-01 00:00:00',20,25,0,0,'2013-08-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,3,0,0,'2013-08-01 00:00:00',7),
 (436,446,0,0,2.67,0.2,0,0,'2003-01-01 00:00:00',20,25,0,0,'2011-08-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,2,0,0,'2011-08-01 00:00:00',11),
 (437,447,0,0,4.06,0.2,0,0,'1989-03-01 00:00:00',25,25,0,0,'2013-07-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,12,0,0,'2013-07-01 00:00:00',25),
 (438,448,0,0,3.99,0.2,0,0,'2005-07-01 00:00:00',20,25,0,0,'2014-01-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,6,0,0,'2014-01-01 00:00:00',8),
 (439,449,0,0,3,0.2,0,0,'2005-03-01 00:00:00',20,25,0,0,'2012-03-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,3,0,0,'2012-03-01 00:00:00',9),
 (440,450,0,0,3.33,0,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-08-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,4,0,0,'2013-08-01 00:00:00',12),
 (441,451,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,1,0,0,'2011-10-01 00:00:00',3),
 (442,452,0,0,3.66,0,0,0,'1997-01-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,5,0,0,'2011-10-01 00:00:00',17),
 (443,453,0,0,2.67,0,0,0,'2009-01-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,2,0,0,'2013-01-01 00:00:00',5),
 (444,454,0,0,3.06,0,0,0,'1993-03-01 00:00:00',25,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,7,0,0,'2012-06-01 00:00:00',21),
 (445,455,0,0,3,0,0,0,'2011-09-01 00:00:00',20,25,0,0,'2014-01-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,3,0,0,'2014-01-01 00:00:00',2),
 (446,456,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,1,0,0,'2011-10-01 00:00:00',3),
 (447,457,0,0,2.07,0,0,0,'2005-01-01 00:00:00',25,25,0,0,'2014-04-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,5,0,0,'2014-04-01 00:00:00',9),
 (448,458,0,0,2.06,0,0,0,'2011-09-01 00:00:00',25,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,2,0,0,'2014-03-01 00:00:00',2),
 (449,459,0,0,3.48,0,0,28,'1986-06-01 00:00:00',25,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,12,0,0,'2013-12-01 00:00:00',28),
 (450,460,0,0,3.66,0,0,0,'1994-10-01 00:00:00',25,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,10,0,0,'2013-11-01 00:00:00',19),
 (451,461,0,0,3.63,0,0,27,'2003-06-01 00:00:00',25,25,0,0,'2013-09-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,12,0,0,'2013-09-01 00:00:00',11),
 (452,462,0,0,3.99,0,0,0,'1993-02-01 00:00:00',20,25,0,0,'2013-07-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,6,0,0,'2013-07-01 00:00:00',21),
 (453,463,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,2,0,0,'2012-12-01 00:00:00',5),
 (454,464,0,0,3,0,0,0,'2007-09-01 00:00:00',20,25,0,0,'2013-09-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,3,0,0,'2013-09-01 00:00:00',6),
 (455,465,0,0,2.26,0,0,0,'2007-12-01 00:00:00',20,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,3,0,0,'2012-06-01 00:00:00',6),
 (456,466,0,0,2.67,0,0,0,'2009-01-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,2,0,0,'2013-01-01 00:00:00',5),
 (457,467,0,0,2.67,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2013-10-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,2,0,0,'2013-10-01 00:00:00',3),
 (458,468,0,0,2.34,0,0,0,'2011-09-01 00:00:00',20,25,0,0,'2012-09-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,1,0,0,'2012-09-01 00:00:00',2),
 (459,469,0,0,3.26,0,0,0,'2000-12-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,8,0,0,'2013-06-01 00:00:00',13),
 (460,470,0,0,2.67,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,2,0,0,'2011-07-01 00:00:00',3),
 (461,471,1,0,2.22,0,0,0,'2005-03-01 00:00:00',0,25,0,0,'2013-03-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,5,0,0,'2013-03-01 00:00:00',9),
 (462,472,1,0,2.77,0,0,0,'2003-01-01 00:00:00',0,25,0,0,'2012-07-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,5,0,0,'2012-07-01 00:00:00',11),
 (463,473,1,0,1.86,0,0,0,'2005-01-01 00:00:00',0,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,3,0,0,'2013-12-01 00:00:00',9),
 (464,474,1,0,1.5,0,0,0,'2013-04-01 00:00:00',0,25,0,0,'2013-04-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,1,0,0,'2013-04-01 00:00:00',1),
 (465,475,1,0,2.23,0,0,0,'2011-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,2,0,0,'2013-05-01 00:00:00',3),
 (466,476,1,0,1.5,0,0,0,'2013-10-01 00:00:00',0,25,0,0,'2013-10-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,1,0,0,'2013-10-01 00:00:00',0),
 (467,477,1,0,1.5,0,0,0,'2013-10-01 00:00:00',0,25,0,0,'2013-10-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,1,0,0,'2013-10-01 00:00:00',0),
 (468,478,1,0,1,0,0,0,'2013-11-01 00:00:00',0,25,0,0,'2013-11-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,1,0,0,'2013-11-01 00:00:00',0),
 (469,479,1,0,1.83,0,0,0,'2010-10-01 00:00:00',0,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:45','2014-05-15 04:37:45',0.5,0,70,2,0,0,'2012-10-01 00:00:00',3),
 (470,480,1,0,1.83,0,0,0,'2010-10-01 00:00:00',0,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.5,0,70,2,0,0,'2012-10-01 00:00:00',3),
 (471,481,1,0,1.83,0,0,0,'2010-10-01 00:00:00',0,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.5,0,70,2,0,0,'2012-10-01 00:00:00',3),
 (472,482,0,0,5.76,0.55,0,0,'1995-09-01 00:00:00',15,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,5,0,0,'2013-01-01 00:00:00',18),
 (473,483,0,0,4.65,0.4,0,0,'1986-11-01 00:00:00',20,25,0,0,'2014-03-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,8,0,0,'2014-03-01 00:00:00',27),
 (474,484,0,0,4.74,0.35,0,0,'1994-12-01 00:00:00',15,25,0,0,'2012-06-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,2,0,0,'2012-06-01 00:00:00',19),
 (475,485,0,0,5.42,0.35,0,0,'1977-06-01 00:00:00',15,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,4,0,0,'2013-12-01 00:00:00',37),
 (476,486,0,0,3.33,0.25,0,0,'2002-02-01 00:00:00',20,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,4,0,0,'2013-02-01 00:00:00',12),
 (477,487,0,0,3.33,0.25,0,0,'2005-07-01 00:00:00',20,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,4,0,0,'2013-01-01 00:00:00',8),
 (478,488,0,0,4.98,0.25,0,6,'1995-08-01 00:00:00',20,25,0,0,'2013-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,9,0,0,'2013-10-01 00:00:00',18),
 (479,489,0,0,2.1,0,0,0,'2011-09-01 00:00:00',25,25,0,0,'2012-09-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2012-09-01 00:00:00',2),
 (480,490,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (481,491,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (482,492,0,0,3.26,0,0,0,'1999-03-01 00:00:00',25,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,8,0,0,'2013-02-01 00:00:00',15),
 (483,493,0,0,3.66,0,0,0,'1994-11-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,5,0,0,'2012-11-01 00:00:00',19),
 (484,494,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (485,495,0,0,2.91,0,0,0,'2002-05-01 00:00:00',25,25,0,0,'2014-05-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,8,0,0,'2014-05-01 00:00:00',12),
 (486,496,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (487,497,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (488,498,0,0,3.63,0,0,5,'1997-09-01 00:00:00',25,25,0,0,'2013-06-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,12,0,0,'2013-06-01 00:00:00',16),
 (489,499,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (490,500,0,0,3.86,0,0,0,'1982-02-01 00:00:00',25,25,0,0,'2012-04-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,11,0,0,'2012-04-01 00:00:00',32),
 (491,501,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (492,502,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (493,503,0,0,2.06,0,0,0,'2010-07-01 00:00:00',25,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,2,0,0,'2013-01-01 00:00:00',3),
 (494,504,0,0,2.34,0,0,0,'2010-07-01 00:00:00',20,25,0,0,'2011-07-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-07-01 00:00:00',3),
 (495,505,0,0,2.91,0,0,0,'2002-05-01 00:00:00',25,25,0,0,'2014-05-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,8,0,0,'2014-05-01 00:00:00',12),
 (496,506,0,0,2.67,0,0,0,'2009-11-01 00:00:00',20,25,0,0,'2012-11-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,2,0,0,'2012-11-01 00:00:00',4),
 (497,507,0,0,4.98,0,0,0,'1979-03-01 00:00:00',20,25,0,0,'2013-04-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,9,0,0,'2013-04-01 00:00:00',35),
 (498,508,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (499,509,0,0,2.67,0,0,0,'2008-12-01 00:00:00',20,25,0,0,'2012-12-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,2,0,0,'2012-12-01 00:00:00',5),
 (500,510,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (501,511,0,0,2.06,0,0,0,'2010-07-01 00:00:00',25,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,2,0,0,'2013-01-01 00:00:00',3),
 (502,512,0,0,2.34,0,0,0,'2010-10-01 00:00:00',20,25,0,0,'2011-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2011-10-01 00:00:00',3),
 (503,513,0,0,2.1,0,0,0,'2011-09-01 00:00:00',25,25,0,0,'2012-09-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2012-09-01 00:00:00',2),
 (504,514,1,0,1.5,0,0,0,'2013-12-01 00:00:00',0,25,0,0,'2013-12-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2013-12-01 00:00:00',0),
 (505,515,1,0,1.5,0,0,0,'2013-05-01 00:00:00',0,25,0,0,'2013-05-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2013-05-01 00:00:00',1),
 (506,516,1,0,2.23,0,0,0,'2011-02-01 00:00:00',0,25,0,0,'2013-02-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,2,0,0,'2013-02-01 00:00:00',3),
 (507,517,1,0,2.05,0,0,0,'2013-01-01 00:00:00',0,25,0,0,'2013-01-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2013-01-01 00:00:00',1),
 (508,518,1,0,2.94,0,0,0,'1997-04-01 00:00:00',0,25,0,0,'2013-04-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,9,0,0,'2013-04-01 00:00:00',17),
 (509,519,1,0,1,0,0,0,'2014-02-01 00:00:00',0,25,0,0,'2014-02-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,1,0,0,'2014-02-01 00:00:00',0),
 (510,520,1,0,1.83,0,0,0,'2010-10-01 00:00:00',0,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,2,0,0,'2012-10-01 00:00:00',3),
 (511,521,1,0,1.83,0,0,0,'2010-10-01 00:00:00',0,25,0,0,'2012-10-01 00:00:00','2014-05-15 04:37:46','2014-05-15 04:37:46',0.2,0,0,2,0,0,'2012-10-01 00:00:00',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`group_id`,`group_name`,`group_status`,`group_order`,`group_permissions`,`group_date_modified`,`group_date_added`) VALUES 
 (1,'NhÃ³m Admin',1,1,'1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,2001,2002,2003,2004,2005,2006,2007,2008,2009,3001,3002,3003,3004,3005,3006,4001,4002,4003,4004,4005,4006,4007,4008,4009,4010,4011,4012,4013,4014,5001,5002,5003,5004,5005,5006,5007,5008,','2014-05-14 18:37:42',NULL),
 (6,'NhÃ³m cÃ´ng chá»©c',1,3,'2001,2002,2003,2004,2005,2006,2007,2008,2009,','2014-05-14 18:38:35','2013-11-09 16:41:59'),
 (7,'TrÆ°á»Ÿng Ä‘Æ¡n vá»‹',1,1,'2001,2002,2003,2004,2005,2006,2007,2008,2009,3001,3002,3003,3004,3005,3006,','2014-05-14 18:38:58','2014-02-28 02:35:17'),
 (8,'NhÃ³m TÃ i vá»¥',1,2,'2001,2002,2003,2004,2005,2006,2007,2008,2009,4005,4006,4009,4010,4011,','2014-05-14 18:38:47','2014-02-28 02:35:31');
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
 (5,1150000,85,1.5,8,'2014-06-01 12:52:02','2014-01-01 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hoc_ham`
--

/*!40000 ALTER TABLE `hoc_ham` DISABLE KEYS */;
INSERT INTO `hoc_ham` (`hh_id`,`hh_name`,`hh_order`,`hh_status`,`hh_date_added`,`hh_date_modified`) VALUES 
 (3,'Tháº¡c sÄ©',1,1,'2013-11-09 22:15:46','2013-11-09 22:28:15'),
 (4,'Cá»­ nhÃ¢n',2,1,'2014-02-23 16:58:10','2014-02-23 16:58:10'),
 (5,'Trung cáº¥p',3,1,'2014-04-16 23:11:13','2014-04-16 23:11:13'),
 (6,'Cao Ä‘áº³ng',4,1,'2014-04-16 23:11:31','2014-04-16 23:11:31'),
 (7,'SÆ¡ cáº¥p',5,1,'2014-04-16 23:11:44','2014-04-16 23:11:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holidays`
--

/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` (`hld_id`,`hld_name`,`hld_order`,`hld_status`,`hld_date_added`,`hld_date_modified`,`hld_code`) VALUES 
 (13,'Nghá»‰ má»™t buá»•i',1,1,'2014-04-18 04:32:14','2014-05-14 18:40:54','-'),
 (14,'Äi cÃ´ng tÃ¡c',2,1,'2014-04-18 04:32:24','2014-05-14 18:41:07','CT'),
 (15,'Nghá»‰ á»‘m',3,1,'2014-04-18 04:32:32','2014-05-14 18:41:24','á»'),
 (16,'Nghá»‰ Ä‘áº»',4,1,'2014-04-18 04:32:42','2014-05-14 18:41:38','Ä'),
 (17,'Nghá»‰ con á»‘m',5,1,'2014-04-18 04:32:53','2014-05-14 18:41:54','Cá»‘'),
 (18,'Nghá»‰ khÃ´ng lÃ½ do',6,1,'2014-04-18 04:33:04','2014-05-14 18:42:09','O'),
 (19,'Nghá»‰ bÃ¹',7,1,'2014-04-18 04:33:12','2014-05-14 18:44:35','B'),
 (20,'Äi há»c cáº£ ngÃ y',8,1,'2014-04-18 04:33:26','2014-05-14 18:45:38','H'),
 (21,'Äi há»c má»™t ná»­a',8,1,'2014-04-18 04:33:42','2014-05-14 18:45:56','H 1/2'),
 (22,'Nghá»‰ lá»…',9,1,'2014-04-18 04:33:53','2014-05-14 18:46:20','L'),
 (23,'CÃ³ máº·t lÃ m viá»‡c',0,1,'2014-05-14 18:40:40','2014-05-14 18:40:40','X'),
 (24,'Nghá»‰ phÃ©p',7,1,'2014-05-14 18:44:55','2014-05-14 18:45:16','P');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khen_thuong`
--

/*!40000 ALTER TABLE `khen_thuong` DISABLE KEYS */;
INSERT INTO `khen_thuong` (`kt_id`,`kt_can_bo_to_chuc`,`kt_em_id`,`kt_date`,`kt_ly_do`,`kt_chi_tiet`,`kt_status`,`kt_date_added`,`kt_date_modified`,`kt_don_vi`,`kt_ptccb_viewed`,`kt_money`) VALUES 
 (1,1,1,'2014-02-15 00:00:07','Lamf toot cong viec','<p>dsfds<strong> dsg</strong></p>\n<p>Goo man<em>fdggfdfdgf</em></p>',1,'2013-12-15 21:49:01','2013-12-15 21:49:01',0,0,0),
 (3,1,1,'2014-02-18 00:00:07','âsdasdasd','<p>fsdfsd</p>',0,'2014-02-18 17:17:03','2014-02-18 17:17:03',0,0,0),
 (7,1,1,'2014-02-18 00:00:07','fgdfg','<p>gdfgdf</p>',1,'2014-02-18 17:20:20','2014-02-18 17:20:20',0,0,0),
 (9,1,1,'2014-02-18 00:00:07','Ka ka ka','<p>Anh khen chu nha</p>',1,'2014-02-18 17:22:07','2014-02-18 23:51:36',1,1,5000000),
 (11,1,1,'2014-02-23 00:00:07','hi hi','<p>ha ha</p>',1,'2014-02-23 11:20:25','2014-02-23 23:05:52',1,1,0),
 (12,1,1,'2014-02-24 00:00:00','Test khen thuong','<p>Lam tot lam</p>',1,'2014-02-23 22:09:13','2014-02-23 22:09:13',0,0,0),
 (13,13,18,'2014-02-20 00:00:00','kopjkpoj','<p>jopij0j</p>',1,'2014-02-28 02:17:41','2014-02-28 02:17:41',0,1,200000),
 (14,13,18,'2014-02-20 00:00:00','lp[klp[k[p','<p>mklmlkkk</p>',1,'2014-02-28 02:17:54','2014-02-28 02:17:54',0,1,200000),
 (15,13,18,'2014-02-11 00:00:00','jhbjhbib','<p>mklm</p>',1,'2014-02-28 02:18:25','2014-02-28 02:18:25',0,1,500000),
 (16,13,19,'2014-04-18 00:00:07','gdfhah','<p>fasdgg</p>',1,'2014-04-18 04:11:42','2014-04-18 04:12:01',13,1,1000000),
 (17,73,67,'2014-04-15 00:00:07','Láº­p thÃ nh tÃ­ch trong cÃ´ng tÃ¡c Äáº£ng','<p>Láº­p th&agrave;nh t&iacute;ch trong c&ocirc;ng t&aacute;c Äáº£ng</p>',1,'2014-05-15 02:55:24','2014-05-15 02:55:24',0,1,230000);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ky_luat`
--

/*!40000 ALTER TABLE `ky_luat` DISABLE KEYS */;
INSERT INTO `ky_luat` (`kl_id`,`kl_can_bo_to_chuc`,`kl_em_id`,`kl_date`,`kl_ly_do`,`kl_chi_tiet`,`kl_status`,`kl_date_added`,`kl_date_modified`,`kl_don_vi`,`kl_ptccb_viewed`,`kl_money`) VALUES 
 (1,1,1,'2014-02-11 00:00:00','Chua lam tot cong viev','<p>sadsad ]d</p>\n<p><strong>sadf</strong></p>\n<p>sd</p>\n<p>sdasd</p>',1,'2013-12-15 21:58:46','2013-12-15 21:58:46',0,0,200000),
 (2,1,1,'0000-00-00 00:00:00','Làm chØH÷','<p>Anh phÝÚ	XXÝ]NÈŒÜ',1,'2014-02-18 17:25:43','2014-02-18 17:25:43',0,0,20000),
 (3,0,1,'0000-00-00 00:00:00','lam chØH÷','<p>ANh phÝÚ	XXÝ]NÏÜ',1,'2014-02-18 17:36:58','2014-02-18 17:36:58',1,0,200000),
 (4,1,1,'0000-00-00 00:00:00','Lam chua tot','<p>Phat</p>',1,'2014-02-23 22:09:32','2014-02-23 22:09:32',0,0,0);
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
  `ltg_gio_bat_dau_chieu` int(10) unsigned NOT NULL DEFAULT '0',
  `ltg_phut_bat_dau_chieu` int(10) unsigned NOT NULL DEFAULT '0',
  `ltg_gio_ket_thuc_chieu` int(10) unsigned NOT NULL DEFAULT '0',
  `ltg_phut_ket_thuc_chieu` int(10) unsigned NOT NULL DEFAULT '0',
  `ltg_date_added` datetime NOT NULL,
  `ltg_don_vi_status` float NOT NULL DEFAULT '-1',
  `ltg_tccb_status` float NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ltg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lam_them_gio`
--

/*!40000 ALTER TABLE `lam_them_gio` DISABLE KEYS */;
INSERT INTO `lam_them_gio` (`ltg_id`,`ltg_em_id`,`ltg_ngay`,`ltg_chi_tiet`,`ltg_gio_bat_dau`,`ltg_phut_bat_dau`,`ltg_gio_ket_thuc`,`ltg_phut_ket_thuc`,`ltg_gio_bat_dau_chieu`,`ltg_phut_bat_dau_chieu`,`ltg_gio_ket_thuc_chieu`,`ltg_phut_ket_thuc_chieu`,`ltg_date_added`,`ltg_don_vi_status`,`ltg_tccb_status`) VALUES 
 (21,69,'2014-05-03 00:00:00','<p>Hi hi hi</p>',7,30,11,15,14,20,15,55,'2014-05-28 22:24:00',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ly_luan_chinh_tri`
--

/*!40000 ALTER TABLE `ly_luan_chinh_tri` DISABLE KEYS */;
INSERT INTO `ly_luan_chinh_tri` (`llct_id`,`llct_name`,`llct_order`,`llct_status`,`llct_date_added`,`llct_date_modified`) VALUES 
 (3,'Cao cáº¥p',1,1,'2014-04-15 00:36:12','2014-04-16 03:10:50'),
 (4,'Cá»­ nhÃ¢n',2,1,'2014-04-16 03:11:08','2014-04-16 03:11:08'),
 (5,'Trung cáº¥p',3,1,'2014-04-16 03:11:23','2014-04-16 03:11:58'),
 (6,'SÆ¡ cáº¥p',4,1,'2014-04-16 03:11:32','2014-04-16 03:11:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ngach_cong_chuc`
--

/*!40000 ALTER TABLE `ngach_cong_chuc` DISABLE KEYS */;
INSERT INTO `ngach_cong_chuc` (`ncc_id`,`ncc_name`,`ncc_order`,`ncc_status`,`ncc_date_added`,`ncc_date_modified`,`ncc_ma_ngach`,`ncc_nam_nang_bac`) VALUES 
 (4,'Kiá»ƒm tra viÃªn Háº£i quan',2,1,'2013-11-26 15:07:50','2014-05-14 18:49:22','08.051',3),
 (5,'Kiá»ƒm tra viÃªn chÃ­nh Háº£i quan',3,1,'2013-11-26 15:07:58','2014-05-14 18:49:57','08.050',3),
 (6,'Kiá»ƒm tra viÃªn trung cáº¥p Háº£i quan',1,1,'2014-02-25 02:25:20','2014-05-14 18:48:05','08.052',2),
 (7,'NhÃ¢n viÃªn Háº£i quan',0,1,'2014-02-25 02:25:34','2014-05-14 18:47:27','08.053',2),
 (8,'Kiá»ƒm tra viÃªn cao Ä‘áº³ng háº£i quan',2,1,'2014-04-17 04:48:38','2014-05-14 18:51:22','08a.051',3),
 (9,'NhÃ¢n viÃªn vÄƒn thÆ°',5,1,'2014-04-17 04:49:37','2014-05-14 18:52:07','01.008',2),
 (10,'NhÃ¢n viÃªn báº£o vá»‡',6,1,'2014-04-17 04:49:51','2014-05-14 18:52:25','01.011',2),
 (11,'LÃ¡i xe cÆ¡ quan',7,1,'2014-04-17 04:50:07','2014-05-14 18:52:41','01.010',2),
 (12,'NhÃ¢n viÃªn phá»¥c vá»¥',8,1,'2014-05-14 18:54:10','2014-05-14 18:54:10','01.009',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phong_ban`
--

/*!40000 ALTER TABLE `phong_ban` DISABLE KEYS */;
INSERT INTO `phong_ban` (`pb_id`,`pb_name`,`pb_parent`,`pb_order`,`pb_status`,`pb_date_added`,`pb_date_modified`) VALUES 
 (9,'Chi cá»¥c Háº£i quan cá»­a kháº©u cáº£ng XuÃ¢n Háº£i',0,11,1,NULL,'2014-05-14 22:48:48'),
 (11,'Chi cá»¥c Háº£i quan Há»“ng LÄ©nh',0,10,1,NULL,'2014-04-16 22:33:44'),
 (12,'Chi cá»¥c Háº£i quan cá»­a kháº©u cáº£ng VÅ©ng Ãng',0,12,1,'2014-02-25 02:21:28','2014-05-15 04:34:03'),
 (13,'Chi cá»¥c Háº£i quan Khu kinh táº¿ cá»­a kháº©u Cáº§u Treo',0,14,1,'2014-02-25 02:22:11','2014-05-14 22:49:49'),
 (14,'Chi cá»¥c Háº£i quan cá»­a kháº©u quá»‘c táº¿ Cáº§u Treo',0,13,1,'2014-02-25 02:22:18','2014-05-14 22:49:30'),
 (15,'Chi cá»¥c Kiá»ƒm tra sau thÃ´ng quan',0,9,1,'2014-02-25 02:22:28','2014-04-16 22:33:28'),
 (16,'PhÃ²ng Chá»‘ng buÃ´n láº­u vÃ  xá»­ lÃ½ vi pháº¡m',0,6,1,'2014-02-25 02:22:49','2014-04-16 22:32:26'),
 (17,'PhÃ²ng Nghiá»‡p vá»¥',0,5,1,'2014-02-25 02:22:57','2014-04-16 22:32:11'),
 (18,'PhÃ²ng Thanh tra',0,4,1,'2014-02-25 02:23:04','2014-04-16 22:30:27'),
 (19,'PhÃ²ng Tá»• chá»©c cÃ¡n bá»™',0,3,1,'2014-02-25 02:23:11','2014-04-16 22:30:15'),
 (20,'VÄƒn phÃ²ng',0,2,1,'2014-02-25 02:23:25','2014-04-16 22:29:43'),
 (21,'Äá»™i Kiá»ƒm soÃ¡t Háº£i quan',0,8,1,'2014-02-25 02:23:45','2014-05-15 04:37:13'),
 (22,'Äá»™i Kiá»ƒm soÃ¡t phÃ²ng chá»‘ng ma tÃºy',0,7,1,'2014-02-25 02:23:52','2014-05-15 04:36:52'),
 (23,'LÃ£nh Ä‘áº¡o Cá»¥c',0,1,1,'2014-04-16 22:29:22','2014-04-16 22:29:22'),
 (24,'Äá»™i Tá»•ng há»£p',15,1,1,'2014-04-16 22:35:19','2014-04-16 22:35:19'),
 (25,'Äá»™i Nghiá»‡p vá»¥',15,2,1,'2014-04-16 22:36:00','2014-04-16 22:36:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quan_ly_nha_nuoc`
--

/*!40000 ALTER TABLE `quan_ly_nha_nuoc` DISABLE KEYS */;
INSERT INTO `quan_ly_nha_nuoc` (`qlnn_id`,`qlnn_name`,`qlnn_order`,`qlnn_status`,`qlnn_date_added`,`qlnn_date_modified`) VALUES 
 (3,'ChuyÃªn viÃªn cao cáº¥p',1,1,'2014-04-15 00:35:51','2014-04-16 03:09:33'),
 (4,'ChuyÃªn viÃªn chÃ­nh',2,1,'2014-04-15 00:35:58','2014-04-16 03:09:58'),
 (5,'ChuyÃªn viÃªn',3,1,'2014-04-16 03:10:22','2014-04-16 03:10:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thong_bao`
--

/*!40000 ALTER TABLE `thong_bao` DISABLE KEYS */;
INSERT INTO `thong_bao` (`tb_id`,`tb_from`,`tb_to`,`tb_tieu_de`,`tb_noi_dung`,`tb_status`,`tb_date_added`,`tb_date_modified`) VALUES 
 (1,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetnghiphep\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:43:21','2014-05-15 02:43:21'),
 (3,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetnghiphep\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:43:21','2014-05-15 02:43:21'),
 (4,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetnghiphep\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:43:21','2014-05-15 02:43:21'),
 (5,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:49:34','2014-05-15 02:49:34'),
 (7,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:49:34','2014-05-15 02:49:34'),
 (8,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:49:34','2014-05-15 02:49:34'),
 (9,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:50:13','2014-05-15 02:50:13'),
 (11,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:50:13','2014-05-15 02:50:13'),
 (12,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:50:13','2014-05-15 02:50:13'),
 (13,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:51:37','2014-05-15 02:51:37'),
 (15,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 02:51:37','2014-05-15 02:51:37'),
 (16,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-05-15 02:51:37','2014-05-15 02:51:37'),
 (17,0,67,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: TrÆ°á»Ÿng phÃ²ng</br>\n                PhÃ²ng ban: PhÃ²ng Tá»• chá»©c cÃ¡n bá»™</br>\n                Ngáº¡ch cÃ´ng chá»©c: Kiá»ƒm tra viÃªn Háº£i quan</br>\n                CÃ´ng viá»‡c: </br>\n                ChuyÃªn mÃ´n: </br>',0,'2014-05-15 02:54:12','2014-05-15 02:54:12'),
 (18,0,67,'[Khen ThÆ°á»Ÿng] Láº­p thÃ nh tÃ­ch trong cÃ´ng tÃ¡c Äáº£ng','<p>Láº­p th&agrave;nh t&iacute;ch trong c&ocirc;ng t&aacute;c Äáº£ng</p>',0,'2014-05-15 02:55:24','2014-05-15 02:55:24'),
 (22,0,70,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: CÃ´ng chá»©c</br>\n                PhÃ²ng ban: PhÃ²ng Tá»• chá»©c cÃ¡n bá»™</br>\n                Ngáº¡ch cÃ´ng chá»©c: Kiá»ƒm tra viÃªn Háº£i quan</br>\n                CÃ´ng viá»‡c: </br>\n                ChuyÃªn mÃ´n: </br>',0,'2014-05-15 03:06:11','2014-05-15 03:06:11'),
 (23,0,71,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: CÃ´ng chá»©c</br>\n                PhÃ²ng ban: PhÃ²ng Tá»• chá»©c cÃ¡n bá»™</br>\n                Ngáº¡ch cÃ´ng chá»©c: Kiá»ƒm tra viÃªn Háº£i quan</br>\n                CÃ´ng viá»‡c: </br>\n                ChuyÃªn mÃ´n: </br>',0,'2014-05-15 03:06:27','2014-05-15 03:06:27'),
 (24,0,72,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: CÃ´ng chá»©c</br>\n                PhÃ²ng ban: PhÃ²ng Tá»• chá»©c cÃ¡n bá»™</br>\n                Ngáº¡ch cÃ´ng chá»©c: Kiá»ƒm tra viÃªn Háº£i quan</br>\n                CÃ´ng viá»‡c: </br>\n                ChuyÃªn mÃ´n: </br>',0,'2014-05-15 03:06:38','2014-05-15 03:06:38'),
 (25,0,73,'[LuÃ¢n chuyá»ƒn] Báº¡n Ä‘Ã£ Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i','Báº¡n vá»«a Ä‘Æ°á»£c luÃ¢n chuyá»ƒn sang Ä‘Æ¡n vá»‹/cÃ´ng viá»‡c má»›i.</br>\n                Chi tiáº¿t nhÆ° sau:</br>\n                Chá»©c vá»¥: CÃ´ng chá»©c</br>\n                PhÃ²ng ban: PhÃ²ng Tá»• chá»©c cÃ¡n bá»™</br>\n                Ngáº¡ch cÃ´ng chá»©c: Kiá»ƒm tra viÃªn Háº£i quan</br>\n                CÃ´ng viá»‡c: </br>\n                ChuyÃªn mÃ´n: </br>',0,'2014-05-15 03:06:49','2014-05-15 03:06:49'),
 (26,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:10:38','2014-05-15 03:10:38'),
 (28,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:10:38','2014-05-15 03:10:38'),
 (29,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:10:38','2014-05-15 03:10:38'),
 (30,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-05-15 03:11:20','2014-05-15 03:11:20'),
 (32,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:11:20','2014-05-15 03:11:20'),
 (33,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:11:20','2014-05-15 03:11:20'),
 (34,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:29:52','2014-05-15 03:29:52'),
 (36,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:29:52','2014-05-15 03:29:52'),
 (37,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:29:52','2014-05-15 03:29:52'),
 (38,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:32:15','2014-05-15 03:32:15'),
 (40,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:32:15','2014-05-15 03:32:15'),
 (41,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:32:15','2014-05-15 03:32:15'),
 (42,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:33:53','2014-05-15 03:33:53'),
 (44,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:33:53','2014-05-15 03:33:53'),
 (45,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:33:53','2014-05-15 03:33:53'),
 (46,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:36:54','2014-05-15 03:36:54'),
 (48,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:37:12','2014-05-15 03:37:12'),
 (50,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:37:24','2014-05-15 03:37:24'),
 (52,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:37:44','2014-05-15 03:37:44'),
 (54,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:39:21','2014-05-15 03:39:21'),
 (56,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:39:21','2014-05-15 03:39:21'),
 (57,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:39:21','2014-05-15 03:39:21'),
 (58,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:40:53','2014-05-15 03:40:53'),
 (60,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:40:53','2014-05-15 03:40:53'),
 (61,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:40:53','2014-05-15 03:40:53'),
 (62,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:42:41','2014-05-15 03:42:41'),
 (64,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:42:41','2014-05-15 03:42:41'),
 (65,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-05-15 03:42:41','2014-05-15 03:42:41'),
 (66,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:43:57','2014-05-15 03:43:57'),
 (68,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:44:17','2014-05-15 03:44:17'),
 (70,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:44:53','2014-05-15 03:44:53'),
 (72,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:45:12','2014-05-15 03:45:12'),
 (74,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:45:16','2014-05-15 03:45:16'),
 (76,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:45:21','2014-05-15 03:45:21'),
 (78,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:45:25','2014-05-15 03:45:25'),
 (80,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:45:31','2014-05-15 03:45:31'),
 (82,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-15 03:45:38','2014-05-15 03:45:38'),
 (84,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-05-15 03:45:46','2014-05-15 03:45:46'),
 (86,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/tochuccanbo/duyetnghiphep\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',1,'2014-05-15 03:50:14','2014-05-15 03:50:14'),
 (88,0,1,'[LÃ m thÃªm giá»] Khai bÃ¡o lÃ m thÃªm giá» Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.','Khai bÃ¡o lÃ m thÃªm giá» cá»§a báº¡n Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.<br> NgÃ y: 12-02-2014<br> Giá» báº¯t Ä‘áº§u: 1:10 <br> Giá» káº¿t thÃºc: 18:19',0,'2014-05-15 23:00:31','2014-05-15 23:00:31'),
 (89,0,1,'[LÃ m thÃªm giá»] Khai bÃ¡o lÃ m thÃªm giá» Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.','Khai bÃ¡o lÃ m thÃªm giá» cá»§a báº¡n Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.<br> NgÃ y: 12-02-2014<br> Giá» báº¯t Ä‘áº§u: 1:10 <br> Giá» káº¿t thÃºc: 18:19',0,'2014-05-15 23:00:31','2014-05-15 23:00:31'),
 (90,0,329,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetnghiphep\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-16 03:39:22','2014-05-16 03:39:22'),
 (91,0,329,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-16 03:41:17','2014-05-16 03:41:17'),
 (92,0,329,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-16 03:42:24','2014-05-16 03:42:24'),
 (93,0,329,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-16 03:45:11','2014-05-16 03:45:11'),
 (94,0,1,'[Xin nghá»‰ phÃ©p] ÄÆ¡n xin nghá»‰ phÃ©p Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.','ÄÆ¡n nghá»‰ phÃ©p cá»§a báº¡n Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.<br> Lá»‹ch nghá»‰ cá»§a báº¡n báº¯t Ä‘áº§u tá»« 02-02-2014 Ä‘áº¿n ngÃ y 07-02-2014',0,'2014-05-16 03:50:43','2014-05-16 03:50:43'),
 (95,0,1,'[LÃ m thÃªm giá»] Khai bÃ¡o lÃ m thÃªm giá» Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c cháº¥p nháº­n.','Khai bÃ¡o lÃ m thÃªm giá» cá»§a báº¡n Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br> NgÃ y: 12-02-2014<br> Giá» báº¯t Ä‘áº§u: 1:10 <br> Giá» káº¿t thÃºc: 18:19',0,'2014-05-16 03:53:52','2014-05-16 03:53:52'),
 (96,0,1,'[LÃ m thÃªm giá»] Khai bÃ¡o lÃ m thÃªm giá» Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c cháº¥p nháº­n.','Khai bÃ¡o lÃ m thÃªm giá» cá»§a báº¡n Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br> NgÃ y: 12-02-2014<br> Giá» báº¯t Ä‘áº§u: 1:10 <br> Giá» káº¿t thÃºc: 18:19',0,'2014-05-16 03:53:56','2014-05-16 03:53:56'),
 (97,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:01:31','2014-05-18 11:01:31'),
 (99,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:01:31','2014-05-18 11:01:31'),
 (100,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:01:31','2014-05-18 11:01:31'),
 (101,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:01:35','2014-05-18 11:01:35'),
 (103,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:01:35','2014-05-18 11:01:35'),
 (104,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:01:35','2014-05-18 11:01:35'),
 (105,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:07:06','2014-05-18 11:07:06'),
 (107,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:07:06','2014-05-18 11:07:06'),
 (108,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:07:06','2014-05-18 11:07:06'),
 (109,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:07:12','2014-05-18 11:07:12'),
 (111,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:07:12','2014-05-18 11:07:12'),
 (112,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:07:12','2014-05-18 11:07:12'),
 (113,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:09:00','2014-05-18 11:09:00'),
 (115,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:09:00','2014-05-18 11:09:00'),
 (116,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:09:00','2014-05-18 11:09:00'),
 (117,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:09:06','2014-05-18 11:09:06'),
 (119,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:09:06','2014-05-18 11:09:06'),
 (120,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:09:06','2014-05-18 11:09:06'),
 (121,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 5-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 5-2014',0,'2014-05-18 11:10:20','2014-05-18 11:10:20'),
 (122,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 5-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 5-2014',0,'2014-05-18 11:10:54','2014-05-18 11:10:54'),
 (123,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:11:17','2014-05-18 11:11:17'),
 (125,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:11:17','2014-05-18 11:11:17'),
 (126,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:11:17','2014-05-18 11:11:17'),
 (127,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 5-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 5-2014',0,'2014-05-18 11:11:17','2014-05-18 11:11:17'),
 (128,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:11:22','2014-05-18 11:11:22'),
 (130,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:11:22','2014-05-18 11:11:22'),
 (131,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:11:22','2014-05-18 11:11:22'),
 (132,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:11:28','2014-05-18 11:11:28'),
 (134,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:11:28','2014-05-18 11:11:28'),
 (135,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:11:28','2014-05-18 11:11:28'),
 (136,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 5-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 5-2014',0,'2014-05-18 11:11:28','2014-05-18 11:11:28'),
 (137,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 05-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 05-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 05-2014',0,'2014-05-18 11:12:38','2014-05-18 11:12:38'),
 (138,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 5-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 5-2014',0,'2014-05-18 11:13:04','2014-05-18 11:13:04'),
 (139,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:14:33','2014-05-18 11:14:33'),
 (141,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:14:33','2014-05-18 11:14:33'),
 (142,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:14:33','2014-05-18 11:14:33'),
 (143,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 05-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 05-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 05-2014',1,'2014-05-18 11:14:50','2014-05-18 11:14:50'),
 (144,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:15:46','2014-05-18 11:15:46'),
 (146,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:15:46','2014-05-18 11:15:46'),
 (147,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:15:47','2014-05-18 11:15:47'),
 (148,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 05-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 05-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 05-2014',0,'2014-05-18 11:15:56','2014-05-18 11:15:56'),
 (149,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:17:47','2014-05-18 11:17:47'),
 (151,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:17:47','2014-05-18 11:17:47'),
 (152,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:17:47','2014-05-18 11:17:47'),
 (153,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:40:29','2014-05-18 11:40:29'),
 (155,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:40:29','2014-05-18 11:40:29'),
 (156,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:40:29','2014-05-18 11:40:29'),
 (157,0,1,'[LÃ m thÃªm giá»] Khai bÃ¡o lÃ m thÃªm giá» Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.','Khai bÃ¡o lÃ m thÃªm giá» cá»§a báº¡n Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.<br> NgÃ y: 12-02-2014<br> Giá» báº¯t Ä‘áº§u: 1:10 <br> Giá» káº¿t thÃºc: 18:19',0,'2014-05-18 11:49:29','2014-05-18 11:49:29'),
 (158,0,1,'[LÃ m thÃªm giá»] Khai bÃ¡o lÃ m thÃªm giá» Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.','Khai bÃ¡o lÃ m thÃªm giá» cá»§a báº¡n Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.<br> NgÃ y: 12-02-2014<br> Giá» báº¯t Ä‘áº§u: 1:10 <br> Giá» káº¿t thÃºc: 18:19',0,'2014-05-18 11:51:31','2014-05-18 11:51:31'),
 (159,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:58:41','2014-05-18 11:58:41'),
 (161,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:58:41','2014-05-18 11:58:41'),
 (162,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 11:58:41','2014-05-18 11:58:41'),
 (164,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetnghiphep\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 12:18:29','2014-05-18 12:18:29'),
 (166,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetnghiphep\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 12:18:29','2014-05-18 12:18:29'),
 (167,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Æ¡n xin nghá»‰ phÃ©p.','CÃ³ Ä‘Æ¡n xin nghá»‰ phÃ©p má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetnghiphep\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-18 12:18:29','2014-05-18 12:18:29'),
 (168,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 22:28:29','2014-05-26 22:28:29'),
 (170,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 22:28:29','2014-05-26 22:28:29'),
 (171,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 22:28:29','2014-05-26 22:28:29'),
 (173,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 22:53:21','2014-05-26 22:53:21'),
 (175,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 22:53:21','2014-05-26 22:53:21'),
 (176,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t cháº¥m cÃ´ng thÃ¡ng.','CÃ³ Ä‘Æ¡n xin duyá»‡t cháº¥m cÃ´ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 22:53:21','2014-05-26 22:53:21'),
 (177,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 23:11:46','2014-05-26 23:11:46'),
 (179,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 23:11:46','2014-05-26 23:11:46'),
 (180,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 23:11:46','2014-05-26 23:11:46'),
 (181,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 23:20:13','2014-05-26 23:20:13'),
 (183,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 23:34:52','2014-05-26 23:34:52'),
 (185,0,68,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng cá»§a báº¡n thÃ¡ng 4-2014 khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/> YÃªu cáº§u báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/canhan/danhgiaphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t chá»‰nh sá»­a.',0,'2014-05-26 23:37:37','2014-05-26 23:37:37'),
 (186,0,73,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a Nguyá»…n ÄÃ¬nh BÃ¬nh thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:37:37','2014-05-26 23:37:37'),
 (188,0,67,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a Nguyá»…n ÄÃ¬nh BÃ¬nh thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:37:37','2014-05-26 23:37:37'),
 (189,0,68,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a Nguyá»…n ÄÃ¬nh BÃ¬nh thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:37:37','2014-05-26 23:37:37'),
 (190,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 23:38:05','2014-05-26 23:38:05'),
 (193,0,73,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a ÄÃ o NghÄ©a Äá»“ng thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:38:35','2014-05-26 23:38:35'),
 (195,0,67,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a ÄÃ o NghÄ©a Äá»“ng thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:38:35','2014-05-26 23:38:35'),
 (196,0,68,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a ÄÃ o NghÄ©a Äá»“ng thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:38:35','2014-05-26 23:38:35'),
 (197,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 23:45:44','2014-05-26 23:45:44'),
 (199,0,67,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng cá»§a báº¡n thÃ¡ng 4-2014 khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/> YÃªu cáº§u báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/canhan/danhgiaphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t chá»‰nh sá»­a.',0,'2014-05-26 23:45:59','2014-05-26 23:45:59'),
 (201,0,73,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a ÄÃ o NghÄ©a Äá»“ng thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:49:11','2014-05-26 23:49:11'),
 (203,0,67,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a ÄÃ o NghÄ©a Äá»“ng thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:49:11','2014-05-26 23:49:11'),
 (204,0,68,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a ÄÃ o NghÄ©a Äá»“ng thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:49:11','2014-05-26 23:49:11'),
 (205,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 23:50:06','2014-05-26 23:50:06'),
 (207,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-26 23:50:09','2014-05-26 23:50:09'),
 (209,0,67,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng cá»§a báº¡n thÃ¡ng 4-2014 khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/> YÃªu cáº§u báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/canhan/danhgiaphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t chá»‰nh sá»­a.',0,'2014-05-26 23:50:37','2014-05-26 23:50:37'),
 (210,0,73,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a Nguyá»…n Thá»‹ Kim Oanh thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:50:37','2014-05-26 23:50:37'),
 (212,0,67,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a Nguyá»…n Thá»‹ Kim Oanh thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:50:37','2014-05-26 23:50:37'),
 (213,0,68,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a Nguyá»…n Thá»‹ Kim Oanh thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:50:37','2014-05-26 23:50:37'),
 (215,0,73,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a ÄÃ o NghÄ©a Äá»“ng thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:50:37','2014-05-26 23:50:37'),
 (217,0,67,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a ÄÃ o NghÄ©a Äá»“ng thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:50:37','2014-05-26 23:50:37'),
 (218,0,68,'[ThÃ´ng bÃ¡o] PhÃ²ng tá»• chá»©c khÃ´ng duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','ÄÃ¡nh giÃ¡ phÃ¢n loáº¡i cá»§a ÄÃ o NghÄ©a Äá»“ng thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:50:37','2014-05-26 23:50:37'),
 (219,0,69,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 4-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 4-2014',1,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (220,0,73,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>ÄÃ o NghÄ©a Äá»“ng</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (221,0,69,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>ÄÃ o NghÄ©a Äá»“ng</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',1,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (222,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>ÄÃ o NghÄ©a Äá»“ng</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (223,0,68,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>ÄÃ o NghÄ©a Äá»“ng</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (224,0,71,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 4-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 4-2014',0,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (225,0,73,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>BÃ¹i Minh  TÃº</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (226,0,69,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>BÃ¹i Minh  TÃº</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',1,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (227,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>BÃ¹i Minh  TÃº</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (228,0,68,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>BÃ¹i Minh  TÃº</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-26 23:57:42','2014-05-26 23:57:42'),
 (229,0,73,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 4-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 4-2014',0,'2014-05-28 22:04:52','2014-05-28 22:04:52'),
 (230,0,73,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>NgÃ´ Thá»‹ Ngá»c Vinh</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:04:52','2014-05-28 22:04:52'),
 (231,0,69,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>NgÃ´ Thá»‹ Ngá»c Vinh</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:04:52','2014-05-28 22:04:52'),
 (232,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>NgÃ´ Thá»‹ Ngá»c Vinh</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:04:52','2014-05-28 22:04:52'),
 (233,0,68,'[Cháº¥m cÃ´ng thÃ¡ng 4-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>NgÃ´ Thá»‹ Ngá»c Vinh</strong> thÃ¡ng 4-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:04:52','2014-05-28 22:04:52'),
 (234,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-28 22:24:00','2014-05-28 22:24:00'),
 (235,0,69,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-28 22:24:00','2014-05-28 22:24:00'),
 (236,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-28 22:24:00','2014-05-28 22:24:00'),
 (237,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-28 22:24:00','2014-05-28 22:24:00'),
 (238,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-28 22:24:08','2014-05-28 22:24:08'),
 (239,0,69,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-28 22:24:08','2014-05-28 22:24:08');
INSERT INTO `thong_bao` (`tb_id`,`tb_from`,`tb_to`,`tb_tieu_de`,`tb_noi_dung`,`tb_status`,`tb_date_added`,`tb_date_modified`) VALUES 
 (240,0,309,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-28 22:24:08','2014-05-28 22:24:08'),
 (241,0,302,'[ThÃ´ng bÃ¡o] Duyá»‡t khai bÃ¡o lÃ m thÃªm giá».','CÃ³ khai bÃ¡o lÃ m thÃªm giá» má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetthemgio\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-05-28 22:24:08','2014-05-28 22:24:08'),
 (242,0,69,'[LÃ m thÃªm giá»] Khai bÃ¡o lÃ m thÃªm giá» Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.','Khai bÃ¡o lÃ m thÃªm giá» cá»§a báº¡n Ä‘Ã£ Ä‘Æ°á»£c duyá»‡t.<br> NgÃ y: 03-05-2014<br> Giá» báº¯t Ä‘áº§u: 7:30 <br> Giá» káº¿t thÃºc: 11:15',0,'2014-05-28 22:24:18','2014-05-28 22:24:18'),
 (243,0,72,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 5-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 5-2014',0,'2014-05-28 22:39:54','2014-05-28 22:39:54'),
 (244,0,73,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Äáº­u Minh PhÆ°Æ¡ng</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:39:55','2014-05-28 22:39:55'),
 (245,0,69,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Äáº­u Minh PhÆ°Æ¡ng</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:39:55','2014-05-28 22:39:55'),
 (246,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Äáº­u Minh PhÆ°Æ¡ng</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:39:55','2014-05-28 22:39:55'),
 (247,0,68,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Äáº­u Minh PhÆ°Æ¡ng</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:39:55','2014-05-28 22:39:55'),
 (248,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 5-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 5-2014',0,'2014-05-28 22:41:32','2014-05-28 22:41:32'),
 (249,0,73,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Nguyá»…n Thá»‹ Kim Oanh</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:41:32','2014-05-28 22:41:32'),
 (250,0,69,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Nguyá»…n Thá»‹ Kim Oanh</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:41:32','2014-05-28 22:41:32'),
 (251,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Nguyá»…n Thá»‹ Kim Oanh</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:41:32','2014-05-28 22:41:32'),
 (252,0,68,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Nguyá»…n Thá»‹ Kim Oanh</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:41:32','2014-05-28 22:41:32'),
 (253,0,72,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 5-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 5-2014',0,'2014-05-28 22:43:32','2014-05-28 22:43:32'),
 (254,0,73,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Äáº­u Minh PhÆ°Æ¡ng</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:43:32','2014-05-28 22:43:32'),
 (255,0,69,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Äáº­u Minh PhÆ°Æ¡ng</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:43:32','2014-05-28 22:43:32'),
 (256,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Äáº­u Minh PhÆ°Æ¡ng</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:43:32','2014-05-28 22:43:32'),
 (257,0,68,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>Äáº­u Minh PhÆ°Æ¡ng</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:43:32','2014-05-28 22:43:32'),
 (258,0,71,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','ChÃ o báº¡n!<br/>Cháº¥m cÃ´ng 5-2014 Ä‘Ã£ khÃ´ng Ä‘Æ°á»£c duyá»‡t.<br/>YÃªu cáº§u báº¡n chá»‰nh sá»­a láº¡i báº£ng cháº¥m cÃ´ng thÃ¡ng 5-2014',0,'2014-05-28 22:43:55','2014-05-28 22:43:55'),
 (259,0,73,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>BÃ¹i Minh  TÃº</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:43:55','2014-05-28 22:43:55'),
 (260,0,69,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>BÃ¹i Minh  TÃº</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:43:55','2014-05-28 22:43:55'),
 (261,0,67,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>BÃ¹i Minh  TÃº</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:43:55','2014-05-28 22:43:55'),
 (262,0,68,'[Cháº¥m cÃ´ng thÃ¡ng 5-2014] Cháº¥m cÃ´ng khÃ´ng Ä‘Æ°á»£c duyá»‡t.','Cháº¥m cÃ´ng cá»§a <strong>BÃ¹i Minh  TÃº</strong> thÃ¡ng 5-2014 phÃ²ng tá»• chá»©c khÃ´ng duyá»‡t.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetchamcong\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t láº¡i.',0,'2014-05-28 22:43:55','2014-05-28 22:43:55'),
 (263,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:35','2014-06-01 13:18:35'),
 (264,0,69,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:35','2014-06-01 13:18:35'),
 (265,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:35','2014-06-01 13:18:35'),
 (266,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:35','2014-06-01 13:18:35'),
 (267,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:47','2014-06-01 13:18:47'),
 (268,0,69,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:47','2014-06-01 13:18:47'),
 (269,0,67,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:47','2014-06-01 13:18:47'),
 (270,0,68,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ khai bÃ¡o Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i má»›i.<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/donvi/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:47','2014-06-01 13:18:47'),
 (271,0,73,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:57','2014-06-01 13:18:57'),
 (272,0,69,'[ThÃ´ng bÃ¡o] Duyá»‡t Ä‘Ã¡nh giÃ¡ phÃ¢n loáº¡i.','CÃ³ Ä‘Æ¡n Ä‘Ã¡nh giÃ¡ phÃ¢n phÃ¢n loáº¡i theo thÃ¡ng má»›i<br/> Báº¡n hÃ£y <strong><a href=\"/phanloaicanbo/web/tochuccanbo/duyetphanloai\">click vÃ o Ä‘Ã¢y</a></strong> Ä‘á»ƒ xÃ©t duyá»‡t.',0,'2014-06-01 13:18:57','2014-06-01 13:18:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`em_id`,`group_id`,`username`,`password`,`status`,`date_added`,`date_modified`) VALUES 
 (19,73,1,'vinhntn','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 02:08:26','2014-05-15 02:08:26'),
 (20,69,1,'dongdn','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 02:32:18','2014-05-15 02:32:18'),
 (21,67,7,'oanhntk','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 02:33:00','2014-05-15 02:33:00'),
 (22,68,7,'binhnd','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 02:33:18','2014-05-15 02:33:18'),
 (23,70,6,'phuongltk','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 02:33:33','2014-05-15 02:41:27'),
 (24,72,6,'phuongdm','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 02:34:00','2014-05-15 02:34:00'),
 (25,71,6,'tubm','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 02:34:17','2014-05-15 02:34:17'),
 (26,309,8,'thaodtd','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 23:12:37','2014-05-15 23:12:37'),
 (27,302,8,'hanhptm','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 23:12:58','2014-05-15 23:12:58'),
 (28,329,7,'andx','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 23:13:33','2014-05-15 23:13:33'),
 (29,330,6,'thanhnc','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 23:13:59','2014-05-15 23:13:59'),
 (30,332,6,'binhvtd','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 23:14:25','2014-05-15 23:14:25'),
 (31,331,6,'hienntb','e10adc3949ba59abbe56e057f20f883e','1','2014-05-15 23:14:43','2014-05-15 23:14:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

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
 (91,1,1393210964,'117.6.79.96'),
 (92,1,1393211497,'117.6.79.96'),
 (93,1,1393257535,'42.112.142.72'),
 (94,1,1393315379,'117.6.79.96'),
 (95,4,1393315451,'113.160.178.133'),
 (96,1,1393318072,'117.6.79.96'),
 (97,4,1393383162,'113.160.178.133'),
 (98,5,1393388589,'113.160.178.133'),
 (99,5,1393388709,'113.160.178.133'),
 (100,4,1393396601,'113.160.178.133'),
 (101,6,1393396700,'113.160.178.133'),
 (102,1,1393515085,'42.112.142.72'),
 (103,4,1393573599,'113.160.178.133'),
 (104,6,1393579703,'113.160.178.133'),
 (105,4,1393580080,'113.160.178.133'),
 (106,1,1393954659,'42.112.142.72'),
 (107,4,1394011180,'113.160.178.133'),
 (108,4,1394075000,'113.160.178.133'),
 (109,4,1394434551,'113.160.178.133'),
 (110,1,1394968583,'42.113.163.61'),
 (111,1,1395566816,'113.23.54.120'),
 (112,4,1395800959,'113.160.178.133'),
 (113,1,1395998992,'117.6.79.96'),
 (114,1,1396543817,'42.113.92.47'),
 (115,4,1397094263,'113.160.178.133'),
 (116,4,1397112898,'113.160.178.133'),
 (117,4,1397182938,'113.160.178.133'),
 (118,1,1397200165,'117.6.79.96'),
 (119,1,1397202170,'42.113.186.164'),
 (120,1,1397204718,'42.113.186.164'),
 (121,4,1397459099,'113.160.178.133'),
 (122,1,1397539812,'117.6.79.96'),
 (123,4,1397550690,'113.160.178.133'),
 (124,4,1397612000,'113.160.178.133'),
 (125,4,1397633391,'113.160.178.133'),
 (126,4,1397634850,'113.160.178.133'),
 (127,4,1397700827,'113.160.178.133'),
 (128,1,1397702041,'117.6.79.96'),
 (129,4,1397703681,'113.160.178.133'),
 (130,4,1397785432,'113.160.178.133'),
 (131,7,1397790646,'113.160.178.133'),
 (132,4,1397792806,'113.160.178.133'),
 (133,8,1397792907,'113.160.178.133'),
 (134,4,1397793161,'113.160.178.133'),
 (135,11,1397794090,'113.160.178.133'),
 (136,7,1397805749,'113.160.178.133'),
 (137,1,1397807069,'117.6.79.96'),
 (138,4,1397808307,'113.160.178.133'),
 (139,4,1397984528,'123.17.59.91'),
 (140,4,1397984529,'123.17.59.91'),
 (141,4,1398480119,'113.160.178.133'),
 (142,13,1398480220,'113.160.178.133'),
 (143,8,1398480291,'113.160.178.133'),
 (144,4,1398480370,'113.160.178.133'),
 (145,4,1398482823,'113.160.178.133'),
 (146,4,1398742698,'113.160.178.133'),
 (147,1,1399272974,'117.6.79.96'),
 (148,4,1399363733,'113.160.178.133'),
 (149,4,1399423600,'113.160.178.133'),
 (150,1,1399738756,'42.113.130.214'),
 (151,1,1399917102,'42.114.72.253'),
 (152,4,1399945054,'113.160.178.133'),
 (153,4,1399974647,'113.160.178.133'),
 (154,1,1400000528,'1.55.162.44'),
 (155,4,1400050850,'113.160.178.133'),
 (156,1,1400110250,'42.113.155.53'),
 (157,4,1400113177,'42.113.155.53'),
 (158,4,1400113188,'42.113.155.53'),
 (159,4,1400124261,'113.160.178.133'),
 (160,4,1400124947,'113.160.178.133'),
 (161,4,1400125594,'117.6.79.96'),
 (162,4,1400128142,'113.160.178.133'),
 (163,4,1400137743,'113.160.178.133'),
 (164,19,1400137823,'113.160.178.133'),
 (165,19,1400138971,'113.160.178.133'),
 (166,22,1400141280,'113.160.178.133'),
 (167,19,1400141504,'113.160.178.133'),
 (168,23,1400142401,'113.160.178.133'),
 (169,25,1400142642,'113.160.178.133'),
 (170,24,1400142758,'113.160.178.133'),
 (171,20,1400142844,'113.160.178.133'),
 (172,21,1400142929,'113.160.178.133'),
 (173,24,1400143093,'113.160.178.133'),
 (174,21,1400143180,'113.160.178.133'),
 (175,20,1400143263,'113.160.178.133'),
 (176,21,1400143396,'113.160.178.133'),
 (177,20,1400143503,'117.6.79.96'),
 (178,20,1400143639,'113.160.178.133'),
 (179,20,1400143645,'113.160.178.133'),
 (180,19,1400143670,'113.160.178.133'),
 (181,20,1400212190,'113.160.178.133'),
 (182,29,1400213703,'113.160.178.133'),
 (183,19,1400229921,'113.160.178.133'),
 (184,22,1400231219,'113.160.178.133'),
 (185,28,1400231446,'113.160.178.133'),
 (186,20,1400231587,'117.6.79.96'),
 (187,19,1400232670,'113.160.178.133'),
 (188,20,1400339201,'::1'),
 (189,20,1400385058,'::1'),
 (190,21,1400386599,'::1'),
 (191,20,1400386628,'::1'),
 (192,20,1400424188,'::1'),
 (193,20,1401116934,'::1'),
 (194,20,1401289226,'::1'),
 (195,20,1401508769,'::1'),
 (196,20,1401528607,'::1'),
 (197,20,1401544029,'::1'),
 (198,20,1401593382,'::1'),
 (199,20,1401636708,'::1'),
 (200,20,1401665452,'::1');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xin_nghi_phep`
--

/*!40000 ALTER TABLE `xin_nghi_phep` DISABLE KEYS */;
INSERT INTO `xin_nghi_phep` (`xnp_id`,`xnp_em_id`,`xnp_from_date`,`xnp_to_date`,`xnp_date_created`,`xnp_don_vi_status`,`xnp_ptccb_status`,`xnp_ly_do`,`xnp_chi_tiet`) VALUES 
 (3,1,'2014-02-02 21:42:07','2014-02-07 21:42:07','2013-12-27 21:42:29',1,1,'Nghi om','<p>ah ang nay naoRet qua nen muon xin nghi</p>'),
 (4,1,'2014-03-03 00:00:00','2014-03-05 00:00:00','2014-02-23 22:03:38',-1,-1,'Test lai he thong nghi phep','<p>Test lai thoi</p>'),
 (5,13,'2014-04-01 00:00:00','2014-04-23 00:00:00','2014-04-14 02:20:42',-1,1,'ThÄƒm gia Ä‘Ã¬nh','<p>táº¡i TP Há»“ Ch&iacute; Minh</p>\r\n<p>&nbsp;</p>'),
 (6,13,'2014-04-23 00:00:00','2014-04-25 00:00:00','2014-04-16 03:24:07',-1,1,'Du lá»‹ch gia Ä‘Ã¬nh',''),
 (7,19,'2014-04-22 00:00:00','2014-04-24 00:00:00','2014-04-17 22:37:29',1,1,'Äi khÃ¡m bá»‡nh',''),
 (8,73,'2014-06-03 00:00:00','2014-06-05 00:00:00','2014-05-15 02:43:21',1,-1,'Äi khÃ¡m bá»‡nh','<p>Kh&aacute;m dáº¡ d&agrave;y</p>'),
 (9,330,'2014-05-26 00:00:00','2014-05-26 00:00:00','2014-05-16 03:39:22',-1,1,'Äi khÃ¡m bá»‡nh','<p>Thá»‹ lá»±c giáº£m s&uacute;t. Xin ph&eacute;p Ä‘i kh&aacute;m máº¯t</p>'),
 (10,69,'2014-05-01 00:00:00','2014-05-01 00:00:00','2014-05-18 12:18:29',-1,-1,'114324234234','<p>11</p>');
/*!40000 ALTER TABLE `xin_nghi_phep` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
