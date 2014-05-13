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
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '3002');
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

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

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
            $listHoliday[$holiday['hld_id']] = $holiday['hld_code'];
        }

        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->list_nhan_vien = $list_nhan_vien;
        $this->view->listHoliday = $listHoliday;
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

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

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


        $objPHPExcel->getActiveSheet()->SetCellValue('A3', 'BẢNG CHẤM CÔNG VÀ XẾP LOẠI A,B,C THÁNG ' . $thang . '-' . $nam);

        $chamcongModel = new Front_Model_ChamCong();
        if ($list_nhan_vien) {
            $k = 0;
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
                $k++;
                $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $nhan_vien->em_id, 'c_thang' => (int) $thang, 'c_nam' => (int) $nam));
                $objPHPExcel->getActiveSheet()->SetCellValue('A' . ($k + 7), $k);
                $objPHPExcel->getActiveSheet()->SetCellValue('B' . ($k + 7), $nhan_vien->em_ho . ' ' . $nhan_vien->em_ten);
                $objPHPExcel->getActiveSheet()->SetCellValue('C' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_1]) ? $listHoliday[$cham_cong->c_ngay_1] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('D' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_2]) ? $listHoliday[$cham_cong->c_ngay_2] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('E' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_3]) ? $listHoliday[$cham_cong->c_ngay_3] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('F' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_4]) ? $listHoliday[$cham_cong->c_ngay_4] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('G' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_5]) ? $listHoliday[$cham_cong->c_ngay_5] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('H' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_6]) ? $listHoliday[$cham_cong->c_ngay_6] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('I' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_7]) ? $listHoliday[$cham_cong->c_ngay_7] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('J' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_8]) ? $listHoliday[$cham_cong->c_ngay_8] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('K' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_9]) ? $listHoliday[$cham_cong->c_ngay_9] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('L' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_10]) ? $listHoliday[$cham_cong->c_ngay_10] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('M' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_11]) ? $listHoliday[$cham_cong->c_ngay_11] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('N' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_12]) ? $listHoliday[$cham_cong->c_ngay_12] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('O' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_13]) ? $listHoliday[$cham_cong->c_ngay_13] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('P' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_14]) ? $listHoliday[$cham_cong->c_ngay_14] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('Q' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_15]) ? $listHoliday[$cham_cong->c_ngay_15] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('R' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_16]) ? $listHoliday[$cham_cong->c_ngay_16] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('S' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_17]) ? $listHoliday[$cham_cong->c_ngay_17] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('T' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_18]) ? $listHoliday[$cham_cong->c_ngay_18] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('U' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_19]) ? $listHoliday[$cham_cong->c_ngay_19] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('V' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_20]) ? $listHoliday[$cham_cong->c_ngay_20] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('W' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_21]) ? $listHoliday[$cham_cong->c_ngay_21] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('X' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_22]) ? $listHoliday[$cham_cong->c_ngay_22] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('Y' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_23]) ? $listHoliday[$cham_cong->c_ngay_23] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('Z' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_24]) ? $listHoliday[$cham_cong->c_ngay_24] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AA' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_25]) ? $listHoliday[$cham_cong->c_ngay_25] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AB' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_26]) ? $listHoliday[$cham_cong->c_ngay_26] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AC' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_27]) ? $listHoliday[$cham_cong->c_ngay_27] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AD' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_28]) ? $listHoliday[$cham_cong->c_ngay_28] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AE' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_29]) ? $listHoliday[$cham_cong->c_ngay_29] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AF' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_30]) ? $listHoliday[$cham_cong->c_ngay_30] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AG' . ($k + 7), !empty($listHoliday[$cham_cong->c_ngay_31]) ? $listHoliday[$cham_cong->c_ngay_31] : '');
                $objPHPExcel->getActiveSheet()->SetCellValue('AH' . ($k + 7), $phan_loai_label);
            }

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

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

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
                    $text_outout .= '<td>' . $status . '</td>';
                }
                $text_outout .= '<td>'.$phan_loai_label.'</td>';
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