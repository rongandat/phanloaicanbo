<?php

class Tochuccanbo_PhanloaithangController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4003');
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
        $this->view->title = 'Thống kê phân loại tháng - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = new Zend_Date();
        $thang = $this->_getParam('thang', $date->toString("M"));
        $nam = $this->_getParam('nam', $date->toString("Y"));

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $chucvuModel = new Front_Model_Chucvu();

        $chuc_vu = $chucvuModel->fetchAll();
        
        $list_phong_ban = $phongbanModel->fetchAll();

        $pb_selected = $this->_getParam('phongban', 0);

        $phong_ban = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban);
        $phong_ban_choosed_info = $phongbanModel->fetchRow("pb_id=$pb_selected and pb_status=1");
        $phong_ban_choosed = Array();
        $phongbanModel->fetchData($pb_selected, $phong_ban_choosed);

        $pb_ids = array($pb_selected);
        foreach ($phong_ban_choosed as $pb) {
            $pb_ids[] = $pb->pb_id;
        }

        if (!$pb_selected) {
            //$list_employees = $emModel->fetchData(array('em_delete' => 0));
            $list_employees = $emModel->getListNhanVienDanhSachTheoChucVu();
        } else {
            //$select = $emModel->select()->where('em_phong_ban in (?)', $pb_ids);
            $list_employees = $emModel->getListNhanVienTheoChucVu($pb_ids);
        }

        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $list_tieuchi = $tieuchiModel->fetchData(array('tcdgcb_status' => 1), 'tcdgcb_order ASC');

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $list_ketqua = $ketquaModel->fetchData(array('dgkqcv_status' => 1), 'dgkqcv_order ASC');


        if ($this->_request->isPost()) {
            $inputFileName = APPLICATION_PATH . "/../tmp/BANG_TONG_HOP_PHAN_LOAI_THANG.xlsx";

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

            $objPHPExcel->getActiveSheet()->SetCellValue('A5', "(Tháng $thang Năm $nam)");

            $phong_ban_st = Array($phong_ban_choosed_info);
            $list_phongban_selected = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban_st);
            
            if ($list_employees) {
                $k = 0;
                $stt = 0;
                $stt_1 = 0;
                foreach ($list_phongban_selected as $phong_ban_info) {                    
                    $stt_1 = 0;
                    $k++;
                    $objPHPExcel->setActiveSheetIndex(0)->mergeCells("A" . ($k + 8) . ":J" . ($k + 8));
                    $objPHPExcel->getActiveSheet()->getStyle("A" . ($k + 8))->getFill()
                            ->applyFromArray(array('type' => PHPExcel_Style_Fill::FILL_SOLID,
                                'startcolor' => array('rgb' => 'F28A8C')
                            ));
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . ($k + 8), $phong_ban_info->pb_name);
                    foreach ($list_employees as $nhan_vien) {                        
                        if ($phong_ban_info->pb_id == $nhan_vien->em_phong_ban) {
                            $phan_loai = $this->view->viewGetPhanLoai($nhan_vien->em_id, (int) $thang, (int) $nam);
                            $pl_ptccb = '';
                            if ($phan_loai) {
                                if ($phan_loai->dg_ptccb_status != 'O')
                                    $pl_ptccb = $phan_loai->dg_ptccb_status;
                                else
                                    $pl_ptccb = '-';
                            }
                            $stt_1++;
                            $k++;
                            $stt++;
                            $objPHPExcel->getActiveSheet()->SetCellValue('A' . ($k + 8), $stt);
                            $objPHPExcel->getActiveSheet()->SetCellValue('B' . ($k + 8), $stt_1);
                            $objPHPExcel->getActiveSheet()->SetCellValue('C' . ($k + 8), $nhan_vien->em_ho . ' ' . $nhan_vien->em_ten);
                            $objPHPExcel->getActiveSheet()->SetCellValue('D' . ($k + 8), $nhan_vien->cv_name);

                            switch ($pl_ptccb) {
                                case 'A':
                                    $objPHPExcel->getActiveSheet()->SetCellValue('E' . ($k + 8), 'X');
                                    break;
                                case 'B':
                                    $objPHPExcel->getActiveSheet()->SetCellValue('F' . ($k + 8), 'X');
                                    break;
                                case 'C':
                                    $objPHPExcel->getActiveSheet()->SetCellValue('G' . ($k + 8), 'X');
                                    break;
                                case 'D':
                                    $objPHPExcel->getActiveSheet()->SetCellValue('H' . ($k + 8), 'X');
                                    break;
                                case '-':
                                    $objPHPExcel->getActiveSheet()->SetCellValue('I' . ($k + 8), 'X');
                                    break;
                            }
                        }
                        $objPHPExcel->getActiveSheet()->getStyle('A' . ($k + 8) . ':J' . ($k + 8))->applyFromArray($styleArray);
                    }
                }

                $objPHPExcel->getActiveSheet()->SetCellValue('A' . ($k + 13), 'Ghi chú: Để trống là chưa phân loại hoặc chưa xét duyệt');

                $objPHPExcel->getActiveSheet()->setTitle('Thống kê phân loại tháng' . $thang . '-' . $nam);
                $file_name = 'Thong_Ke_Phan_Loai_Thang_' . $thang . '-' . $nam . '.xls';

                header('Content-type: application/vnd.ms-excel; charset=UTF-8');
                header('Content-Disposition: attachment;filename="' . $file_name . '"');
                header('Cache-Control: max-age=0');
                $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
                $objWriter->save('php://output');
                die();
            }
        }



        $this->view->tieu_chi = $list_tieuchi;
        $this->view->ket_qua = $list_ketqua;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->list_nhan_vien = $list_employees;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->pb_id = $pb_selected;
    }

}