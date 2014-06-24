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

        $date = new Zend_Date();
        $thang = $this->_getParam('thang', $date->toString("M"));
        $nam = $this->_getParam('nam', $date->toString("Y"));
        $em_id = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $hesocbModel = new Front_Model_HeSo();
        $hesoModel = new Front_Model_EmployeesHeso();
        $phucapModel = new Front_Model_EmployeesPhuCap();
        $em_info = $emModel->fetchRow("em_id=$em_id");
        $em_he_so = $hesoModel->getCurrentHeSo($thang, $nam, $em_id);
        $em_phu_cap = $phucapModel->getCurrentHeSo($thang, $nam, $em_id);
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
        $this->view->phu_cap = $em_phu_cap;
        $this->view->he_so_cb = $lastHeSoLuong;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->nv_id = $em_id;
        $this->view->bang_luong = $bang_luong;
        $this->view->phan_loai = $phan_loai;
        if ($nam > $date->toString("Y") || ($nam == $date->toString("Y") && $thang > $date->toString("M"))) {
            $this->_helper->viewRenderer->setRender('thoigian');
        }
    }

    public function heso03Action() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Tính lương - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = new Zend_Date();
        $date->subMonth(1);

        $thang = $this->_getParam('thang', $date->toString("M"));
        $nam = $this->_getParam('nam', $date->toString("Y"));
        $em_id = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $hesocbModel = new Front_Model_HeSo();
        $hesoModel = new Front_Model_EmployeesHeso();
        $phucapModel = new Front_Model_EmployeesPhuCap();
        $em_info = $emModel->fetchRow("em_id=$em_id");
        $em_he_so = $hesoModel->getCurrentHeSo($thang, $nam, $em_id);
        $em_phu_cap = $phucapModel->getCurrentHeSo($thang, $nam, $em_id);
        $lastHeSoLuong = $hesocbModel->fetchOneData(array('hs_ngay_bat_dau' => date("$nam-$thang-1")), 'hs_ngay_bat_dau DESC');

        $bangluongModel = new Front_Model_BangLuong();
        $bang_luong = $bangluongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $ketquaModel = new Front_Model_DanhGia();
        $phan_loai = $ketquaModel->getPhanLoai($em_id, $thang, $nam);
        $this->view->em_info = $em_info;
        $this->view->he_so = $em_he_so;
        $this->view->phu_cap = $em_phu_cap;
        $this->view->he_so_cb = $lastHeSoLuong;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->nv_id = $em_id;
        $this->view->bang_luong = $bang_luong;
        $this->view->phan_loai = $phan_loai;
        if ($nam > $date->toString("Y") || ($nam == $date->toString("Y") && $thang > $date->toString("M"))) {
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
            $bl_hs_pc_thu_hut = $this->_request->getParam('bl_hs_pc_thu_hut', 0);
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
            if ($bl_hs_pc_thu_hut == '')
                $bl_hs_pc_thu_hut = 0;
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
            if (!is_numeric($bl_hs_pc_thu_hut))
                $error_message = array('PC thu hút phải là dạng số');
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
                    'bl_pc_thu_hut' => $bl_hs_pc_thu_hut,
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

    public function luuheso03Action() {
        $this->_helper->layout()->disableLayout();
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $my_id = $identity->em_id;
        $error_message = array();
        $success_message = '';
        $process_status = 0;
        if ($this->_request->isPost()) {
            $bl_em_id = $this->_request->getParam('bl_em_id', 0);
            $bl_thang = $this->_request->getParam('bl_thang', 0);
            $bl_nam = $this->_request->getParam('bl_nam', 0);
            $bl_phan_loai_he_so = $this->_request->getParam('bl_phan_loai_he_so', 0);
            $bl_tong_he_so = $this->_request->getParam('bl_tong_he_so', 0);
            $bl_tong_he_so_ca_nhan = $this->_request->getParam('bl_tong_he_so_ca_nhan', 0);
            $bl_tong_he_so_plld = $this->_request->getParam('bl_tong_he_so_plld', 0);
            $bl_tam_chi_dau_vao = $this->_request->getParam('bl_tam_chi_dau_vao', 0);
            $sl_phan_loai = $this->_request->getParam('sl_phan_loai', 'O');

            if ($bl_hs_pc_thu_hut == '')
                $bl_hs_pc_thu_hut = 0;


            if (!is_numeric($bl_em_id) || !$bl_em_id)
                $error_message = array('Thông tin nhân viên không chính xác');



            if (!sizeof($error_message)) {
                $bangluongModel = new Front_Model_BangLuong();
                $check_isset = $bangluongModel->fetchByDate($bl_em_id, "$bl_nam-$bl_thang-01 00:00:00", "$bl_nam-$bl_thang-31 23:59:59");
                $current_time = new Zend_Db_Expr('NOW()');
                $data = array(
                    'bl_ptccb_id' => $my_id,
                    'bl_phan_loai' => $sl_phan_loai,
                    'bl_phan_loai_he_so' => $bl_phan_loai_he_so,
                    'bl_tong_he_so' => $bl_tong_he_so,
                    'bl_tong_he_so_ca_nhan' => $bl_tong_he_so_ca_nhan,
                    'bl_tong_he_so_plld' => $bl_tong_he_so_plld,
                    'bl_tam_chi_dau_vao' => $bl_tam_chi_dau_vao,
                    'bl_date_modified' => $current_time
                );

                $bl_id = $check_isset->bl_id;
                $process_status = $bangluongModel->update($data, "bl_id=$bl_id");
            }
        }
        $this->view->process_status = $process_status;
    }

    public function auto05Action() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Tinh lương hệ số 0.5 - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $my_id = $identity->em_id;

        $date = new Zend_Date();
        $thang = $this->_getParam('thang', $date->toString('M'));
        $nam = $this->_getParam('nam', $date->toString('Y'));
        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $chucvuModel = new Front_Model_Chucvu();
        $hesocbModel = new Front_Model_HeSo();
        $hesoModel = new Front_Model_EmployeesHeso();
        $phucapModel = new Front_Model_EmployeesPhuCap();
        $bangluongModel = new Front_Model_BangLuong();

        $lastHeSoLuong = $hesocbModel->fetchOneData(array('hs_ngay_bat_dau' => date("$nam-$thang-1")), 'hs_ngay_bat_dau DESC');
        $he_so_tang_them = 0.5;

        $pb_selected = $this->_getParam('phongban', 0);
        $phong_ban_id = $list_phongban_selected = $phong_ban = Array();

        $phong_ban_id[] = $pb_selected;
        $list_phongban_selected = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban);
        $list_chuc_vu = $chucvuModel->fetchAll();

        $list_nhan_vien = $phong_ban_options = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban_options);

        if (sizeof($list_phongban_selected)) {
            foreach ($list_phongban_selected as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_id;
            }
        }
        $phong_ban_id = implode(',', $phong_ban_id);
        if ($pb_selected)
            $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");

        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $bang_luong = $bangluongModel->fetchByDate($v, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
                if (!$bang_luong) {
                    $em_he_so = $hesoModel->getCurrentHeSo($thang, $nam, $v);
                    $em_phu_cap = $phucapModel->getCurrentHeSo($thang, $nam, $v);

                    $luong_toi_thieu = $lastHeSoLuong->hs_luong_co_ban; //luong co ban
                    $giai_doan = $em_he_so->eh_giai_doan; //0: chinh thuc, 1: thu viec
                    $loai_luong = $em_he_so->eh_loai_luong; //0: bien che, 1: hop dong

                    $he_so_luong = $em_he_so->eh_he_so;
                    $luong_thu_viec = 0;
                    if ($giai_doan) {
                        $luong_thu_viec = $lastHeSoLuong->hs_he_so_luong_thuc_tap; //so phan tram so voi luong chinh
                        $he_so_luong = number_format($em_he_so->eh_he_so * (100 - $luong_thu_viec) / 100, 2);
                    }

                    $bhxh = ($lastHeSoLuong->hs_bhxh > 0 ? $lastHeSoLuong->hs_bhxh : 0); //bao hiem xa hoi
                    $bhyt = ($lastHeSoLuong->hs_bhyt > 0 ? $lastHeSoLuong->hs_bhyt : 0); //bao hiem y te

                    $hs_pc_chuc_vu = $em_phu_cap->eh_pc_cong_viec; //he so pc chuc vu            
                    $hs_pc_trach_nhiem = $em_phu_cap->eh_pc_trach_nhiem; //he so pc trach nhiem            
                    $hs_pc_khu_vuc = $em_phu_cap->eh_pc_kv; //he so pc khu vuc            
                    $hs_pc_tnvk_phan_tram = $em_phu_cap->eh_pc_tnvk_phan_tram; //he so pc tnvk                    

                    $time_tham_niem = strtotime($em_phu_cap->eh_tham_niem); //tinh tham nien tu ngay
                    $hs_pc_tham_nien_phan_tram = $em_phu_cap->eh_pc_tham_nien;
                    $uu_dai_nghe = $em_phu_cap->eh_pc_udn_phan_tram; //he so pc uu dai nghe
                    $cong_vu = $em_phu_cap->eh_pc_cong_vu_phan_tram; //he so pc cong vu
                    $thu_hut = $em_phu_cap->eh_pc_thu_hut; //he so pc thu hut
                    $kiem_nhiem = $em_phu_cap->eh_pc_kiem_nhiem; //he so pc kiem nhiem
                    $hs_pc_khac = $em_phu_cap->eh_pc_khac; //he so pc khac
                    $hs_pc_khac_type = $em_phu_cap->eh_pc_khac_type; //0: he so, 1: phan tram

                    if (!$giai_doan && !$loai_luong) {
                        $hs_pc_tnvk = ($he_so_luong + $hs_pc_chuc_vu) * $hs_pc_tnvk_phan_tram / 100;
                    } else {
                        $hs_pc_tnvk = $hs_pc_chuc_vu * $hs_pc_tnvk_phan_tram / 100;
                    }

                    if (!$giai_doan) {
                        $hs_pc_tham_nien = ($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $hs_pc_tham_nien_phan_tram / 100;
                    } else {
                        $hs_pc_tham_nien = ($hs_pc_chuc_vu + $hs_pc_tnvk) * $hs_pc_tham_nien_phan_tram / 100;
                    }

                    $hs_pc_uu_dai_nghe = ($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $uu_dai_nghe / 100;
                    $hs_pc_cong_vu = ($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $cong_vu / 100;
                    $hs_pc_thu_hut = ($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $thu_hut / 100;

                    if (!$giai_doan && !$loai_luong) {
                        $hs_pc_kiem_nhiem = ($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $kiem_nhiem / 100;
                    } else {
                        $hs_pc_kiem_nhiem = ($hs_pc_chuc_vu + $hs_pc_tnvk) * $kiem_nhiem / 100;
                    }

                    $hs_pc_khac_he_so = $hs_pc_khac;
                    if ($hs_pc_khac_type) {
                        $hs_pc_khac_he_so = $hs_pc_khac / 100;
                    }

                    $current_time = new Zend_Db_Expr('NOW()');
                    $data = array(
                        'bl_em_id' => $v,
                        'bl_ptccb_id' => $my_id,
                        'bl_luong_toi_thieu' => $luong_toi_thieu,
                        'bl_luong_thu_viec' => $luong_thu_viec,
                        'bl_giai_doan' => $giai_doan,
                        'bl_loai_luong' => $loai_luong,
                        'bl_bhxh' => $bhxh,
                        'bl_bhyt' => $bhyt,
                        'bl_tham_nien' => $hs_pc_tham_nien_phan_tram,
                        'bl_time_tham_nien' => date('Y-m-d', $time_tham_niem),
                        'bl_pc_kiem_nhiem' => $kiem_nhiem,
                        'bl_pc_tang_them' => $he_so_tang_them,
                        'bl_hs_luong' => $he_so_luong,
                        'bl_hs_pc_cong_viec' => $hs_pc_chuc_vu,
                        'bl_hs_pc_trach_nhiem' => $hs_pc_trach_nhiem,
                        'bl_hs_pc_khu_vuc' => $hs_pc_khu_vuc,
                        'bl_hs_pc_tnvk' => $hs_pc_tnvk_phan_tram,
                        'bl_hs_pc_udn' => $uu_dai_nghe,
                        'bl_hs_pc_cong_vu' => $cong_vu,
                        'bl_pc_thu_hut' => $thu_hut,
                        'bl_hs_pc_khac' => $hs_pc_khac,
                        'bl_pc_khac_type' => $hs_pc_khac_type,
                        'bl_date_modified' => $current_time,
                        'bl_date_added' => $current_time,
                        'bl_date' => "$nam-$thang-1"
                    );
                    $bangluongModel->insert($data);
                }
            }
        }

        $this->view->list_nhan_vien = $list_nhan_vien;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->pb_id = $pb_selected;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->list_chuc_vu = $list_chuc_vu;
    }

    public function auto03Action() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Tính lương hệ số 0.3 - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $my_id = $identity->em_id;

        $date = new Zend_Date();
        $date->subMonth(1);
        $thang = $this->_getParam('thang', $date->toString('M'));
        $nam = $this->_getParam('nam', $date->toString('Y'));
        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $chucvuModel = new Front_Model_Chucvu();
        $hesocbModel = new Front_Model_HeSo();
        $hesoModel = new Front_Model_EmployeesHeso();
        $bangluongModel = new Front_Model_BangLuong();
        $danhgiaModel = new Front_Model_DanhGia();

        $lastHeSoLuong = $hesocbModel->fetchOneData(array('hs_ngay_bat_dau' => date("$nam-$thang-1")), 'hs_ngay_bat_dau DESC');
        $he_so_tang_them = 0.5;
        $he_so_phan_loai = array('O' => 0, 'A' => 1.2, 'B' => 1, 'C' => 0.8, 'D' => 0);

        $pb_selected = $this->_getParam('phongban', 0);
        $phong_ban_id = $list_phongban_selected = $phong_ban = Array();

        $phong_ban_id[] = $pb_selected;
        $list_phongban_selected = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban);
        $list_chuc_vu = $chucvuModel->fetchAll();

        $list_nhan_vien = $phong_ban_options = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban_options);

        if (sizeof($list_phongban_selected)) {
            foreach ($list_phongban_selected as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_id;
            }
        }
        $phong_ban_id = implode(',', $phong_ban_id);
        if ($pb_selected)
            $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");

        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $bang_luong = $bangluongModel->fetchByDate($v, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
                $danh_gia = $danhgiaModel->fetchRow("dg_em_id= $v and dg_thang=$thang and dg_nam=$nam");
                if ($bang_luong && $danh_gia && $danh_gia->dg_ptccb_status != '') {
                    $luong_thu_viec = 0;
                    $luong_toi_thieu = $bang_luong->bl_luong_toi_thieu; //luong co ban
                    $giai_doan = $bang_luong->bl_giai_doan; //0: chinh thuc, 1: thu viec
                    $loai_luong = $bang_luong->bl_loai_luong; //0: bien che, 1: hop dong
                    $luong_thu_viec = $bang_luong->bl_luong_thu_viec; //so phan tram so voi luong chinh
                    $he_so_luong = $bang_luong->bl_hs_luong;
                    $bhxh = $bang_luong->bl_bhxh;
                    $bhyt = $bang_luong->bl_bhyt;
                    $hs_pc_chuc_vu = $bang_luong->bl_hs_pc_cong_viec;
                    $hs_pc_trach_nhiem = $bang_luong->bl_hs_pc_trach_nhiem;
                    $hs_pc_khu_vuc = $bang_luong->bl_hs_pc_khu_vuc;
                    $hs_pc_tnvk_phan_tram = $bang_luong->bl_hs_pc_tnvk;
                    $hs_pc_tham_nien_phan_tram = $bang_luong->bl_tham_nien;
                    $uu_dai_nghe = $bang_luong->bl_hs_pc_udn;
                    $cong_vu = $bang_luong->bl_hs_pc_cong_vu;
                    $hs_pc_khac = $bang_luong->bl_hs_pc_khac;
                    $he_so_tang_them = $bang_luong->bl_pc_tang_them;
                    $hs_pc_khac_type = $bang_luong->bl_pc_khac_type;
                    $hs_pc_thu_hut_phan_tram = $bang_luong->bl_pc_thu_hut;
                    $tong_hs_luong_pc = $bang_luong->bl_tong_he_so;
                    $tong_hs_luong_pc_ca_nhan = $bang_luong->bl_tong_he_so_ca_nhan;
                    $tong_hs_luong_pc_plld = $bang_luong->bl_tong_he_so_plld;
                    $tam_chi_dau_vao = $bang_luong->bl_tam_chi_dau_vao;

                    $phan_loai = $danh_gia->dg_ptccb_status;
                    $phan_loai_he_so = $he_so_phan_loai[$phan_loai];


                    $luong_toi_thieu_sau_bh = (int) ($luong_toi_thieu * (100 - ($bhxh + $bhyt)) / 100);
                    $luong_toi_thieu_bhyt = (int) ($luong_toi_thieu * (100 - $bhyt) / 100);
                    $pc_trach_nhiem = $pc_cong_vu = $pc_khac = $pc_kiem_nhiem = $pc_uu_dai_nghe = $luong_toi_thieu;
                    $pc_chuc_vu = $pc_tnvk = $pc_thu_hut = $pc_tham_nien = $luong_toi_thieu_sau_bh;
                    $pc_khu_vuc = $luong_toi_thieu_bhyt;


                    if (!$giai_doan && !$loai_luong) {
                        $hs_pc_tnvk = ($he_so_luong + $hs_pc_chuc_vu) * $hs_pc_tnvk_phan_tram / 100;
                    } else {
                        $hs_pc_tnvk = $hs_pc_chuc_vu * $hs_pc_tnvk_phan_tram / 100;
                    }

                    if (!$giai_doan) {
                        $hs_pc_tham_nien = ($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $hs_pc_tham_nien_phan_tram / 100;
                    } else {
                        $hs_pc_tham_nien = ($hs_pc_chuc_vu + $hs_pc_tnvk) * $hs_pc_tham_nien_phan_tram / 100;
                    }

                    $hs_pc_thu_hut = ($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $hs_pc_thu_hut_phan_tram / 100;
                    $hs_pc_uu_dai_nghe = ($he_so_luong + $hs_pc_chuc_vu + $hs_pc_tnvk) * $uu_dai_nghe / 100;

                    $thanh_tien_pc_khac = $hs_pc_khac * $pc_khac;

                    $hs_pc_khac_he_so = $hs_pc_khac;
                    if ($hs_pc_khac_type) {
                        $thanh_tien_pc_khac = $thanh_tien_pc_khac / 100;
                        $hs_pc_khac_he_so = $hs_pc_khac / 100;
                    }

                    $tong_hs_luong_pc = $he_so_luong + $hs_pc_chuc_vu + $hs_pc_trach_nhiem + $hs_pc_khu_vuc + $hs_pc_tnvk + $hs_pc_tham_nien + $hs_pc_uu_dai_nghe + $hs_pc_khac_he_so + $hs_pc_thu_hut;
                    $tong_hs_luong_pc_ca_nhan = $he_so_luong + $hs_pc_chuc_vu + $hs_pc_khu_vuc + $hs_pc_tnvk + $hs_pc_uu_dai_nghe;
                    $tong_hs_luong_pc_plld = $tong_hs_luong_pc_ca_nhan * $phan_loai_he_so;
                    $tam_chi_dau_vao = $tong_hs_luong_pc * $luong_toi_thieu * 0.5;

                    $data = array(
                        'bl_ptccb_id' => $my_id,
                        'bl_phan_loai' => $phan_loai,
                        'bl_phan_loai_he_so' => $phan_loai_he_so,
                        'bl_tong_he_so' => $tong_hs_luong_pc,
                        'bl_tong_he_so_ca_nhan' => $tong_hs_luong_pc_ca_nhan,
                        'bl_tong_he_so_plld' => $tong_hs_luong_pc_plld,
                        'bl_tam_chi_dau_vao' => $tam_chi_dau_vao
                    );

                    $bl_id = $bang_luong->bl_id;
                    $bangluongModel->update($data, "bl_id=$bl_id");
                }
            }
        }

        $this->view->list_nhan_vien = $list_nhan_vien;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->pb_id = $pb_selected;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->list_chuc_vu = $list_chuc_vu;
    }

    public function auto02Action() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Tính lương hệ số 0.2 - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $my_id = $identity->em_id;

        $date = new Zend_Date();
        $date->subMonth(1);
        $thang = $this->_getParam('thang', $date->toString('M'));
        $nam = $this->_getParam('nam', $date->toString('Y'));
        $emModel = new Front_Model_Employees();
        $phongbanModel = new Front_Model_Phongban();
        $chucvuModel = new Front_Model_Chucvu();
        $hesocbModel = new Front_Model_HeSo();
        $hesoModel = new Front_Model_EmployeesHeso();
        $bangluongModel = new Front_Model_BangLuong();
        $danhgiaModel = new Front_Model_DanhGia();

        $lastHeSoLuong = $hesocbModel->fetchOneData(array('hs_ngay_bat_dau' => date("$nam-$thang-1")), 'hs_ngay_bat_dau DESC');
        $he_so_tang_them = 0.5;
        $he_so_phan_loai = array('O' => 0, 'A' => 1.2, 'B' => 1, 'C' => 0.8, 'D' => 0);

        $pb_selected = $this->_getParam('phongban', 0);
        $phong_ban_id = $list_phongban_selected = $phong_ban = Array();

        $phong_ban_id[] = $pb_selected;
        $list_phongban_selected = $phongbanModel->fetchDataStatus($pb_selected, $phong_ban);
        $list_chuc_vu = $chucvuModel->fetchAll();

        $list_nhan_vien = $phong_ban_options = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban_options);

        if (sizeof($list_phongban_selected)) {
            foreach ($list_phongban_selected as $phong_ban_info) {
                $phong_ban_id[] = $phong_ban_info->pb_id;
            }
        }
        $phong_ban_id = implode(',', $phong_ban_id);
        if ($pb_selected)
            $list_nhan_vien = $emModel->fetchAll("em_phong_ban in ($phong_ban_id) and em_status=1");

        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $bang_luong = $bangluongModel->fetchByDate($v, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");
                if ($bang_luong && $bang_luong->bl_tong_he_so > 0) {
                    $luong_toi_thieu = $bang_luong->bl_luong_toi_thieu; //luong co ban
                    $tong_hs_luong_pc = $bang_luong->bl_tong_he_so;
                    $tam_chi_dau_vao = $tong_hs_luong_pc * $luong_toi_thieu * 0.5;
                    $data = array(
                        'bl_ptccb_id' => $my_id,
                        'bl_tam_chi_dau_vao_02' => $tam_chi_dau_vao,
                        'bl_02' => 1
                    );

                    $bl_id = $bang_luong->bl_id;
                    $bangluongModel->update($data, "bl_id=$bl_id");
                }
            }
        }

        $this->view->list_nhan_vien = $list_nhan_vien;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->pb_id = $pb_selected;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->list_chuc_vu = $list_chuc_vu;
    }

}
