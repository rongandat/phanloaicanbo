<?php

class Tochuccanbo_DuyetthemgioController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4005');
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
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $ltgModel = new Front_Model_LamThemGio();

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
            $list_lam_them_gio = $ltgModel->fetchByPhongBan(array(), "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        } else {
            $list_lam_them_gio = $ltgModel->fetchByPhongBan($pb_ids, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
        }

        $this->view->lam_them_gio = $list_lam_them_gio;
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
            $item_id = $this->_arrParam['item_id'];
            $item_status = $this->_arrParam['item_status'];
            if ($item_status > 1) {
                $item_status = 1;
            }
            if ($item_status < 0) {
                $item_status = -1;
            }
            $process_status = 1;
            $current_time = new Zend_Db_Expr('NOW()');
            $ltgModel = new Front_Model_LamThemGio();
            $process_status = $ltgModel->update(array('ltg_tccb_status' => $item_status), "ltg_id=$item_id");
            if ($process_status) {
                $thongbao_model = new Front_Model_ThongBao();
                $row_content = $ltgModel->fetchRow(array('ltg_id' => $item_id));
                $data = array();
                $data['tb_from'] = 0;
                $data['tb_to'] = $row_content->ltg_em_id;
                $data['tb_tieu_de'] = '[Làm thêm giờ] Khai báo làm thêm giờ đã được duyệt.';
                $data['tb_noi_dung'] = 'Khai báo làm thêm giờ của bạn đã được duyệt.<br> Ngày: ' . date('d-m-Y', strtotime($row_content->ltg_ngay)) . '<br> Giờ bắt đầu: ' . $row_content->ltg_gio_bat_dau . ':' . $row_content->ltg_phut_bat_dau . ' <br> Giờ kết thúc: ' . $row_content->ltg_gio_ket_thuc . ':' . $row_content->ltg_phut_ket_thuc;
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;

                if (!$item_status) {
                    $data['tb_tieu_de'] = '[Làm thêm giờ] Khai báo làm thêm giờ đã không được chấp nhận.';
                    $data['tb_noi_dung'] = 'Khai báo làm thêm giờ của bạn đã không được duyệt.<br> Ngày: ' . date('d-m-Y', strtotime($row_content->ltg_ngay)) . '<br> Giờ bắt đầu: ' . $row_content->ltg_gio_bat_dau . ':' . $row_content->ltg_phut_bat_dau . ' <br> Giờ kết thúc: ' . $row_content->ltg_gio_ket_thuc . ':' . $row_content->ltg_phut_ket_thuc;
                    $new_status = 'Không duyệt';
                }
                $thongbao_model->insert($data);
            }
        }
        $this->view->new_status = $new_status;
        $this->view->process_status = $process_status;
    }

}