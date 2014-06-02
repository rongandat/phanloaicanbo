DELETE FROM `lam_them_gio`

ALTER TABLE `lam_them_gio` ADD COLUMN `ltg_gio_bat_dau_chieu` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `ltg_phut_ket_thuc`,
 ADD COLUMN `ltg_phut_bat_dau_chieu` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `ltg_gio_bat_dau_chieu`,
 ADD COLUMN `ltg_gio_ket_thuc_chieu` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `ltg_phut_bat_dau_chieu`,
 ADD COLUMN `ltg_phut_ket_thuc_chieu` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `ltg_gio_ket_thuc_chieu`;

ALTER TABLE `holidays` ADD COLUMN `hld_ngay_cong` INTEGER UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: ko tinh cong, 1: 1 ngay cong, 2: nua ngay cong' AFTER `hld_code`;

/*31-5*/
ALTER TABLE `employees_heso` ADD COLUMN `eh_pc_tham_nien` DOUBLE NOT NULL DEFAULT 0 AFTER `eh_tham_niem`;
ALTER TABLE `bang_luong` MODIFY COLUMN `bl_tham_nien` FLOAT NOT NULL DEFAULT 0 COMMENT 'phu cap tham nien (%)';

ALTER TABLE `bang_luong` MODIFY COLUMN `bl_phan_loai` VARCHAR(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci
, CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `bang_luong` MODIFY COLUMN `bl_phan_loai_he_so` FLOAT NOT NULL DEFAULT 0;

ALTER TABLE `bang_luong` ADD COLUMN `bl_tong_he_so` FLOAT NOT NULL DEFAULT 0 AFTER `bl_pc_doc_hai_type`,
 ADD COLUMN `bl_tong_he_so_ca_nhan` FLOAT NOT NULL DEFAULT 0 AFTER `bl_tong_he_so`,
 ADD COLUMN `bl_tong_he_so_plld` FLOAT NOT NULL DEFAULT 0 AFTER `bl_tong_he_so_ca_nhan`,
 ADD COLUMN `bl_tam_chi_dau_vao` DOUBLE NOT NULL DEFAULT 0 AFTER `bl_tong_he_so_plld`;

/*2-6*/
ALTER TABLE `employees` ADD COLUMN `em_tai_lieu_khac` TEXT AFTER `em_date_modified`;
ALTER TABLE `employees_edit` ADD COLUMN `eme_tai_lieu_khac` TEXT AFTER `eme_date_modified`;
