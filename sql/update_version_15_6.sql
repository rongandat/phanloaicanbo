CREATE TABLE  `employees_phucap` (
  `epc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `epc_em_id` int(10) unsigned NOT NULL,
  `eh_pc_cong_viec` double NOT NULL DEFAULT '0',
  `eh_pc_trach_nhiem` double NOT NULL DEFAULT '0',
  `eh_pc_tnvk_phan_tram` double NOT NULL DEFAULT '0',
  `eh_tham_niem` datetime NOT NULL,
  `eh_pc_udn_phan_tram` double NOT NULL DEFAULT '0',
  `eh_pc_cong_vu_phan_tram` double NOT NULL DEFAULT '0',
  `eh_pc_kiem_nhiem` double NOT NULL DEFAULT '0',
  `eh_pc_khac` double NOT NULL DEFAULT '0',
  `eh_date_added` datetime DEFAULT NULL,
  `eh_date_modified` datetime DEFAULT NULL,
  `eh_pc_kv` double NOT NULL DEFAULT '0',
  `eh_pc_khac_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: he so, 1: %',
  `eh_pc_thu_hut` double NOT NULL DEFAULT '0',
  `eh_pc_doc_hai` double NOT NULL DEFAULT '0',
  `eh_pc_doc_hai_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: he so, 1: tien co dinh',
  `eh_han_ap_dung` datetime DEFAULT '0000-00-00 00:00:00',
  `eh_pc_tham_nien` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`epc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;



/* sau khi chay convertheso thi chay doan nay*/

ALTER TABLE `phanloaicanbo`.`employees_heso` DROP COLUMN `eh_pc_cong_viec`,
 DROP COLUMN `eh_pc_trach_nhiem`,
 DROP COLUMN `eh_pc_tnvk_phan_tram`,
 DROP COLUMN `eh_tham_niem`,
 DROP COLUMN `eh_pc_udn_phan_tram`,
 DROP COLUMN `eh_pc_cong_vu_phan_tram`,
 DROP COLUMN `eh_pc_kiem_nhiem`,
 DROP COLUMN `eh_pc_khac`,
 DROP COLUMN `eh_pc_kv`,
 DROP COLUMN `eh_pc_khac_type`,
 DROP COLUMN `eh_pc_thu_hut`,
 DROP COLUMN `eh_pc_doc_hai`,
 DROP COLUMN `eh_pc_doc_hai_type`,
 DROP COLUMN `eh_pc_tham_nien`;
