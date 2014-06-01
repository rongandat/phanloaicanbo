<?php

class Canhan_InluongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '2009');
        if (!$check_permission) {
            $this->_redirect('index/permission/');
            exit();
        }
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        if ($this->_arrParam['page'] == '' || $this->_arrParam['page'] <= 0) {
            $this->_arrParam['page'] = 1;
        }
        $this->_page = $this->_arrParam['page'];
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'In lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow("em_id=$em_id");

        $khenthuongModel = new Front_Model_KhenThuong();
        $khen_thuong = $khenthuongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $kyluatModel = new Front_Model_KyLuat();
        $ky_luat = $kyluatModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $bangluongModel = new Front_Model_BangLuong();
        $bang_luong = $bangluongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $this->view->khen_thuong = $khen_thuong;
        $this->view->ky_luat = $ky_luat;
        $this->view->em_info = $em_info;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->nv_id = $em_id;
        $this->view->bang_luong = $bang_luong;
    }

    public function heso03Action() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'In lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = new Zend_Date();
        $date->subMonth(1);
        
        $thang = $this->_getParam('thang', $date->toString("M"));
        $nam = $this->_getParam('nam', $date->toString("Y"));

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow("em_id=$em_id");

        $bangluongModel = new Front_Model_BangLuong();
        $bang_luong = $bangluongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $this->view->em_info = $em_info;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->nv_id = $em_id;
        $this->view->bang_luong = $bang_luong;
    }

    public function intheophongAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'In lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $chucvuModel = new Front_Model_Chucvu();
        $pb_selected = $this->_getParam('phongban', 0);
        $phong_ban_id = $list_phongban_selected = $phong_ban = Array();

        $phong_ban_id[] = $pb_selected;
        $list_phongban_selected = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban);
        $list_chuc_vu = $chucvuModel->fetchAll();

        $phong_ban_options = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban_options);

        if (sizeof($list_phongban_selected)) {
            foreach ($list_phongban_selected as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_id;
            }
        }
        $phong_ban_id = implode(',', $phong_ban_id);
        $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");
        $this->view->list_nhan_vien = $list_nhan_vien;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->pb_id = $pb_selected;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->list_chuc_vu = $list_chuc_vu;
    }

    public function exeltheophongAction() {
        $inputFileName = APPLICATION_PATH . "/../tmp/Mau_Exel.xlsx";

        $objPHPExcel = PHPExcel_IOFactory::load($inputFileName);

        $objPHPExcel->getProperties()->setCreator("Cục Hải Quan Hà Tĩnh");
        $objPHPExcel->getProperties()->setLastModifiedBy("Cục Hải Quan Hà Tĩnh");
        $objPHPExcel->getProperties()->setTitle("Bảng lương");
        $objPHPExcel->getProperties()->setSubject("Bảng lương");
        $objPHPExcel->getProperties()->setDescription("Bảng lương Cục Hải Quan Hà Tĩnh");

        $objPHPExcel->setActiveSheetIndex(0);

        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'In lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $pb_selected = $this->_getParam('phongban', 0);
        $phong_ban_id = $list_phongban_selected = $phong_ban = Array();
        $phong_ban_selected_info = $phongbanModel->fetchRow("pb_id=$pb_selected");
        $phong_ban_id[] = $pb_selected;
        $list_phongban_selected = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban);

        if (sizeof($list_phongban_selected)) {
            foreach ($list_phongban_selected as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_id;
            }
        }
        $phong_ban_id = implode(',', $phong_ban_id);
        $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");

        if ($list_nhan_vien) {
            $khenthuongModel = new Front_Model_KhenThuong();
            $kyluatModel = new Front_Model_KyLuat();
            $bangluongModel = new Front_Model_BangLuong();
            $k = 0;

            foreach ($list_nhan_vien as $nhan_vien) {
                $khen_thuong = $khenthuongModel->fetchByDate($nhan_vien->em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
                $ky_luat = $kyluatModel->fetchByDate($nhan_vien->em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
                $bang_luong = $bangluongModel->fetchByDate($nhan_vien->em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

                if ($bang_luong) {
                    $k++;
                    $luong_toi_thieu = $bang_luong->bl_luong_toi_thieu;
                    $giai_doan = $bang_luong->bl_giai_doan;
                    $loai_luong = $bang_luong->bl_loai_luong;
                    $luong_thu_viec = $bang_luong->bl_luong_thu_viec;
                    $he_so_luong = $bang_luong->bl_hs_luong;
                    $bhxh = $bang_luong->bl_bhxh;
                    $bhyt = $bang_luong->bl_bhyt;
                    $hs_pc_chuc_vu = $bang_luong->bl_hs_pc_cong_viec;
                    $hs_pc_trach_nhiem = $bang_luong->bl_hs_pc_trach_nhiem;
                    $hs_pc_khu_vuc = $bang_luong->bl_hs_pc_khu_vuc;
                    $hs_pc_tnvk_phan_tram = $bang_luong->bl_hs_pc_tnvk;
                    $tham_nien = $bang_luong->bl_tham_nien;
                    $uu_dai_nghe = $bang_luong->bl_hs_pc_udn;
                    $cong_vu = $bang_luong->bl_hs_pc_cong_vu;
                    $kiem_nhiem = $bang_luong->bl_pc_kiem_nhiem;
                    $hs_pc_khac = $bang_luong->bl_hs_pc_khac;
                    $he_so_tang_them = $bang_luong->bl_pc_tang_them;

                    $hs_pc_khac_type = $bang_luong->bl_pc_khac_type;
                    $hs_pc_thu_hut_phan_tram = $bang_luong->bl_pc_thu_hut;
                    $phan_loai = strtoupper($bang_luong->bl_phan_loai);
                    $phan_loai_he_so = $bang_luong->bl_phan_loai_he_so;

                    $luong_toi_thieu_sau_bh = (int) ($luong_toi_thieu * (100 - ($bhxh + $bhyt)) / 100);
                    $luong_toi_thieu_bhyt = (int) ($luong_toi_thieu * (100 - $bhyt) / 100);

                    $pc_trach_nhiem = $pc_cong_vu = $pc_khac = $pc_kiem_nhiem = $pc_uu_dai_nghe = $luong_toi_thieu;
                    $pc_chuc_vu = $pc_tnvk = $pc_thu_hut = $pc_tham_nien = $luong_toi_thieu_sau_bh;
                    $pc_khu_vuc = $luong_toi_thieu_bhyt;

                    $thanh_tien_hsl = $luong_toi_thieu_sau_bh * $he_so_luong * $phan_loai_he_so;


                    //if ($this->he_so->eh_giai_doan)
                    //$hs_pc_chuc_vu = number_format ($this->he_so->eh_pc_cong_viec*(100-$luong_thu_viec)/100, 2);
                    $thanh_tien_pc_chuc_vu = $hs_pc_chuc_vu * $pc_chuc_vu * $phan_loai_he_so;


                    //if ($this->he_so->eh_giai_doan)
                    //$hs_pc_trach_nhiem = number_format ($this->he_so->eh_pc_trach_nhiem*(100-$luong_thu_viec)/100, 2);
                    $thanh_tien_pc_trach_nhiem = $hs_pc_trach_nhiem * $pc_trach_nhiem * $phan_loai_he_so;


                    //if ($this->he_so->eh_giai_doan)
                    //$hs_pc_khu_vuc = number_format ($this->he_so->eh_pc_kv*(100-$luong_thu_viec)/100, 2);
                    $thanh_tien_pc_khu_vuc = $hs_pc_khu_vuc * $pc_khu_vuc * $phan_loai_he_so;


                    $hs_pc_tnvk = ($he_so_luong + $hs_pc_chuc_vu) * $hs_pc_tnvk_phan_tram / 100;
                    //if ($this->he_so->eh_giai_doan)
                    //$hs_pc_tnvk = number_format ($hs_pc_tnvk*(100-$luong_thu_viec)/100, 2);
                    $thanh_tien_pc_tham_nien_vuot_khung = $hs_pc_tnvk * $pc_tnvk * $phan_loai_he_so;


                    $hs_pc_tham_nien = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_trach_nhiem) * $tham_nien / 100) * 100) / 100;
                    $thanh_tien_pc_tham_nien = $hs_pc_tham_nien * $pc_tham_nien * $phan_loai_he_so;

                    $hs_pc_thu_hut = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $hs_pc_thu_hut_phan_tram / 100) * 100) / 100;
                    $thanh_tien_pc_thu_hut = $hs_pc_thu_hut * $pc_thu_hut * $phan_loai_he_so;

                    $hs_pc_uu_dai_nghe = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $uu_dai_nghe / 100) * 100) / 100;
                    $thanh_tien_pc_uu_dai_nghe = $hs_pc_uu_dai_nghe * $pc_uu_dai_nghe * $phan_loai_he_so;


                    $hs_pc_cong_vu = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $cong_vu / 100) * 100) / 100;
                    $thanh_tien_pc_cong_vu = $hs_pc_cong_vu * $pc_cong_vu * $phan_loai_he_so;


                    $hs_pc_kiem_nhiem = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $kiem_nhiem / 100) * 100) / 100;
                    $thanh_tien_pc_kiem_nhiem = $hs_pc_kiem_nhiem * $pc_kiem_nhiem * $phan_loai_he_so;

                    $thanh_tien_pc_khac = $hs_pc_khac * $pc_khac;
                    $hs_pc_khac_he_so = $hs_pc_khac;
                    if ($hs_pc_khac_type) {
                        $thanh_tien_pc_khac = $thanh_tien_pc_khac / 100;
                        $hs_pc_khac_he_so = $hs_pc_khac / 100;
                    }
                    $thanh_tien_pc_khac = $thanh_tien_pc_khac * $phan_loai_he_so;


                    $tong_khen_thuong = 0;
                    if (sizeof($khen_thuong)) {
                        foreach ($khen_thuong as $kt) {
                            $tong_khen_thuong +=$kt->kt_money;
                        }
                    }

                    $tong_khien_trach = 0;
                    if (sizeof($ky_luat)) {
                        foreach ($ky_luat as $kl) {
                            $tong_khien_trach +=$kl->kl_money;
                        }
                    }

                    $tong_1 = (int) ($thanh_tien_pc_thu_hut + $thanh_tien_hsl + $thanh_tien_pc_chuc_vu + $thanh_tien_pc_trach_nhiem + $thanh_tien_pc_khu_vuc + $thanh_tien_pc_tham_nien_vuot_khung + $thanh_tien_pc_tham_nien + $thanh_tien_pc_uu_dai_nghe + $thanh_tien_pc_cong_vu + $thanh_tien_pc_kiem_nhiem + $tong_khen_thuong - $tong_khien_trach);


                    $hs_tang_them = $hs_pc_thu_hut + $he_so_luong + $hs_pc_chuc_vu + $hs_pc_trach_nhiem + $hs_pc_khu_vuc + $hs_pc_tnvk + $hs_pc_tham_nien + $hs_pc_uu_dai_nghe + $hs_pc_cong_vu + $hs_pc_kiem_nhiem + $hs_pc_khac_he_so;
                    $ti_le_tang_them = ($hs_tang_them - $hs_pc_kiem_nhiem) * $luong_toi_thieu * $he_so_tang_them * $phan_loai_he_so;
                    $tong_2 = (int) $tong_1 + $ti_le_tang_them;


                    $he_so_luong_chinh_thuc = $he_so_luong_thuc_tap = $he_so_luong_hop_dong = '';
                    $thanh_tien_he_so_luong = $thanh_tien_thuc_tap = $thanh_tien_hop_dong = '';
                    if (!$loai_luong && !$giai_doan) {
                        $he_so_luong_chinh_thuc = $he_so_luong;
                        $thanh_tien_he_so_luong = $thanh_tien_hsl;
                    } else if ($giai_doan) {
                        $he_so_luong_thuc_tap = $he_so_luong;
                        $thanh_tien_thuc_tap = $thanh_tien_hsl;
                    } else {
                        $he_so_luong_hop_dong = $he_so_luong;
                        $thanh_tien_hop_dong = $thanh_tien_hsl;
                    }


                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . ($k + 7), $k);
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . ($k + 7), $nhan_vien->em_ho . ' ' . $nhan_vien->em_ten);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . ($k + 7), $he_so_luong_chinh_thuc);
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . ($k + 7), $he_so_luong_thuc_tap);
                    $objPHPExcel->getActiveSheet()->SetCellValue('E' . ($k + 7), $he_so_luong_hop_dong);
                    $objPHPExcel->getActiveSheet()->SetCellValue('F' . ($k + 7), $hs_pc_chuc_vu);
                    $objPHPExcel->getActiveSheet()->SetCellValue('G' . ($k + 7), $hs_pc_trach_nhiem);
                    $objPHPExcel->getActiveSheet()->SetCellValue('H' . ($k + 7), $hs_pc_khu_vuc);
                    $objPHPExcel->getActiveSheet()->SetCellValue('I' . ($k + 7), $hs_pc_tnvk_phan_tram);
                    $objPHPExcel->getActiveSheet()->SetCellValue('J' . ($k + 7), $hs_pc_tnvk);
                    $objPHPExcel->getActiveSheet()->SetCellValue('K' . ($k + 7), $tham_nien);
                    $objPHPExcel->getActiveSheet()->SetCellValue('L' . ($k + 7), $hs_pc_tham_nien);
                    $objPHPExcel->getActiveSheet()->SetCellValue('M' . ($k + 7), $uu_dai_nghe);
                    $objPHPExcel->getActiveSheet()->SetCellValue('N' . ($k + 7), $hs_pc_uu_dai_nghe);
                    $objPHPExcel->getActiveSheet()->SetCellValue('O' . ($k + 7), $cong_vu);
                    $objPHPExcel->getActiveSheet()->SetCellValue('P' . ($k + 7), $hs_pc_cong_vu);
                    $objPHPExcel->getActiveSheet()->SetCellValue('Q' . ($k + 7), $hs_pc_thu_hut_phan_tram);
                    $objPHPExcel->getActiveSheet()->SetCellValue('R' . ($k + 7), $hs_pc_thu_hut);
                    $objPHPExcel->getActiveSheet()->SetCellValue('S' . ($k + 7), $kiem_nhiem);
                    $objPHPExcel->getActiveSheet()->SetCellValue('T' . ($k + 7), $hs_pc_khac . ($hs_pc_khac_type ? '%' : ''));
                    $objPHPExcel->getActiveSheet()->SetCellValue('U' . ($k + 7), $hs_tang_them);
                    $objPHPExcel->getActiveSheet()->SetCellValue('V' . ($k + 7), $phan_loai);
                    $objPHPExcel->getActiveSheet()->SetCellValue('W' . ($k + 7), $phan_loai_he_so);
                    $objPHPExcel->getActiveSheet()->SetCellValue('X' . ($k + 7), number_format($thanh_tien_he_so_luong, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('Y' . ($k + 7), number_format($thanh_tien_thuc_tap, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('Z' . ($k + 7), number_format($thanh_tien_hop_dong, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AA' . ($k + 7), number_format($thanh_tien_pc_chuc_vu, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AB' . ($k + 7), number_format($thanh_tien_pc_trach_nhiem, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AC' . ($k + 7), number_format($thanh_tien_pc_khu_vuc, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AD' . ($k + 7), number_format($thanh_tien_pc_thu_hut, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AE' . ($k + 7), number_format($thanh_tien_pc_tham_nien_vuot_khung, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AF' . ($k + 7), number_format($thanh_tien_pc_tham_nien, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AG' . ($k + 7), number_format($thanh_tien_pc_uu_dai_nghe, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AH' . ($k + 7), number_format($thanh_tien_pc_kiem_nhiem, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AI' . ($k + 7), number_format($thanh_tien_pc_khac, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AJ' . ($k + 7), number_format($tong_khen_thuong, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AK' . ($k + 7), number_format($tong_khien_trach, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AL' . ($k + 7), number_format($tong_1, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AM' . ($k + 7), number_format($ti_le_tang_them, 0, '.', ','));
                    $objPHPExcel->getActiveSheet()->SetCellValue('AN' . ($k + 7), number_format($tong_2, 0, '.', ','));
                }
            }


            if ($k) {
                $objPHPExcel->getActiveSheet()->setTitle('Bảng lương');
                if ($pb_selected && $phong_ban_selected_info) {
                    $file_name = 'Bang_luong_' . str_replace(' ', '_', $this->loc_tieng_viet($phong_ban_selected_info->pb_name)) . '_' . $thang . '-' . $nam . '.xls';
                } else {
                    $file_name = 'Bang_luong_' . $thang . '-' . $nam . '.xls';
                }
                header('Content-Type: application/vnd.ms-excel');
                header('Content-Disposition: attachment;filename="' . $file_name . '"');
                header('Cache-Control: max-age=0');
                $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
                $objWriter->save('php://output');
                die();

                /*
                  $file_name = 'Bang_luong_.xls';
                  $objPHPExcel->getActiveSheet()->setTitle('Bảng lương');

                  header('Content-Type: application/vnd.ms-excel');
                  header('Content-Disposition: attachment;filename="hungnm.xls"');
                  header('Cache-Control: max-age=0');
                  $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
                  $objWriter->save('php://output'); */
            } else {
                $this->_helper->viewRenderer->setRender('loi');
            }
        } else {
            $this->_helper->viewRenderer->setRender('loi');
        }
    }

    public function downtheophongAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'In lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $pb_selected = $this->_getParam('phongban', 0);
        $phong_ban_id = $list_phongban_selected = $phong_ban = Array();
        $phong_ban_selected_info = $phongbanModel->fetchRow("pb_id=$pb_selected");
        $phong_ban_id[] = $pb_selected;
        $list_phongban_selected = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban);

        if (sizeof($list_phongban_selected)) {
            foreach ($list_phongban_selected as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_id;
            }
        }
        $phong_ban_id = implode(',', $phong_ban_id);
        $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");

        if ($list_nhan_vien) {
            $khenthuongModel = new Front_Model_KhenThuong();
            $kyluatModel = new Front_Model_KyLuat();
            $bangluongModel = new Front_Model_BangLuong();
            $k = 0;
            $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

            $pdf->SetCreator(PDF_CREATOR);
            $pdf->SetAuthor(PDF_AUTHOR);
            $pdf->SetTitle(PDF_HEADER_TITLE);
            $pdf->SetSubject(PDF_HEADER_TITLE);
            $pdf->SetKeywords('bang luong');

            $pdf->setPrintHeader(false);
            $pdf->setFooterData(array(0, 64, 0), array(0, 64, 128));

            $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

            $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

            $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
            $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
            $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

            $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
            $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
            $pdf->setFontSubsetting(true);

            $pdf->SetFont('dejavusans', '', 14, '', true);

            $pdf->AddPage();

            $pdf->setTextShadow(array('enabled' => true, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array(196, 196, 196), 'opacity' => 1, 'blend_mode' => 'Normal'));

            foreach ($list_nhan_vien as $nhan_vien) {
                $khen_thuong = $khenthuongModel->fetchByDate($nhan_vien->em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
                $ky_luat = $kyluatModel->fetchByDate($nhan_vien->em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
                $bang_luong = $bangluongModel->fetchByDate($nhan_vien->em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

                if ($bang_luong) {
                    $k++;
                    if ($k > 1) {
                        $pdf->AddPage();
                        $pdf->setTextShadow(array('enabled' => true, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array(196, 196, 196), 'opacity' => 1, 'blend_mode' => 'Normal'));
                    }
                    $luong_toi_thieu = $bang_luong->bl_luong_toi_thieu;
                    $giai_doan = $bang_luong->bl_giai_doan;
                    $loai_luong = $bang_luong->bl_loai_luong;
                    $luong_thu_viec = $bang_luong->bl_luong_thu_viec;
                    $he_so_luong = $bang_luong->bl_hs_luong;
                    $bhxh = $bang_luong->bl_bhxh;
                    $bhyt = $bang_luong->bl_bhyt;
                    $hs_pc_chuc_vu = $bang_luong->bl_hs_pc_cong_viec;
                    $hs_pc_trach_nhiem = $bang_luong->bl_hs_pc_trach_nhiem;
                    $hs_pc_khu_vuc = $bang_luong->bl_hs_pc_khu_vuc;
                    $hs_pc_tnvk_phan_tram = $bang_luong->bl_hs_pc_tnvk;
                    $tham_nien = $bang_luong->bl_tham_nien;
                    $uu_dai_nghe = $bang_luong->bl_hs_pc_udn;
                    $cong_vu = $bang_luong->bl_hs_pc_cong_vu;
                    $kiem_nhiem = $bang_luong->bl_pc_kiem_nhiem;
                    $hs_pc_khac = $bang_luong->bl_hs_pc_khac;
                    $he_so_tang_them = $bang_luong->bl_pc_tang_them;

                    $hs_pc_khac_type = $bang_luong->bl_pc_khac_type;
                    $hs_pc_thu_hut_phan_tram = $bang_luong->bl_pc_thu_hut;
                    $phan_loai = strtoupper($bang_luong->bl_phan_loai);
                    $phan_loai_he_so = $bang_luong->bl_phan_loai_he_so;

                    $luong_toi_thieu_sau_bh = (int) ($luong_toi_thieu * (100 - ($bhxh + $bhyt)) / 100);
                    $luong_toi_thieu_bhyt = (int) ($luong_toi_thieu * (100 - $bhyt) / 100);

                    $pc_trach_nhiem = $pc_cong_vu = $pc_khac = $pc_kiem_nhiem = $pc_uu_dai_nghe = $luong_toi_thieu;
                    $pc_chuc_vu = $pc_tnvk = $pc_thu_hut = $pc_tham_nien = $luong_toi_thieu_sau_bh;
                    $pc_khu_vuc = $luong_toi_thieu_bhyt;

                    $thanh_tien_hsl = $luong_toi_thieu_sau_bh * $he_so_luong * $phan_loai_he_so;


                    //if ($this->he_so->eh_giai_doan)
                    //$hs_pc_chuc_vu = number_format ($this->he_so->eh_pc_cong_viec*(100-$luong_thu_viec)/100, 2);
                    $thanh_tien_pc_chuc_vu = $hs_pc_chuc_vu * $pc_chuc_vu * $phan_loai_he_so;


                    //if ($this->he_so->eh_giai_doan)
                    //$hs_pc_trach_nhiem = number_format ($this->he_so->eh_pc_trach_nhiem*(100-$luong_thu_viec)/100, 2);
                    $thanh_tien_pc_trach_nhiem = $hs_pc_trach_nhiem * $pc_trach_nhiem * $phan_loai_he_so;


                    //if ($this->he_so->eh_giai_doan)
                    //$hs_pc_khu_vuc = number_format ($this->he_so->eh_pc_kv*(100-$luong_thu_viec)/100, 2);
                    $thanh_tien_pc_khu_vuc = $hs_pc_khu_vuc * $pc_khu_vuc * $phan_loai_he_so;

                    $hs_pc_tnvk = ($he_so_luong + $hs_pc_chuc_vu) * $hs_pc_tnvk_phan_tram / 100;
                    //if ($this->he_so->eh_giai_doan)
                    //$hs_pc_tnvk = number_format ($hs_pc_tnvk*(100-$luong_thu_viec)/100, 2);
                    $thanh_tien_pc_tham_nien_vuot_khung = $hs_pc_tnvk * $pc_tnvk * $phan_loai_he_so;


                    $hs_pc_tham_nien = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_trach_nhiem) * $tham_nien / 100) * 100) / 100;
                    $thanh_tien_pc_tham_nien = $hs_pc_tham_nien * $pc_tham_nien * $phan_loai_he_so;

                    $hs_pc_thu_hut = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $hs_pc_thu_hut_phan_tram / 100) * 100) / 100;
                    $thanh_tien_pc_thu_hut = $hs_pc_thu_hut * $pc_thu_hut * $phan_loai_he_so;

                    $hs_pc_uu_dai_nghe = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $uu_dai_nghe / 100) * 100) / 100;
                    $thanh_tien_pc_uu_dai_nghe = $hs_pc_uu_dai_nghe * $pc_uu_dai_nghe * $phan_loai_he_so;


                    $hs_pc_cong_vu = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $cong_vu / 100) * 100) / 100;
                    $thanh_tien_pc_cong_vu = $hs_pc_cong_vu * $pc_cong_vu * $phan_loai_he_so;


                    $hs_pc_kiem_nhiem = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $kiem_nhiem / 100) * 100) / 100;
                    $thanh_tien_pc_kiem_nhiem = $hs_pc_kiem_nhiem * $pc_kiem_nhiem * $phan_loai_he_so;

                    $thanh_tien_pc_khac = $hs_pc_khac * $pc_khac;
                    $hs_pc_khac_he_so = $hs_pc_khac;
                    if ($hs_pc_khac_type) {
                        $thanh_tien_pc_khac = $thanh_tien_pc_khac / 100;
                        $hs_pc_khac_he_so = $hs_pc_khac / 100;
                    }
                    $thanh_tien_pc_khac = $thanh_tien_pc_khac * $phan_loai_he_so;

                    $tong_1 = (int) ($thanh_tien_pc_thu_hut + $thanh_tien_hsl + $thanh_tien_pc_chuc_vu + $thanh_tien_pc_trach_nhiem + $thanh_tien_pc_khu_vuc + $thanh_tien_pc_tham_nien_vuot_khung + $thanh_tien_pc_tham_nien + $thanh_tien_pc_uu_dai_nghe + $thanh_tien_pc_cong_vu + $thanh_tien_pc_kiem_nhiem);


                    $hs_tang_them = $hs_pc_thu_hut + $he_so_luong + $hs_pc_chuc_vu + $hs_pc_trach_nhiem + $hs_pc_khu_vuc + $hs_pc_tnvk + $hs_pc_tham_nien + $hs_pc_uu_dai_nghe + $hs_pc_cong_vu + $hs_pc_kiem_nhiem + $hs_pc_khac_he_so;
                    $ti_le_tang_them = ($hs_tang_them - $hs_pc_kiem_nhiem) * $luong_toi_thieu * $he_so_tang_them * $phan_loai_he_so;
                    $tong_2 = (int) $tong_1 + $ti_le_tang_them;

                    $tong_khen_thuong = 0;
                    if (sizeof($khen_thuong)) {
                        foreach ($khen_thuong as $kt) {
                            $tong_khen_thuong +=$kt->kt_money;
                        }
                    }

                    $tong_khien_trach = 0;
                    if (sizeof($ky_luat)) {
                        foreach ($ky_luat as $kl) {
                            $tong_khien_trach +=$kl->kl_money;
                        }
                    }

                    $tong_cong = $tong_2 + $tong_khen_thuong - $tong_khien_trach;


                    //$mpdf = new mPDF();
                    $khen_thuong_text_out = '
                        <tr>
                            <td colspan="3" class="tieu-de">Khen thưởng</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <br/>
                                <table border="1" width="100%" class="noi-dung" cellpadding="5" nobr="true">
                                    <tr>
                                        <td style="width: 36pt;"><strong>#</strong></td>
                                        <td><strong>Ngày</strong></td>
                                        <td style="width: 235pt;"><strong>Lý do</strong></td>
                                        <td style="width: 100pt;"><strong>Mức thưởng</strong></td>
                                    </tr>';
                    if (sizeof($khen_thuong)) {
                        $i = 0;
                        foreach ($khen_thuong as $kt) {
                            $i++;

                            $khen_thuong_text_out .= '<tr>
                                                <td>' . $i . '</td>
                                                <td>' . date('d-m-Y', strtotime($kt->kt_date)) . '</td>
                                                <td>' . $kt->kt_ly_do . '</td>
                                                <td>' . number_format($kt->kt_money, 0, '.', ',') . '</td>
                                            </tr>';
                        }
                    } else {
                        $khen_thuong_text_out.= '<tr><td colspan="4">Không có khen thưởng nào!</td></tr>';
                    }
                    $khen_thuong_text_out.= '
                                    <tr>
                                        <td colspan="3"><strong>Tổng cộng (III)</strong></td>
                                        <td><strong>' . number_format($tong_khen_thuong, 0, '.', ',') . '</strong></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>';

                    $ky_luat_text_out = '
                        <tr>
                            <td colspan="3" class="tieu-de">Kỷ luật/Khiển trách</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <br/>
                                <table border="1" width="100%" class="noi-dung" cellpadding="5" nobr="true">
                                    <tr>
                                        <td style="width: 36pt;"><strong>#</strong></td>
                                        <td><strong>Ngày</strong></td>
                                        <td style="width: 235pt;"><strong>Lý do</strong></td>
                                        <td style="width: 100pt;"><strong>Mức phạt</strong></td>
                                    </tr>';
                    if (sizeof($ky_luat)) {
                        $i = 0;
                        foreach ($ky_luat as $kl) {
                            $i++;

                            $ky_luat_text_out .= '<tr>
                                                <td>' . $i . '</td>
                                                <td>' . date('d-m-Y', strtotime($kl->kl_date)) . '</td>
                                                <td>' . $kl->kl_ly_do . '</td>
                                                <td>' . number_format($kl->kl_money, 0, '.', ',') . '</td>
                                            </tr>';
                        }
                    } else {
                        $ky_luat_text_out.= '<tr><td colspan="4">Không có kỷ luật/khiển trách nào nào!</td></tr>';
                    }
                    $ky_luat_text_out.= '
                                    <tr>
                                        <td colspan="3"><strong>Tổng cộng (IV)</strong></td>
                                        <td><strong>' . number_format($tong_khien_trach, 0, '.', ',') . '</strong></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>';


                    $text_outout = '
                        <style>
                            .ten-co-quan {
                                color: #000;
                                font-size: 10pt;
                                height: 50px;
                                text-align:center;
                            }
                            .ten-bang-luong{
                                height: 30px;
                                text-align:center;
                                font-size: 10pt;
                            }

                            table.first {
                                color: #003300;
                                font-family: helvetica;
                                font-size: 8pt;
                                border-left: 3px solid red;
                                border-right: 3px solid #FF00FF;
                                border-top: 3px solid green;
                                border-bottom: 3px solid blue;
                                background-color: #ccffcc;
                            }
                            .borders {
                                border: 1px solid #000;
                                font-size: 10px;
                            }

                            .tieu-de{
                                height: 20px;
                                font-size: 11px;
                            }
                            .noi-dung{
                                font-size: 10px;
                            }
                            td.second {
                                border: 2px dashed green;
                            }

                            .lowercase {
                                text-transform: lowercase;
                            }
                            .uppercase {
                                text-transform: uppercase;
                            }
                            .capitalize {
                                text-transform: capitalize;
                            }
                        </style>
                        <table width="100%">
                            <tr>
                                <td width="200" class="ten-co-quan uppercase">
                                    TỔNG CỤC HẢI QUAN
                                    <div><strong>CỤC HẢI QUAN HÀ TĨNH</strong></div>
                                </td>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="ten-bang-luong uppercase">BẢNG LƯƠNG THÁNG ' . $thang . '-' . $nam . '</td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tieu-de">Thông tin cá nhân</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <br/>
                                    <table border="1" class="noi-dung" cellpadding="5" nobr="true">
                                        <tr>
                                            <td style="width: 120pt;"><strong>Họ tên</strong></td>
                                            <td style="width: 80pt;"><strong>Giới tính</strong></td>
                                            <td style="width: 100pt;"><strong>Ngày sinh</strong></td>
                                            <td style="width: 100pt;"><strong>Phòng ban</strong></td>
                                            <td style="width: 96pt;"><strong>Chức vụ</strong></td>
                                        </tr>
                                        <tr>
                                            <td>' . $nhan_vien->em_ho . ' ' . $nhan_vien->em_ten . '</td>
                                            <td>' . ($nhan_vien->em_gioi_tinh ? 'Nam' : 'Nữ') . '</td>
                                            <td>' . date('d-m-Y', strtotime($nhan_vien->em_ngay_sinh)) . '</td>
                                            <td>' . $this->view->viewGetPhongBanName($nhan_vien->em_phong_ban) . '</td>
                                            <td>' . $this->view->viewGetChucVuName($nhan_vien->em_chuc_vu) . '</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tieu-de"></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tieu-de">Thông số lương cơ bản</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <br />
                                    <table border="1" width="575pt" class="noi-dung" cellpadding="5" nobr="true">
                                        <tr>
                                            <td><strong>Lương cơ bản</strong></td>
                                            ' . ($giai_doan ? '<td><strong>Thử việc</strong></td>  ' : '') . '
                                            <td style="width: 70pt;"><strong>BHXH</strong></td>
                                            <td style="width: 70pt;"><strong>BHYT</strong></td>
                                            <td style="width: 210pt;"><strong>Đã trừ BHXH+BHYT</strong></td>
                                        </tr>
                                        <tr>
                                            <td>' . number_format($luong_toi_thieu, 0, '.', ',') . '</td>
                                            ' . ($giai_doan ? '<td>' . $luong_thu_viec . '%</td>  ' : '') . '
                                            <td>' . $bhxh . '%</td>
                                            <td>' . $bhyt . '%</td>
                                            <td>
                                                Đã trừ BHYT + BHXH: ' . number_format($luong_toi_thieu_sau_bh, 0, '.', ',') . ' <br>
                                                Đã trừ BHYT: ' . number_format($luong_toi_thieu_bhyt, 0, '.', ',') . '
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tieu-de"></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tieu-de">Bảng lương</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <br/>
                                    <table border="1" width="100%" class="noi-dung" cellpadding="5" nobr="true">
                                        <tr>
                                            <td style="width: 150pt;"><strong>Tên</strong></td>
                                            <td style="width: 245pt;" colspan="2"><strong>Hệ số</strong></td>
                                            <td style="width: 100pt;"><strong>Thành tiền</strong></td>
                                        </tr>
                                        <tr>
                                            <td>Kết quả phân loại tháng</td>
                                            <td> ' . $phan_loai . ' </td>
                                            <td> ' . $phan_loai_he_so . '</td>
                                            <td></td>
                                        </tr>  
                                        <tr>
                                            <td>Hệ số lương</td>
                                            <td colspan="2">' . $he_so_luong . '</td>
                                            <td>' . number_format($thanh_tien_hsl, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC chức vụ</td>
                                            <td colspan="2">' . $hs_pc_chuc_vu . '</td>
                                            <td>' . number_format($thanh_tien_pc_cong_viec, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC trách nhiệm</td>
                                            <td colspan="2">' . $hs_pc_trach_nhiem . '</td>
                                            <td>' . number_format($thanh_tien_pc_trach_nhiem, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC khu vực</td>
                                            <td colspan="2">' . $hs_pc_khu_vuc . '</td>
                                            <td>' . number_format($thanh_tien_pc_khu_vuc, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC thu hút</td>
                                            <td>' . $hs_pc_thu_hut_phan_tram . '%</td>
                                            <td>' . $hs_pc_thu_hut . '</td>
                                            <td>' . number_format($thanh_tien_pc_thu_hut, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC thâm niên vượt khung</td>
                                            <td>' . $hs_pc_tnvk_phan_tram . '%</td>
                                            <td>' . $hs_pc_tnvk . '</td>
                                            <td>' . number_format($thanh_tien_pc_tham_nien_vuot_khung, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC thâm niên</td>
                                            <td>' . $tham_nien . ' Năm</td>
                                            <td>' . $hs_pc_tham_nien . '</td>
                                            <td>' . number_format($thanh_tien_pc_tham_nien, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC ưu đãi nghề</td>
                                            <td>' . $uu_dai_nghe . '%</td>
                                            <td>' . $hs_pc_uu_dai_nghe . '</td>
                                            <td>' . number_format($thanh_tien_pc_uu_dai_nghe, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC công vụ</td>
                                            <td>' . $cong_vu . '%</td>
                                            <td>' . $hs_pc_cong_vu . '</td>
                                            <td>' . number_format($thanh_tien_pc_cong_vu, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC kiêm nhiệm</td>
                                            <td colspan="2">' . $hs_pc_kiem_nhiem . '</td>
                                            <td>' . number_format($thanh_tien_pc_kiem_nhiem, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>PC khác</td>
                                            <td colspan="2">' . $hs_pc_khac . ($hs_pc_khac_type ? '%' : '') . '</td>
                                            <td>' . number_format($thanh_tien_pc_khac, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">Tổng cộng (I)</td>
                                            <td>' . number_format($tong_1, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td>Tỷ lệ tăng thêm</td>
                                            <td colspan="2">' . $hs_tang_them . '</td>
                                            <td>' . number_format($ti_le_tang_them, 0, '.', ',') . '</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><strong>Tổng cộng (II)</strong></td>
                                            <td><strong>' . number_format($tong_2, 0, '.', ',') . '</strong></td>
                                        </tr>
                                    </table>                            
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="tieu-de"></td>
                            </tr>  
                            ' . $khen_thuong_text_out . '
                            <tr>
                                <td colspan="3" class="tieu-de"></td>
                            </tr> 
                            ' . $ky_luat_text_out . '
                            <tr>
                                <td colspan="3" class="tieu-de"></td>
                            </tr> 
                            <tr>
                                <td colspan="3">
                                    <br/>
                                    <table border="1" width="100%" class="noi-dung" cellpadding="5" nobr="true">
                                        <tr>
                                            <td style="width: 395pt;"><strong>Tổng được nhận = II + III + IV</strong></td>
                                            <td style="width: 100pt;"><strong>' . number_format($tong_cong, 0, '.', ',') . '</strong></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table> 
                      ';
                    $pdf->writeHTMLCell(0, 0, '', '', $text_outout, 0, 1, 0, true, '', true);
                }
            }
            if ($k) {
                if ($pb_selected && $phong_ban_selected_info) {
                    $file_name = 'Bang_luong_' . str_replace(' ', '_', $this->loc_tieng_viet($phong_ban_selected_info->pb_name)) . '_' . $thang . '-' . $nam . '.pdf';
                } else {
                    $file_name = 'Bang_luong_' . $thang . '-' . $nam . '.pdf';
                }
                $pdf->Output($file_name, 'I');
                die();
            } else {
                $this->_helper->viewRenderer->setRender('loi');
            }
        } else {
            $this->_helper->viewRenderer->setRender('loi');
        }
    }

    public function downAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'In lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;
        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow("em_id=$em_id");

        $khenthuongModel = new Front_Model_KhenThuong();
        $khen_thuong = $khenthuongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $kyluatModel = new Front_Model_KyLuat();
        $ky_luat = $kyluatModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $bangluongModel = new Front_Model_BangLuong();
        $bang_luong = $bangluongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        if (!$em_info || !$bang_luong) {
            $this->_helper->viewRenderer->setRender('loi');
        } else {

            $luong_toi_thieu = $bang_luong->bl_luong_toi_thieu;
            $giai_doan = $bang_luong->bl_giai_doan;
            $loai_luong = $bang_luong->bl_loai_luong;
            $luong_thu_viec = $bang_luong->bl_luong_thu_viec;
            $he_so_luong = $bang_luong->bl_hs_luong;
            $bhxh = $bang_luong->bl_bhxh;
            $bhyt = $bang_luong->bl_bhyt;
            $hs_pc_chuc_vu = $bang_luong->bl_hs_pc_cong_viec;
            $hs_pc_trach_nhiem = $bang_luong->bl_hs_pc_trach_nhiem;
            $hs_pc_khu_vuc = $bang_luong->bl_hs_pc_khu_vuc;
            $hs_pc_tnvk_phan_tram = $bang_luong->bl_hs_pc_tnvk;
            $tham_nien = $bang_luong->bl_tham_nien;
            $uu_dai_nghe = $bang_luong->bl_hs_pc_udn;
            $cong_vu = $bang_luong->bl_hs_pc_cong_vu;
            $kiem_nhiem = $bang_luong->bl_pc_kiem_nhiem;
            $hs_pc_khac = $bang_luong->bl_hs_pc_khac;
            $he_so_tang_them = $bang_luong->bl_pc_tang_them;

            $hs_pc_khac_type = $bang_luong->bl_pc_khac_type;
            $hs_pc_thu_hut_phan_tram = $bang_luong->bl_pc_thu_hut;
            $phan_loai = strtoupper($bang_luong->bl_phan_loai);
            $phan_loai_he_so = $bang_luong->bl_phan_loai_he_so;

            $luong_toi_thieu_sau_bh = (int) ($luong_toi_thieu * (100 - ($bhxh + $bhyt)) / 100);
            $luong_toi_thieu_bhyt = (int) ($luong_toi_thieu * (100 - $bhyt) / 100);

            $pc_trach_nhiem = $pc_cong_vu = $pc_khac = $pc_kiem_nhiem = $pc_uu_dai_nghe = $luong_toi_thieu;
            $pc_chuc_vu = $pc_tnvk = $pc_thu_hut = $pc_tham_nien = $luong_toi_thieu_sau_bh;
            $pc_khu_vuc = $luong_toi_thieu_bhyt;

            $thanh_tien_hsl = $luong_toi_thieu_sau_bh * $he_so_luong * $phan_loai_he_so;


            //if ($this->he_so->eh_giai_doan)
            //$hs_pc_chuc_vu = number_format ($this->he_so->eh_pc_cong_viec*(100-$luong_thu_viec)/100, 2);
            $thanh_tien_pc_chuc_vu = $hs_pc_chuc_vu * $pc_chuc_vu * $phan_loai_he_so;


            //if ($this->he_so->eh_giai_doan)
            //$hs_pc_trach_nhiem = number_format ($this->he_so->eh_pc_trach_nhiem*(100-$luong_thu_viec)/100, 2);
            $thanh_tien_pc_trach_nhiem = $hs_pc_trach_nhiem * $pc_trach_nhiem * $phan_loai_he_so;


            //if ($this->he_so->eh_giai_doan)
            //$hs_pc_khu_vuc = number_format ($this->he_so->eh_pc_kv*(100-$luong_thu_viec)/100, 2);
            $thanh_tien_pc_khu_vuc = $hs_pc_khu_vuc * $pc_khu_vuc * $phan_loai_he_so;

            $hs_pc_tnvk = ($he_so_luong + $hs_pc_chuc_vu) * $hs_pc_tnvk_phan_tram / 100;
            //if ($this->he_so->eh_giai_doan)
            //$hs_pc_tnvk = number_format ($hs_pc_tnvk*(100-$luong_thu_viec)/100, 2);
            $thanh_tien_pc_tham_nien_vuot_khung = $hs_pc_tnvk * $pc_tnvk * $phan_loai_he_so;


            $hs_pc_tham_nien = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_trach_nhiem) * $tham_nien / 100) * 100) / 100;
            $thanh_tien_pc_tham_nien = $hs_pc_tham_nien * $pc_tham_nien * $phan_loai_he_so;

            $hs_pc_thu_hut = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $hs_pc_thu_hut_phan_tram / 100) * 100) / 100;
            $thanh_tien_pc_thu_hut = $hs_pc_thu_hut * $pc_thu_hut * $phan_loai_he_so;

            $hs_pc_uu_dai_nghe = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $uu_dai_nghe / 100) * 100) / 100;
            $thanh_tien_pc_uu_dai_nghe = $hs_pc_uu_dai_nghe * $pc_uu_dai_nghe * $phan_loai_he_so;


            $hs_pc_cong_vu = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $cong_vu / 100) * 100) / 100;
            $thanh_tien_pc_cong_vu = $hs_pc_cong_vu * $pc_cong_vu * $phan_loai_he_so;


            $hs_pc_kiem_nhiem = floor((($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $kiem_nhiem / 100) * 100) / 100;
            $thanh_tien_pc_kiem_nhiem = $hs_pc_kiem_nhiem * $pc_kiem_nhiem * $phan_loai_he_so;

            $thanh_tien_pc_khac = $hs_pc_khac * $pc_khac;
            $hs_pc_khac_he_so = $hs_pc_khac;
            if ($hs_pc_khac_type) {
                $thanh_tien_pc_khac = $thanh_tien_pc_khac / 100;
                $hs_pc_khac_he_so = $hs_pc_khac / 100;
            }
            $thanh_tien_pc_khac = $thanh_tien_pc_khac * $phan_loai_he_so;

            $tong_1 = (int) ($thanh_tien_pc_thu_hut + $thanh_tien_hsl + $thanh_tien_pc_chuc_vu + $thanh_tien_pc_trach_nhiem + $thanh_tien_pc_khu_vuc + $thanh_tien_pc_tham_nien_vuot_khung + $thanh_tien_pc_tham_nien + $thanh_tien_pc_uu_dai_nghe + $thanh_tien_pc_cong_vu + $thanh_tien_pc_kiem_nhiem);


            $hs_tang_them = $hs_pc_thu_hut + $he_so_luong + $hs_pc_chuc_vu + $hs_pc_trach_nhiem + $hs_pc_khu_vuc + $hs_pc_tnvk + $hs_pc_tham_nien + $hs_pc_uu_dai_nghe + $hs_pc_cong_vu + $hs_pc_kiem_nhiem + $hs_pc_khac_he_so;
            $ti_le_tang_them = ($hs_tang_them - $hs_pc_kiem_nhiem) * $luong_toi_thieu * $he_so_tang_them * $phan_loai_he_so;
            $tong_2 = (int) $tong_1 + $ti_le_tang_them;

            $tong_khen_thuong = 0;
            if (sizeof($khen_thuong)) {
                foreach ($khen_thuong as $kt) {
                    $tong_khen_thuong +=$kt->kt_money;
                }
            }

            $tong_khien_trach = 0;
            if (sizeof($ky_luat)) {
                foreach ($ky_luat as $kl) {
                    $tong_khien_trach +=$kl->kl_money;
                }
            }

            $tong_cong = $tong_2 + $tong_khen_thuong - $tong_khien_trach;


            //$mpdf = new mPDF();
            $khen_thuong_text_out = '
                <tr>
                    <td colspan="3" class="tieu-de">Khen thưởng</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br/>
                        <table border="1" width="100%" class="noi-dung" cellpadding="5" nobr="true">
                            <tr>
                                <td style="width: 36pt;"><strong>#</strong></td>
                                <td><strong>Ngày</strong></td>
                                <td style="width: 235pt;"><strong>Lý do</strong></td>
                                <td style="width: 100pt;"><strong>Mức thưởng</strong></td>
                            </tr>';
            if (sizeof($khen_thuong)) {
                $i = 0;
                foreach ($khen_thuong as $kt) {
                    $i++;

                    $khen_thuong_text_out .= '<tr>
                                        <td>' . $i . '</td>
                                        <td>' . date('d-m-Y', strtotime($kt->kt_date)) . '</td>
                                        <td>' . $kt->kt_ly_do . '</td>
                                        <td>' . number_format($kt->kt_money, 0, '.', ',') . '</td>
                                    </tr>';
                }
            } else {
                $khen_thuong_text_out.= '<tr><td colspan="4">Không có khen thưởng nào!</td></tr>';
            }
            $khen_thuong_text_out.= '
                            <tr>
                                <td colspan="3"><strong>Tổng cộng (III)</strong></td>
                                <td><strong>' . number_format($tong_khen_thuong, 0, '.', ',') . '</strong></td>
                            </tr>
                        </table>
                    </td>
                </tr>';

            $ky_luat_text_out = '
                <tr>
                    <td colspan="3" class="tieu-de">Kỷ luật/Khiển trách</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br/>
                        <table border="1" width="100%" class="noi-dung" cellpadding="5" nobr="true">
                            <tr>
                                <td style="width: 36pt;"><strong>#</strong></td>
                                <td><strong>Ngày</strong></td>
                                <td style="width: 235pt;"><strong>Lý do</strong></td>
                                <td style="width: 100pt;"><strong>Mức phạt</strong></td>
                            </tr>';
            if (sizeof($ky_luat)) {
                $i = 0;
                foreach ($ky_luat as $kl) {
                    $i++;

                    $ky_luat_text_out .= '<tr>
                                        <td>' . $i . '</td>
                                        <td>' . date('d-m-Y', strtotime($kl->kl_date)) . '</td>
                                        <td>' . $kl->kl_ly_do . '</td>
                                        <td>' . number_format($kl->kl_money, 0, '.', ',') . '</td>
                                    </tr>';
                }
            } else {
                $ky_luat_text_out.= '<tr><td colspan="4">Không có kỷ luật/khiển trách nào nào!</td></tr>';
            }
            $ky_luat_text_out.= '
                            <tr>
                                <td colspan="3"><strong>Tổng cộng (IV)</strong></td>
                                <td><strong>' . number_format($tong_khien_trach, 0, '.', ',') . '</strong></td>
                            </tr>
                        </table>
                    </td>
                </tr>';


            $text_outout = '
                <style>
                    .ten-co-quan {
                        color: #000;
                        font-size: 10pt;
                        height: 50px;
                        text-align:center;
                    }
                    .ten-bang-luong{
                        height: 30px;
                        text-align:center;
                        font-size: 10pt;
                    }
                    
                    table.first {
                        color: #003300;
                        font-family: helvetica;
                        font-size: 8pt;
                        border-left: 3px solid red;
                        border-right: 3px solid #FF00FF;
                        border-top: 3px solid green;
                        border-bottom: 3px solid blue;
                        background-color: #ccffcc;
                    }
                    .borders {
                        border: 1px solid #000;
                        font-size: 10px;
                    }
                    
                    .tieu-de{
                        height: 20px;
                        font-size: 11px;
                    }
                    .noi-dung{
                        font-size: 10px;
                    }
                    td.second {
                        border: 2px dashed green;
                    }
                    
                    .lowercase {
                        text-transform: lowercase;
                    }
                    .uppercase {
                        text-transform: uppercase;
                    }
                    .capitalize {
                        text-transform: capitalize;
                    }
                </style>
                <table width="100%">
                    <tr>
                        <td width="200" class="ten-co-quan uppercase">
                            TỔNG CỤC HẢI QUAN
                            <div><strong>CỤC HẢI QUAN HÀ TĨNH</strong></div>
                        </td>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="ten-bang-luong uppercase">BẢNG LƯƠNG THÁNG ' . $thang . '-' . $nam . '</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="tieu-de">Thông tin cá nhân</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <br/>
                            <table border="1" class="noi-dung" cellpadding="5" nobr="true">
                                <tr>
                                    <td style="width: 120pt;"><strong>Họ tên</strong></td>
                                    <td style="width: 80pt;"><strong>Giới tính</strong></td>
                                    <td style="width: 100pt;"><strong>Ngày sinh</strong></td>
                                    <td style="width: 100pt;"><strong>Phòng ban</strong></td>
                                    <td style="width: 96pt;"><strong>Chức vụ</strong></td>
                                </tr>
                                <tr>
                                    <td>' . $em_info->em_ho . ' ' . $em_info->em_ten . '</td>
                                    <td>' . ($em_info->em_gioi_tinh ? 'Nam' : 'Nữ') . '</td>
                                    <td>' . date('d-m-Y', strtotime($em_info->em_ngay_sinh)) . '</td>
                                    <td>' . $this->view->viewGetPhongBanName($em_info->em_phong_ban) . '</td>
                                    <td>' . $this->view->viewGetChucVuName($em_info->em_chuc_vu) . '</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="tieu-de"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="tieu-de">Thông số lương cơ bản</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <br />
                            <table border="1" width="575pt" class="noi-dung" cellpadding="5" nobr="true">
                                <tr>
                                    <td><strong>Lương cơ bản</strong></td>
                                    ' . ($giai_doan ? '<td><strong>Thử việc</strong></td>  ' : '') . '
                                    <td style="width: 70pt;"><strong>BHXH</strong></td>
                                    <td style="width: 70pt;"><strong>BHYT</strong></td>
                                    <td style="width: 210pt;"><strong>Đã trừ BHXH+BHYT</strong></td>
                                </tr>
                                <tr>
                                    <td>' . number_format($luong_toi_thieu, 0, '.', ',') . '</td>
                                    ' . ($giai_doan ? '<td>' . $luong_thu_viec . '%</td>  ' : '') . '
                                    <td>' . $bhxh . '%</td>
                                    <td>' . $bhyt . '%</td>
                                    <td>
                                        Đã trừ BHYT + BHXH: ' . number_format($luong_toi_thieu_sau_bh, 0, '.', ',') . ' <br>
                                        Đã trừ BHYT: ' . number_format($luong_toi_thieu_bhyt, 0, '.', ',') . '
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="tieu-de"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="tieu-de">Bảng lương</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <br/>
                            <table border="1" width="100%" class="noi-dung" cellpadding="5" nobr="true">
                                <tr>
                                    <td style="width: 150pt;"><strong>Tên</strong></td>
                                    <td style="width: 245pt;" colspan="2"><strong>Hệ số</strong></td>
                                    <td style="width: 100pt;"><strong>Thành tiền</strong></td>
                                </tr>
                                <tr>
                                    <td>Kết quả phân loại tháng</td>
                                    <td> ' . $phan_loai . ' </td>
                                    <td> ' . $phan_loai_he_so . '</td>
                                    <td></td>
                                </tr>  
                                <tr>
                                    <td>Hệ số lương</td>
                                    <td colspan="2">' . $he_so_luong . '</td>
                                    <td>' . number_format($thanh_tien_hsl, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC chức vụ</td>
                                    <td colspan="2">' . $hs_pc_chuc_vu . '</td>
                                    <td>' . number_format($thanh_tien_pc_cong_viec, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC trách nhiệm</td>
                                    <td colspan="2">' . $hs_pc_trach_nhiem . '</td>
                                    <td>' . number_format($thanh_tien_pc_trach_nhiem, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC khu vực</td>
                                    <td colspan="2">' . $hs_pc_khu_vuc . '</td>
                                    <td>' . number_format($thanh_tien_pc_khu_vuc, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC thu hút</td>
                                    <td>' . $hs_pc_thu_hut_phan_tram . '%</td>
                                    <td>' . $hs_pc_thu_hut . '</td>
                                    <td>' . number_format($thanh_tien_pc_thu_hut, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC thâm niên vượt khung</td>
                                    <td>' . $hs_pc_tnvk_phan_tram . '%</td>
                                    <td>' . $hs_pc_tnvk . '</td>
                                    <td>' . number_format($thanh_tien_pc_tham_nien_vuot_khung, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC thâm niên</td>
                                    <td>' . $tham_nien . ' Năm</td>
                                    <td>' . $hs_pc_tham_nien . '</td>
                                    <td>' . number_format($thanh_tien_pc_tham_nien, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC ưu đãi nghề</td>
                                    <td>' . $uu_dai_nghe . '%</td>
                                    <td>' . $hs_pc_uu_dai_nghe . '</td>
                                    <td>' . number_format($thanh_tien_pc_uu_dai_nghe, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC công vụ</td>
                                    <td>' . $cong_vu . '%</td>
                                    <td>' . $hs_pc_cong_vu . '</td>
                                    <td>' . number_format($thanh_tien_pc_cong_vu, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC kiêm nhiệm</td>
                                    <td colspan="2">' . $hs_pc_kiem_nhiem . '</td>
                                    <td>' . number_format($thanh_tien_pc_kiem_nhiem, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>PC khác</td>
                                    <td colspan="2">' . $hs_pc_khac . ($hs_pc_khac_type ? '%' : '') . '</td>
                                    <td>' . number_format($thanh_tien_pc_khac, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td colspan="3">Tổng cộng (I)</td>
                                    <td>' . number_format($tong_1, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td>Tỷ lệ tăng thêm</td>
                                    <td colspan="2">' . $hs_tang_them . '</td>
                                    <td>' . number_format($ti_le_tang_them, 0, '.', ',') . '</td>
                                </tr>
                                <tr>
                                    <td colspan="3"><strong>Tổng cộng (II)</strong></td>
                                    <td><strong>' . number_format($tong_2, 0, '.', ',') . '</strong></td>
                                </tr>
                            </table>                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="tieu-de"></td>
                    </tr>  
                    ' . $khen_thuong_text_out . '
                    <tr>
                        <td colspan="3" class="tieu-de"></td>
                    </tr> 
                    ' . $ky_luat_text_out . '
                    <tr>
                        <td colspan="3" class="tieu-de"></td>
                    </tr> 
                    <tr>
                        <td colspan="3">
                            <br/>
                            <table border="1" width="100%" class="noi-dung" cellpadding="5" nobr="true">
                                <tr>
                                    <td style="width: 395pt;"><strong>Tổng được nhận = II + III + IV</strong></td>
                                    <td style="width: 100pt;"><strong>' . number_format($tong_cong, 0, '.', ',') . '</strong></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table> 
              ';

            /*
              $mpdf->WriteHTML($text_outout);
              $file_name = $this->loc_tieng_viet($em_info->em_ho) . '_' . $this->loc_tieng_viet($em_info->em_ten) . '_' . $thang . '-' . $nam . '.pdf';
              $mpdf->Output($file_name, 'D');
             */
            $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

            $pdf->SetCreator(PDF_CREATOR);
            $pdf->SetAuthor(PDF_AUTHOR);
            $pdf->SetTitle(PDF_HEADER_TITLE);
            $pdf->SetSubject(PDF_HEADER_TITLE);
            $pdf->SetKeywords('bang luong');

            $pdf->setPrintHeader(false);
            $pdf->setFooterData(array(0, 64, 0), array(0, 64, 128));

            $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

            $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

            $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
            $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
            $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

            $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
            $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
            $pdf->setFontSubsetting(true);

            $pdf->SetFont('dejavusans', '', 14, '', true);

            $pdf->AddPage();

            $pdf->setTextShadow(array('enabled' => true, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array(196, 196, 196), 'opacity' => 1, 'blend_mode' => 'Normal'));

            $file_name = $this->loc_tieng_viet($em_info->em_ho) . '_' . $this->loc_tieng_viet($em_info->em_ten) . '_' . $thang . '-' . $nam . '.pdf';
            $pdf->writeHTMLCell(0, 0, '', '', $text_outout, 0, 1, 0, true, '', true);

// ---------------------------------------------------------
// Close and output PDF document
// This method has several options, check the source code documentation for more information.
            $pdf->Output($file_name, 'I');
            die();
        }
    }

    function loc_tieng_viet($chuoi_vao) {
        $marTViet = array("à", "á", "ạ", "ả", "ã", "â", "ầ", "ấ", "ậ", "ẩ", "ẫ", "ă",
            "ằ", "ắ", "ặ", "ẳ", "ẵ", "è", "é", "ẹ", "ẻ", "ẽ", "ê", "ề"
            , "ế", "ệ", "ể", "ễ",
            "ì", "í", "ị", "ỉ", "ĩ",
            "ò", "ó", "ọ", "ỏ", "õ", "ô", "ồ", "ố", "ộ", "ổ", "ỗ", "ơ"
            , "ờ", "ớ", "ợ", "ở", "ỡ",
            "ù", "ú", "ụ", "ủ", "ũ", "ư", "ừ", "ứ", "ự", "ử", "ữ",
            "ỳ", "ý", "ỵ", "ỷ", "ỹ",
            "đ",
            "À", "Á", "Ạ", "Ả", "Ã", "Â", "Ầ", "Ấ", "Ậ", "Ẩ", "Ẫ", "Ă"
            , "Ằ", "Ắ", "Ặ", "Ẳ", "Ẵ",
            "È", "É", "Ẹ", "Ẻ", "Ẽ", "Ê", "Ề", "Ế", "Ệ", "Ể", "Ễ",
            "Ì", "Í", "Ị", "Ỉ", "Ĩ",
            "Ò", "Ó", "Ọ", "Ỏ", "Õ", "Ô", "Ồ", "Ố", "Ộ", "Ổ", "Ỗ", "Ơ"
            , "Ờ", "Ớ", "Ợ", "Ở", "Ỡ",
            "Ù", "Ú", "Ụ", "Ủ", "Ũ", "Ư", "Ừ", "Ứ", "Ự", "Ử", "Ữ",
            "Ỳ", "Ý", "Ỵ", "Ỷ", "Ỹ",
            "Đ");

        $marKoDau = array("a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a"
            , "a", "a", "a", "a", "a", "a",
            "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e",
            "i", "i", "i", "i", "i",
            "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o"
            , "o", "o", "o", "o", "o",
            "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u",
            "y", "y", "y", "y", "y",
            "d",
            "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A"
            , "A", "A", "A", "A", "A",
            "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
            "I", "I", "I", "I", "I",
            "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"
            , "O", "O", "O", "O", "O",
            "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U",
            "Y", "Y", "Y", "Y", "Y",
            "D");
        $chuoi_ra = str_replace($marTViet, $marKoDau, $chuoi_vao);
        return $chuoi_ra;
    }

}