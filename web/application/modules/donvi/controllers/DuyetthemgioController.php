<?php

class Donvi_DuyetthemgioController extends Zend_Controller_Action {

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
        $this->view->title = 'Duyệt khai báo làm thêm giờ - ' . $translate->_('TEXT_DEFAULT_TITLE');
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
        $ltgModel = new Front_Model_LamThemGio();
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
        
        $list_lam_them_gio = $ltgModel->fetchByDate($list_nhan_vien_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        $this->view->lam_them_gio = $list_lam_them_gio;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
    }
    
    public function jqupdatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $new_status = 'Đã duyệt';
        $process_status = 0;
        if ($this->_request->isPost()) {
            $item_id = $this->_arrParam['item_id'];
            $item_status = $this->_arrParam['item_status'];
            if($item_status>1){
                $item_status=1;
            }
            if($item_status<0){
                $item_status = -1;
            }
            $process_status = 1;
            $ltgModel = new Front_Model_LamThemGio();
            $process_status = $ltgModel->update(array('ltg_don_vi_status' => $item_status), "ltg_id=$item_id and ltg_tccb_status<0");
            if($process_status){
                if(!$item_status){
                    $new_status = 'Không duyệt';
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
        $ltgModel = new Front_Model_LamThemGio();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $ltgModel->update(array('ltg_don_vi_status' => $xnp_status), "ltg_id=$v and ltg_tccb_status<0");
            }
        }
        $this->_redirect('donvi/duyetthemgio/index/thang/'.$thang.'/nam/'.$nam);
    }

}