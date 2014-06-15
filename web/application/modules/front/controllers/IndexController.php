<?php

class IndexController extends Zend_Controller_Action {

    protected $_arrParam;

    public function init() {
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'index',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);
    }

    public function changethamnienAction() {
        $hesoModel = new Front_Model_EmployeesHeso();
        $date = new Zend_Date();
        $thang = $date->toString("M");
        $nam = $date->toString("Y");
        $he_so = $hesoModel->fetchAll();
        foreach ($he_so as $hs) {
            if ($hs->eh_tham_niem != '' && $hs->eh_tham_niem != '0000-00-00 00:00:00') {
                $nam_tham_nien = date('Y', strtotime($hs->eh_tham_niem));
                $thang_tham_nien = date('m', strtotime($hs->eh_tham_niem));
                $tham_niem = $nam - $nam_tham_nien;
                if ($thang < $thang_tham_nien)
                    $tham_niem--;
                $data_ud = array('eh_pc_tham_nien' => $tham_niem);
                $hesoModel->update($data_ud, 'eh_id=' . $hs->eh_id);
            }
        }
        die();
    }

    
    public function converthesoAction() {
        $hesoModel = new Front_Model_EmployeesHeso();
        $phucap_model = new Front_Model_EmployeesPhuCap();
        
        $list_he_so = $hesoModel->fetchAll();
        foreach ($list_he_so as $he_so) {
            $data = array(
                'epc_em_id' =>$he_so->eh_em_id,
                'eh_pc_cong_viec' =>$he_so->eh_pc_cong_viec,
                'eh_pc_trach_nhiem' =>$he_so->eh_pc_trach_nhiem,
                'eh_pc_tnvk_phan_tram' =>$he_so->eh_pc_tnvk_phan_tram,
                'eh_tham_niem' =>$he_so->eh_tham_niem,
                'eh_pc_udn_phan_tram' =>$he_so->eh_pc_udn_phan_tram,
                'eh_pc_cong_vu_phan_tram' =>$he_so->eh_pc_cong_vu_phan_tram,
                'eh_pc_kiem_nhiem' =>$he_so->eh_pc_kiem_nhiem,
                'eh_pc_khac' =>$he_so->eh_pc_khac,
                'eh_date_added' =>$he_so->eh_date_added,
                'eh_date_modified' =>$he_so->eh_date_modified,
                'eh_pc_kv' =>$he_so->eh_pc_kv,
                'eh_pc_khac_type' =>$he_so->eh_pc_khac_type,
                'eh_pc_thu_hut' =>$he_so->eh_pc_thu_hut,
                'eh_pc_doc_hai' =>$he_so->eh_pc_doc_hai,
                'eh_pc_doc_hai_type' =>$he_so->eh_pc_doc_hai_type,
                'eh_han_ap_dung' =>$he_so->eh_han_ap_dung,
                'eh_pc_tham_nien' =>$he_so->eh_pc_tham_nien                
            );
            $phucap_model->insert($data);
        }
        
        die('ok');
    }
    
    public function permissionAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'index',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);
    }

}