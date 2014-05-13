DELETE FROM `employees` WHERE `em_delete`=1

ALTER TABLE `ngach_cong_chuc` ADD COLUMN `ncc_ma_ngach` VARCHAR(45) NOT NULL AFTER `ncc_date_modified`;
ALTER TABLE `ngach_cong_chuc` ADD COLUMN `ncc_nam_nang_bac` INTEGER UNSIGNED NOT NULL DEFAULT 2 AFTER `ncc_ma_ngach`;

UPDATE `bac_luong` SET `bl_he_so_luong`=''

ALTER TABLE `bac_luong` MODIFY COLUMN `bl_he_so_luong` TEXT NOT NULL,
 DROP COLUMN `bl_pc_chuc_vu`,
 DROP COLUMN `bl_pc_trach_nhiem`,
 DROP COLUMN `bl_pc_khu_vuc`,
 DROP COLUMN `bl_pc_tnvk`,
 DROP COLUMN `bl_pc_udn`,
 DROP COLUMN `bl_pc_cong_vu`,
 DROP COLUMN `bl_pc_kiem_nhiem`,
 DROP COLUMN `bl_pc_khac`,
 DROP COLUMN `bl_pc_khac_type`,
 DROP COLUMN `bl_pc_thu_hut`;

ALTER TABLE `employees` DROP COLUMN `em_ma_ngach`;

ALTER TABLE `employees_heso` MODIFY COLUMN `eh_pc_khac_type` INTEGER UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: he so, 1: %',
 ADD COLUMN `eh_pc_doc_hai` DOUBLE NOT NULL DEFAULT 0 AFTER `eh_bac_luong`,
 ADD COLUMN `eh_pc_doc_hai_type` INTEGER UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: he so, 1: tien co dinh' AFTER `eh_pc_doc_hai`;

ALTER TABLE `employees_heso` ADD COLUMN `eh_han_ap_dung` DATETIME DEFAULT '0000-00-00 00:00:00' AFTER `eh_pc_doc_hai_type`;

ALTER TABLE `holidays` ADD COLUMN `hld_code` VARCHAR(45) AFTER `hld_date_modified`;
ALTER TABLE `employees` ADD COLUMN `em_time_cong_tac` DATETIME AFTER `em_ngay_nghi_huu`;
ALTER TABLE `holidays` ADD COLUMN `hld_code` VARCHAR(45) AFTER `hld_date_modified`;
