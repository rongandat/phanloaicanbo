<?php

class Donvi_InthemgioController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '3003');
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
        $this->view->title = 'In khai báo làm thêm giờ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'donvi/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $date = new Zend_Date();
        $ngay = $this->_getParam('ngay', $date->toString('d'));
        $thang = $this->_getParam('thang', $date->toString('M'));
        $nam = $this->_getParam('nam', $date->toString('Y'));

        $ltg_date = $ngay . '/' . $thang . '/' . $nam;
        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $ltgModel = new Front_Model_LamThemGio();

        if ($this->_request->isPost()) {
            $inputFileName = APPLICATION_PATH . "/../tmp/MAU_LAM_THEM_GIO.xlsx";

            $objPHPExcel = PHPExcel_IOFactory::load($inputFileName);

            $objPHPExcel->getProperties()->setCreator("Cục Hải Quan Hà Tĩnh");
            $objPHPExcel->getProperties()->setLastModifiedBy("Cục Hải Quan Hà Tĩnh");
            $objPHPExcel->getProperties()->setTitle("Thống kê tháng");
            $objPHPExcel->getProperties()->setSubject("Bảng chấm công");
            $objPHPExcel->getProperties()->setDescription("Bảng chấm công Cục Hải Quan Hà Tĩnh");
            $objPHPExcel->setActiveSheetIndex(0);

            $objPHPExcel->getActiveSheet()->SetCellValue('A6', "(Ngày $ltg_date)");

            $item = $this->getRequest()->getPost('cid');
            $k = 8;
            foreach ($item as $v) {
                $ltg = $ltgModel->fetchRow('ltg_id=' . $v);
                if ($ltg) {
                    $k++;
                    $em_info = $this->view->viewGetEmployeeInfo($ltg->ltg_em_id);
                    $objPHPExcel->getActiveSheet()->SetCellValue('A' . $k, $k - 8);
                    $objPHPExcel->getActiveSheet()->SetCellValue('B' . $k, $em_info->em_ho . ' ' . $em_info->em_ten);
                    $objPHPExcel->getActiveSheet()->SetCellValue('C' . $k, strip_tags($ltg->ltg_chi_tiet));
                    $objPHPExcel->getActiveSheet()->getStyle('C' . $k)->getAlignment()->setWrapText(true);
                    $tong_gio = 0;
                    $tong_phut = 0;
                    if ($ltg->ltg_gio_bat_dau) {
                        $tong_gio += $ltg->ltg_gio_ket_thuc - $ltg->ltg_gio_bat_dau;
                        if ($ltg->ltg_phut_ket_thuc < $ltg->ltg_phut_bat_dau) {
                            $tong_gio--;
                            $tong_phut += $ltg->ltg_phut_bat_dau - $ltg->ltg_phut_ket_thuc;
                        } else {
                            $tong_phut += $ltg->ltg_phut_ket_thuc - $ltg->ltg_phut_bat_dau;
                        }
                    }

                    if ($ltg->ltg_gio_bat_dau_chieu) {
                        $tong_gio += $ltg->ltg_gio_ket_thuc_chieu - $ltg->ltg_gio_bat_dau_chieu;
                        if ($ltg->ltg_phut_ket_thuc_chieu < $ltg->ltg_phut_bat_dau_chieu) {
                            $tong_gio--;
                            $tong_phut += $ltg->ltg_phut_bat_dau_chieu - $ltg->ltg_phut_ket_thuc_chieu;
                        } else {
                            $tong_phut += $ltg->ltg_phut_ket_thuc_chieu - $ltg->ltg_phut_bat_dau_chieu;
                        }
                    }

                    if ($tong_phut >= 60) {
                        $tong_gio++;
                        $tong_phut = $tong_phut - 60;
                    }

                    $str_gio_bat_dau = '';
                    if ($ltg->ltg_gio_bat_dau && $ltg->ltg_gio_bat_dau_chieu) {
                        $str_gio_bat_dau = $ltg->ltg_gio_bat_dau . ":" . $ltg->ltg_phut_bat_dau . "\n" . $ltg->ltg_gio_bat_dau_chieu . ":" . $ltg->ltg_phut_bat_dau_chieu;
                    } elseif ($ltg->ltg_gio_bat_dau) {
                        $str_gio_bat_dau = $ltg->ltg_gio_bat_dau . ':' . $ltg->ltg_phut_bat_dau;
                    } elseif ($ltg->ltg_gio_bat_dau_chieu) {
                        $str_gio_bat_dau = $ltg->ltg_gio_bat_dau_chieu . ':' . $ltg->ltg_phut_bat_dau_chieu;
                    }
                    $str_gio_key_thuc = '';
                    if ($ltg->ltg_gio_ket_thuc && $ltg->ltg_gio_ket_thuc_chieu) {
                        $str_gio_key_thuc = $ltg->ltg_gio_ket_thuc . ":" . $ltg->ltg_phut_ket_thuc . "\n" . $ltg->ltg_gio_ket_thuc_chieu . ":" . $ltg->ltg_phut_ket_thuc_chieu;
                    } elseif ($ltg->ltg_gio_ket_thuc) {
                        $str_gio_key_thuc = $ltg->ltg_gio_ket_thuc . ':' . $ltg->ltg_phut_ket_thuc;
                    } elseif ($ltg->ltg_gio_ket_thuc_chieu) {
                        $str_gio_key_thuc = $ltg->ltg_gio_ket_thuc_chieu . ':' . $ltg->ltg_phut_ket_thuc_chieu;
                    }
                    $objPHPExcel->getActiveSheet()->getCell('D' . $k)->setValue($str_gio_bat_dau);
                    $objPHPExcel->getActiveSheet()->getStyle('D' . $k)->getAlignment()->setWrapText(true);
                    $objPHPExcel->getActiveSheet()->getCell('E' . $k)->setValue($str_gio_key_thuc);
                    $objPHPExcel->getActiveSheet()->getStyle('E' . $k)->getAlignment()->setWrapText(true);
                    $objPHPExcel->getActiveSheet()->getCell('F' . $k)->setValue($tong_gio . ':' . $tong_phut);
                }
            }
            $objPHPExcel->getActiveSheet()->setTitle('Làm thêm giờ');
            $file_name = 'Lam_Them_Gio_' . $ngay . '-' . $thang . '-' . $nam . '.xls';

            header('Content-type: application/vnd.ms-excel; charset=UTF-8');
            header('Content-Disposition: attachment;filename="' . $file_name . '"');
            header('Cache-Control: max-age=0');
            $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
            $objWriter->save('php://output');
            die();
        }

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
        $list_nhan_vien_id = array();
        foreach ($list_nhan_vien as $nhan_vien) {
            $list_nhan_vien_id[] = $nhan_vien->em_id;
        }

        $list_lam_them_gio = $ltgModel->fetchByDate($list_nhan_vien_id, "$nam-$thang-$ngay 00:00:00", "$nam-$thang-$ngay 23:59:59");
        $this->view->lam_them_gio = $list_lam_them_gio;
        $this->view->ltg_date = $ltg_date;
        $this->view->ngay = $ngay;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
    }

}