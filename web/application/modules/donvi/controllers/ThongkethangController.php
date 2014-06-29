<?php

class Donvi_ThongkethangController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '3006');
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
        $this->view->title = 'Duyệt đánh giá phân loại - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = new Zend_Date();
        $date->subMonth(1);

        $thang = $this->_getParam('thang', $date->toString("M"));
        $nam = $this->_getParam('nam', $date->toString("Y"));

        if (empty($thang))
            $thang = date('m');
        if (empty($nam))
            $nam = date('Y');


        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $my_info = $emModel->fetchRow('em_id=' . $em_id . ' and em_status=1');

        $phong_ban_id = $list_phongban = $phong_ban = Array();
        if ($my_info) {
            $phong_ban_id[] = $my_info->em_phong_ban;
            $list_phongban = $phongbanModel->fetchDataStatus($my_info->em_phong_ban, $phong_ban);
        }

        if (sizeof($list_phongban)) {
            foreach ($list_phongban as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_parent;
            }
        }

        $phong_ban_id = implode(',', $phong_ban_id);
        $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");

        $holidaysModel = new Front_Model_Holidays();
        $holidays = $holidaysModel->fetchData();
        $listHoliday = array();

        foreach ($holidays as $holiday) {
            $listHoliday[$holiday['hld_id']] = array('code' => $holiday['hld_code'], 'ngay_cong' => $holiday['hld_ngay_cong']);
        }

        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->list_nhan_vien = $list_nhan_vien;
        $this->view->listHoliday = $listHoliday;
    }

    public function exelthongkeAction() {

        $inputFileName = APPLICATION_PATH . "/../tmp/Mau_Thong_Ke_Thang.xlsx";

        $objPHPExcel = PHPExcel_IOFactory::load($inputFileName);

        $styleArray = array(
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN
                )
            ),
            'font' => array(
                'bold' => false,
                'color' => array('rgb' => '000000'),
                'size' => 11,
                'name' => 'Times New Roman'
            )
        );

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

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $my_info = $emModel->fetchRow('em_id=' . $em_id . ' and em_status=1');

        $phong_ban_id = $list_phongban = $phong_ban = Array();
        if ($my_info) {
            $phong_ban_id[] = $my_info->em_phong_ban;
            $list_phongban = $phongbanModel->fetchDataStatus($my_info->em_phong_ban, $phong_ban);
        }

        if (sizeof($list_phongban)) {
            foreach ($list_phongban as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_parent;
            }
        }

        $phong_ban_id = implode(',', $phong_ban_id);
        $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");

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

                    /* if ($this->view->viewCheckChuNhatThuBay($d, (int) $thang, (int) $nam)) {
                      if (!empty($listHoliday[$trangthai_ngaycong]) && $listHoliday[$trangthai_ngaycong]['ngay_cong'] == 1)
                      $ngay_lam_thu_7_cn++;
                      if (!empty($listHoliday[$trangthai_ngaycong]) && $listHoliday[$trangthai_ngaycong]['ngay_cong'] == 2)
                      $ngay_lam_thu_7_cn+=0.5;
                      } */
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

                $objPHPExcel->getActiveSheet()->getStyle('A' . ($k + 6) . ':AL' . ($k + 6))->applyFromArray($styleArray);
                
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
                $objPHPExcel->getActiveSheet()->getStyle('B' . ($k + 7) . ':C' . ($k + 7))->applyFromArray($styleArray);
            }



            if ($k) {
                $objPHPExcel->getActiveSheet()->setTitle('Bảng lương');
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

    public function pdfthongkeAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Thống kê - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = new Zend_Date();
        $date->subMonth(1);
        $thang = $this->_getParam('thang', $date->toString('M'));
        $nam = $this->_getParam('nam', $date->toString('Y'));

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $my_info = $emModel->fetchRow('em_id=' . $em_id . ' and em_status=1');

        $phong_ban_id = $list_phongban = $phong_ban = Array();
        if ($my_info) {
            $phong_ban_id[] = $my_info->em_phong_ban;
            $list_phongban = $phongbanModel->fetchDataStatus($my_info->em_phong_ban, $phong_ban);
        }

        if (sizeof($list_phongban)) {
            foreach ($list_phongban as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_parent;
            }
        }

        $phong_ban_id = implode(',', $phong_ban_id);
        $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");

        $holidaysModel = new Front_Model_Holidays();
        $holidays = $holidaysModel->fetchData();
        $listHoliday = array();
        foreach ($holidays as $holiday) {
            $listHoliday[$holiday['hld_id']] = $holiday['hld_code'];
        }

        $k = 0;

        if ($list_nhan_vien) {

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

            $pdf->SetMargins(5, PDF_MARGIN_TOP, 5);
            $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
            $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

            $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
            $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
            $pdf->setFontSubsetting(true);

            $pdf->SetFont('dejavusans', '', 14, '', true);

            $pdf->AddPage('L', 'A4');

            $pdf->setTextShadow(array('enabled' => true, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array(196, 196, 196), 'opacity' => 1, 'blend_mode' => 'Normal'));
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
                            
                            .error{
                                background-color: #dddddd;
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
                                <td colspan="3" class="ten-bang-luong uppercase">BẢNG CHẤM CÔNG VÀ XẾP LOẠI A,B,C THÁNG ' . $thang . '-' . $nam . '</td>
                            </tr>';
            $text_outout .= '<tr>
                                <td colspan="3">
                                    <br/>
                                    <table border="1" class="noi-dung" cellpadding="5" nobr="true">
                                        <tr>
                                            <td style="width: 25pt;" rowspan="2"><strong>STT</strong></td>
                                            <td style="width: 70pt;" rowspan="2"><strong>HỌ TÊN</strong></td>
                                            <td colspan="31" style="text-align:center;"><strong>Ngày Công Trong Tháng</strong></td>
                                            <td style="width: 50pt;" rowspan="2"><strong>Phân loại A,B,C</strong></td>
                                            <td style="width: 50pt;" rowspan="2"><strong>Ghi chú</strong></td>
                                        </tr>
                                        <tr>';
            for ($i = 1; $i <= 31; $i++) {
                $text_outout .= '<td >' . $i . '</td>';
            }
            $text_outout .= '</tr>';
            $k = 0;

            $chamcongModel = new Front_Model_ChamCong();

            foreach ($list_nhan_vien as $nhan_vien) {
                $phan_loai_label = 'A';
                $phan_loai = $this->view->viewGetPhanLoai($nhan_vien->em_id, $thang, $nam);
                if ($phan_loai) {
                    $phan_loai_label = $phan_loai->dg_ptccb_status;
                    if (!$phan_loai_label || $phan_loai_label == null || $phan_loai_label == '-') {
                        $phan_loai_label = 'A';
                    }
                } else {
                    $phan_loai_label = '';
                }
                $text_outout .= '<tr>';
                $k++;
                $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $nhan_vien['em_id'], 'c_thang' => (int) $thang, 'c_nam' => (int) $nam));
                $text_outout .= '<td>' . $k . '</td>';
                $text_outout .= '<td>' . $nhan_vien->em_ho . ' ' . $nhan_vien->em_ten_dem . ' ' . $nhan_vien->em_ten . '</td>';
                for ($i = 1; $i <= 31; $i++) {
                    $ngay_chamcong = 'c_ngay_' . $i;
                    $trangthai_ngaycong = $cham_cong->$ngay_chamcong;
                    $status = !empty($listHoliday[$trangthai_ngaycong]) ? $listHoliday[$trangthai_ngaycong] : '&nbsp;';
                    $text_outout .= '<td ' . $this->view->viewCheckChuNhatThuBay($i, (int) $thang, (int) $nam) . '>' . $status . '</td>';
                }
                $text_outout .= '<td>' . $phan_loai_label . '</td>';
                $text_outout .= '<td></td>';
                $text_outout .= '</tr>';
            }
            $text_outout .= '</table>
                                </td>
                            </tr>';

            $text_outout .= '</table>
                                </td>
                            </tr>';
            $text_outout .= '<tr><td style=""></td><td style="width: 120pt;">&nbsp;</td><td style="width: 50pt;">&nbsp;</td></tr>';
            foreach ($holidays as $holiday) {

                $text_outout .= '<tr class="noi-dung"><td style="width: 32pt;"></td><td style="width: 70pt;">' . $holiday['hld_name'] . '</td><td style="width: 50pt;">' . $holiday['hld_code'] . '</td></tr>';
            }

            $text_outout .='</table> ';
            $pdf->writeHTMLCell(0, 0, '', '', $text_outout, 0, 1, 0, true, '', true);
            $pdf->Output($file_name, 'I');
            die();
            $k += 5;
            foreach ($holidays as $holiday) {
                $k++;
                $objPHPExcel->getActiveSheet()->SetCellValue('B' . ($k + 7), $holiday['hld_name']);
                $objPHPExcel->getActiveSheet()->SetCellValue('C' . ($k + 7), $holiday['hld_code']);
            }

            if ($k) {
                $objPHPExcel->getActiveSheet()->setTitle('Bảng lương');
                if ($pb_selected && $phong_ban_selected_info) {
                    $file_name = 'Thong_ke_luong_' . str_replace(' ', '_', $this->loc_tieng_viet($phong_ban_selected_info->pb_name)) . '_' . $thang . '-' . $nam . '.xls';
                } else {
                    $file_name = 'Thong_ke_luong_' . $thang . '-' . $nam . '.xls';
                }

                header('Content-Type: application/vnd.ms-excel');
                header('Content-Disposition: attachment;
                filename = "' . $file_name . '"');
                header('Cache-Control: max-age = 0');
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

}