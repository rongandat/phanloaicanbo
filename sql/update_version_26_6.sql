CREATE TABLE `employees_luan_chuyen_history` (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `em_id` INTEGER UNSIGNED NOT NULL,
  `from_date` DATETIME,
  `to_date` DATETIME,
  `chuc_vu` INTEGER UNSIGNED,
  `don_vi` INTEGER UNSIGNED,
  `ngach_cong_chuc` INTEGER UNSIGNED,
  `cong_viec` VARCHAR(255),
  `chuyen_mon` VARCHAR(255),
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;
