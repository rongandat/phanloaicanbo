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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cham_cong`
--

/*!40000 ALTER TABLE `cham_cong` DISABLE KEYS */;
INSERT INTO `cham_cong` (`c_id`,`c_em_id`,`c_thang`,`c_nam`,`c_ngay_1`,`c_ngay_2`,`c_ngay_3`,`c_ngay_4`,`c_ngay_5`,`c_ngay_6`,`c_ngay_7`,`c_ngay_8`,`c_ngay_9`,`c_ngay_10`,`c_ngay_11`,`c_ngay_12`,`c_ngay_13`,`c_ngay_14`,`c_ngay_15`,`c_ngay_16`,`c_ngay_17`,`c_ngay_18`,`c_ngay_19`,`c_ngay_20`,`c_ngay_21`,`c_ngay_22`,`c_ngay_23`,`c_ngay_24`,`c_ngay_25`,`c_ngay_26`,`c_ngay_27`,`c_ngay_28`,`c_ngay_29`,`c_ngay_30`,`c_ngay_31`,`c_don_vi_status`,`c_ptccb_status`,`c_date_created`,`c_date_modifyed`) VALUES 
 (2,1,2,2014,'9','','','','','','','9','8','0','0','0','0','0','9','8','0','0','0','0','0','9','8','0','','','','4','','','',0,-1,'2014-02-08 23:08:39','2014-02-08 23:18:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dan_toc`
--

/*!40000 ALTER TABLE `dan_toc` DISABLE KEYS */;
INSERT INTO `dan_toc` (`dt_id`,`dt_name`,`dt_status`,`dt_order`,`dt_date_added`,`dt_date_modified`) VALUES 
 (2,'TÃ y',1,0,'2013-11-09 17:09:09','2013-11-09 17:27:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `danh_gia`
--

/*!40000 ALTER TABLE `danh_gia` DISABLE KEYS */;
INSERT INTO `danh_gia` (`dg_id`,`dg_em_id`,`dg_thang`,`dg_nam`,`dg_cong_viec`,`dg_ket_qua_cong_viec`,`dg_so_ngay_nghi`,`dg_ly_do_nghi`,`dg_y_thuc_xay_dung`,`dg_khuyet_diem`,`dg_tc_danh_gia`,`dg_ghi_chu`,`dg_phan_loai`,`dg_don_vi_status`,`dg_ptccb_status`,`dg_date_created`,`dg_date_modifyed`) VALUES 
 (1,1,2,2014,'<p>C&ocirc;ng viá»‡c 1,</p>\r\n<p>c&ocirc;ng viá»‡c 2</p>',9,0,'<p>á»m</p>','<p>tá»‘t</p>','<p>kh&ocirc;ng c&oacute;</p>','a:2:{i:4;s:1:\"0\";i:5;s:1:\"2\";}','<p>te te</p>','A','D','','2014-02-11 19:54:22','2014-02-16 13:42:46');
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
  `em_que_quan` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`em_id`,`em_ten`,`em_ten_dem`,`em_ho`,`em_ngay_sinh`,`em_so_chung_minh_thu`,`em_ten_khac`,`em_anh_the`,`em_gioi_tinh`,`em_home_phone`,`em_phone`,`em_noi_sinh`,`em_que_quan`,`em_dia_chi`,`em_dia_chi_tinh`,`em_dia_chi_huyen`,`em_dan_toc`,`em_so_cong_chuc`,`em_chuc_vu`,`em_phong_ban`,`em_ngay_tuyen_dung`,`em_ngach_cong_chuc`,`em_cong_viec`,`em_chuyen_mon`,`em_chuc_vu_dang`,`em_ngay_vao_dang`,`em_chuc_vu_doan`,`em_ngay_vao_doan`,`em_chuc_vu_cong_doan`,`em_van_hoa_pt`,`em_hoc_ham`,`em_bang_cap`,`em_ngoai_ngu`,`em_tin_hoc`,`em_chung_chi_khac`,`em_anh_bang_cap`,`em_status`,`em_delete`,`em_date_added`,`em_date_modified`) VALUES 
 (1,'HÃ¹ng','Máº¡nh','Nguyá»…n','1986-10-08 12:32:07','131398081','Nobita','',1,'','0985679742','Äoan HÃ¹ng','VÄ©nh PhÃº','ThÃ´n 12 -VÃ¢n Du',4,1,2,'HAV102',6,9,'2009-10-01 11:48:07',5,'Ha ah ha','he he he',9,'2010-04-30 12:32:07',12,'2012-03-20 12:32:07',14,'12/12',3,8,1,2,3,'a:3:{i:0;s:36:\"571272600_1_blue.__large_preview.jpg\";i:1;s:17:\"518928803_top.png\";i:2;s:25:\"1795367415_Untitled-1.jpg\";}',1,0,'2013-12-02 16:54:16','2014-02-09 12:32:08'),
 (2,'BÃ­ch','Ngá»c','Ã‚u','1986-11-02 00:00:07','13133123434','BÃ­ch','1385911581.png',0,'','09886838560','Báº£o Tháº¯ng','HoÃ ng LiÃªn SÆ¡n','XÃ³m 11',4,1,2,'HAV1023',6,11,'1981-06-16 00:00:07',5,'Káº¿ ToÃ¡n','Káº¿ toÃ¡n mÃ¡y',2,'2012-07-15 00:00:07',4,'2011-05-18 00:00:07',3,'12/12',3,8,1,2,3,'a:3:{i:0;s:28:\"1620194362_OneTV  - Logo.png\";i:1;s:17:\"987576096_top.png\";i:2;s:24:\"681729117_Untitled-1.jpg\";}',1,0,'2013-12-01 22:26:21','2013-12-01 22:26:21'),
 (13,'Äá»“ng','NghÄ©a','ÄÃ o','2013-09-01 17:37:07','3454543534543','Äá»“ng',NULL,1,'5345345','534534534','5345345','534534','5345345',5,2,2,'34534534',4,9,'2013-12-01 17:37:07',5,'5345345','5345345',2,'2013-12-31 17:37:07',2,'2013-12-28 17:37:07',3,'5443',3,8,1,2,3,'a:3:{i:0;s:22:\"1242417760_anh_the.jpg\";i:1;s:37:\"947727117_game garena on facebook.png\";i:2;s:24:\"34040717_legend team.jpg\";}',1,0,'2013-12-24 17:36:41','2013-12-24 17:37:44');
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
  `eme_status` int(10) unsigned NOT NULL DEFAULT '0',
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
-- Definition of table `he_so`
--

