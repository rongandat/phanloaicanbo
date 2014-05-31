DELETE FROM `lam_them_gio`

ALTER TABLE `lam_them_gio` ADD COLUMN `ltg_gio_bat_dau_chieu` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `ltg_phut_ket_thuc`,
 ADD COLUMN `ltg_phut_bat_dau_chieu` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `ltg_gio_bat_dau_chieu`,
 ADD COLUMN `ltg_gio_ket_thuc_chieu` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `ltg_phut_bat_dau_chieu`,
 ADD COLUMN `ltg_phut_ket_thuc_chieu` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `ltg_gio_ket_thuc_chieu`;

ALTER TABLE `holidays` ADD COLUMN `hld_ngay_cong` INTEGER UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: ko tinh cong, 1: 1 ngay cong, 2: nua ngay cong' AFTER `hld_code`;

/*31-5*/
ALTER TABLE `employees_heso` ADD COLUMN `eh_pc_tham_nien` DOUBLE NOT NULL DEFAULT 0 AFTER `eh_tham_niem`;
ALTER TABLE `bang_luong` MODIFY COLUMN `bl_tham_nien` FLOAT NOT NULL DEFAULT 0 COMMENT 'phu cap tham nien (%)';
