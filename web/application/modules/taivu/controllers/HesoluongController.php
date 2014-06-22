<?php

class Taivu_HesoluongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4009');
        if (!$check_permission) {
            $this->_redirect('index/permission/');
            exit();
        }
        $this->_arrParam = $this->_request->getParams();
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý hệ số lương cơ bản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $current_time = new Zend_Db_Expr('NOW()');
        $hesoModel = new Front_Model_HeSo();
        $lastHeSoLuong = $hesoModel->fetchOneData(array('hs_ngay_bat_dau' => date('Y-m-1')), 'hs_ngay_bat_dau DESC');
        $historyHeSoLuong = $hesoModel->fetchData(array(), 'hs_ngay_bat_dau DESC');
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $data = array();
            $hs_luong_co_ban = trim($this->_arrParam['hs_luong_co_ban']);
            $hs_he_so_luong_thuc_tap = trim($this->_arrParam['hs_he_so_luong_thuc_tap']);
            $hs_bhxh = trim($this->_arrParam['hs_bhxh']);
            $hs_bhyt = trim($this->_arrParam['hs_bhyt']);
            $thang_ap_dung = $this->_arrParam['thang_ap_dung'];
            $nam_ap_dung = $this->_arrParam['nam_ap_dung'];
            $date_ngay_ap_dung = date_create($nam_ap_dung . '-' . $thang_ap_dung . '-1');

            if (!is_numeric($hs_luong_co_ban)) {
                $error_message[] = 'Lương cơ bản phải là dạng số.';
            }

            if (!is_numeric($hs_he_so_luong_thuc_tap)) {
                $error_message[] = 'Hệ số lương thực tập phải là dạng số.';
            }
            if (!is_numeric($hs_bhxh)) {
                $error_message[] = 'Bảo hiểm xã hội phải là dạng số.';
            }
            if (!is_numeric($hs_bhyt)) {
                $error_message[] = 'Bảo hiểm y tế phải là dạng số.';
            }

            if (!sizeof($error_message)) {
                $data['hs_luong_co_ban'] = $hs_luong_co_ban;
                $data['hs_he_so_luong_thuc_tap'] = $hs_he_so_luong_thuc_tap;
                $data['hs_bhxh'] = $hs_bhxh;
                $data['hs_bhyt'] = $hs_bhyt;
                $data['hs_ngay_bat_dau'] = date_format($date_ngay_ap_dung, "Y-m-d");
                $data['hs_date_modified'] = $current_time;
                $check_exit_date = $hesoModel->fetchExactOneData(array('hs_ngay_bat_dau' => $data['hs_ngay_bat_dau']));
                if ($check_exit_date) {
                    $hesoModel->update($data, 'hs_id=' . $check_exit_date['hs_id']);
                } else {
                    $hesoModel->insert($data);
                }
                $success_message = 'Đã cập nhật thành công.';
                $lastHeSoLuong = $hesoModel->fetchOneData(array('hs_ngay_bat_dau' => date('Y-m-1')), 'hs_ngay_bat_dau DESC');
            }
        }
        $this->view->he_so_luong = $lastHeSoLuong;
        $this->view->lich_su_he_so_luong = $historyHeSoLuong;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

}