DROP TABLE IF EXISTS `he_so`;
CREATE TABLE `he_so` (
  `hs_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hs_luong_co_ban` float NOT NULL DEFAULT '0',
  `hs_luong_hop_dong` float NOT NULL DEFAULT '0',
  `hs_he_so_luong_thuc_tap` float NOT NULL DEFAULT '0',
  `hs_date_modified` datetime DEFAULT NULL,
  `hs_ngay_bat_dau` datetime NOT NULL,
  PRIMARY KEY (`hs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `he_so`
--

/*!40000 ALTER TABLE `he_so` DISABLE KEYS */;
INSERT INTO `he_so` (`hs_id`,`hs_luong_co_ban`,`hs_luong_hop_dong`,`hs_he_so_luong_thuc_tap`,`hs_date_modified`,`hs_ngay_bat_dau`) VALUES 
 (1,2000000,1500000,85,'2013-12-06 15:49:56','2002-01-01 00:00:00'),
 (2,2000000,1500000,85,'2013-12-06 15:54:19','2011-01-01 00:00:00'),
 (3,2000000,1500000,85,'2013-12-06 15:54:35','2012-01-01 00:00:00'),
 (4,2000000,1500000,85,'2013-12-06 15:56:14','2012-05-01 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holidays`
--

/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` (`hld_id`,`hld_name`,`hld_order`,`hld_status`,`hld_date_added`,`hld_date_modified`) VALUES 
 (4,'Giáº£i phÃ³ng miá»n nam',1,0,'2013-11-10 17:11:04','2013-11-10 17:12:58'),
 (5,'QUá»‘c táº¿ lao Ä‘á»™ng',2,1,'2013-11-10 17:11:13','2013-11-10 17:11:13'),
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
  `huyen_name` varchar(255) NOT NULL,
  `huyen_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `huyen_order` int(10) unsigned NOT NULL DEFAULT '0',
  `huyen_status` int(10) unsigned NOT NULL DEFAULT '1',
  `huyen_date_added` datetime DEFAULT NULL,
  `huyen_date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`huyen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `huyen`
--

/*!40000 ALTER TABLE `huyen` DISABLE KEYS */;
INSERT INTO `huyen` (`huyen_id`,`huyen_name`,`huyen_parent`,`huyen_order`,`huyen_status`,`huyen_date_added`,`huyen_date_modified`) VALUES 
 (1,'Cau Giay',4,1,1,'2013-11-30 15:01:01','2013-11-30 15:01:01'),
 (2,'Quan 1',5,1,1,'2013-11-30 15:01:38','2013-11-30 15:01:38'),
 (3,'Tu liem',4,2,1,'2013-11-30 15:33:01','2013-11-30 15:33:01'),
 (5,'Ba dinh',4,3,1,'2013-11-30 15:33:08','2013-11-30 15:33:08');
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
  PRIMARY KEY (`kt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `khen_thuong`
--

/*!40000 ALTER TABLE `khen_thuong` DISABLE KEYS */;
INSERT INTO `khen_thuong` (`kt_id`,`kt_can_bo_to_chuc`,`kt_em_id`,`kt_date`,`kt_ly_do`,`kt_chi_tiet`,`kt_status`,`kt_date_added`,`kt_date_modified`) VALUES 
 (1,1,1,'2014-02-15 00:00:07','Lamf toot cong viec','<p>dsfds<strong> dsg</strong></p>\n<p>Goo man<em>fdggfdfdgf</em></p>',1,'2013-12-15 21:49:01','2013-12-15 21:49:01');
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
  PRIMARY KEY (`kl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ky_luat`
--

/*!40000 ALTER TABLE `ky_luat` DISABLE KEYS */;
INSERT INTO `ky_luat` (`kl_id`,`kl_can_bo_to_chuc`,`kl_em_id`,`kl_date`,`kl_ly_do`,`kl_chi_tiet`,`kl_status`,`kl_date_added`,`kl_date_modified`) VALUES 
 (1,1,1,'2014-02-11 00:00:00','Chua lam tot cong viev','<p>sadsad ]d</p>\n<p><strong>sadf</strong></p>\n<p>sd</p>\n<p>sdasd</p>',1,'2013-12-15 21:58:46','2013-12-15 21:58:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lam_them_gio`
--

/*!40000 ALTER TABLE `lam_them_gio` DISABLE KEYS */;
INSERT INTO `lam_them_gio` (`ltg_id`,`ltg_em_id`,`ltg_ngay`,`ltg_chi_tiet`,`ltg_gio_bat_dau`,`ltg_phut_bat_dau`,`ltg_gio_ket_thuc`,`ltg_phut_ket_thuc`,`ltg_date_added`,`ltg_don_vi_status`,`ltg_tccb_status`) VALUES 
 (6,1,'2014-02-12 15:39:07','<p>h&acirc;hahaha</p>',1,10,18,19,'2013-12-27 11:53:32',1,-1);
/*!40000 ALTER TABLE `lam_them_gio` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phong_ban`
--

/*!40000 ALTER TABLE `phong_ban` DISABLE KEYS */;
INSERT INTO `phong_ban` (`pb_id`,`pb_name`,`pb_parent`,`pb_order`,`pb_status`,`pb_date_added`,`pb_date_modified`) VALUES 
 (9,'Phong ban 1',0,0,1,NULL,'2013-11-17 22:50:46'),
 (11,'phong ban 3',0,0,1,NULL,NULL),
 (12,'PhÃ²ng ban 3 -1',11,0,1,'2014-02-13 22:16:03','2014-02-13 22:16:03');
/*!40000 ALTER TABLE `phong_ban` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thong_bao`
--

/*!40000 ALTER TABLE `thong_bao` DISABLE KEYS */;
INSERT INTO `thong_bao` (`tb_id`,`tb_from`,`tb_to`,`tb_tieu_de`,`tb_noi_dung`,`tb_status`,`tb_date_added`,`tb_date_modified`) VALUES 
 (5,1,1,'Hung gui','<p>Nhandc chua</p>',0,'2014-02-14 22:40:44','2014-02-14 22:40:44'),
 (6,1,13,'Hung gui','<p>Nhandc chua</p>',0,'2014-02-14 22:40:44','2014-02-14 22:40:44'),
 (7,1,0,'Hung gui','<p>Nhandc chua</p>',0,'2014-02-14 22:40:44','2014-02-14 22:40:44'),
 (9,1,0,'','',0,'2014-02-14 22:44:16','2014-02-14 22:44:16'),
 (10,1,1,'sdf','<p>fd</p>',0,'2014-02-14 22:46:09','2014-02-14 22:46:09'),
 (11,1,0,'sdf','<p>fd</p>',0,'2014-02-14 22:46:09','2014-02-14 22:46:09'),
 (12,1,1,'Thang nay chua nhap day du','<p>Yeu cau dong chi nhap thong tin day du</p>',1,'2014-02-16 11:21:46','2014-02-16 11:21:46');
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
 (1,1,1,'hungnm','37a9b57da9afc663e11b5da3e01c3da5','1','2013-11-07 22:58:52','2013-11-07 22:58:52'),
 (3,2,1,'bichatn','37a9b57da9afc663e11b5da3e01c3da5','1','2013-11-30 14:51:44','2013-11-30 14:51:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

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
 (86,1,1392560278,'::1');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xin_nghi_phep`
--

/*!40000 ALTER TABLE `xin_nghi_phep` DISABLE KEYS */;
INSERT INTO `xin_nghi_phep` (`xnp_id`,`xnp_em_id`,`xnp_from_date`,`xnp_to_date`,`xnp_date_created`,`xnp_don_vi_status`,`xnp_ptccb_status`,`xnp_ly_do`,`xnp_chi_tiet`) VALUES 
 (3,1,'2014-02-02 21:42:07','2014-02-07 21:42:07','2013-12-27 21:42:29',0,-1,'Nghi om','<p>ah ang nay naoRet qua nen muon xin nghi</p>');
/*!40000 ALTER TABLE `xin_nghi_phep` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
