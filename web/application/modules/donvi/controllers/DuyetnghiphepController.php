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
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1001');
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
        $this->view->title = 'Danh sách thành viên - ' . $translate->_('TEXT_DEFAULT_TITLE');
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

}