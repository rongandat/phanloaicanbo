<?php

class Tochuccanbo_DuyetchamcongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4006');
        if (!$check_permission) {
            $this->_redirect('index/permission/');
            exit();
        }
        $this->_arrParam = $this->_request->getParams();
        $this->_kw = $this->_arrParam['kw'];
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        if ($this->_arrParam['page'] == '' || $this->_arrParam['page'] <= 0) {
            $this->_arrParam['page'] = 1;
        }
        $this->_page = $this->_arrParam['page'];
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Duyệt chấm công - ' . $translate->_('TEXT_DEFAULT_TITLE');
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
        $phongbanModel = new Front_Model_Phongban();

        $list_phong_ban = $phongbanModel->fetchAll();

        $pb_selected = $this->_getParam('phongban', 0);
        $nv_selected = $this->_getParam('nhanvien', 0);
        $list_nhan_vien = $phong_ban_id = $list_phongban = $phong_ban = Array();

        $phong_ban_id[] = $pb_selected;
        $list_phongban = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban);

        $phong_ban_options = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban_options);

        if (sizeof($list_phongban)) {
            foreach ($list_phongban as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_id;
            }
        }

        $phong_ban_id = implode(',', $phong_ban_id);
        if ($pb_selected)
            $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");

        $holidaysModel = new Front_Model_Holidays();
        $holidays = $holidaysModel->fetchData();
        $listHoliday = array();

        foreach ($holidays as $holiday) {
            $listHoliday[$holiday['hld_id']] = array('code' => $holiday['hld_code'], 'ngay_cong' => $holiday['hld_ngay_cong']);
        }

        $this->view->listHoliday = $listHoliday;

        $this->view->list_nhan_vien = $list_nhan_vien;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->pb_id = $pb_selected;
        $this->view->nv_id = $nv_selected;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
    }

    public function exelthongkeAction() {

        $inputFileName = APPLICATION_PATH . "/../tmp/Mau_Thong_Ke_Thang.xlsx";

        $objPHPExcel = PHPExcel_IOFactory::load($inputFileName);

        $objPHPExcel->getProperties()->setCreator("Cục Hải Quan Hà Tĩnh");
        $objPHPExcel->getProperties()->setLastModifiedBy("Cục Hải Quan Hà Tĩnh");
        $objPHPExcel->getProperties()->setTitle("Thống kê tháng");
        $objPHPExcel->getProperties()->setSubject("Bảng chấm công");
        $objPHPExcel->getProperties()->setDescription("Bảng chấm công Cục Hải Quan Hà Tĩnh");

        $objPHPExcel->setActiveSheetIndex(0);

        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Thống kê - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = new Zend_Date();
        $date->subMonth(1);

        $thang = $this->_getParam('thang', $date->toString("M"));
        $nam = $this->_getParam('nam', $date->toString("Y"));
        $pb_selected = $this->_getParam('phongban', 0);


        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();

        $phong_ban_id = $list_phongban = $phong_ban = Array();

        $phong_ban_id[] = $pb_selected;
        $list_phongban = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban);
        $ten_phong = '';
        if (sizeof($list_phongban)) {
            foreach ($list_phongban as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_parent;
            }
        }

        $phong_ban_id = implode(',', $phong_ban_id);
        if ($pb_selected) {
            $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");
            $pb_selected_info = $phongbanModel->fetchRow('pb_id=' . $pb_selected);
            if ($pb_selected_info)
                $ten_phong = $pb_selected_info->pb_name;
        }

        $holidaysModel = new Front_Model_Holidays();
        $holidays = $holidaysModel->fetchData();
        $listHoliday = array();
        foreach ($holidays as $holiday) {
            $listHoliday[$holiday['hld_id']] = array('code' => $holiday['hld_code'], 'ngay_cong' => $holiday['hld_ngay_cong']);
        }


        $objPHPExcel->getActiveSheet()->SetCellValue('A4', 'BẢNG CHẤM CÔNG LÀM THÊM GIỜ THÁNG ' . $thang . ' NĂM ' . $nam);
        $day_key[1] = 'C';
        $day_key[2] = 'D';
        $day_key[3] = 'E';
        $day_key[4] = 'F';
        $day_key[5] = 'G';
        $day_key[6] = 'H';
        $day_key[7] = 'I';
        $day_key[8] = 'J';
        $day_key[9] = 'K';
        $day_key[10] = 'L';
        $day_key[11] = 'M';
        $day_key[12] = 'N';
        $day_key[13] = 'O';
        $day_key[14] = 'P';
        $day_key[15] = 'Q';
        $day_key[16] = 'R';
        $day_key[17] = 'S';
        $day_key[18] = 'T';
        $day_key[19] = 'U';
        $day_key[20] = 'V';
        $day_key[21] = 'W';
        $day_key[22] = 'X';
        $day_key[23] = 'Y';
        $day_key[24] = 'Z';
        $day_key[25] = 'AA';
        $day_key[26] = 'AB';
        $day_key[27] = 'AC';
        $day_key[28] = 'AD';
        $day_key[29] = 'AE';
        $day_key[30] = 'AF';
        $day_key[31] = 'AG';
        $chamcongModel = new Front_Model_ChamCong();
        if ($list_nhan_vien) {
            $k = 1;
            foreach ($list_nhan_vien as $nhan_vien) {
                //$ngay_lam_thu_7_cn = 0;
                $so_gio_lam_le_tet = $so_phut_lam_le_tet = 0;
                $so_gio_lam_thu_7_cn = $so_phut_lam_thu_7_cn = 0;

                $days_in_month = cal_days_in_month(0, (int) $thang, (int) $nam);
                $k++;
                $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $nhan_vien->em_id, 'c_thang' => (int) $thang, 'c_nam' => (int) $nam));
                for ($d = 1; $d <= $days_in_month; $d++) {
                    $ngay_chamcong = 'c_ngay_' . $d;
                    $trangthai_ngaycong = $cham_cong->$ngay_chamcong;
                    $check_gio_lam_them = $this->view->viewGetGioLamThem($nhan_vien->em_id, $d, $thang, $nam);

                    if ($check_gio_lam_them) {
                        if ($this->view->viewCheckLeTet($d, $thang, $nam)) {
                            $so_gio_lam_le_tet+=$check_gio_lam_them['gio'];
                            $so_phut_lam_le_tet+=$check_gio_lam_them['phut'];
                        } elseif ($this->view->viewCheckChuNhatThuBay($d, (int) $thang, (int) $nam)) {
                            $so_gio_lam_thu_7_cn+=$check_gio_lam_them['gio'];
                            $so_phut_lam_thu_7_cn+=$check_gio_lam_them['phut'];
                        }
                    }
                }

                $doi_gio_thu_7 = floor($so_phut_lam_thu_7_cn / 60);
                $so_phut_lam_thu_7_cn = $so_phut_lam_thu_7_cn % 60;
                $so_gio_lam_thu_7_cn += $doi_gio_thu_7;

                $doi_gio_le_tet = floor($so_phut_lam_le_tet / 60);
                $so_phut_lam_le_tet = $so_phut_lam_le_tet % 60;
                $so_gio_lam_le_tet += $doi_gio_le_tet;

                $objPHPExcel->getActiveSheet()->SetCellValue('A' . ($k + 6), $k);
                $objPHPExcel->getActiveSheet()->SetCellValue('B' . ($k + 6), $nhan_vien->em_ho . ' ' . $nhan_vien->em_ten);
                $objPHPExcel->getActiveSheet()->SetCellValue('C' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_1]) ? $listHoliday[$cham_cong->c_ngay_1]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('D' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_2]) ? $listHoliday[$cham_cong->c_ngay_2]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('E' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_3]) ? $listHoliday[$cham_cong->c_ngay_3]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('F' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_4]) ? $listHoliday[$cham_cong->c_ngay_4]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('G' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_5]) ? $listHoliday[$cham_cong->c_ngay_5]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('H' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_6]) ? $listHoliday[$cham_cong->c_ngay_6]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('I' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_7]) ? $listHoliday[$cham_cong->c_ngay_7]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('J' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_8]) ? $listHoliday[$cham_cong->c_ngay_8]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('K' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_9]) ? $listHoliday[$cham_cong->c_ngay_9]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('L' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_10]) ? $listHoliday[$cham_cong->c_ngay_10]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('M' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_11]) ? $listHoliday[$cham_cong->c_ngay_11]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('N' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_12]) ? $listHoliday[$cham_cong->c_ngay_12]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('O' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_13]) ? $listHoliday[$cham_cong->c_ngay_13]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('P' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_14]) ? $listHoliday[$cham_cong->c_ngay_14]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('Q' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_15]) ? $listHoliday[$cham_cong->c_ngay_15]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('R' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_16]) ? $listHoliday[$cham_cong->c_ngay_16]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('S' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_17]) ? $listHoliday[$cham_cong->c_ngay_17]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('T' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_18]) ? $listHoliday[$cham_cong->c_ngay_18]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('U' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_19]) ? $listHoliday[$cham_cong->c_ngay_19]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('V' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_20]) ? $listHoliday[$cham_cong->c_ngay_20]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('W' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_21]) ? $listHoliday[$cham_cong->c_ngay_21]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('X' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_22]) ? $listHoliday[$cham_cong->c_ngay_22]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('Y' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_23]) ? $listHoliday[$cham_cong->c_ngay_23]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('Z' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_24]) ? $listHoliday[$cham_cong->c_ngay_24]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AA' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_25]) ? $listHoliday[$cham_cong->c_ngay_25]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AB' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_26]) ? $listHoliday[$cham_cong->c_ngay_26]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AC' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_27]) ? $listHoliday[$cham_cong->c_ngay_27]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AD' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_28]) ? $listHoliday[$cham_cong->c_ngay_28]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AE' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_29]) ? $listHoliday[$cham_cong->c_ngay_29]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AF' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_30]) ? $listHoliday[$cham_cong->c_ngay_30]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AG' . ($k + 6), !empty($listHoliday[$cham_cong->c_ngay_31]) ? $listHoliday[$cham_cong->c_ngay_31]['code'] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AI' . ($k + 6), $so_gio_lam_thu_7_cn . ':' . $so_phut_lam_thu_7_cn);
                $objPHPExcel->getActiveSheet()->SetCellValue('AJ' . ($k + 6), $so_gio_lam_le_tet . ':' . $so_phut_lam_le_tet);


                for ($l = 1; $l <= 31; $l++) {
                    if ($this->view->viewCheckChuNhatThuBay($l, $thang, $nam)) {
                        $objPHPExcel->getActiveSheet()->getStyle($day_key[$l] . ($k + 6))->getFill()
                                ->applyFromArray(array('type' => PHPExcel_Style_Fill::FILL_SOLID,
                                    'startcolor' => array('rgb' => 'DDDDDD')
                                ));
                    }
                }
            }

            $loop_day = 31 - $days_in_month;
            for ($a = 1; $a <= $loop_day; $a++) {
                $col_num = 33 - $a;
                $objPHPExcel->getActiveSheet()->removeColumnByIndex($col_num);
            }


            $k += 5;
            foreach ($holidays as $holiday) {
                $k++;
                $objPHPExcel->getActiveSheet()->SetCellValue('B' . ($k + 7), $holiday['hld_name']);
                $objPHPExcel->getActiveSheet()->SetCellValue('C' . ($k + 7), $holiday['hld_code']);
            }



            if ($k) {
                $objPHPExcel->getActiveSheet()->setTitle('Phòng ' . $ten_phong);
                if ($pb_selected && $phong_ban_selected_info) {
                    $file_name = 'Thong_ke_thang_' . str_replace(' ', '_', $this->loc_tieng_viet($phong_ban_selected_info->pb_name)) . '_' . $thang . '-' . $nam . '.xls';
                } else {
                    $file_name = 'Thong_ke_thang_' . $thang . '-' . $nam . '.xls';
                }

                header('Content-Type: application/vnd.ms-excel');
                header('Content-Disposition: attachment;filename="' . $file_name . '"');
                header('Cache-Control: max-age=0');
                $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
                $objWriter->save('php://output');
                die();
            } else {
                $this->_helper->viewRenderer->setRender('loi');
            }
        } else {
            $this->_helper->viewRenderer->setRender('loi');
        }
    }

    public function detailAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Duyệt chấm công - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = new Zend_Date();
        $date->subMonth(1);

        $thang = $this->_getParam('thang', $date->toString("M"));
        $nam = $this->_getParam('nam', $date->toString("Y"));
        $em_id = $this->_getParam('em', 0);

        $holidaysModel = new Front_Model_Holidays();
        $list_holidays = $holidaysModel->fetchData(array(), 'hld_order ASC');
        $xinnghiphepModel = new Front_Model_XinNghiPhep();
        $list_nghi_phep = $xinnghiphepModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $chamcongModel = new Front_Model_ChamCong();
        $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $em_id, 'c_thang' => $thang, 'c_nam' => $nam));

        $this->view->cham_cong = $cham_cong;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->list_holidays = $list_holidays;
        $this->view->list_nghi_phep = $list_nghi_phep;
    }

    public function jqupdatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $new_status = 'Đã duyệt';
        $em_id = 0;
        $process_status = 0;
        if ($this->_request->isPost()) {
            $item_id = $this->_arrParam['item_id'];
            $item_status = $this->_arrParam['item_status'];
            if ($item_status > 1) {
                $item_status = 1;
            }
            if ($item_status <= 0) {
                $item_status = -1;
                $new_status = 'Không duyệt';
            }
            $chamcongModel = new Front_Model_ChamCong();
            $cham_cong = $chamcongModel->fetchRow('c_id=' . $item_id);
            //Zend_Debug::dump($cham_cong);
            if ($cham_cong && $cham_cong->c_don_vi_status > 0) {
                $em_id = $cham_cong->c_em_id;
                $thang = $cham_cong->c_thang;
                $nam = $cham_cong->c_nam;
                $process_status = $chamcongModel->update(array('c_ptccb_status' => $item_status, 'c_don_vi_status' => $item_status), 'c_id=' . $item_id);
                if ($item_status < 1) {
                    $current_time = new Zend_Db_Expr('NOW()');
                    $thongbao_model = new Front_Model_ThongBao();
                    $data = array();
                    $data['tb_from'] = 0;
                    $data['tb_to'] = $cham_cong->c_em_id;
                    $data['tb_tieu_de'] = "[Chấm công tháng $thang-$nam] Chấm công không được duyệt.";
                    $data['tb_noi_dung'] = "Chào bạn!<br/>Chấm công $thang-$nam đã không được duyệt.<br/>Yêu cầu bạn chỉnh sửa lại bảng chấm công tháng $thang-$nam";
                    $data['tb_status'] = 0;
                    $data['tb_date_added'] = $current_time;
                    $data['tb_date_modified'] = $current_time;
                    $thongbao_model->insert($data);

                    $em_info = $this->view->viewGetEmployeeInfo($cham_cong->c_em_id);
                    $data['tb_noi_dung'] = 'Chấm công của <strong>' . $em_info->em_ho . ' ' . $em_info->em_ten . '</strong> tháng ' . $thang . '-' . $nam . ' phòng tổ chức không duyệt.<br/> Bạn hãy <strong><a href="' . $this->view->baseUrl('donvi/duyetchamcong') . '">click vào đây</a></strong> để xét duyệt lại.';
                    $don_vi_user = $this->_helper->GlobalHelpers->checkDonViUsers($cham_cong->c_em_id, 3004);
                    foreach ($don_vi_user as $user) {
                        $data['tb_to'] = $user->em_id;
                        $thongbao_model->insert($data);
                    }
                }
            }
        }
        $this->view->em_id = $em_id;
        $this->view->new_status = $new_status;
        $this->view->process_status = $process_status;
    }

    public function updatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $c_status = $this->_request->getParam('status', 0);
        $thang = $this->_request->getParam('thang', 0);
        $nam = $this->_request->getParam('nam', 0);
        $phongban = $this->_request->getParam('phongban', 0);
        $current_time = new Zend_Db_Expr('NOW()');
        if ($c_status > 1) {
            $c_status = 1;
        }
        if ($c_status <= 0) {
            $c_status = -1;
        }

        $chamcongModel = new Front_Model_ChamCong();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $v, 'c_thang' => $thang, 'c_nam' => $nam));
                //Don vi phai duyet thi moi dc quyen cap nhat status
                if ($cham_cong && $cham_cong->c_don_vi_status > 0) {
                    /* $chamcongModel->insert(array(
                      'c_em_id' => $v,
                      'c_thang' => $thang,
                      'c_nam' => $nam,
                      'c_ngay_1' => '',
                      'c_ngay_2' => '',
                      'c_ngay_3' => '',
                      'c_ngay_4' => '',
                      'c_ngay_5' => '',
                      'c_ngay_6' => '',
                      'c_ngay_7' => '',
                      'c_ngay_8' => '',
                      'c_ngay_9' => '',
                      'c_ngay_10' => '',
                      'c_ngay_11' => '',
                      'c_ngay_12' => '',
                      'c_ngay_13' => '',
                      'c_ngay_14' => '',
                      'c_ngay_15' => '',
                      'c_ngay_16' => '',
                      'c_ngay_17' => '',
                      'c_ngay_18' => '',
                      'c_ngay_19' => '',
                      'c_ngay_20' => '',
                      'c_ngay_21' => '',
                      'c_ngay_22' => '',
                      'c_ngay_23' => '',
                      'c_ngay_24' => '',
                      'c_ngay_25' => '',
                      'c_ngay_26' => '',
                      'c_ngay_27' => '',
                      'c_ngay_28' => '',
                      'c_ngay_29' => '',
                      'c_ngay_30' => '',
                      'c_ngay_31' => '',
                      'c_don_vi_status' => $c_status,
                      'c_ptccb_status' => $c_status,
                      'c_date_created' => $current_time,
                      'c_date_modifyed' => $current_time
                      )
                      );

                     */

                    $chamcongModel->update(array('c_ptccb_status' => $c_status, 'c_don_vi_status' => $c_status), "c_em_id=$v and c_thang=$thang and c_nam=$nam");
                    if ($c_status < 1) {
                        $thongbao_model = new Front_Model_ThongBao();
                        $data = array();
                        $data['tb_from'] = 0;
                        $data['tb_to'] = $v;
                        $data['tb_tieu_de'] = "[Chấm công tháng $thang-$nam] Chấm công không được duyệt.";
                        $data['tb_noi_dung'] = "Chào bạn!<br/>Chấm công $thang-$nam đã không được duyệt.<br/>Yêu cầu bạn chỉnh sửa lại bảng chấm công tháng $thang-$nam";
                        $data['tb_status'] = 0;
                        $data['tb_date_added'] = $current_time;
                        $data['tb_date_modified'] = $current_time;
                        $thongbao_model->insert($data);

                        $em_info = $this->view->viewGetEmployeeInfo($v);
                        $data['tb_noi_dung'] = 'Chấm công của <strong>' . $em_info->em_ho . ' ' . $em_info->em_ten . '</strong> tháng ' . $thang . '-' . $nam . ' phòng tổ chức không duyệt.<br/> Bạn hãy <strong><a href="' . $this->view->baseUrl('donvi/duyetchamcong') . '">click vào đây</a></strong> để xét duyệt lại.';
                        $don_vi_user = $this->_helper->GlobalHelpers->checkDonViUsers($v, 3004);
                        foreach ($don_vi_user as $user) {
                            $data['tb_to'] = $user->em_id;
                            $thongbao_model->insert($data);
                        }
                    }
                }
            }
        }
        $this->_redirect('tochuccanbo/duyetchamcong/index/thang/' . $thang . '/nam/' . $nam . '/phongban/' . $phongban);
    }

}