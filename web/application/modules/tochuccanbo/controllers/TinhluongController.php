<?php

class Tochuccanbo_TinhluongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4010');
        if (!$check_permission) {
            $this->_redirect('index/permission/');
            exit();
        }
        $this->_arrParam = $this->_request->getParams();
        $this->_arrParam['page'] = $this->_request->getParam('page', 1);
        if ($this->_arrParam['page'] == '' || $this->_arrParam['page'] <= 0) {
            $this->_arrParam['page'] = 1;
        }
        $this->_page = $this->_arrParam['page'];
        $this->view->arrParam = $this->_arrParam;
    }

    public function indexAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Tính lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));
        $em_id = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $hesocbModel = new Front_Model_HeSo();
        $hesoModel = new Front_Model_EmployeesHeso();
        $em_info = $emModel->fetchRow("em_id=$em_id");
        $em_he_so = $hesoModel->getCurrentHeSo($thang, $nam, $em_id);
        $lastHeSoLuong = $hesocbModel->fetchOneData(array('hs_ngay_bat_dau' => date("$nam-$thang-1")), 'hs_ngay_bat_dau DESC');

        $khenthuongModel = new Front_Model_KhenThuong();
        $khen_thuong = $khenthuongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $kyluatModel = new Front_Model_KyLuat();
        $ky_luat = $kyluatModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $bangluongModel = new Front_Model_BangLuong();
        $bang_luong = $bangluongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $ketquaModel = new Front_Model_DanhGia();
        $phan_loai = $ketquaModel->getPhanLoai($em_id, $thang, $nam);
        $this->view->khen_thuong = $khen_thuong;
        $this->view->ky_luat = $ky_luat;
        $this->view->em_info = $em_info;
        $this->view->he_so = $em_he_so;
        $this->view->he_so_cb = $lastHeSoLuong;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->nv_id = $em_id;
        $this->view->bang_luong = $bang_luong;
        $this->view->phan_loai = $phan_loai;
        if ($nam > date('Y', $date) || ($nam == date('Y', $date) && $thang > date('m', $date))) {
            $this->_helper->viewRenderer->setRender('thoigian');
        }
    }

    function luuAction() {
        $this->_helper->layout()->disableLayout();
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $my_id = $identity->em_id;
        $error_message = array();
        $success_message = '';
        $process_status = 0;
        if ($this->_request->isPost()) {
            $bl_em_id = $this->_request->getParam('bl_em_id', 0);
            $bl_luong_toi_thieu = $this->_request->getParam('bl_luong_toi_thieu', 0);
            $bl_luong_thu_viec = $this->_request->getParam('bl_luong_thu_viec', 0);
            $bl_giai_doan = $this->_request->getParam('bl_giai_doan', 0);
            $bl_loai_luong = $this->_request->getParam('bl_loai_luong', 0);
            $bl_bhxh = $this->_request->getParam('bl_bhxh', 0);
            $bl_bhyt = $this->_request->getParam('bl_bhyt', 0);
            $bl_pc_kiem_nhiem = $this->_request->getParam('bl_pc_kiem_nhiem', 0);
            $bl_pc_tang_them = $this->_request->getParam('bl_pc_tang_them', 0);
            $bl_thang = $this->_request->getParam('bl_thang', 0);
            $bl_nam = $this->_request->getParam('bl_nam', 0);
            $bl_hs_luong = $this->_request->getParam('bl_hs_luong', 0);
            $bl_hs_pc_cong_viec = $this->_request->getParam('bl_hs_pc_cong_viec', 0);
            $bl_hs_pc_trach_nhiem = $this->_request->getParam('bl_hs_pc_trach_nhiem', 0);
            $bl_hs_pc_khu_vuc = $this->_request->getParam('bl_hs_pc_khu_vuc', 0);
            $bl_hs_pc_tnvk = $this->_request->getParam('bl_hs_pc_tnvk', 0);
            $bl_tham_nien = $this->_request->getParam('bl_tham_nien', 0);
            $bl_hs_pc_udn = $this->_request->getParam('bl_hs_pc_udn', 0);
            $bl_hs_pc_cong_vu = $this->_request->getParam('bl_hs_pc_cong_vu', 0);
            $bl_hs_pc_khac = $this->_request->getParam('bl_hs_pc_khac', 0);
            $bl_hs_pc_khac_type = $this->_request->getParam('bl_pc_khac_type', 0);
            $bl_tham_nien_thang = $this->_request->getParam('bl_tham_nien_thang', 0);
            $bl_tham_nien_nam = $this->_request->getParam('bl_tham_nien_nam', 0);

            if ($bl_em_id == '')
                $bl_em_id = 0;
            if ($bl_luong_toi_thieu == '')
                $bl_luong_toi_thieu = 0;
            if ($bl_luong_thu_viec == '')
                $bl_luong_thu_viec = 0;
            if ($bl_giai_doan == '')
                $bl_giai_doan = 0;
            if ($bl_loai_luong == '')
                $bl_loai_luong = 0;
            if ($bl_bhxh == '')
                $bl_bhxh = 0;
            if ($bl_bhyt == '')
                $bl_bhyt = 0;
            if ($bl_pc_kiem_nhiem == '')
                $bl_pc_kiem_nhiem = 0;
            if ($bl_pc_tang_them == '')
                $bl_pc_tang_them = 0;
            if ($bl_thang == '')
                $bl_thang = 0;
            if ($bl_nam == '')
                $bl_nam = 0;
            if ($bl_hs_luong == '')
                $bl_hs_luong = 0;
            if ($bl_hs_pc_cong_viec == '')
                $bl_hs_pc_cong_viec = 0;
            if ($bl_hs_pc_trach_nhiem == '')
                $bl_hs_pc_trach_nhiem = 0;
            if ($bl_hs_pc_khu_vuc == '')
                $bl_hs_pc_khu_vuc = 0;
            if ($bl_hs_pc_tnvk == '')
                $bl_hs_pc_tnvk = 0;
            if ($bl_tham_nien == '')
                $bl_tham_nien = 0;
            if ($bl_hs_pc_udn == '')
                $bl_hs_pc_udn = 0;
            if ($bl_hs_pc_cong_vu == '')
                $bl_hs_pc_cong_vu = 0;
            if ($bl_hs_pc_khac == '')
                $bl_hs_pc_khac = 0;

            if (!is_numeric($bl_em_id) || !$bl_em_id)
                $error_message = array('Thông tin nhân viên không chính xác');
            if (!is_numeric($bl_luong_toi_thieu))
                $error_message = array('Lương tối thiểu phải là dạng số');
            if (!is_numeric($bl_luong_thu_viec))
                $error_message = array('Lương thử việc phải là dạng số');
            if (!is_numeric($bl_giai_doan))
                $error_message = array('Giai đoạn phải là dạng số');
            if (!is_numeric($bl_loai_luong))
                $error_message = array('Loại lương phải là dạng số');
            if (!is_numeric($bl_bhxh))
                $error_message = array('BHXH phải là dạng số');
            if (!is_numeric($bl_bhyt))
                $error_message = array('BHYT phải là dạng số');
            if (!is_numeric($bl_pc_kiem_nhiem))
                $error_message = array('PC kiêm nhiệm phải là dạng số');
            if (!is_numeric($bl_pc_tang_them))
                $error_message = array('PC tăng thêm phải là dạng số');
            if (!is_numeric($bl_thang))
                $error_message = array('Tháng phải là dạng số');
            if (!is_numeric($bl_nam))
                $error_message = array('Năm phải là dạng số');
            if (!is_numeric($bl_hs_luong))
                $error_message = array('Hệ số lương phải là dạng số');
            if (!is_numeric($bl_hs_pc_cong_viec))
                $error_message = array('PC công việc phải là dạng số');
            if (!is_numeric($bl_hs_pc_trach_nhiem))
                $error_message = array('PC trách nhiệm phải là dạng số');
            if (!is_numeric($bl_hs_pc_khu_vuc))
                $error_message = array('PC khu vực phải là dạng số');
            if (!is_numeric($bl_hs_pc_tnvk))
                $error_message = array('PC TNVK phải là dạng số');
            if (!is_numeric($bl_tham_nien))
                $error_message = array('Thâm niên phải là dạng số');
            if (!is_numeric($bl_hs_pc_udn))
                $error_message = array('PC ưu đãi nghề phải là dạng số');
            if (!is_numeric($bl_hs_pc_cong_vu))
                $error_message = array('PC công vụ phải là dạng số');
            if (!is_numeric($bl_hs_pc_khac))
                $error_message = array('PC khác phải là dạng số');

            if (!sizeof($error_message)) {
                $bangluongModel = new Front_Model_BangLuong();
                $check_isset = $bangluongModel->fetchByDate($bl_em_id, "$bl_nam-$bl_thang-01 00:00:00", "$bl_nam-$bl_thang-31 23:59:59");
                $current_time = new Zend_Db_Expr('NOW()');
                $date_dieu_chinh = date_create($bl_nam . '-' . $bl_thang . '-1');
                $date_tham_nien = date_create($bl_tham_nien_nam . '-' . $bl_tham_nien_thang . '-1');
                $data = array(
                    'bl_em_id' => $bl_em_id,
                    'bl_ptccb_id' => $my_id,
                    'bl_luong_toi_thieu' => $bl_luong_toi_thieu,
                    'bl_luong_thu_viec' => $bl_luong_thu_viec,
                    'bl_giai_doan' => $bl_giai_doan,
                    'bl_loai_luong' => $bl_loai_luong,
                    'bl_bhxh' => $bl_bhxh,
                    'bl_bhyt' => $bl_bhyt,
                    'bl_pc_kiem_nhiem' => $bl_pc_kiem_nhiem,
                    'bl_pc_tang_them' => $bl_pc_tang_them,
                    'bl_hs_luong' => $bl_hs_luong,
                    'bl_hs_pc_cong_viec' => $bl_hs_pc_cong_viec,
                    'bl_hs_pc_trach_nhiem' => $bl_hs_pc_trach_nhiem,
                    'bl_hs_pc_khu_vuc' => $bl_hs_pc_khu_vuc,
                    'bl_hs_pc_tnvk' => $bl_hs_pc_tnvk,
                    'bl_tham_nien' => $bl_tham_nien,
                    'bl_time_tham_nien' => date_format($date_tham_nien, "Y-m-d H:iP"),
                    'bl_hs_pc_udn' => $bl_hs_pc_udn,
                    'bl_hs_pc_cong_vu' => $bl_hs_pc_cong_vu,
                    'bl_hs_pc_khac' => $bl_hs_pc_khac,
                    'bl_pc_khac_type' => $bl_hs_pc_khac_type,
                    'bl_date_modified' => $current_time
                );

                if (!$check_isset) {
                    $data['bl_date_added'] = $current_time;
                    $data['bl_date'] = date_format($date_dieu_chinh, "Y-m-d H:iP");
                    $process_status = $bangluongModel->insert($data);
                } else {
                    $bl_id = $check_isset->bl_id;
                    $process_status = $bangluongModel->update($data, "bl_id=$bl_id");
                }                
            }
        }
        $this->view->process_status = $process_status;
    }

}