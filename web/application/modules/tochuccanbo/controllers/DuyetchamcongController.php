<?php

class Tochuccanbo_DuyetchamcongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4006');
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
        $nv_selected = $this->_getParam('nhanvien', 0);
        $phong_ban_id = $list_phongban = $phong_ban = Array();

        $phong_ban_id[] = $pb_selected;
        $list_phongban = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban);

        $phong_ban_options = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban_options);

        if (sizeof($list_phongban)) {
            foreach ($list_phongban as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_id;
            }
        }

        $phong_ban_id = implode(',', $phong_ban_id);
        $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");
        $this->view->list_nhan_vien = $list_nhan_vien;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->pb_id = $pb_selected;
        $this->view->nv_id = $nv_selected;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
    }

    public function detailAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Duyệt chấm công - ' . $translate->_('TEXT_DEFAULT_TITLE');
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
            if ($c_status < 0) {
                $c_status = -1;
            }
            $chamcongModel = new Front_Model_ChamCong();
            $process_status = $chamcongModel->update(array('c_ptccb_status' => $c_status), "c_id=$c_id");
        }
        $this->view->process_status = $process_status;
    }

    public function updatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $c_status = $this->_request->getParam('status', 0);
        $thang = $this->_request->getParam('thang', 0);
        $nam = $this->_request->getParam('nam', 0);
        $phongban = $this->_request->getParam('phongban', 0);
        $current_time = new Zend_Db_Expr('NOW()');
        if ($c_status > 1) {
            $c_status = 1;
        }
        if ($c_status <= 0) {
            $c_status = -1;
        }

        $chamcongModel = new Front_Model_ChamCong();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $v, 'c_thang' => $thang, 'c_nam' => $nam));
                //Don vi phai duyet thi moi dc quyen cap nhat status
                if ($cham_cong && $cham_cong->c_don_vi_status>0) {
                    /* $chamcongModel->insert(array(
                      'c_em_id' => $v,
                      'c_thang' => $thang,
                      'c_nam' => $nam,
                      'c_ngay_1' => '',
                      'c_ngay_2' => '',
                      'c_ngay_3' => '',
                      'c_ngay_4' => '',
                      'c_ngay_5' => '',
                      'c_ngay_6' => '',
                      'c_ngay_7' => '',
                      'c_ngay_8' => '',
                      'c_ngay_9' => '',
                      'c_ngay_10' => '',
                      'c_ngay_11' => '',
                      'c_ngay_12' => '',
                      'c_ngay_13' => '',
                      'c_ngay_14' => '',
                      'c_ngay_15' => '',
                      'c_ngay_16' => '',
                      'c_ngay_17' => '',
                      'c_ngay_18' => '',
                      'c_ngay_19' => '',
                      'c_ngay_20' => '',
                      'c_ngay_21' => '',
                      'c_ngay_22' => '',
                      'c_ngay_23' => '',
                      'c_ngay_24' => '',
                      'c_ngay_25' => '',
                      'c_ngay_26' => '',
                      'c_ngay_27' => '',
                      'c_ngay_28' => '',
                      'c_ngay_29' => '',
                      'c_ngay_30' => '',
                      'c_ngay_31' => '',
                      'c_don_vi_status' => $c_status,
                      'c_ptccb_status' => $c_status,
                      'c_date_created' => $current_time,
                      'c_date_modifyed' => $current_time
                      )
                      );

                     */

                    $chamcongModel->update(array('c_ptccb_status' => $c_status, 'c_don_vi_status' => $c_status), "c_em_id=$v and c_thang=$thang and c_nam=$nam");
                    if ($c_status < 1) {
                        $thongbao_model = new Front_Model_ThongBao();
                        $data = array();
                        $data['tb_from'] = 0;
                        $data['tb_to'] = $v;
                        $data['tb_tieu_de'] = "[Chấm công tháng $thang-$nam] Chấm công không được duyệt.";
                        $data['tb_noi_dung'] = "Chào bạn!<br/>Chấm công $thang-$nam đã không được duyệt.<br/>Yêu cầu bạn chỉnh sửa lại bảng chấm công tháng $thang-$nam";
                        $data['tb_status'] = 0;
                        $data['tb_date_added'] = $current_time;
                        $data['tb_date_modified'] = $current_time;
                        $thongbao_model->insert($data);
                    }
                }
            }
        }
        $this->_redirect('tochuccanbo/duyetchamcong/index/thang/' . $thang . '/nam/' . $nam . '/phongban/' . $phongban);
    }

}