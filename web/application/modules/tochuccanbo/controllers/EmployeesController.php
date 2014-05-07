<?php

class Tochuccanbo_EmployeesController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4001');
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
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $pb_selected = $this->_getParam('phongban', 0);

        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));
        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));

        $phongbanModel = new Front_Model_Phongban();
        $list_phong_ban = $phongbanModel->fetchAll();

        $phong_ban = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban);

        $phong_ban_choosed = Array();
        $phongbanModel->fetchData($pb_selected, $phong_ban_choosed);

        $check_nang_luong = $this->_helper->global->checkNangLuong();
        $check_luan_chuyen = $this->_helper->global->checkLuanChuyen();
        $check_ve_huu = $this->_helper->global->checkNghiHuu();

        $pb_ids = array($pb_selected);
        foreach ($phong_ban_choosed as $pb) {
            $pb_ids[] = $pb->pb_id;
        }

        $employeesModel = new Front_Model_Employees();
        if (!$pb_selected) {
            $list_employees = $employeesModel->fetchData();
        } else {
            $select = $employeesModel->select()->where('em_phong_ban in (?)', $pb_ids);
            $list_employees = $employeesModel->fetchAll($select);
        }
        $paginator = Zend_Paginator::factory($list_employees);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->pb_id = $pb_selected;
        $this->view->paginator = $paginator;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
        $this->view->check_nang_luong = $check_nang_luong;
        $this->view->check_luan_chuyen = $check_luan_chuyen;
        $this->view->check_ve_huu = $check_ve_huu;
    }

    public function nangluongAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $pb_selected = $this->_getParam('phongban', 0);

        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));
        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));

        $phongbanModel = new Front_Model_Phongban();
        $list_phong_ban = $phongbanModel->fetchAll();

        $phong_ban = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban);

        $phong_ban_choosed = Array();
        $phongbanModel->fetchData($pb_selected, $phong_ban_choosed);

        $pb_ids = array($pb_selected);
        foreach ($phong_ban_choosed as $pb) {
            $pb_ids[] = $pb->pb_id;
        }

        $date = time();
        $thang = date('m', $date);
        $nam = date('Y', $date);

        $employeesModel = new Front_Model_Employees();
        if (!$pb_selected) {
            $list_employees = $employeesModel->getNangLuong($thang, $nam, array());
        } else {
            $list_employees = $employeesModel->getNangLuong($thang, $nam, $pb_ids);
        }
        $paginator = Zend_Paginator::factory($list_employees);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->pb_id = $pb_selected;
        $this->view->paginator = $paginator;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
    }

    public function luanchuyenAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $pb_selected = $this->_getParam('phongban', 0);

        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));
        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));

        $phongbanModel = new Front_Model_Phongban();
        $list_phong_ban = $phongbanModel->fetchAll();

        $phong_ban = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban);

        $phong_ban_choosed = Array();
        $phongbanModel->fetchData($pb_selected, $phong_ban_choosed);

        $pb_ids = array($pb_selected);
        foreach ($phong_ban_choosed as $pb) {
            $pb_ids[] = $pb->pb_id;
        }

        $date = time();
        $thang = date('m', $date);
        $nam = date('Y', $date);

        $employeesModel = new Front_Model_Employees();
        if (!$pb_selected) {
            $list_employees = $employeesModel->getLuanChuyen($thang, $nam, array());
        } else {
            $list_employees = $employeesModel->getLuanChuyen($thang, $nam, $pb_ids);
        }
        $paginator = Zend_Paginator::factory($list_employees);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->pb_id = $pb_selected;
        $this->view->paginator = $paginator;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
    }

    public function nghihuuAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ sắp nghỉ hưu - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $pb_selected = $this->_getParam('phongban', 0);

        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));
        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));

        $phongbanModel = new Front_Model_Phongban();
        $list_phong_ban = $phongbanModel->fetchAll();

        $phong_ban = Array();
        $list_phong_ban_option = $phongbanModel->fetchData(0, $phong_ban);

        $phong_ban_choosed = Array();
        $phongbanModel->fetchData($pb_selected, $phong_ban_choosed);

        $pb_ids = array($pb_selected);
        foreach ($phong_ban_choosed as $pb) {
            $pb_ids[] = $pb->pb_id;
        }

        $employeesModel = new Front_Model_Employees();
        if (!$pb_selected) {
            $list_employees = $employeesModel->getNghiHuu(array());
        } else {
            $list_employees = $employeesModel->getNghiHuu($pb_ids);
        }
        $paginator = Zend_Paginator::factory($list_employees);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->pb_id = $pb_selected;
        $this->view->paginator = $paginator;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
    }

    public function printerAction() {
        $this->_helper->layout()->disableLayout();
        $id = $this->_getParam('id', 0);
        $employeeModel = new Front_Model_Employees();
        $employeeInfo = $employeeModel->fetchRow('em_id=' . $id);
        $this->view->employee_info = $employeeInfo;
    }

    public function searchAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);
        $usersModel = new Front_Model_Users();
        if ($this->_kw)
            $list_users = $usersModel->fetchData(array('keyword' => $this->_kw));
        else {
            $this->_redirect('hethong/users/');
            $list_users = $usersModel->fetchData();
        }

        $paginator = Zend_Paginator::factory($list_users);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
    }

    public function thongkeAction() {
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));
        $em_id = $this->_getParam('id', 0);

        $holidaysModel = new Front_Model_Holidays();
        $list_holidays = $holidaysModel->fetchData(array(), 'hld_order ASC');
        $xinnghiphepModel = new Front_Model_XinNghiPhep();
        $list_nghi_phep = $xinnghiphepModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $chamcongModel = new Front_Model_ChamCong();
        $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $em_id, 'c_thang' => $thang, 'c_nam' => $nam));

        $khenthuongModel = new Front_Model_KhenThuong();
        $khen_thuong = $khenthuongModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $kyluatModel = new Front_Model_KyLuat();
        $ky_luat = $kyluatModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $ltgModel = new Front_Model_LamThemGio();
        $list_lam_them_gio = $ltgModel->fetchData(array('ltg_em_id' => $em_id), 'ltg_date_added ASC');

        $this->view->cham_cong = $cham_cong;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->list_holidays = $list_holidays;
        $this->view->list_nghi_phep = $list_nghi_phep;
        $this->view->khen_thuong = $khen_thuong;
        $this->view->ky_luat = $ky_luat;
        $this->view->em_id = $em_id;
        $this->view->list_lam_them_gio = $list_lam_them_gio;
        $this->view->page = $this->_page;
    }

    public function addAction() {
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);


        $employeesModel = new Front_Model_Employees();

        $tinhModel = new Front_Model_Tinh();
        $list_tinh = $tinhModel->fetchData(array('tinh_status' => 1));

        $huyenModel = new Front_Model_Huyen();
        $list_huyen = $huyenModel->fetchData(array('huyen_status' => 1));

        $dantocModel = new Front_Model_Dantoc();
        $list_dan_toc = $dantocModel->fetchData(array('dt_status' => 1));

        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));

        $phongbanModel = new Front_Model_Phongban();
        $phong_ban = Array();
        $list_phong_ban = $phongbanModel->fetchData(0, $phong_ban);

        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));

        $hochamModel = new Front_Model_Hocham();
        $list_hoc_ham = $hochamModel->fetchData(array('hh_status' => 1));

        $bangcapModel = new Front_Model_Bangcap();
        $list_bang_cap = $bangcapModel->fetchData(array('bc_status' => 1));

        $chungchiModel = new Front_Model_Chungchi();
        $list_chung_chi = $chungchiModel->fetchData(array('cc_status' => 1));

        $chucvudoanModel = new Front_Model_ChucVuDoan();
        $list_chuc_vu_doan = $chucvudoanModel->fetchData(array('cvdoan_status' => 1));

        $chucvudangModel = new Front_Model_ChucVuDang();
        $list_chuc_vu_dang = $chucvudangModel->fetchData(array('cvdang_status' => 1));

        $chucvucongdoanModel = new Front_Model_ChucVuCongDoan();
        $list_chuc_vu_cong_doan = $chucvucongdoanModel->fetchData(array('cvcdoan_status' => 1));

        $lyluanModel = new Front_Model_LyLuanChinhTri();
        $list_ly_luan_chinh_tri = $lyluanModel->fetchData(array('llct_status' => 1));

        $quanlynnModel = new Front_Model_QuanLyNhaNuoc();
        $list_quan_ly_nn = $quanlynnModel->fetchData(array('qlnn_status' => 1));

        $error_message = array();
        $success_message = '';

        $min = 10;
        $max = 20 * 1024 * 1024; //20MB
        $dir = '/avatars'; //thu muc uploads
        $dir_upload = UPLOAD_PATH . $dir; //duong dan
        $upload = new Zend_File_Transfer_Adapter_Http();
        $upload->setDestination($dir_upload);
        $upload->addValidator('Count', false, array('min' => 1, 'max' => 1)) // so file duoc upload 1 lan la 1
                ->addValidator('Size', false, array('min' => $min, 'max' => $max))
                ->addValidator('Extension', false, 'jpg,png,gif,jpeg');
        $files = $upload->getFileInfo();


        if ($this->_request->isPost()) {

            $data = array();
            if ($upload->isValid()) {
                foreach ($files as $file => $info) {
                    if ($info['name'] != '') {
                        $validator = new Zend_Validate_File_Exists($dir_upload);
                        if ($validator->isValid($info['name'])) {
                            $file_name = $upload->getFileName($info['name']);
                            preg_match("/\.([^\.]+)$/", $file_name, $matches);
                            $file_ext = $matches[1];
                            $file_name = time() . '.' . $file_ext;
                            $arrFileName[$file] = $file_name;
                            $upload->addFilter('Rename', $dir_upload . '/' . $file_name);
                        } else {
                            $arrFileName[$file] = $info['name'];
                        }
                        $upload->receive($file);
                    }
                }
                $data['em_anh_the'] = $arrFileName['em_anh_the'];
            }
            //echo '<pre>';
            //Zend_Debug::dump($this->_arrParam);
            //echo '</pre>';
            $em_ho = trim($this->_arrParam['em_ho']);
            $em_ten = trim($this->_arrParam['em_ten']);
            $em_ten_khac = $this->_arrParam['em_ten_khac'];
            $em_so_chung_minh_thu = trim($this->_arrParam['em_so_chung_minh_thu']);
            $em_gioi_tinh = $this->_arrParam['em_gioi_tinh'];
            $ngay_sinh = trim($this->_arrParam['ngay_sinh']);
            $em_home_phone = trim($this->_arrParam['em_home_phone']);
            $em_phone = trim($this->_arrParam['em_phone']);
            $em_noi_sinh = trim($this->_arrParam['em_noi_sinh']);
            $em_que_quan = trim($this->_arrParam['em_que_quan']);
            $em_dia_chi = trim($this->_arrParam['em_dia_chi']);
            $em_dia_chi_tinh = $this->_arrParam['em_dia_chi_tinh'];
            $em_dia_chi_huyen = $this->_arrParam['em_dia_chi_huyen'];
            $em_dan_toc = $this->_arrParam['em_dan_toc'];
            $em_so_cong_chuc = trim($this->_arrParam['em_so_cong_chuc']);
            $em_chuc_vu = $this->_arrParam['em_chuc_vu'];
            $em_phong_ban = $this->_arrParam['em_phong_ban'];
            $ngay_tuyen_dung = trim($this->_arrParam['em_ngay_tuyen_dung']);
            $em_ngach_cong_chuc = $this->_arrParam['em_ngach_cong_chuc'];
            $em_cong_viec = trim($this->_arrParam['em_cong_viec']);
            $em_chuyen_mon = trim($this->_arrParam['em_chuyen_mon']);
            $em_chuc_vu_dang = $this->_arrParam['em_chuc_vu_dang'];
            $ngay_dang = trim($this->_arrParam['ngay_dang']);
            $em_chuc_vu_doan = $this->_arrParam['em_chuc_vu_doan'];
            $ngay_doan = trim($this->_arrParam['ngay_doan']);
            $em_chuc_vu_cong_doan = $this->_arrParam['em_chuc_vu_cong_doan'];
            $em_van_hoa_pt = trim($this->_arrParam['em_van_hoa_pt']);
            $em_hoc_ham = $this->_arrParam['em_hoc_ham'];
            $em_bang_cap = $this->_arrParam['em_bang_cap'];
            $em_ngoai_ngu = $this->_arrParam['em_ngoai_ngu'];
            $em_tin_hoc = $this->_arrParam['em_tin_hoc'];
            $em_chung_chi_khac = $this->_arrParam['em_chung_chi_khac'];
            $em_bang_scan_upload = $this->_arrParam['anh_bang_cap'];
            $em_status = $this->_arrParam['em_status'];
            /* Moi them */
            $em_ton_giao = trim($this->_arrParam['em_ton_giao']);
            $em_noi_sinh_huyen = trim($this->_arrParam['em_noi_sinh_huyen']);
            $em_noi_sinh_tinh = trim($this->_arrParam['em_noi_sinh_tinh']);
            $em_que_quan_huyen = trim($this->_arrParam['em_que_quan_huyen']);
            $em_que_quan_tinh = trim($this->_arrParam['em_que_quan_tinh']);
            $em_noi_o = trim($this->_arrParam['em_noi_o']);
            $em_noi_o_huyen = $this->_arrParam['em_noi_o_huyen'];
            $em_noi_o_tinh = $this->_arrParam['em_noi_o_tinh'];
            $em_co_quan_tuyen_dung = trim($this->_arrParam['em_co_quan_tuyen_dung']);
            $em_cong_viec_khi_tuyen_dung = trim($this->_arrParam['em_cong_viec_khi_tuyen_dung']);
            $em_khen_thuong = trim($this->_arrParam['em_khen_thuong']);
            $em_ky_luat = trim($this->_arrParam['em_ky_luat']);
            $em_ngay_nhap_ngu = trim($this->_arrParam['em_ngay_nhap_ngu']);
            $em_ngay_xuat_ngu = trim($this->_arrParam['em_ngay_xuat_ngu']);
            $em_cmt_ngay_cap = trim($this->_arrParam['em_cmt_ngay_cap']);
            $em_quan_ham = trim($this->_arrParam['em_quan_ham']);
            $em_danh_hieu = trim($this->_arrParam['em_danh_hieu']);
            $em_so_bhxh = trim($this->_arrParam['em_so_bhxh']);
            $em_tinh_trang_suc_khoe = trim($this->_arrParam['em_tinh_trang_suc_khoe']);
            $em_chieu_cao = trim($this->_arrParam['em_chieu_cao']);
            $em_can_nang = trim($this->_arrParam['em_can_nang']);
            $em_nhom_mau = trim($this->_arrParam['em_nhom_mau']);
            $em_thuong_binh = trim($this->_arrParam['em_thuong_binh']);
            $em_gia_dinh_chinh_sach = trim($this->_arrParam['em_gia_dinh_chinh_sach']);
            $em_lich_su_dao_tao = $this->_arrParam['em_lich_su_dao_tao'];
            $em_qua_trinh_cong_tac = $this->_arrParam['em_qua_trinh_cong_tac'];
            $em_gia_dinh_ban_than = $this->_arrParam['em_gia_dinh_ban_than'];
            $em_gia_dinh_vo = $this->_arrParam['em_gia_dinh_vo'];
            $em_qua_trinh_luong = $this->_arrParam['em_qua_trinh_luong'];
            $em_bi_bat = trim($this->_arrParam['em_bi_bat']);
            $em_tham_gia_to_chuc = trim($this->_arrParam['em_tham_gia_to_chuc']);
            $em_than_nhan_nuoc_ngoai = trim($this->_arrParam['em_than_nhan_nuoc_ngoai']);
            $em_ly_luan_chinh_tri = trim($this->_arrParam['em_ly_luan_chinh_tri']);
            $em_quan_ly_nha_nuoc = trim($this->_arrParam['em_quan_ly_nha_nuoc']);

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 255));


            if (!$validator_length->isValid($em_ho)) {
                $error_message[] = 'Họ không được bỏ trống và phải lớn hơn hoặc bằng 2 ký tự.';
            }

            if (!$validator_length->isValid($em_ten)) {
                $error_message[] = 'Họ không được bỏ trống và phải lớn hơn hoặc bằng 2 ký tự.';
            }


            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');

                if ($ngay_sinh != '') {
                    $ngay_sinh = str_replace('/', '-', $ngay_sinh);
                    $ngay_sinh = date('Y-m-d', strtotime($ngay_sinh));
                    $data['em_ngay_sinh'] = $ngay_sinh;
                }

                if ($ngay_tuyen_dung != '') {
                    $ngay_tuyen_dung = str_replace('/', '-', $ngay_tuyen_dung);
                    $ngay_tuyen_dung = date('Y-m-d', strtotime($ngay_tuyen_dung));
                    $data['em_ngay_tuyen_dung'] = $ngay_tuyen_dung;
                }

                if ($ngay_dang != '') {
                    $ngay_dang = str_replace('/', '-', $ngay_dang);
                    $ngay_dang = date('Y-m-d', strtotime($ngay_dang));
                    $data['em_ngay_vao_dang'] = $ngay_dang;
                }


                if ($ngay_doan != '') {
                    $ngay_doan = str_replace('/', '-', $ngay_doan);
                    $ngay_doan = date('Y-m-d', strtotime($ngay_doan));
                    $data['em_ngay_vao_doan'] = $ngay_doan;
                }


                if ($em_ngay_nhap_ngu != '') {
                    $em_ngay_nhap_ngu = str_replace('/', '-', $em_ngay_nhap_ngu);
                    $em_ngay_nhap_ngu = date('Y-m-d', strtotime($em_ngay_nhap_ngu));
                    $data['em_ngay_nhap_ngu'] = $em_ngay_nhap_ngu;
                }

                if ($em_ngay_xuat_ngu != '') {
                    $em_ngay_xuat_ngu = str_replace('/', '-', $em_ngay_xuat_ngu);
                    $em_ngay_xuat_ngu = date('Y-m-d', strtotime($em_ngay_xuat_ngu));
                    $data['em_ngay_xuat_ngu'] = $em_ngay_xuat_ngu;
                }

                if ($em_cmt_ngay_cap != '') {
                    $em_cmt_ngay_cap = str_replace('/', '-', $em_cmt_ngay_cap);
                    $em_cmt_ngay_cap = date('Y-m-d', strtotime($em_cmt_ngay_cap));
                    $data['em_cmt_ngay_cap'] = $em_cmt_ngay_cap;
                }

                $data['em_ho'] = $em_ho;
                $data['em_ten'] = $em_ten;
                $data['em_ten_khac'] = $em_ten_khac;
                $data['em_so_chung_minh_thu'] = $em_so_chung_minh_thu;

                $data['em_gioi_tinh'] = $em_gioi_tinh;
                $data['em_home_phone'] = $em_home_phone;
                $data['em_phone'] = $em_phone;
                $data['em_noi_sinh'] = $em_noi_sinh;
                $data['em_que_quan'] = $em_que_quan;
                $data['em_dia_chi'] = $em_dia_chi;
                $data['em_dia_chi_tinh'] = $em_dia_chi_tinh;
                $data['em_dia_chi_huyen'] = $em_dia_chi_huyen;
                $data['em_dan_toc'] = $em_dan_toc;
                $data['em_so_cong_chuc'] = $em_so_cong_chuc;
                $data['em_chuc_vu'] = $em_chuc_vu;
                $data['em_phong_ban'] = $em_phong_ban;
                $data['em_ngach_cong_chuc'] = $em_ngach_cong_chuc;
                $data['em_cong_viec'] = $em_cong_viec;
                $data['em_chuyen_mon'] = $em_chuyen_mon;
                $data['em_chuc_vu_dang'] = $em_chuc_vu_dang;
                $data['em_chuc_vu_doan'] = $em_chuc_vu_doan;
                $data['em_chuc_vu_cong_doan'] = $em_chuc_vu_cong_doan;
                $data['em_van_hoa_pt'] = $em_van_hoa_pt;
                $data['em_hoc_ham'] = $em_hoc_ham;
                $data['em_bang_cap'] = $em_bang_cap;
                $data['em_ngoai_ngu'] = $em_ngoai_ngu;
                $data['em_tin_hoc'] = $em_tin_hoc;
                $data['em_chung_chi_khac'] = $em_chung_chi_khac;
                $data['em_anh_bang_cap'] = serialize($em_bang_scan_upload);
                $data['em_status'] = $em_status;

                /* Moi them */
                $data['em_ton_giao'] = $em_ton_giao;
                $data['em_noi_sinh_huyen'] = $em_noi_sinh_huyen;
                $data['em_noi_sinh_tinh'] = $em_noi_sinh_tinh;
                $data['em_que_quan_huyen'] = $em_que_quan_huyen;
                $data['em_que_quan_tinh'] = $em_que_quan_tinh;
                $data['em_noi_o'] = $em_noi_o;
                $data['em_noi_o_huyen'] = $em_noi_o_huyen;
                $data['em_noi_o_tinh'] = $em_noi_o_tinh;
                $data['em_co_quan_tuyen_dung'] = $em_co_quan_tuyen_dung;
                $data['em_cong_viec_khi_tuyen_dung'] = $em_cong_viec_khi_tuyen_dung;
                $data['em_khen_thuong'] = $em_khen_thuong;
                $data['em_ky_luat'] = $em_ky_luat;

                $data['em_quan_ham'] = $em_quan_ham;
                $data['em_danh_hieu'] = $em_danh_hieu;
                $data['em_so_bhxh'] = $em_so_bhxh;
                $data['em_tinh_trang_suc_khoe'] = $em_tinh_trang_suc_khoe;
                $data['em_chieu_cao'] = $em_chieu_cao;
                $data['em_can_nang'] = $em_can_nang;
                $data['em_nhom_mau'] = $em_nhom_mau;
                $data['em_thuong_binh'] = $em_thuong_binh;
                $data['em_gia_dinh_chinh_sach'] = $em_gia_dinh_chinh_sach;
                $data['em_lich_su_dao_tao'] = serialize($em_lich_su_dao_tao);
                $data['em_qua_trinh_cong_tac'] = serialize($em_qua_trinh_cong_tac);
                $data['em_gia_dinh_ban_than'] = serialize($em_gia_dinh_ban_than);
                $data['em_gia_dinh_vo'] = serialize($em_gia_dinh_vo);
                $data['em_qua_trinh_luong'] = serialize($em_qua_trinh_luong);
                $data['em_bi_bat'] = $em_bi_bat;
                $data['em_tham_gia_to_chuc'] = $em_tham_gia_to_chuc;
                $data['em_than_nhan_nuoc_ngoai'] = $em_than_nhan_nuoc_ngoai;
                $data['em_ly_luan_chinh_tri'] = $em_ly_luan_chinh_tri;
                $data['em_quan_ly_nha_nuoc'] = $em_quan_ly_nha_nuoc;


                $data['em_date_added'] = $current_time;
                $data['em_date_modified'] = $current_time;
                $employeesModel->insert($data);
                $last_id = $employeesModel->getAdapter()->lastInsertId();
                $this->_redirect('tochuccanbo/employees/edit/id/' . $last_id . '/mess/success');
                $success_message = 'Đã thêm mới thành công.';
            }
        }
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
        $this->view->list_tinh = $list_tinh;
        $this->view->list_huyen = $list_huyen;
        $this->view->list_dan_toc = $list_dan_toc;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
        $this->view->list_hoc_ham = $list_hoc_ham;
        $this->view->list_bang_cap = $list_bang_cap;
        $this->view->list_chung_chi = $list_chung_chi;
        $this->view->list_chuc_vu_doan = $list_chuc_vu_doan;
        $this->view->list_chuc_vu_dang = $list_chuc_vu_dang;
        $this->view->list_chuc_vu_cong_doan = $list_chuc_vu_cong_doan;
        $this->view->list_ly_luan_chinh_tri = $list_ly_luan_chinh_tri;
        $this->view->list_quan_ly_nha_nuoc = $list_quan_ly_nn;
        $this->view->arrParam = $this->_arrParam;
    }

    public function editAction() {

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);


        $employeesModel = new Front_Model_Employees();

        $success_message = '';

        $id = $this->_getParam('id', 0);
        if ($this->_getParam('mess') == 'success') {
            $success_message = 'Đã thêm mới thành công.';
        }

        $employee_info = $employeesModel->fetchRow('em_id=' . $id);

        if (!$employee_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        $tinhModel = new Front_Model_Tinh();
        $list_tinh = $tinhModel->fetchData(array('tinh_status' => 1));

        $huyenModel = new Front_Model_Huyen();
        $list_huyen = $huyenModel->fetchData(array('huyen_status' => 1, 'huyen_parent' => $employee_info->em_dia_chi_tinh));

        $dantocModel = new Front_Model_Dantoc();
        $list_dan_toc = $dantocModel->fetchData(array('dt_status' => 1));

        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));

        $phongbanModel = new Front_Model_Phongban();
        $phong_ban = Array();
        $list_phong_ban = $phongbanModel->fetchData(0, $phong_ban);

        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));

        $hochamModel = new Front_Model_Hocham();
        $list_hoc_ham = $hochamModel->fetchData(array('hh_status' => 1));

        $bangcapModel = new Front_Model_Bangcap();
        $list_bang_cap = $bangcapModel->fetchData(array('bc_status' => 1));

        $chungchiModel = new Front_Model_Chungchi();
        $list_chung_chi = $chungchiModel->fetchData(array('cc_status' => 1));

        $chucvudoanModel = new Front_Model_ChucVuDoan();
        $list_chuc_vu_doan = $chucvudoanModel->fetchData(array('cvdoan_status' => 1));

        $chucvudangModel = new Front_Model_ChucVuDang();
        $list_chuc_vu_dang = $chucvudangModel->fetchData(array('cvdang_status' => 1));

        $chucvucongdoanModel = new Front_Model_ChucVuCongDoan();
        $list_chuc_vu_cong_doan = $chucvucongdoanModel->fetchData(array('cvcdoan_status' => 1));

        $lyluanModel = new Front_Model_LyLuanChinhTri();
        $list_ly_luan_chinh_tri = $lyluanModel->fetchData(array('llct_status' => 1));

        $quanlynnModel = new Front_Model_QuanLyNhaNuoc();
        $list_quan_ly_nn = $quanlynnModel->fetchData(array('qlnn_status' => 1));

        $error_message = array();

        $min = 10;
        $max = 20 * 1024 * 1024; //20MB
        $dir = '/avatars'; //thu muc uploads
        $dir_upload = UPLOAD_PATH . $dir; //duong dan
        $upload = new Zend_File_Transfer_Adapter_Http();
        $upload->setDestination($dir_upload);
        $upload->addValidator('Count', false, array('min' => 1, 'max' => 1)) // so file duoc upload 1 lan la 1
                ->addValidator('Size', false, array('min' => $min, 'max' => $max))
                ->addValidator('Extension', false, 'jpg,png,gif,jpeg');
        $files = $upload->getFileInfo();


        if ($this->_request->isPost()) {
            $data = array();
            if ($upload->isValid()) {
                foreach ($files as $file => $info) {
                    if ($info['name'] != '') {
                        $validator = new Zend_Validate_File_Exists($dir_upload);
                        if ($validator->isValid($info['name'])) {
                            $file_name = $upload->getFileName($info['name']);
                            preg_match("/\.([^\.]+)$/", $file_name, $matches);
                            $file_ext = $matches[1];
                            $file_name = time() . '.' . $file_ext;
                            $arrFileName[$file] = $file_name;
                            $upload->addFilter('Rename', $dir_upload . '/' . $file_name);
                        } else {
                            $arrFileName[$file] = $info['name'];
                        }
                        $upload->receive($file);
                    }
                }
                $data['em_anh_the'] = $arrFileName['em_anh_the'];
            }

            $em_ho = trim($this->_arrParam['em_ho']);
            $em_ten = trim($this->_arrParam['em_ten']);
            $em_ten_khac = trim($this->_arrParam['em_ten_khac']);
            $em_so_chung_minh_thu = trim($this->_arrParam['em_so_chung_minh_thu']);
            $em_gioi_tinh = $this->_arrParam['em_gioi_tinh'];
            $ngay_sinh = trim($this->_arrParam['ngay_sinh']);
            $em_home_phone = trim($this->_arrParam['em_home_phone']);
            $em_phone = trim($this->_arrParam['em_phone']);
            $em_noi_sinh = trim($this->_arrParam['em_noi_sinh']);
            $em_que_quan = trim($this->_arrParam['em_que_quan']);
            $em_dia_chi = trim($this->_arrParam['em_dia_chi']);
            $em_dia_chi_tinh = $this->_arrParam['em_dia_chi_tinh'];
            $em_dia_chi_huyen = $this->_arrParam['em_dia_chi_huyen'];
            $em_dan_toc = $this->_arrParam['em_dan_toc'];
            $em_so_cong_chuc = trim($this->_arrParam['em_so_cong_chuc']);
            $em_chuc_vu = $this->_arrParam['em_chuc_vu'];
            $em_phong_ban = $this->_arrParam['em_phong_ban'];
            $ngay_tuyen_dung = $this->_arrParam['em_ngay_tuyen_dung'];
            $em_ngach_cong_chuc = $this->_arrParam['em_ngach_cong_chuc'];
            $em_cong_viec = trim($this->_arrParam['em_cong_viec']);
            $em_chuyen_mon = trim($this->_arrParam['em_chuyen_mon']);
            $em_chuc_vu_dang = $this->_arrParam['em_chuc_vu_dang'];
            $ngay_dang = $this->_arrParam['ngay_dang'];
            $em_chuc_vu_doan = $this->_arrParam['em_chuc_vu_doan'];
            $ngay_doan = $this->_arrParam['ngay_doan'];
            $em_chuc_vu_cong_doan = $this->_arrParam['em_chuc_vu_cong_doan'];
            $em_van_hoa_pt = trim($this->_arrParam['em_van_hoa_pt']);
            $em_hoc_ham = $this->_arrParam['em_hoc_ham'];
            $em_bang_cap = $this->_arrParam['em_bang_cap'];
            $em_ngoai_ngu = $this->_arrParam['em_ngoai_ngu'];
            $em_tin_hoc = $this->_arrParam['em_tin_hoc'];
            $em_chung_chi_khac = $this->_arrParam['em_chung_chi_khac'];
            $em_bang_scan_upload = $this->_arrParam['anh_bang_cap'];
            $em_status = $this->_arrParam['em_status'];

            /* Moi them */
            $em_ton_giao = trim($this->_arrParam['em_ton_giao']);
            $em_noi_sinh_huyen = trim($this->_arrParam['em_noi_sinh_huyen']);
            $em_noi_sinh_tinh = trim($this->_arrParam['em_noi_sinh_tinh']);
            $em_que_quan_huyen = trim($this->_arrParam['em_que_quan_huyen']);
            $em_que_quan_tinh = trim($this->_arrParam['em_que_quan_tinh']);
            $em_noi_o = trim($this->_arrParam['em_noi_o']);
            $em_noi_o_huyen = $this->_arrParam['em_noi_o_huyen'];
            $em_noi_o_tinh = $this->_arrParam['em_noi_o_tinh'];
            $em_co_quan_tuyen_dung = trim($this->_arrParam['em_co_quan_tuyen_dung']);
            $em_cong_viec_khi_tuyen_dung = trim($this->_arrParam['em_cong_viec_khi_tuyen_dung']);
            $em_khen_thuong = trim($this->_arrParam['em_khen_thuong']);
            $em_ky_luat = trim($this->_arrParam['em_ky_luat']);
            $em_ngay_nhap_ngu = trim($this->_arrParam['em_ngay_nhap_ngu']);
            $em_ngay_xuat_ngu = trim($this->_arrParam['em_ngay_xuat_ngu']);
            $em_cmt_ngay_cap = trim($this->_arrParam['em_cmt_ngay_cap']);
            $em_quan_ham = trim($this->_arrParam['em_quan_ham']);
            $em_danh_hieu = trim($this->_arrParam['em_danh_hieu']);
            $em_so_bhxh = trim($this->_arrParam['em_so_bhxh']);
            $em_tinh_trang_suc_khoe = trim($this->_arrParam['em_tinh_trang_suc_khoe']);
            $em_chieu_cao = trim($this->_arrParam['em_chieu_cao']);
            $em_can_nang = trim($this->_arrParam['em_can_nang']);
            $em_nhom_mau = trim($this->_arrParam['em_nhom_mau']);
            $em_thuong_binh = trim($this->_arrParam['em_thuong_binh']);
            $em_gia_dinh_chinh_sach = trim($this->_arrParam['em_gia_dinh_chinh_sach']);
            $em_lich_su_dao_tao = $this->_arrParam['em_lich_su_dao_tao'];
            $em_qua_trinh_cong_tac = $this->_arrParam['em_qua_trinh_cong_tac'];
            $em_gia_dinh_ban_than = $this->_arrParam['em_gia_dinh_ban_than'];
            $em_gia_dinh_vo = $this->_arrParam['em_gia_dinh_vo'];
            $em_qua_trinh_luong = $this->_arrParam['em_qua_trinh_luong'];
            $em_bi_bat = trim($this->_arrParam['em_bi_bat']);
            $em_tham_gia_to_chuc = trim($this->_arrParam['em_tham_gia_to_chuc']);
            $em_than_nhan_nuoc_ngoai = trim($this->_arrParam['em_than_nhan_nuoc_ngoai']);
            $em_ly_luan_chinh_tri = trim($this->_arrParam['em_ly_luan_chinh_tri']);
            $em_quan_ly_nha_nuoc = trim($this->_arrParam['em_quan_ly_nha_nuoc']);

            $validator_length = new Zend_Validate_StringLength(array('min' => 2, 'max' => 255));

            //kiem tra dữ liệu
            if (!$validator_length->isValid($em_ho)) {
                $error_message[] = 'Họ không được bỏ trống và phải lớn hơn hoặc bằng 2 ký tự.';
            }

            if (!$validator_length->isValid($em_ten)) {
                $error_message[] = 'Họ không được bỏ trống và phải lớn hơn hoặc bằng 2 ký tự.';
            }


            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');

                if ($ngay_sinh != '') {
                    $ngay_sinh = str_replace('/', '-', $ngay_sinh);
                    $ngay_sinh = date('Y-m-d', strtotime($ngay_sinh));
                }
                $data['em_ngay_sinh'] = $ngay_sinh;

                if ($ngay_tuyen_dung != '') {
                    $ngay_tuyen_dung = str_replace('/', '-', $ngay_tuyen_dung);
                    $ngay_tuyen_dung = date('Y-m-d', strtotime($ngay_tuyen_dung));
                }
                $data['em_ngay_tuyen_dung'] = $ngay_tuyen_dung;

                if ($ngay_dang != '') {
                    $ngay_dang = str_replace('/', '-', $ngay_dang);
                    $ngay_dang = date('Y-m-d', strtotime($ngay_dang));
                }
                $data['em_ngay_vao_dang'] = $ngay_dang;


                if ($ngay_doan != '') {
                    $ngay_doan = str_replace('/', '-', $ngay_doan);
                    $ngay_doan = date('Y-m-d', strtotime($ngay_doan));
                }
                $data['em_ngay_vao_doan'] = $ngay_doan;


                if ($em_ngay_nhap_ngu != '') {
                    $em_ngay_nhap_ngu = str_replace('/', '-', $em_ngay_nhap_ngu);
                    $em_ngay_nhap_ngu = date('Y-m-d', strtotime($em_ngay_nhap_ngu));
                }
                $data['em_ngay_nhap_ngu'] = $em_ngay_nhap_ngu;

                if ($em_ngay_xuat_ngu != '') {
                    $em_ngay_xuat_ngu = str_replace('/', '-', $em_ngay_xuat_ngu);
                    $em_ngay_xuat_ngu = date('Y-m-d', strtotime($em_ngay_xuat_ngu));
                }
                $data['em_ngay_xuat_ngu'] = $em_ngay_xuat_ngu;

                if ($em_cmt_ngay_cap != '') {
                    $em_cmt_ngay_cap = str_replace('/', '-', $em_cmt_ngay_cap);
                    $em_cmt_ngay_cap = date('Y-m-d', strtotime($em_cmt_ngay_cap));
                }
                $data['em_cmt_ngay_cap'] = $em_cmt_ngay_cap;

                $data['em_ho'] = $em_ho;
                $data['em_ten'] = $em_ten;
                $data['em_ten_khac'] = $em_ten_khac;
                $data['em_so_chung_minh_thu'] = $em_so_chung_minh_thu;
                $data['em_gioi_tinh'] = $em_gioi_tinh;
                $data['em_home_phone'] = $em_home_phone;
                $data['em_phone'] = $em_phone;
                $data['em_noi_sinh'] = $em_noi_sinh;
                $data['em_que_quan'] = $em_que_quan;
                $data['em_dia_chi'] = $em_dia_chi;
                $data['em_dia_chi_tinh'] = $em_dia_chi_tinh;
                $data['em_dia_chi_huyen'] = $em_dia_chi_huyen;
                $data['em_dan_toc'] = $em_dan_toc;
                $data['em_so_cong_chuc'] = $em_so_cong_chuc;
                $data['em_chuc_vu'] = $em_chuc_vu;
                $data['em_phong_ban'] = $em_phong_ban;
                $data['em_ngach_cong_chuc'] = $em_ngach_cong_chuc;
                $data['em_cong_viec'] = $em_cong_viec;
                $data['em_chuyen_mon'] = $em_chuyen_mon;
                $data['em_chuc_vu_dang'] = $em_chuc_vu_dang;
                $data['em_chuc_vu_doan'] = $em_chuc_vu_doan;
                $data['em_chuc_vu_cong_doan'] = $em_chuc_vu_cong_doan;
                $data['em_van_hoa_pt'] = $em_van_hoa_pt;
                $data['em_hoc_ham'] = $em_hoc_ham;
                $data['em_bang_cap'] = $em_bang_cap;
                $data['em_ngoai_ngu'] = $em_ngoai_ngu;
                $data['em_tin_hoc'] = $em_tin_hoc;
                $data['em_chung_chi_khac'] = $em_chung_chi_khac;
                $data['em_anh_bang_cap'] = serialize($em_bang_scan_upload);
                $data['em_status'] = $em_status;

                /* Moi them */
                $data['em_ton_giao'] = $em_ton_giao;
                $data['em_noi_sinh_huyen'] = $em_noi_sinh_huyen;
                $data['em_noi_sinh_tinh'] = $em_noi_sinh_tinh;
                $data['em_que_quan_huyen'] = $em_que_quan_huyen;
                $data['em_que_quan_tinh'] = $em_que_quan_tinh;
                $data['em_noi_o'] = $em_noi_o;
                $data['em_noi_o_huyen'] = $em_noi_o_huyen;
                $data['em_noi_o_tinh'] = $em_noi_o_tinh;
                $data['em_co_quan_tuyen_dung'] = $em_co_quan_tuyen_dung;
                $data['em_cong_viec_khi_tuyen_dung'] = $em_cong_viec_khi_tuyen_dung;
                $data['em_khen_thuong'] = $em_khen_thuong;
                $data['em_ky_luat'] = $em_ky_luat;
                $data['em_quan_ham'] = $em_quan_ham;
                $data['em_danh_hieu'] = $em_danh_hieu;
                $data['em_so_bhxh'] = $em_so_bhxh;
                $data['em_tinh_trang_suc_khoe'] = $em_tinh_trang_suc_khoe;
                $data['em_chieu_cao'] = $em_chieu_cao;
                $data['em_can_nang'] = $em_can_nang;
                $data['em_nhom_mau'] = $em_nhom_mau;
                $data['em_thuong_binh'] = $em_thuong_binh;
                $data['em_gia_dinh_chinh_sach'] = $em_gia_dinh_chinh_sach;
                $data['em_lich_su_dao_tao'] = serialize($em_lich_su_dao_tao);
                $data['em_qua_trinh_cong_tac'] = serialize($em_qua_trinh_cong_tac);
                $data['em_gia_dinh_ban_than'] = serialize($em_gia_dinh_ban_than);
                $data['em_gia_dinh_vo'] = serialize($em_gia_dinh_vo);
                $data['em_qua_trinh_luong'] = serialize($em_qua_trinh_luong);
                $data['em_bi_bat'] = $em_bi_bat;
                $data['em_tham_gia_to_chuc'] = $em_tham_gia_to_chuc;
                $data['em_than_nhan_nuoc_ngoai'] = $em_than_nhan_nuoc_ngoai;
                $data['em_ly_luan_chinh_tri'] = $em_ly_luan_chinh_tri;
                $data['em_quan_ly_nha_nuoc'] = $em_quan_ly_nha_nuoc;

                $data['em_date_modified'] = $current_time;
                $employeesModel->update($data, 'em_id=' . $id);
                $employee_info = $employeesModel->fetchRow('em_id=' . $id);
                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }
        $this->view->employee_info = $employee_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
        $this->view->list_tinh = $list_tinh;
        $this->view->list_huyen = $list_huyen;
        $this->view->list_dan_toc = $list_dan_toc;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
        $this->view->list_hoc_ham = $list_hoc_ham;
        $this->view->list_bang_cap = $list_bang_cap;
        $this->view->list_chung_chi = $list_chung_chi;
        $this->view->list_chuc_vu_doan = $list_chuc_vu_doan;
        $this->view->list_chuc_vu_dang = $list_chuc_vu_dang;
        $this->view->list_chuc_vu_cong_doan = $list_chuc_vu_cong_doan;
        $this->view->list_ly_luan_chinh_tri = $list_ly_luan_chinh_tri;
        $this->view->list_quan_ly_nha_nuoc = $list_quan_ly_nn;
    }

    public function deleteAction() {

        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $id = $this->_getParam('id', 0);

        $employeeModel = new Front_Model_Employees();
        $error_message = array();

        $employee_info = $employeeModel->fetchRow('em_id=' . $id);
        if (!$employee_info) {
            $error_message[] = 'Không tìm thấy thông tin của cán bộ.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $employeeModel->delete('em_id=' . $id);
            }
            $this->_redirect('tochuccanbo/employees/index/page/' . $this->_page);
        }

        $this->view->employee_info = $employee_info;
        $this->view->error_message = $error_message;
    }

    public function hesoAction() {
        $this->_helper->layout()->disableLayout();
        $em_id = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow("em_id=$em_id");
        $hesoModel = new Front_Model_EmployeesHeso();
        $bacluongModel = new Front_Model_BacLuong();
        $he_so = $hesoModel->fetchRow("eh_em_id=$em_id");
        $bac_luong = $bacluongModel->fetchAll('bl_status=1', 'bl_order ASC');
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $update_em_id = $this->_request->getParam('pc_cap_nhat_em_id', 0);
            $eh_loai_luong = $this->_request->getParam('eh_loai_luong', 0);
            $eh_giai_doan = $this->_request->getParam('eh_giai_doan', 0);
            $eh_he_so = $this->_request->getParam('eh_he_so', 0);
            $eh_pc_cong_viec = $this->_request->getParam('eh_pc_cong_viec', 0);
            $eh_pc_trach_nhiem = $this->_request->getParam('eh_pc_trach_nhiem', 0);
            $eh_pc_kv = $this->_request->getParam('eh_pc_kv', 0);
            $eh_pc_tnvk_phan_tram = $this->_request->getParam('eh_pc_tnvk_phan_tram', 0);
            $eh_tham_niem = $this->_request->getParam('eh_tham_niem', 0);
            $eh_pc_udn_phan_tram = $this->_request->getParam('eh_pc_udn_phan_tram', 0);
            $eh_pc_cong_vu_phan_tram = $this->_request->getParam('eh_pc_cong_vu_phan_tram', 0);
            $eh_pc_kiem_nhiem = $this->_request->getParam('eh_pc_kiem_nhiem', 0);
            $eh_pc_khac = $this->_request->getParam('eh_pc_khac', 0);
            $eh_thang_dieu_chinh = $this->_request->getParam('eh_thang_dieu_chinh', 0);
            $eh_nam_dieu_chinh = $this->_request->getParam('eh_nam_dieu_chinh', 0);

            $eh_pc_thu_hut = $this->_request->getParam('eh_pc_thu_hut', 0);
            $eh_bac_luong = $this->_request->getParam('eh_bac_luong', 0);
            $eh_pc_khac_type = $this->_request->getParam('eh_pc_khac_type', 0);

            $eh_tham_nien_thang = $this->_request->getParam('eh_tham_nien_thang', 0);
            $eh_tham_nien_nam = $this->_request->getParam('eh_tham_nien_nam', 0);

            if (!$eh_bac_luong) {
                $error_message = array('Bạn phải chọn bậc lương.');
            }

            if (!is_numeric($eh_he_so)) {
                $error_message = array('Hệ số phải có dạng số.');
            }

            if (!is_numeric($eh_pc_thu_hut)) {
                $error_message = array('Phụ cấp thu hút phải có dạng số.');
            }

            if (!is_numeric($eh_he_so)) {
                $error_message = array('Hệ số phải có dạng số.');
            }

            if (!is_numeric($eh_pc_cong_viec)) {
                $error_message = array('Phụ cấp chức vụ phải có dạng số.');
            }
            if (!is_numeric($eh_pc_trach_nhiem)) {
                $error_message = array('Phụ cấp trách nhiệm phải có dạng số.');
            }
            if (!is_numeric($eh_pc_kv)) {
                $error_message = array('Phụ cấp khu vực phải có dạng số.');
            }
            if (!is_numeric($eh_pc_tnvk_phan_tram)) {
                $error_message = array('Phụ cấp thâm niên vượt khung phải có dạng số.');
            }

            if (!is_numeric($eh_pc_udn_phan_tram)) {
                $error_message = array('Phụ cấp ưu đãi nghề (%) phải có dạng số.');
            }

            if (!is_numeric($eh_pc_cong_vu_phan_tram)) {
                $error_message = array('Phụ cấp công vụ (%) phải có dạng số.');
            }

            if (!is_numeric($eh_pc_kiem_nhiem)) {
                $error_message = array('Phụ cấp kiêm nhiệm phải có dạng số.');
            }
            if (!is_numeric($eh_pc_khac)) {
                $error_message = array('Phụ cấp khác phải có dạng số.');
            }

            if (!sizeof($error_message)) {
                if ($em_id != $update_em_id) {
                    $error_message = array('Có lỗi xảy ra, xin hãy tắt form này và mở lại.');
                } else {
                    $current_time = new Zend_Db_Expr('NOW()');
                    $date_dieu_chinh = date_create($eh_nam_dieu_chinh . '-' . $eh_thang_dieu_chinh . '-1');
                    $date_tham_nien = date_create($eh_tham_nien_nam . '-' . $eh_tham_nien_thang . '-1');
                    $data = array(
                        'eh_loai_luong' => $eh_loai_luong,
                        'eh_giai_doan' => $eh_giai_doan,
                        'eh_bac_luong' => $eh_bac_luong,
                        'eh_he_so' => $eh_he_so,
                        'eh_pc_kv' => $eh_pc_kv,
                        'eh_pc_thu_hut' => $eh_pc_thu_hut,
                        'eh_pc_cong_viec' => $eh_pc_cong_viec,
                        'eh_pc_trach_nhiem' => $eh_pc_trach_nhiem,
                        'eh_pc_tnvk_phan_tram' => $eh_pc_tnvk_phan_tram,
                        'eh_tham_niem' => date_format($date_tham_nien, "Y-m-d H:iP"),
                        'eh_pc_udn_phan_tram' => $eh_pc_udn_phan_tram,
                        'eh_pc_cong_vu_phan_tram' => $eh_pc_cong_vu_phan_tram,
                        'eh_pc_kiem_nhiem' => $eh_pc_kiem_nhiem,
                        'eh_pc_khac' => $eh_pc_khac,
                        'eh_pc_khac_type' => $eh_pc_khac_type,
                        'eh_date_modified' => $current_time,
                        'eh_han_dieu_chinh' => date_format($date_dieu_chinh, "Y-m-d H:iP")
                    );
                    if (!$he_so) {
                        $data['eh_em_id'] = $update_em_id;
                        $data['eh_date_added'] = $current_time;
                        $hesoModel->insert($data);
                    } else {
                        $hesoModel->update($data, "eh_em_id=$update_em_id");
                    }
                    $he_so = $hesoModel->fetchRow("eh_em_id=$em_id");
                    $success_message = 'Đã cập nhật thông tin thành công.';
                }
            }
        }
        $this->view->error_message = $error_message;
        $this->view->success_message = $success_message;
        $this->view->he_so = $he_so;
        $this->view->bac_luong = $bac_luong;
        $this->view->em_id = $em_id;
        $this->view->em_info = $em_info;
    }

    public function changestatusAction() {
        $this->_helper->layout()->disableLayout();
        $type = $this->_request->getParam('status', 1);
        $id = $this->_request->getParam('id', 0);
        if ($type > 0) {
            $type = 1;
        } else {
            $type = 0;
        }
        $current_time = new Zend_Db_Expr('NOW()');
        $employeeModel = new Front_Model_Employees();
        $employeeModel->update(array('em_status' => $type, 'em_date_modified' => $current_time), 'em_id=' . $id);
        $this->_redirect('tochuccanbo/employees/index/page/' . $this->_page);
    }

    public function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $employeeModel = new Front_Model_Employees();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $employeeModel->delete('em_id=' . $v);
            }
        }
        $this->_redirect('tochuccanbo/employees/index/page/' . $this->_page);
    }

    public function gethuyenAction() {
        $this->_helper->layout()->disableLayout();
        $tinhID = $this->_getParam('tid', 0);
        $huyenModel = new Front_Model_Huyen();
        $list_huyen = $huyenModel->fetchData(array('huyen_parent' => $tinhID, 'huyen_status' > 1));
        $this->view->list_huyen = $list_huyen;
    }

    public function formluanchuyenAction() {
        $this->_helper->layout()->disableLayout();
        $emID = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow('em_id =' . $emID);
        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));
        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));

        $phongbanModel = new Front_Model_Phongban();
        $list_phong_ban = $phongbanModel->fetchAll('pb_status=1');

        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $em_chuc_vu = $this->_arrParam['em_chuc_vu'];
            $em_phong_ban = $this->_arrParam['em_phong_ban'];
            $em_ngach_cong_chuc = $this->_arrParam['em_ngach_cong_chuc'];
            $em_cong_viec = trim($this->_arrParam['em_cong_viec']);
            $em_chuyen_mon = trim($this->_arrParam['em_chuyen_mon']);
            $em_thang_dieu_chinh = $this->_request->getParam('em_han_luan_chuyen_thang', 0);
            $em_nam_dieu_chinh = $this->_request->getParam('em_han_luan_chuyen_nam', 0);
            $date_dieu_chinh = date_create($em_nam_dieu_chinh . '-' . $em_thang_dieu_chinh . '-1');
            $current_time = new Zend_Db_Expr('NOW()');
            $data['em_chuc_vu'] = $em_chuc_vu;
            $data['em_phong_ban'] = $em_phong_ban;
            $data['em_ngach_cong_chuc'] = $em_ngach_cong_chuc;
            $data['em_cong_viec'] = $em_cong_viec;
            $data['em_chuyen_mon'] = $em_chuyen_mon;
            $data['em_han_luan_chuyen'] = date_format($date_dieu_chinh, "Y-m-d H:iP");
            $data['em_date_modified'] = $current_time;
            $success_message = $emModel->update($data, 'em_id=' . $emID);

            if ($success_message) {
                $thongbao_model = new Front_Model_ThongBao();
                $data = array();
                $data['tb_from'] = 0;
                $data['tb_to'] = $emID;
                $data['tb_tieu_de'] = '[Luân chuyển] Bạn đã được luân chuyển sang đơn vị/công việc mới';
                $data['tb_noi_dung'] = 'Bạn vừa được luân chuyển sang đơn vị/công việc mới.</br>
                Chi tiết như sau:</br>
                Chức vụ: ' . $this->view->viewGetChucVuName($em_chuc_vu) . '</br>
                Phòng ban: ' . $this->view->viewGetPhongBanName($em_phong_ban) . '</br>
                Ngạch công chức: ' . $this->view->viewGetNgachCongChucName($em_ngach_cong_chuc) . '</br>
                Công việc: ' . $em_cong_viec . '</br>
                Chuyên môn: ' . $em_chuyen_mon . '</br>';
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;
                $thongbao_model->insert($data);
            }
            $em_info = $emModel->fetchRow('em_id =' . $emID);
        }
        $this->view->error_message = $error_message;
        $this->view->success_message = $success_message;
        $this->view->em_id = $emID;
        $this->view->employee_info = $em_info;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
    }

    public function formnghihuuAction() {
        $this->_helper->layout()->disableLayout();
        $emID = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow('em_id =' . $emID);
        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));
        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));

        $phongbanModel = new Front_Model_Phongban();
        $list_phong_ban = $phongbanModel->fetchAll('pb_status=1');

        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $current_time = new Zend_Db_Expr('NOW()');
            $data = array();
            $data['em_nghi_huu'] = 1;
            $data['em_ngay_nghi_huu'] = $current_time;
            $success_message = $emModel->update($data, 'em_id=' . $emID);

            if ($success_message) {
                $thongbao_model = new Front_Model_ThongBao();
                $data = array();
                $data['tb_from'] = 0;
                $data['tb_to'] = $emID;
                $data['tb_tieu_de'] = '[Nghỉ hưu] Bạn vừa được duyệt nghỉ hưu';
                $data['tb_noi_dung'] = 'Phòng tổ chức vừa chuyển trạng thái của bạn sang nghỉ hưu.';
                $data['tb_status'] = 0;
                $data['tb_date_added'] = $current_time;
                $data['tb_date_modified'] = $current_time;
                $thongbao_model->insert($data);
            }
            $em_info = $emModel->fetchRow('em_id =' . $emID);
        }
        $this->view->error_message = $error_message;
        $this->view->success_message = $success_message;
        $this->view->em_id = $emID;
        $this->view->employee_info = $em_info;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
    }

    public function updatedataluanchuyenAction() {
        $this->_helper->layout()->disableLayout();
        $employeesModel = new Front_Model_Employees();
        if ($this->_request->isPost()) {
            $data = array();
            $em_id = $this->_arrParam['em_id'];
            $em_chuc_vu = $this->_arrParam['em_chuc_vu'];
            $em_phong_ban = $this->_arrParam['em_phong_ban'];
            $em_ngach_cong_chuc = $this->_arrParam['em_ngach_cong_chuc'];
            $em_cong_viec = trim($this->_arrParam['em_cong_viec']);
            $em_chuyen_mon = trim($this->_arrParam['em_chuyen_mon']);
            $current_time = new Zend_Db_Expr('NOW()');
            $data['em_chuc_vu'] = $em_chuc_vu;
            $data['em_phong_ban'] = $em_phong_ban;
            $data['em_ngach_cong_chuc'] = $em_ngach_cong_chuc;
            $data['em_cong_viec'] = $em_cong_viec;
            $data['em_chuyen_mon'] = $em_chuyen_mon;
            $data['em_date_modified'] = $current_time;
            $success_message = $employeesModel->update($data, 'em_id=' . $em_id);

            $thongbao_model = new Front_Model_ThongBao();
            $data = array();
            $data['tb_from'] = 0;
            $data['tb_to'] = $em_id;
            $data['tb_tieu_de'] = '[Luân chuyển] Bạn đã được luân chuyển sang đơn vị/công việc mới';
            $data['tb_noi_dung'] = 'Bạn vừa được luân chuyển sang đơn vị/công việc mới.</br>
                Chi tiết như sau:</br>
                Chức vụ: ' . $this->view->viewGetChucVuName($em_chuc_vu) . '</br>
                Phòng ban: ' . $this->view->viewGetPhongBanName($em_phong_ban) . '</br>
                Ngạch công chức: ' . $this->view->viewGetNgachCongChucName($em_ngach_cong_chuc) . '</br>
                Công việc: ' . $em_cong_viec . '</br>
                Chuyên môn: ' . $em_chuyen_mon . '</br>';
            $data['tb_status'] = 0;
            $data['tb_date_added'] = $current_time;
            $data['tb_date_modified'] = $current_time;
            $thongbao_model->insert($data);

            $this->view->success_message = $success_message;
        }
    }

    public function jqkhenthuongAction() {
        $this->_helper->layout()->disableLayout();
        $khenthuongModel = new Front_Model_KhenThuong();
        if ($this->_request->isPost()) {
            $data = array();
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;

            $em_id = $this->_arrParam['em_id'];
            $kt_date_day = $this->_arrParam['kt_date_day'];
            $kt_date_month = $this->_arrParam['kt_date_month'];
            $kt_date_year = $this->_arrParam['kt_date_year'];
            $kt_ly_do = trim($this->_arrParam['kt_ly_do']);
            $kt_chi_tiet = trim($this->_arrParam['kt_chi_tiet']);
            $kt_money = trim($this->_arrParam['kt_money']);
            $current_time = new Zend_Db_Expr('NOW()');

            if (!is_numeric($kt_money)) {
                $kt_money = 0;
            }
            $date_khen_thuong = date_create($kt_date_year . '-' . $kt_date_month . '-' . $kt_date_day);

            $data['kt_can_bo_to_chuc'] = $from_id;
            $data['kt_em_id'] = $em_id;
            $data['kt_ptccb_viewed'] = 1;
            $data['kt_date'] = date_format($date_khen_thuong, "Y-m-d H:iP");
            $data['kt_ly_do'] = $kt_ly_do;
            $data['kt_chi_tiet'] = $kt_chi_tiet;
            $data['kt_money'] = $kt_money;
            $data['kt_date_added'] = $current_time;
            $data['kt_date_modified'] = $current_time;
            $success_message = $khenthuongModel->insert($data);

            $thongbao_model = new Front_Model_ThongBao();

            $data = array();
            $data['tb_from'] = 0;
            $data['tb_to'] = $em_id;
            $data['tb_tieu_de'] = '[Khen Thưởng] ' . $kt_ly_do;
            $data['tb_noi_dung'] = $kt_chi_tiet;
            $data['tb_status'] = 0;
            $data['tb_date_added'] = $current_time;
            $data['tb_date_modified'] = $current_time;
            $thongbao_model->insert($data);

            $this->view->success_message = $success_message;
        }
    }

    public function jqkyluatAction() {
        $this->_helper->layout()->disableLayout();
        $kyluatModel = new Front_Model_KyLuat();
        if ($this->_request->isPost()) {
            $data = array();
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $from_id = $identity->em_id;

            $em_id = $this->_arrParam['em_id'];
            $kl_date_day = $this->_arrParam['kl_date_day'];
            $kl_date_month = $this->_arrParam['kl_date_month'];
            $kl_date_year = $this->_arrParam['kl_date_year'];
            $kl_ly_do = trim($this->_arrParam['kl_ly_do']);
            $kl_money = trim($this->_arrParam['kl_money']);
            $kl_chi_tiet = trim($this->_arrParam['kl_chi_tiet']);
            $current_time = new Zend_Db_Expr('NOW()');
            $date_ky_luat = date_create($kl_date_year . '-' . $kl_date_month . '-' . $kl_date_day);
            if (!is_numeric($kl_money)) {
                $kl_money = 0;
            }
            $data['kl_can_bo_to_chuc'] = $from_id;
            $data['kl_em_id'] = $em_id;
            $data['kl_ptccb_viewed'] = 1;
            $data['kl_money'] = $kl_money;
            $data['kl_date'] = date_format($date_ky_luat, "Y-m-d H:iP");
            $data['kl_ly_do'] = $kl_ly_do;
            $data['kl_chi_tiet'] = $kl_chi_tiet;
            $data['kl_date_added'] = $current_time;
            $data['kl_date_modified'] = $current_time;
            $success_message = $kyluatModel->insert($data);

            $thongbao_model = new Front_Model_ThongBao();
            $data = array();
            $data['tb_from'] = 0;
            $data['tb_to'] = $em_id;
            $data['tb_tieu_de'] = '[Kỷ luật/khiển trách] ' . $kl_ly_do;
            $data['tb_noi_dung'] = $kl_chi_tiet;
            $data['tb_status'] = 0;
            $data['tb_date_added'] = $current_time;
            $data['tb_date_modified'] = $current_time;
            $thongbao_model->insert($data);

            $this->view->success_message = $success_message;
        }
    }

    public function jqbacluongAction() {
        $this->_helper->layout()->disableLayout();
        $bl_id = $this->_request->getParam('id', 0);
        $ncc_id = $this->_request->getParam('ncc', 0);
        $bacluongModel = new Front_Model_BacLuong();
        $bac_luong = $bacluongModel->fetchRow('bl_id=' . $bl_id);
        if($bac_luong){
            $bac_luong = $bac_luong->toArray();
        }
        $this->view->bac_luong = $bac_luong;
        $this->view->ncc_id = $ncc_id;
    }

}