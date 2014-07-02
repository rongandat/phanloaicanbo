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

        $date = new Zend_Date();
        $date->subMonth(1);
        $thang = $this->_getParam('thang', $date->toString("M"));
        $nam = $this->_getParam('nam', $date->toString("Y"));

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

        if (!$pb_selected) {
            //$list_employees = $emModel->fetchData(array('em_delete' => 0));
            $list_employees = $emModel->fetchAll();
        } else {
            $select = $emModel->select()->where('em_phong_ban in (?)', $pb_ids);
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
            if ($find_row) {
                $dg_id = $find_row->dg_id;
                $data_update = array('dg_ptccb_status' => $c_status);
                if ($c_status == '') {
                    $data_update['dg_don_vi_status'] = $c_status;
                }
                $process_status = $danhgiaModel->update($data_update, "dg_id=$dg_id");

                if ($process_status) {
                    $new_status = $c_status;
                    if($new_status =='O'){
                        $new_status = '-';
                    }
                    $bangluongModel = new Front_Model_BangLuong();
                    $bang_luong = $bangluongModel->fetchByDate($em_id, "$dg_nam-$dg_thang-01 00:00:00", "$dg_nam-$dg_thang-31 23:59:59");
                    /*if ($bang_luong && $c_status != '') {
                        $he_so_phan_loai = array('A' => 1.2, 'B' => 1, 'C' => 0.8, 'D' => 0, 'O' => 0);
                        $bl_id = $bang_luong->bl_id;
                        $bangluongModel->update(array('bl_phan_loai' => $c_status, 'bl_phan_loai_he_so' => $he_so_phan_loai[$c_status]), "bl_id=$bl_id");
                    }*/

                    $thongbao_model = new Front_Model_ThongBao();
                    $current_time = new Zend_Db_Expr('NOW()');
                    if ($c_status == '') {
                        $em_info = $this->view->viewGetEmployeeInfo($em_id);
                        $data = array();
                        $data['tb_from'] = 0;
                        $data['tb_tieu_de'] = '[Thông báo] Phòng tổ chức không duyệt đánh giá phân loại.';
                        $data['tb_noi_dung'] = 'Đánh giá phân phân loại theo tháng của bạn tháng ' . $dg_thang . '-' . $dg_nam . ' không được duyệt.<br/> Yêu cầu bạn hãy <strong><a href="' . $this->view->baseUrl('canhan/danhgiaphanloai') . '">click vào đây</a></strong> để xét chỉnh sửa.';
                        $data['tb_status'] = 0;
                        $data['tb_date_added'] = $current_time;
                        $data['tb_date_modified'] = $current_time;
                        $data['tb_to'] = $em_id;
                        $thongbao_model->insert($data);

                        $data['tb_noi_dung'] = 'Đánh giá phân loại của <strong>' . $em_info->em_ho . ' ' . $em_info->em_ten . '</strong> tháng ' . $dg_thang . '-' . $dg_nam . ' phòng tổ chức không duyệt.<br/> Bạn hãy <strong><a href="' . $this->view->baseUrl('donvi/duyetphanloai') . '">click vào đây</a></strong> để xét duyệt lại.';
                        $don_vi_user = $this->_helper->GlobalHelpers->checkDonViUsers($em_id, 3005);
                        foreach ($don_vi_user as $user) {
                            $data['tb_to'] = $user->em_id;
                            $thongbao_model->insert($data);
                        }
                    }
                }
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
            $status = (int) $this->_request->getParam('status', 0);
            $danhgiaModel = new Front_Model_DanhGia();

            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $find_row = $danhgiaModel->fetchRow("dg_em_id=$v and dg_thang=$thang and dg_nam=$nam");
                if ($find_row) {
                    if ($status) {
                        $process_status = $danhgiaModel->update(array('dg_ptccb_status' => $find_row->dg_don_vi_status), "dg_id=$find_row->dg_id");
                    } else {
                        $process_status = $danhgiaModel->update(array('dg_ptccb_status' => '', 'dg_don_vi_status' => ''), "dg_id=$find_row->dg_id");
                    }
                    if ($process_status) {
                        /*$bangluongModel = new Front_Model_BangLuong();
                        $bang_luong = $bangluongModel->fetchByDate($find_row->dg_em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
                        if ($bang_luong) {
                            $he_so_phan_loai = array('A' => 1.2, 'B' => 1, 'C' => 0.8);
                            $bl_id = $bang_luong->bl_id;
                            $bangluongModel->update(array('bl_phan_loai' => $find_row->dg_don_vi_status, 'bl_phan_loai_he_so' => $he_so_phan_loai[$find_row->dg_don_vi_status]), "bl_id=$bl_id");
                        }*/


                        $thongbao_model = new Front_Model_ThongBao();
                        $current_time = new Zend_Db_Expr('NOW()');
                        if (!$status) {
                            $em_info = $this->view->viewGetEmployeeInfo($find_row->dg_em_id);
                            $data = array();
                            $data['tb_from'] = 0;
                            $data['tb_tieu_de'] = '[Thông báo] Phòng tổ chức không duyệt đánh giá phân loại.';
                            $data['tb_noi_dung'] = 'Đánh giá phân phân loại theo tháng của bạn tháng ' . $thang . '-' . $nam . ' không được duyệt.<br/> Yêu cầu bạn hãy <strong><a href="' . $this->view->baseUrl('canhan/danhgiaphanloai') . '">click vào đây</a></strong> để xét chỉnh sửa.';
                            $data['tb_status'] = 0;
                            $data['tb_date_added'] = $current_time;
                            $data['tb_date_modified'] = $current_time;
                            $data['tb_to'] = $find_row->dg_em_id;
                            $thongbao_model->insert($data);

                            $data['tb_noi_dung'] = 'Đánh giá phân loại của <strong>' . $em_info->em_ho . ' ' . $em_info->em_ten . '</strong> tháng ' . $thang . '-' . $nam . ' phòng tổ chức không duyệt.<br/> Bạn hãy <strong><a href="' . $this->view->baseUrl('donvi/duyetphanloai') . '">click vào đây</a></strong> để xét duyệt lại.';
                            $don_vi_user = $this->_helper->GlobalHelpers->checkDonViUsers($find_row->dg_em_id, 3005);
                            foreach ($don_vi_user as $user) {
                                $data['tb_to'] = $user->em_id;
                                $thongbao_model->insert($data);
                            }
                        }
                    }
                }
            }
            $this->_redirect('tochuccanbo/duyetphanloai/index/thang/' . $thang . '/nam/' . $nam . '/phongban/' . $phongban);
        }
    }

}