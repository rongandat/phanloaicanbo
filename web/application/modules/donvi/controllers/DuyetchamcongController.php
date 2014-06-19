<?php

class Donvi_DuyetchamcongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '3004');
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
        $this->view->list_nhan_vien = $list_nhan_vien;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
    }

    public function detailAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Danh sách thành viên - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));
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
        $process_status = 0;
        if ($this->_request->isPost()) {
            $c_id = $this->_arrParam['c_id'];
            $c_status = $this->_arrParam['c_status'];
            if ($c_status > 1) {
                $c_status = 1;
            }
            if ($c_status <= 0) {
                $c_status = -1;
            }
            $chaqmcongModel = new Front_Model_ChamCong();
            $thongbao_model = new Front_Model_ThongBao();
            $process_status = $chaqmcongModel->update(array('c_don_vi_status' => $c_status), "c_id=$c_id and c_ptccb_status<0");
            $current_time = new Zend_Db_Expr('NOW()');
            if ($process_status && $c_status) {
                $users = $this->_helper->GlobalHelpers->checkToChucUsers(4006);


                $data = array();
                $data['tb_from'] = 0;
                $data['tb_tieu_de'] = '[Thông báo] Duyệt chấm công tháng.';
                $data['tb_noi_dung'] = 'Có đơn xin duyệt chấm công mới<br/> Bạn hãy <strong><a href="' . $this->view->baseUrl('tochuccanbo/duyetchamcong') . '">click vào đây</a></strong> để xét duyệt.';
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;

                foreach ($users as $user) {
                    $data['tb_to'] = $user->em_id;
                    $thongbao_model->insert($data);
                }
            }

            if ($c_status < 1) {
                $cham_cong = $chaqmcongModel->fetchRow("c_id=$c_id");
                if ($cham_cong) {
                    $thang = $cham_cong->c_thang;
                    $nam = $cham_cong->c_nam;
                    $data = array();
                    $data['tb_from'] = 0;
                    $data['tb_to'] = $cham_cong->c_em_id;
                    $data['tb_tieu_de'] = "[Chấm công tháng $thang-$nam] Chấm công không được duyệt.";
                    $data['tb_noi_dung'] = "Chào bạn!<br/>Chấm công $thang-$nam đã không được duyệt.<br/>Yêu cầu bạn chỉnh sửa lại bảng chấm công tháng $thang-$nam";
                    $data['tb_status'] = 0;
                    $data['tb_date_added'] = $current_time;
                    $data['tb_date_modified'] = $current_time;
                    $thongbao_model->insert($data);
                }
            }
        }
        $this->view->process_status = $process_status;
    }

}