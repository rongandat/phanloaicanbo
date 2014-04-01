ALTER TABLE `employees` ADD COLUMN `em_ton_giao` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_noi_sinh_huyen` VARCHAR(255) AFTER `em_noi_sinh`,
 ADD COLUMN `em_noi_sinh_tinh` VARCHAR(255) AFTER `em_noi_sinh`,
 ADD COLUMN `em_que_quan_huyen` VARCHAR(255) AFTER `em_que_quan`,
 ADD COLUMN `em_que_quan_tinh` VARCHAR(255) AFTER `em_que_quan`,
 ADD COLUMN `em_noi_o` VARCHAR(255) AFTER `em_que_quan`,
 ADD COLUMN `em_noi_o_huyen` VARCHAR(255) AFTER `em_noi_o`,
 ADD COLUMN `em_noi_o_tinh` VARCHAR(255) AFTER `em_noi_o`,
 ADD COLUMN `em_co_quan_tuyen_dung` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_cong_viec_khi_tuyen_dung` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_ma_ngach` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_khen_thuong` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_ky_luat` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_ngay_nhap_ngu` DATETIME AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_ngay_xuat_ngu` DATETIME AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_quan_ham` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_danh_hieu` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_so_bhxh` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_tinh_trang_suc_khoe` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_chieu_cao` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_can_nang` VARCHAR(45) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_nhom_mau` VARCHAR(45) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_thuong_binh` VARCHAR(45) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_gia_dinh_chinh_sach` VARCHAR(255) AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_lich_su_dao_tao` TEXT AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_qua_trinh_cong_tac` TEXT AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_gia_dinh_ban_than` TEXT AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_gia_dinh_vo` TEXT AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_qua_trinh_luong` TEXT AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_bi_bat` TEXT AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_tham_gia_to_chuc` TEXT AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_than_nhan_nuoc_ngoai` TEXT AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_ly_luan_chinh_tri` INTEGER UNSIGNED AFTER `em_chuc_vu_cong_doan`,
 ADD COLUMN `em_quan_ly_nha_nuoc` INTEGER UNSIGNED AFTER `em_chuc_vu_cong_doan`;

ALTER TABLE `employees` ADD COLUMN `em_cmt_ngay_cap` DATETIME AFTER `em_so_chung_minh_thu`;


ALTER TABLE `employees_edit` ADD COLUMN `eme_ton_giao` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_noi_sinh_huyen` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_noi_sinh_tinh` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_que_quan_huyen` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_que_quan_tinh` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_noi_o` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_noi_o_huyen` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_noi_o_tinh` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_ngay_nhap_ngu` DATETIME AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_ngay_xuat_ngu` DATETIME AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_quan_ham` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_danh_hieu` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_so_bhxh` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_tinh_trang_suc_khoe` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_chieu_cao` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_can_nang` VARCHAR(45) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_nhom_mau` VARCHAR(45) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_thuong_binh` VARCHAR(45) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_gia_dinh_chinh_sach` VARCHAR(255) AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_lich_su_dao_tao` TEXT AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_qua_trinh_cong_tac` TEXT AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_gia_dinh_ban_than` TEXT AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_gia_dinh_vo` TEXT AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_qua_trinh_luong` TEXT AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_bi_bat` TEXT AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_tham_gia_to_chuc` TEXT AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_than_nhan_nuoc_ngoai` TEXT AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_ly_luan_chinh_tri` INTEGER UNSIGNED AFTER `eme_anh_bang_cap`,
 ADD COLUMN `eme_quan_ly_nha_nuoc` INTEGER UNSIGNED AFTER `eme_anh_bang_cap`;

ALTER TABLE `employees_edit` DROP COLUMN `eme_status`;

ALTER TABLE `employees_edit` ADD COLUMN `eme_cmt_ngay_cap` DATETIME AFTER `eme_so_chung_minh_thu`;

CREATE TABLE `bac_luong` (
  `bl_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `bl_name` VARCHAR(255) NOT NULL,
  `bl_he_so_luong` FLOAT NOT NULL,
  `bl_pc_chuc_vu` FLOAT NOT NULL,
  `bl_pc_trach_nhiem` FLOAT NOT NULL,
  `bl_pc_khu_vuc` FLOAT NOT NULL,
  `bl_pc_tnvk` FLOAT NOT NULL,
  `bl_pc_udn` FLOAT NOT NULL,
  `bl_pc_cong_vu` FLOAT NOT NULL,
  `bl_pc_kiem_nhiem` FLOAT NOT NULL,
  `bl_pc_khac` FLOAT NOT NULL,
  `bl_pc_khac_type` INTEGER UNSIGNED NOT NULL DEFAULT 0 COMMENT '\'0: he_so, 1: %\'',
  `bl_pc_thu_hut` FLOAT NOT NULL,
  PRIMARY KEY (`bl_id`)
)
ENGINE = InnoDB;

ALTER TABLE `bac_luong` ADD COLUMN `bl_status` INTEGER UNSIGNED NOT NULL DEFAULT 1 AFTER `bl_pc_thu_hut`;
ALTER TABLE `bac_luong` ADD COLUMN `bl_date_modified` DATETIME AFTER `bl_status`,
 ADD COLUMN `bl_date_added` DATETIME AFTER `bl_date_modified`;

ALTER TABLE `bac_luong` ADD COLUMN `bl_order` INTEGER UNSIGNED NOT NULL DEFAULT 0 AFTER `bl_date_added`;


ALTER TABLE `employees_heso` MODIFY COLUMN `eh_tham_niem` DATETIME NOT NULL,
 ADD COLUMN `eh_pc_khac_type` VARCHAR(45) NOT NULL DEFAULT 0 COMMENT '0: he so, 1: %' AFTER `eh_pc_kv`,
 ADD COLUMN `eh_pc_thu_hut` DOUBLE NOT NULL DEFAULT 0 AFTER `eh_pc_khac_type`;
