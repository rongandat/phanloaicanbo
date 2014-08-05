DROP PROCEDURE IF EXISTS getListNhanVien;
DELIMITER $$
	CREATE PROCEDURE getListNhanVien(param_phong_ban varchar(255))
		BEGIN
		BLOCK1: BEGIN
			DECLARE no_more_rows1 INT DEFAULT FALSE;			
  			DECLARE pb_id_info int;
  			DECLARE phongbanList CURSOR FOR select DISTINCT pb_id from phong_ban order by pb_order;
  			DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows1 = TRUE; 
			DROP TABLE IF EXISTS `tempEmployees`;				
			CREATE TEMPORARY TABLE  `tempEmployees` (
			  `em_id` int(10),
			  `em_ten` varchar(45) NOT NULL,
			  `em_ho` varchar(45) NOT NULL,
			  `em_ngay_sinh` datetime DEFAULT NULL,
			  `em_ten_khac` varchar(100) DEFAULT NULL,
			  `em_dia_chi_tinh` int(10) unsigned NOT NULL DEFAULT '0',
			  `em_dia_chi_huyen` int(10) unsigned NOT NULL DEFAULT '0',
			  `em_dan_toc` int(10) unsigned NOT NULL DEFAULT '0',
			  `em_chuc_vu` int(10) unsigned NOT NULL DEFAULT '0',
			  `em_phong_ban` int(10) unsigned NOT NULL DEFAULT '0',
			  `em_ngach_cong_chuc` int(10) unsigned NOT NULL DEFAULT '0',
			  `em_quan_ly_nha_nuoc` int(10) unsigned DEFAULT NULL,
			  `em_ly_luan_chinh_tri` int(10) unsigned DEFAULT NULL,		  
			  `em_hoc_ham` int(10) unsigned NOT NULL DEFAULT '0',
			  `em_bang_cap` int(10) unsigned NOT NULL DEFAULT '0',
			  `em_status` int(10) unsigned NOT NULL DEFAULT '0',
			  `cv_name` varchar(255)	) DEFAULT CHARSET=utf8; 
			  	
			OPEN  phongbanList;
			LOOP1: LOOP
			
			FETCH phongbanList INTO pb_id_info;
				IF no_more_rows1 THEN
   				LEAVE LOOP1;
  				END IF;
  				insert into temp values(pb_id_info);
  				BLOCK2: BEGIN
  					DECLARE no_more_rows2 INT DEFAULT FALSE;
  					DECLARE em_id_info int;
  					DECLARE em_ten_info varchar(45);
			  		DECLARE em_ho_info varchar(45);
			  		DECLARE em_ngay_sinh_info datetime;
			  		DECLARE em_ten_khac_info varchar(100);
			  		DECLARE em_dia_chi_tinh_info int(10);
			  		DECLARE em_dia_chi_huyen_info int(10);
			  		DECLARE em_dan_toc_info int(10);
			  		DECLARE em_chuc_vu_info int(10);
			  		DECLARE em_phong_ban_info int(10);
			  		DECLARE em_ngach_cong_chuc_info int(10);
			  		DECLARE em_quan_ly_nha_nuoc_info int(10);
			   	DECLARE em_ly_luan_chinh_tri_info int(10);		  
			  		DECLARE em_hoc_ham_info int(10);
			  		DECLARE em_bang_cap_info int;			  		
			  		DECLARE em_status_info int(10);
			  		DECLARE cv_name_info varchar(255);
  					DECLARE nhanvienList CURSOR FOR select e.em_status, e.em_bang_cap, e.em_hoc_ham, e.em_id, e.em_ten, e.em_ho, e.em_ngay_sinh, e.em_ten_khac, e.em_dia_chi_tinh, e.em_dia_chi_huyen, e.em_dan_toc, e.em_chuc_vu, e.em_phong_ban, e.em_ngach_cong_chuc, e.em_quan_ly_nha_nuoc, e.em_ly_luan_chinh_tri, cv.cv_name from employees e left join chuc_vu cv on e.em_chuc_vu=cv.cv_id where e.em_status=1 and e.em_nghi_huu=0 and e.em_phong_ban=pb_id_info order by cv.cv_order;
  					DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows2 = TRUE;  					
  					
  					
  					OPEN  nhanvienList;
					LOOP2: LOOP
					
					FETCH nhanvienList INTO em_status_info, em_bang_cap_info, em_hoc_ham_info, em_id_info, em_ten_info, em_ho_info, em_ngay_sinh_info, em_ten_khac_info, em_dia_chi_tinh_info, em_dia_chi_huyen_info, em_dan_toc_info, em_chuc_vu_info, em_phong_ban_info, em_ngach_cong_chuc_info, em_quan_ly_nha_nuoc_info, em_ly_luan_chinh_tri_info, cv_name_info;
						IF no_more_rows2 THEN
   						LEAVE LOOP2;
  						END IF;
  						
  						INSERT INTO tempEmployees values(em_id_info, em_ten_info, em_ho_info, em_ngay_sinh_info, em_ten_khac_info, em_dia_chi_tinh_info, em_dia_chi_huyen_info, em_dan_toc_info, em_chuc_vu_info, em_phong_ban_info, em_ngach_cong_chuc_info, em_quan_ly_nha_nuoc_info, em_ly_luan_chinh_tri_info, em_hoc_ham_info, em_bang_cap_info, em_status_info, cv_name_info);
					END LOOP LOOP2;
					CLOSE nhanvienList;  
					
  				END BLOCK2;				
  				
			END LOOP LOOP1;
			CLOSE phongbanList;  
			
			SELECT * FROM tempEmployees p where if(param_phong_ban = '', p.em_phong_ban>0, p.em_phong_ban in (em_phong_ban));
			DROP TABLE tempEmployees;     
		END BLOCK1;
		END $$
DELIMITER ;