<?php

class Donvi_DuyetphanloaiController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '3005');
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
        $option = array('layout' => 'donvi/layout',
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

        $tieuchiModel = new Front_Model_TieuChiDanhGiaCB();
        $list_tieuchi = $tieuchiModel->fetchData(array('tcdgcb_status' => 1), 'tcdgcb_order ASC');

        $ketquaModel = new Front_Model_DanhGiaKetQuaCV();
        $list_ketqua = $ketquaModel->fetchData(array('dgkqcv_status' => 1), 'dgkqcv_order ASC');
        $this->view->tieu_chi = $list_tieuchi;
        $this->view->ket_qua = $list_ketqua;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->list_nhan_vien = $list_nhan_vien;
    }

    public function jqupdatestatusAction() {
        $this->_helper->layout()->disableLayout();
        $process_status = 0;
        $new_status = '';
        if ($this->_request->isPost()) {
            $c_id = $this->_arrParam['dg_id'];
            $c_status = strtoupper(trim($this->_arrParam['dg_status']));
            $danhgiaModel = new Front_Model_DanhGia();
            $process_status = $danhgiaModel->update(array('dg_don_vi_status' => $c_status), "dg_id=$c_id and (dg_ptccb_status='' or dg_ptccb_status IS NULL)");
            if ($process_status) {
                $new_status = $c_status;
                $users = $this->_helper->GlobalHelpers->checkToChucUsers(4003);
                $current_time = new Zend_Db_Expr('NOW()');

                $thongbao_model = new Front_Model_ThongBao();
                $data = array();
                $data['tb_from'] = 0;
                $data['tb_tieu_de'] = '[Thông báo] Duyệt đánh giá phân loại.';
                $data['tb_noi_dung'] = 'Có đơn đánh giá phân phân loại theo tháng mới<br/> Bạn hãy <strong><a href="' . $this->view->baseUrl('tochuccanbo/duyetphanloai') . '">click vào đây</a></strong> để xét duyệt.';
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;

                foreach ($users as $user) {
                    $data['tb_to'] = $user->em_id;
                    $thongbao_model->insert($data);
                }
            }
        }
        if ($new_status == 'O') {
            $new_status = '-';
        }
        $this->view->new_status = $new_status;
        $this->view->process_status = $process_status;
    }

    public function jqaddstatusAction() {
        $this->_helper->layout()->disableLayout();
        $process_status = 0;
        $new_status = '';
        if ($this->_request->isPost()) {
            $em_id = $this->_arrParam['em_id'];
            $thang = $this->_arrParam['dg_thang'];
            $nam = $this->_arrParam['dg_nam'];
            $c_status = strtoupper(trim($this->_arrParam['dg_status']));
            $danhgiaModel = new Front_Model_DanhGia();

            $check_row = $danhgiaModel->fetchRow("dg_em_id=$em_id and dg_thang=$thang and dg_nam=$nam");

            if ($check_row) {
                $process_status = $danhgiaModel->update(array('dg_don_vi_status' => $c_status), "dg_id=$check_row->dg_id and (dg_ptccb_status='' or dg_ptccb_status IS NULL)");
            } else if ($c_status) {
                $current_time = new Zend_Db_Expr('NOW()');
                $process_status = $danhgiaModel->insert(array(
                    'dg_em_id' => $em_id,
                    'dg_thang' => $thang,
                    'dg_nam' => $nam,
                    'dg_cong_viec' => '',
                    'dg_ket_qua_cong_viec' => 0,
                    'dg_don_vi_status' => $c_status,
                    'dg_date_modifyed' => $current_time,
                    'dg_date_created' => $current_time
                        )
                );
            }


            if ($process_status) {
                $new_status = $c_status;
                $users = $this->_helper->GlobalHelpers->checkToChucUsers(4003);
                $current_time = new Zend_Db_Expr('NOW()');

                $thongbao_model = new Front_Model_ThongBao();
                $data = array();
                $data['tb_from'] = 0;
                $data['tb_tieu_de'] = '[Thông báo] Duyệt đánh giá phân loại.';
                $data['tb_noi_dung'] = 'Có đơn đánh giá phân phân loại theo tháng mới<br/> Bạn hãy <strong><a href="' . $this->view->baseUrl('tochuccanbo/duyetphanloai') . '">click vào đây</a></strong> để xét duyệt.';
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;
                foreach ($users as $user) {
                    $data['tb_to'] = $user->em_id;
                    $thongbao_model->insert($data);
                }
            }
        }
        if ($new_status == 'O') {
            $new_status = '-';
        }
        $this->view->new_status = $new_status;
        $this->view->process_status = $process_status;
    }

}
