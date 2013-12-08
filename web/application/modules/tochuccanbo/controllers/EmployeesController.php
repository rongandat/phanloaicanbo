<?php

class Tochuccanbo_EmployeesController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '1001');
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
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $employeesModel = new Front_Model_Employees();
        $list_employees = $employeesModel->fetchData(array('em_delete' => 0));

        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));

        $phongbanModel = new Front_Model_Phongban();
        $list_phong_ban = $phongbanModel->fetchAll();

        $ngachcongchucModel = new Front_Model_NgachCongChuc();
        $list_ngach_cong_chuc = $ngachcongchucModel->fetchData(array('ncc_status' => 1));

        $paginator = Zend_Paginator::factory($list_employees);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
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
            $em_ten_dem = trim($this->_arrParam['em_ten_dem']);
            $em_ten = trim($this->_arrParam['em_ten']);
            $em_ten_khac = $this->_arrParam['em_ten_khac'];
            $em_so_chung_minh_thu = trim($this->_arrParam['em_so_chung_minh_thu']);
            $em_gioi_tinh = $this->_arrParam['em_gioi_tinh'];
            $ngay_sinh = $this->_arrParam['ngay_sinh'];
            $thang_sinh = $this->_arrParam['thang_sinh'];
            $nam_sinh = $this->_arrParam['nam_sinh'];
            $em_home_phone = $this->_arrParam['em_home_phone'];
            $em_phone = $this->_arrParam['em_phone'];
            $em_noi_sinh = trim($this->_arrParam['em_noi_sinh']);
            $em_que_quan = trim($this->_arrParam['em_que_quan']);
            $em_dia_chi = $this->_arrParam['em_dia_chi'];
            $em_dia_chi_tinh = $this->_arrParam['em_dia_chi_tinh'];
            $em_dia_chi_huyen = $this->_arrParam['em_dia_chi_huyen'];
            $em_dan_toc = $this->_arrParam['em_dan_toc'];
            $em_so_cong_chuc = trim($this->_arrParam['em_so_cong_chuc']);
            $em_chuc_vu = $this->_arrParam['em_chuc_vu'];
            $em_phong_ban = $this->_arrParam['em_phong_ban'];
            $ngay_tuyen_dung = $this->_arrParam['ngay_tuyen_dung'];
            $thang_tuyen_dung = $this->_arrParam['thang_tuyen_dung'];
            $nam_tuyen_dung = $this->_arrParam['nam_tuyen_dung'];
            $em_ngach_cong_chuc = $this->_arrParam['em_ngach_cong_chuc'];
            $em_cong_viec = trim($this->_arrParam['em_cong_viec']);
            $em_chuyen_mon = trim($this->_arrParam['em_chuyen_mon']);
            $em_chuc_vu_dang = $this->_arrParam['em_chuc_vu_dang'];
            $ngay_dang = $this->_arrParam['ngay_dang'];
            $thang_dang = $this->_arrParam['thang_dang'];
            $nam_dang = $this->_arrParam['nam_dang'];
            $em_chuc_vu_doan = $this->_arrParam['em_chuc_vu_doan'];
            $ngay_doan = $this->_arrParam['ngay_doan'];
            $thang_doan = $this->_arrParam['thang_doan'];
            $nam_doan = $this->_arrParam['nam_doan'];
            $em_chuc_vu_cong_doan = $this->_arrParam['em_chuc_vu_cong_doan'];
            $em_van_hoa_pt = trim($this->_arrParam['em_van_hoa_pt']);
            $em_hoc_ham = $this->_arrParam['em_hoc_ham'];
            $em_bang_cap = $this->_arrParam['em_bang_cap'];
            $em_ngoai_ngu = $this->_arrParam['em_ngoai_ngu'];
            $em_tin_hoc = $this->_arrParam['em_tin_hoc'];
            $em_chung_chi_khac = $this->_arrParam['em_chung_chi_khac'];
            $em_bang_scan_upload = $this->_arrParam['anh_bang_cap'];
            $em_status = $this->_arrParam['em_status'];



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
                $date_ngay_sinh = date_create($nam_sinh . '-' . $thang_sinh . '-' . $ngay_sinh);
                $date_ngay_tuyen_dung = date_create($nam_tuyen_dung . '-' . $thang_tuyen_dung . '-' . $ngay_tuyen_dung);
                $date_ngay_vao_dang = date_create($nam_dang . '-' . $thang_dang . '-' . $ngay_dang);
                $date_ngay_vao_doan = date_create($nam_doan . '-' . $thang_doan . '-' . $ngay_doan);
                $data['em_ho'] = $em_ho;
                $data['em_ten_dem'] = $em_ten_dem;
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
                $data['em_ngay_sinh'] = date_format($date_ngay_sinh, "Y-m-d H:iP");
                $data['em_ngay_tuyen_dung'] = date_format($date_ngay_tuyen_dung, "Y-m-d H:iP");
                $data['em_ngay_vao_dang'] = date_format($date_ngay_vao_dang, "Y-m-d H:iP");
                $data['em_ngay_vao_doan'] = date_format($date_ngay_vao_doan, "Y-m-d H:iP");
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

        $employee_info = $employeesModel->fetchRow('em_id=' . $id . ' and em_delete=0');

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
            //echo '<pre>';
            //Zend_Debug::dump($this->_arrParam);
            //echo '</pre>';
            $em_ho = trim($this->_arrParam['em_ho']);
            $em_ten_dem = trim($this->_arrParam['em_ten_dem']);
            $em_ten = trim($this->_arrParam['em_ten']);
            $em_ten_khac = $this->_arrParam['em_ten_khac'];
            $em_so_chung_minh_thu = trim($this->_arrParam['em_so_chung_minh_thu']);
            $em_gioi_tinh = $this->_arrParam['em_gioi_tinh'];
            $ngay_sinh = $this->_arrParam['ngay_sinh'];
            $thang_sinh = $this->_arrParam['thang_sinh'];
            $nam_sinh = $this->_arrParam['nam_sinh'];
            $em_home_phone = $this->_arrParam['em_home_phone'];
            $em_phone = $this->_arrParam['em_phone'];
            $em_noi_sinh = trim($this->_arrParam['em_noi_sinh']);
            $em_que_quan = trim($this->_arrParam['em_que_quan']);
            $em_dia_chi = $this->_arrParam['em_dia_chi'];
            $em_dia_chi_tinh = $this->_arrParam['em_dia_chi_tinh'];
            $em_dia_chi_huyen = $this->_arrParam['em_dia_chi_huyen'];
            $em_dan_toc = $this->_arrParam['em_dan_toc'];
            $em_so_cong_chuc = trim($this->_arrParam['em_so_cong_chuc']);
            $em_chuc_vu = $this->_arrParam['em_chuc_vu'];
            $em_phong_ban = $this->_arrParam['em_phong_ban'];
            $ngay_tuyen_dung = $this->_arrParam['ngay_tuyen_dung'];
            $thang_tuyen_dung = $this->_arrParam['thang_tuyen_dung'];
            $nam_tuyen_dung = $this->_arrParam['nam_tuyen_dung'];
            $em_ngach_cong_chuc = $this->_arrParam['em_ngach_cong_chuc'];
            $em_cong_viec = trim($this->_arrParam['em_cong_viec']);
            $em_chuyen_mon = trim($this->_arrParam['em_chuyen_mon']);
            $em_chuc_vu_dang = $this->_arrParam['em_chuc_vu_dang'];
            $ngay_dang = $this->_arrParam['ngay_dang'];
            $thang_dang = $this->_arrParam['thang_dang'];
            $nam_dang = $this->_arrParam['nam_dang'];
            $em_chuc_vu_doan = $this->_arrParam['em_chuc_vu_doan'];
            $ngay_doan = $this->_arrParam['ngay_doan'];
            $thang_doan = $this->_arrParam['thang_doan'];
            $nam_doan = $this->_arrParam['nam_doan'];
            $em_chuc_vu_cong_doan = $this->_arrParam['em_chuc_vu_cong_doan'];
            $em_van_hoa_pt = trim($this->_arrParam['em_van_hoa_pt']);
            $em_hoc_ham = $this->_arrParam['em_hoc_ham'];
            $em_bang_cap = $this->_arrParam['em_bang_cap'];
            $em_ngoai_ngu = $this->_arrParam['em_ngoai_ngu'];
            $em_tin_hoc = $this->_arrParam['em_tin_hoc'];
            $em_chung_chi_khac = $this->_arrParam['em_chung_chi_khac'];
            $em_bang_scan_upload = $this->_arrParam['anh_bang_cap'];
            $em_status = $this->_arrParam['em_status'];



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
                $date_ngay_sinh = date_create($nam_sinh . '-' . $thang_sinh . '-' . $ngay_sinh);
                $date_ngay_tuyen_dung = date_create($nam_tuyen_dung . '-' . $thang_tuyen_dung . '-' . $ngay_tuyen_dung);
                $date_ngay_vao_dang = date_create($nam_dang . '-' . $thang_dang . '-' . $ngay_dang);
                $date_ngay_vao_doan = date_create($nam_doan . '-' . $thang_doan . '-' . $ngay_doan);
                $data['em_ho'] = $em_ho;
                $data['em_ten_dem'] = $em_ten_dem;
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
                $data['em_ngay_sinh'] = date_format($date_ngay_sinh, "Y-m-d H:iP");
                $data['em_ngay_tuyen_dung'] = date_format($date_ngay_tuyen_dung, "Y-m-d H:iP");
                $data['em_ngay_vao_dang'] = date_format($date_ngay_vao_dang, "Y-m-d H:iP");
                $data['em_ngay_vao_doan'] = date_format($date_ngay_vao_doan, "Y-m-d H:iP");
                $data['em_date_modified'] = $current_time;
                $employeesModel->update($data, 'em_id=' . $id);
                $employee_info = $employeesModel->fetchRow('em_id=' . $id . ' and em_delete=0');
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

        $employee_info = $employeeModel->fetchRow('em_id=' . $id . ' and em_delete=0');
        if (!$employee_info) {
            $error_message[] = 'Không tìm thấy thông tin của cán bộ.';
        }

        if ($this->_request->isPost()) {
            $del = $this->getRequest()->getPost('del');
            if ($del == 'Yes') {
                $id = $this->getRequest()->getPost('id');
                $employeeModel->update(array('em_delete' => 1), 'em_id=' . $id);
            }
            $this->_redirect('tochuccanbo/employees/index/page/' . $this->_page);
        }

        $this->view->employee_info = $employee_info;
        $this->view->error_message = $error_message;
    }

    function changestatusAction() {
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

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $employeeModel = new Front_Model_Employees();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $employeeModel->update(array('em_delete' => 1), 'em_id=' . $v);
            }
        }
        $this->_redirect('tochuccanbo/employees/index/page/' . $this->_page);
    }

    function gethuyenAction() {
        $this->_helper->layout()->disableLayout();
        $tinhID = $this->_getParam('tid', 0);
        $huyenModel = new Front_Model_Huyen();
        $list_huyen = $huyenModel->fetchData(array('huyen_parent' => $tinhID, 'huyen_status' > 1));
        $this->view->list_huyen = $list_huyen;
    }

    function getdataluanchuyenAction() {
        $this->_helper->layout()->disableLayout();
        $emID = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow('em_id =' . $emID);
        $this->view->employee_info = $em_info;
    }

    function updatedataluanchuyenAction() {
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
            $this->view->success_message = $success_message;
        }
    }

}