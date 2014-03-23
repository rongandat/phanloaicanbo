<?php

class Tochuccanbo_DuyetphanloaiController extends Zend_Controller_Action {

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
        $this->view->title = 'Duyệt đánh giá phân loại - ' . $translate->_('TEXT_DEFAULT_TITLE');
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

        if(!$pb_selected){
            //$list_employees = $emModel->fetchData(array('em_delete' => 0));
            $list_employees = $emModel->fetchAll();
        }else{
            $select = $emModel->select()->where('em_delete=?', 0)->where('em_phong_ban in (?)', $pb_ids);
            $list_employees = $emModel->fetchAll($select);
        }
        
        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $list_tieuchi = $tieuchiModel->fetchData(array('tcdgcb_status' => 1), 'tcdgcb_order ASC');

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $list_ketqua = $ketquaModel->fetchData(array('dgkqcv_status' => 1), 'dgkqcv_order ASC');
        $this->view->tieu_chi = $list_tieuchi;
        $this->view->ket_qua = $list_ketqua;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->list_nhan_vien = $list_employees;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->pb_id = $pb_selected;
    }
    
    public function jqupdatestatusAction() {
        $this->_helper->layout()->disableLayout();        
        $process_status = 0;
        $new_status = '';
        if ($this->_request->isPost()) {
            $em_id = $this->_arrParam['em_id'];
            $dg_thang = (int) $this->_arrParam['d_thang'];
            $dg_nam = (int) $this->_arrParam['dg_nam'];
            $c_status = strtoupper(trim($this->_arrParam['dg_status']));            
            $danhgiaModel = new Front_Model_DanhGia();
            $find_row = $danhgiaModel->fetchRow("dg_em_id=$em_id and dg_thang=$dg_thang and dg_nam=$dg_nam");
            if($find_row){
                $process_status = $danhgiaModel->update(array('dg_ptccb_status' => $c_status), "dg_id=$find_row->dg_id");
            }else{
                $current_time = new Zend_Db_Expr('NOW()');
                $process_status = $danhgiaModel->insert(array('dg_em_id' => $em_id,'dg_thang'=>$dg_thang, 'dg_nam' => $dg_nam, 'dg_cong_viec' => '', 'dg_ket_qua_cong_viec' => 0,'dg_ptccb_status' => $c_status, 'dg_date_created' => $current_time, 'dg_date_modifyed' => $current_time));
            }
            
            if($process_status){
                $new_status = $c_status;
            }
        }
        $this->view->new_status = $new_status;
        $this->view->process_status = $process_status;
    }

    public function updatestatusAction() {
        $this->_helper->layout()->disableLayout();        
        $process_status = 0;
        if ($this->_request->isPost()) {
            $thang = (int) $this->_request->getParam('thang', 0);
            $nam = (int) $this->_request->getParam('nam', 0);      
            $phongban = (int) $this->_request->getParam('phongban', 0);      
            $danhgiaModel = new Front_Model_DanhGia();
            
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $find_row = $danhgiaModel->fetchRow("dg_em_id=$v and dg_thang=$thang and dg_nam=$nam");
                if($find_row && $find_row->dg_don_vi_status){
                    $process_status = $danhgiaModel->update(array('dg_ptccb_status' => $find_row->dg_don_vi_status), "dg_id=$find_row->dg_id");
                }
            }
            $this->_redirect('tochuccanbo/duyetphanloai/index/thang/'.$thang.'/nam/'.$nam.'/phongban/'.$phongban);
        }        
    }
    
}