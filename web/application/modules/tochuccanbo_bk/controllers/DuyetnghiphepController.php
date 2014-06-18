<?php

class Tochuccanbo_DuyetnghiphepController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4004');
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
        $option = array('layout' => '1_column/layout',
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
            $list_nghi_phep = $xnpModel->fetchByPhongBan(array(), "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        } else {
            $list_nghi_phep = $xnpModel->fetchByPhongBan($pb_ids, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        }

        $this->view->list_nghi_phep = $list_nghi_phep;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->pb_id = $pb_selected;
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
            if ($xnp_status <= 0) {
                $xnp_status = -1;
            }
            $current_time = new Zend_Db_Expr('NOW()');
            $xnpModel = new Front_Model_XinNghiPhep();
            $don_nghi_phep = $xnpModel->fetchRow("xnp_id=$xnp_id");
            if ($don_nghi_phep && $don_nghi_phep->xnp_don_vi_status > 0) {
                $process_status = $xnpModel->update(array('xnp_ptccb_status' => $xnp_status, 'xnp_don_vi_status' => $xnp_status), "xnp_id=$xnp_id");
                if ($process_status) {
                    $thongbao_model = new Front_Model_ThongBao();
                    $row_content = $xnpModel->fetchRow(array('xnp_id' => $xnp_id));
                    $data = array();
                    $data['tb_from'] = 0;
                    $data['tb_to'] = $row_content->xnp_em_id;
                    $data['tb_tieu_de'] = '[Xin nghỉ phép] Đơn xin nghỉ phép đã được duyệt.';
                    $data['tb_noi_dung'] = 'Đơn nghỉ phép của bạn đã được duyệt.<br> Lịch nghỉ của bạn bắt đầu từ ' . date('d-m-Y', strtotime($row_content->xnp_from_date)) . ' đến ngày ' . date('d-m-Y', strtotime($row_content->xnp_to_date));
                    $data['tb_status'] = 0;
                    $data['tb_date_added'] = $current_time;
                    $data['tb_date_modified'] = $current_time;

                    if (!$xnp_status) {
                        $new_status = 'Không duyệt';
                        $data['tb_tieu_de'] = '[Xin nghỉ phép] Đơn xin nghỉ phép đã không được chấp nhận.';
                        $data['tb_noi_dung'] = 'Đơn nghỉ phép của bạn đã không được chấp nhận.<br> Bạn không được phép nghỉ từ ' . date('d-m-Y', strtotime($row_content->xnp_from_date)) . ' đến ngày ' . date('d-m-Y', strtotime($row_content->xnp_to_date));
                    }

                    $thongbao_model->insert($data);
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
        $phongban = $this->_request->getParam('phongban', 0);
        $current_time = new Zend_Db_Expr('NOW()');
        if ($xnp_status > 1) {
            $xnp_status = 1;
        }
        if ($xnp_status <= 0) {
            $xnp_status = -1;
        }
        $xnpModel = new Front_Model_XinNghiPhep();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $don_nghi_phep = $xnpModel->fetchRow("xnp_id=$v");
                if ($don_nghi_phep && $don_nghi_phep->xnp_don_vi_status > 0) {
                    $process_status = $xnpModel->update(array('xnp_ptccb_status' => $xnp_status), "xnp_id=$v");
                    if ($process_status) {
                        $thongbao_model = new Front_Model_ThongBao();
                        $row_content = $xnpModel->fetchRow(array('xnp_id' => $v));
                        $data = array();
                        $data['tb_from'] = 0;
                        $data['tb_to'] = $row_content->xnp_em_id;
                        $data['tb_tieu_de'] = '[Xin nghỉ phép] Đơn xin nghỉ phép đã được duyệt.';
                        $data['tb_noi_dung'] = 'Đơn nghỉ phép của bạn đã được duyệt.<br> Lịch nghỉ của bạn bắt đầu từ ' . date('d-m-Y', strtotime($row_content->xnp_from_date)) . ' đến ngày ' . date('d-m-Y', strtotime($row_content->xnp_to_date));
                        $data['tb_status'] = 0;
                        $data['tb_date_added'] = $current_time;
                        $data['tb_date_modified'] = $current_time;

                        if (!$xnp_status) {
                            $data['tb_tieu_de'] = '[Xin nghỉ phép] Đơn xin nghỉ phép đã không được chấp nhận.';
                            $data['tb_noi_dung'] = 'Đơn nghỉ phép của bạn đã không được chấp nhận.<br> Bạn không được phép nghỉ từ ' . date('d-m-Y', strtotime($row_content->xnp_from_date)) . ' đến ngày ' . date('d-m-Y', strtotime($row_content->xnp_to_date));
                        }

                        $thongbao_model->insert($data);
                    }
                }
            }
        }
        $this->_redirect('tochuccanbo/duyetnghiphep/index/thang/' . $thang . '/nam/' . $nam . '/phongban/' . $phongban);
    }

}