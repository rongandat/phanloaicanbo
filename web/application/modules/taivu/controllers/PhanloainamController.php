<?php

class Tochuccanbo_PhanloainamController extends Zend_Controller_Action {

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
        $this->view->title = 'Thống kê phân loại năm - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = new Zend_Date();
        $nam = $this->_getParam('nam', $date->toString("Y"));

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $chucvuModel = new Front_Model_Chucvu();

        $chuc_vu = $chucvuModel->fetchAll();
        $list_chuc_vu = array();
        foreach ($chuc_vu as $cv) {
            $list_chuc_vu[$cv->cv_id] = $cv->cv_name;
        }

        $list_phong_ban = $phongbanModel->fetchAll();

        $pb_selected = $this->_getParam('phongban', 0);

        $phong_ban = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban);

        $phong_ban_choosed = Array();
        $phongbanModel->fetchData($pb_selected, $phong_ban_choosed);

        $pb_ids = array($pb_selected);
        foreach ($phong_ban_choosed as $pb) {
            $pb_ids[] = $pb->pb_id;
        }

        if (!$pb_selected) {
            //$list_employees = $emModel->fetchData(array('em_delete' => 0));
            $list_employees = $emModel->fetchAll();
        } else {
            $select = $emModel->select()->where('em_phong_ban in (?)', $pb_ids);
            $list_employees = $emModel->fetchAll($select);
        }

        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $list_tieuchi = $tieuchiModel->fetchData(array('tcdgcb_status' => 1), 'tcdgcb_order ASC');

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $list_ketqua = $ketquaModel->fetchData(array('dgkqcv_status' => 1), 'dgkqcv_order ASC');


        if ($this->_request->isPost()) {
            $inputFileName = APPLICATION_PATH . "/../tmp/BANG_TONG_HOP_PHAN_LOAI_NAM.xlsx";

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

            $objPHPExcel->getActiveSheet()->SetCellValue('A5', "(Năm $nam)");

            $phong_ban_st = Array();
            $list_phongban_selected = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban_st);
            if ($list_employees) {
                $k = 0;
                $stt = 0;
                $stt_1 = 0;
                foreach ($list_phongban_selected as $phong_ban_info) {
                    $stt_1 = 0;
                    $k++;
                    $objPHPExcel->setActiveSheetIndex(0)->mergeCells("A" . ($k + 7) . ":Q" . ($k + 7));
                    $objPHPExcel->getActiveSheet()->getStyle("A" . ($k + 7))->getFill()
                            ->applyFromArray(array('type' => PHPExcel_Style_Fill::FILL_SOLID,
                                'startcolor' => array('rgb' => 'F28A8C')
                            ));
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . ($k + 7), $phong_ban_info->pb_name);
                    foreach ($list_employees as $nhan_vien) {
                        if ($phong_ban_info->pb_id == $nhan_vien->em_phong_ban) {
                            $stt_1++;
                            $k++;
                            $stt++;
                            $objPHPExcel->getActiveSheet()->SetCellValue('A' . ($k + 7), $stt);
                            $objPHPExcel->getActiveSheet()->SetCellValue('B' . ($k + 7), $stt_1);
                            $objPHPExcel->getActiveSheet()->SetCellValue('C' . ($k + 7), $nhan_vien->em_ho . ' ' . $nhan_vien->em_ten);
                            $objPHPExcel->getActiveSheet()->SetCellValue('D' . ($k + 7), $list_chuc_vu[$nhan_vien->em_chuc_vu]);

                            for ($n = 1; $n <= 12; $n++) {
                                $phan_loai = $this->view->viewGetPhanLoai($nhan_vien->em_id, (int) $n, (int) $nam);
                                $pl_ptccb = '';
                                if ($phan_loai) {
                                    if ($phan_loai->dg_ptccb_status != 'O')
                                        $pl_ptccb = $phan_loai->dg_ptccb_status;
                                    else
                                        $pl_ptccb = '-';
                                }
                                switch ($n) {
                                    case 1:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('E' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 2:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('F' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 3:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('G' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 4:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('H' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 5:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('I' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 6:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('J' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 7:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('K' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 8:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('L' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 9:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('M' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 10:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('N' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 11:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('O' . ($k + 7), $pl_ptccb);
                                        break;
                                    case 12:
                                        $objPHPExcel->getActiveSheet()->SetCellValue('P' . ($k + 7), $pl_ptccb);
                                        break;
                                }
                            }
                        }
                        $objPHPExcel->getActiveSheet()->getStyle('A' . ($k + 7) . ':Q' . ($k + 7))->applyFromArray($styleArray);
                    }
                }

                $objPHPExcel->getActiveSheet()->SetCellValue('A' . ($k + 12), 'Ghi chú: Để trống là chưa phân loại hoặc chưa xét duyệt');

                $objPHPExcel->getActiveSheet()->setTitle('Thống kê phân loại năm' . $nam);
                $file_name = 'Thong_Ke_Phan_Loai_Nam_' . $nam . '.xls';

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
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->pb_id = $pb_selected;
    }

}