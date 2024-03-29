<?php

class Tochuccanbo_CapnhatthongtinController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '4002');
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
        $this->view->title = 'Quản lý yêu cầu cập nhật thông tin - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);

        $employeesEditModel = new Front_Model_EmployeesEdit();

        $chucvuModel = new Front_Model_Chucvu();
        $list_chuc_vu = $chucvuModel->fetchData(array('cv_status' => 1));

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

        if (!$pb_selected)
            $list_employees = $employeesEditModel->fetchData(array(), 'eme_date_modified DESC');
        else {
            $list_employees = $employeesEditModel->fetchByPhongBan($pb_ids);
        }

        $paginator = Zend_Paginator::factory($list_employees);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->pb_id = $pb_selected;
    }

    public function chitietAction() {
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);

        Zend_Layout::startMvc($option);
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý cán bộ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $employeesModel = new Front_Model_Employees();
        $employeesEditModel = new Front_Model_EmployeesEdit();

        $success_message = '';

        $id = $this->_getParam('id', 0);
        $employee_info = $employeesEditModel->fetchRow('eme_id=' . $id);
        if (!$employee_info) {
            $error_message[] = 'Không tìm thấy thông tin.';
        }

        $tinhModel = new Front_Model_Tinh();
        $list_tinh = $tinhModel->fetchData(array('tinh_status' => 1));

        $huyenModel = new Front_Model_Huyen();
        $list_huyen = $huyenModel->fetchData(array('huyen_status' => 1));

        $dantocModel = new Front_Model_Dantoc();
        $list_dan_toc = $dantocModel->fetchData(array('dt_status' => 1));

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
            //echo '<pre>';
            //Zend_Debug::dump($this->_arrParam);
            //echo '</pre>';
            $em_ho = trim($this->_arrParam['em_ho']);
            $em_ten = trim($this->_arrParam['em_ten']);
            $em_ten_khac = $this->_arrParam['em_ten_khac'];
            $em_so_chung_minh_thu = trim($this->_arrParam['em_so_chung_minh_thu']);
            $em_gioi_tinh = $this->_arrParam['em_gioi_tinh'];
            $ngay_sinh = $this->_arrParam['ngay_sinh'];
            $em_home_phone = $this->_arrParam['em_home_phone'];
            $em_phone = $this->_arrParam['em_phone'];
            $em_noi_sinh = trim($this->_arrParam['em_noi_sinh']);
            $em_que_quan = trim($this->_arrParam['em_que_quan']);
            $em_dia_chi = $this->_arrParam['em_dia_chi'];
            $em_dia_chi_tinh = $this->_arrParam['em_dia_chi_tinh'];
            $em_dia_chi_huyen = $this->_arrParam['em_dia_chi_huyen'];
            $em_dan_toc = $this->_arrParam['em_dan_toc'];
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
            $em_tai_lieu_khac = $this->_arrParam['anh_tai_lieu_khac'];

            /* Moi them */
            $em_ton_giao = trim($this->_arrParam['em_ton_giao']);
            $em_noi_sinh_huyen = trim($this->_arrParam['em_noi_sinh_huyen']);
            $em_noi_sinh_tinh = trim($this->_arrParam['em_noi_sinh_tinh']);
            $em_que_quan_huyen = trim($this->_arrParam['em_que_quan_huyen']);
            $em_que_quan_tinh = trim($this->_arrParam['em_que_quan_tinh']);
            $em_noi_o = trim($this->_arrParam['em_noi_o']);
            $em_noi_o_huyen = $this->_arrParam['em_noi_o_huyen'];
            $em_noi_o_tinh = $this->_arrParam['em_noi_o_tinh'];
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

                if ($ngay_dang != '') {
                    $ngay_dang = str_replace('/', '-', $ngay_dang);
                    $ngay_dang = date('Y-m-d', strtotime($ngay_dang));
                }

                if ($ngay_doan != '') {
                    $ngay_doan = str_replace('/', '-', $ngay_doan);
                    $ngay_doan = date('Y-m-d', strtotime($ngay_doan));
                }

                if ($em_ngay_nhap_ngu != '') {
                    $em_ngay_nhap_ngu = str_replace('/', '-', $em_ngay_nhap_ngu);
                    $em_ngay_nhap_ngu = date('Y-m-d', strtotime($em_ngay_nhap_ngu));
                }
                if ($em_ngay_xuat_ngu != '') {
                    $em_ngay_xuat_ngu = str_replace('/', '-', $em_ngay_xuat_ngu);
                    $em_ngay_xuat_ngu = date('Y-m-d', strtotime($em_ngay_xuat_ngu));
                }

                if ($em_cmt_ngay_cap != '') {
                    $em_cmt_ngay_cap = str_replace('/', '-', $em_cmt_ngay_cap);
                    $em_cmt_ngay_cap = date('Y-m-d', strtotime($em_cmt_ngay_cap));
                }
                $data['em_ho'] = $em_ho;
                $data['em_ten'] = $em_ten;
                $data['em_ten_khac'] = $em_ten_khac;
                $data['em_so_chung_minh_thu'] = $em_so_chung_minh_thu;
                $data['em_cmt_ngay_cap'] = $em_cmt_ngay_cap;
                $data['em_gioi_tinh'] = $em_gioi_tinh;
                $data['em_home_phone'] = $em_home_phone;
                $data['em_phone'] = $em_phone;
                $data['em_noi_sinh'] = $em_noi_sinh;
                $data['em_que_quan'] = $em_que_quan;
                $data['em_dia_chi'] = $em_dia_chi;
                $data['em_dia_chi_tinh'] = $em_dia_chi_tinh;
                $data['em_dia_chi_huyen'] = $em_dia_chi_huyen;
                $data['em_dan_toc'] = $em_dan_toc;
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
                $data['em_tai_lieu_khac'] = serialize($em_tai_lieu_khac);
                $data['em_ngay_sinh'] = $ngay_sinh;
                $data['em_ngay_vao_dang'] = $ngay_dang;
                $data['em_ngay_vao_doan'] = $ngay_doan;
                $data['em_date_modified'] = $current_time;

                /* Moi them */
                $data['em_ton_giao'] = $em_ton_giao;
                $data['em_noi_sinh_huyen'] = $em_noi_sinh_huyen;
                $data['em_noi_sinh_tinh'] = $em_noi_sinh_tinh;
                $data['em_que_quan_huyen'] = $em_que_quan_huyen;
                $data['em_que_quan_tinh'] = $em_que_quan_tinh;
                $data['em_noi_o'] = $em_noi_o;
                $data['em_noi_o_huyen'] = $em_noi_o_huyen;
                $data['em_noi_o_tinh'] = $em_noi_o_tinh;
                $data['em_ngay_nhap_ngu'] = $em_ngay_nhap_ngu;
                $data['em_ngay_xuat_ngu'] = $em_ngay_xuat_ngu;
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


                $employeesModel->update($data, 'em_id=' . $employee_info->em_id);
                $employeesEditModel->delete('eme_id=' . $employee_info->eme_id);
                $success_message = 'Đã cập nhật thông tin thành công.';
            }
        }
        $this->view->employee_info = $employee_info;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
        $this->view->list_tinh = $list_tinh;
        $this->view->list_huyen = $list_huyen;
        $this->view->list_dan_toc = $list_dan_toc;
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
        $this->_helper->layout()->disableLayout();
        $id = $this->_getParam('id', 0);
        $employeeEditModel = new Front_Model_EmployeesEdit();
        $employeeEditModel->delete('eme_id=' . $id);
        $this->_redirect('tochuccanbo/capnhatthongtin/index/page/' . $this->_page);
    }

    function deleteitemsAction() {
        $this->_helper->layout()->disableLayout();
        $employeeEditModel = new Front_Model_EmployeesEdit();
        if ($this->_request->isPost()) {
            $item = $this->getRequest()->getPost('cid');
            foreach ($item as $k => $v) {
                $employeeEditModel->delete('eme_id=' . $v);
            }
        }
        $this->_redirect('tochuccanbo/capnhatthongtin/index/page/' . $this->_page);
    }

    function gethuyenAction() {
        $this->_helper->layout()->disableLayout();
        $tinhID = $this->_getParam('tid', 0);
        $huyenModel = new Front_Model_Huyen();
        $list_huyen = $huyenModel->fetchData(array('huyen_parent' => $tinhID, 'huyen_status' > 1));
        $this->view->list_huyen = $list_huyen;
    }

}