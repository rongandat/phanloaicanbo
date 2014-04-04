<?php

class Donvi_DuyetnghiphepController extends Zend_Controller_Action {

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
        $this->view->title = 'Duyệt đơn xin nghỉ phép - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'donvi/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $xnpModel = new Front_Model_XinNghiPhep();
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

        $list_nghi_phep = $xnpModel->fetchByDate($list_nhan_vien_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        $this->view->list_nghi_phep = $list_nghi_phep;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
    }

    public function jqupdatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $new_status = 'Đã duyệt';
        $process_status = 0;
        if ($this->_request->isPost()) {
            $xnp_id = $this->_arrParam['xnp_id'];
            $xnp_status = $this->_arrParam['xnp_status'];
            if ($xnp_status > 1) {
                $xnp_status = 1;
            }
            if ($xnp_status < 0) {
                $xnp_status = -1;
            }
            $process_status = 1;
            $xnpModel = new Front_Model_XinNghiPhep();
            $process_status = $xnpModel->update(array('xnp_don_vi_status' => $xnp_status), "xnp_id=$xnp_id and xnp_ptccb_status<0");
            if ($process_status) {
                if (!$xnp_status) {
                    $new_status = 'Không duyệt';
                } else {
                    $users = $this->_helper->GlobalHelpers->checkToChucUsers(4004);
                    $current_time = new Zend_Db_Expr('NOW()');
                    $thongbao_model = new Front_Model_ThongBao();
                    $data = array();
                    $data['tb_from'] = 0;
                    $data['tb_tieu_de'] = '[Thông báo] Duyệt đơn xin nghỉ phép.';
                    $data['tb_noi_dung'] = 'Có đơn đơn xin nghỉ phép mới<br/> Bạn hãy vào <strong>Tổ chức cán bộ => Duyệt nghỉ phép</strong> để xét duyệt.';
                    $data['tb_status'] = 0;
                    $data['tb_date_added'] = $current_time;
                    $data['tb_date_modified'] = $current_time;

                    foreach ($users as $user) {
                        $data['tb_to'] = $user->em_id;
                        $thongbao_model->insert($data);
                    }
                }
            }
        }
        $this->view->new_status = $new_status;
        $this->view->process_status = $process_status;
    }

    public function updatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $xnp_status = $this->_request->getParam('status', 0);
        $thang = $this->_request->getParam('thang', 0);
        $nam = $this->_request->getParam('nam', 0);
        if ($xnp_status > 1) {
            $xnp_status = 1;
        }
        if ($xnp_status < 0) {
            $xnp_status = -1;
        }
        $xnpModel = new Front_Model_XinNghiPhep();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $xnpModel->update(array('xnp_don_vi_status' => $xnp_status), "xnp_id=$v and xnp_ptccb_status<0");
            }
            if ($xnp_status) {
                $users = $this->_helper->GlobalHelpers->checkToChucUsers(4004);
                $current_time = new Zend_Db_Expr('NOW()');
                $thongbao_model = new Front_Model_ThongBao();
                $data = array();
                $data['tb_from'] = 0;
                $data['tb_tieu_de'] = '[Thông báo] Duyệt đơn xin nghỉ phép.';
                $data['tb_noi_dung'] = 'Có đơn đơn xin nghỉ phép mới<br/> Bạn hãy vào <strong>Tổ chức cán bộ => Duyệt nghỉ phép</strong> để xét duyệt.';
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;

                foreach ($users as $user) {
                    $data['tb_to'] = $user->em_id;
                    $thongbao_model->insert($data);
                }
            }
        }
        $this->_redirect('donvi/duyetnghiphep/index/thang/' . $thang . '/nam/' . $nam);
    }

}