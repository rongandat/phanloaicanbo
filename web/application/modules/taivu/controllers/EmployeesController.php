<?php

class Taivu_EmployeesController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '6001');
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

        $pb_ids = array($pb_selected);
        foreach ($phong_ban_choosed as $pb) {
            $pb_ids[] = $pb->pb_id;
        }

        $check_nang_luong = $this->_helper->global->checkNangLuong();
        
        $employeesModel = new Front_Model_Employees();
        if (!$pb_selected) {
            $list_employees = $employeesModel->callGetListNhanVien();
        } else {
            //$select = $employeesModel->select()->where('em_phong_ban in (?)', $pb_ids);
            $list_employees = $employeesModel->callGetListNhanVien($pb_ids);
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
    }

    public function hesoAction() {
        $this->_helper->layout()->disableLayout();
        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

        $em_id = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow("em_id=$em_id");
        $hesoModel = new Front_Model_EmployeesHeso();
        $bacluongModel = new Front_Model_BacLuong();
        $he_so = $hesoModel->getCurrentHeSo($thang, $nam, $em_id);
        $bac_luong = $bacluongModel->fetchAll('bl_status=1', 'bl_order ASC');
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $update_em_id = $this->_request->getParam('pc_cap_nhat_em_id', 0);
            $eh_loai_luong = $this->_request->getParam('eh_loai_luong', 0);
            $eh_giai_doan = $this->_request->getParam('eh_giai_doan', 0);
            $eh_he_so = $this->_request->getParam('eh_he_so', 0);
            $eh_thang_dieu_chinh = $this->_request->getParam('eh_thang_dieu_chinh', 0);
            $eh_nam_dieu_chinh = $this->_request->getParam('eh_nam_dieu_chinh', 0);
            $eh_bac_luong = $this->_request->getParam('eh_bac_luong', 0);

            $eh_thang_ap_dung = $this->_request->getParam('eh_thang_ap_dung', 0);
            $eh_nam_ap_dung = $this->_request->getParam('eh_nam_ap_dung', 0);

            if (!$eh_bac_luong) {
                $error_message = array('Bạn phải chọn bậc lương.');
            }

            if (!is_numeric($eh_he_so)) {
                $error_message = array('Hệ số phải có dạng số.');
            }

            if (!sizeof($error_message)) {
                if ($em_id != $update_em_id) {
                    $error_message = array('Có lỗi xảy ra, xin hãy tắt form này và mở lại.');
                } else {
                    $current_time = new Zend_Db_Expr('NOW()');
                    $date_dieu_chinh = date_create($eh_nam_dieu_chinh . '-' . $eh_thang_dieu_chinh . '-1');
                    $date_ap_dung = date_create($eh_nam_ap_dung . '-' . $eh_thang_ap_dung . '-1');
                    $data = array(
                        'eh_loai_luong' => $eh_loai_luong,
                        'eh_giai_doan' => $eh_giai_doan,
                        'eh_bac_luong' => $eh_bac_luong,
                        'eh_he_so' => $eh_he_so,
                        'eh_date_modified' => $current_time,
                        'eh_han_dieu_chinh' => date_format($date_dieu_chinh, "Y-m-d H:iP")
                    );
                    $he_so = $hesoModel->checkHeSo($eh_thang_ap_dung, $eh_nam_ap_dung, $em_id);
                    if (!$he_so) {
                        $data['eh_em_id'] = $update_em_id;
                        $data['eh_date_added'] = $current_time;
                        $data['eh_han_ap_dung'] = date_format($date_ap_dung, "Y-m-d H:iP");
                        $hesoModel->insert($data);
                        $he_so_id = $hesoModel->getAdapter()->lastInsertId();
                    } else {
                        $he_so_id = $he_so->eh_id;
                        $hesoModel->update($data, "eh_id=$he_so_id");
                    }
                    $he_so = $hesoModel->fetchRow("eh_id=$he_so_id");
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

        $list_nang_luong = $this->_helper->global->checkNangLuong();

        $this->view->pb_id = $pb_selected;
        $this->view->list_nhan_vien = $list_nang_luong;
        $this->view->list_chuc_vu = $list_chuc_vu;
        $this->view->list_phong_ban = $list_phong_ban;
        $this->view->list_phong_ban_option = $list_phong_ban_option;
        $this->view->list_ngach_cong_chuc = $list_ngach_cong_chuc;
    }
    
    public function phucapAction() {
        $this->_helper->layout()->disableLayout();
        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));
        $em_id = $this->_getParam('id', 0);
        $emModel = new Front_Model_Employees();
        $em_info = $emModel->fetchRow("em_id=$em_id");
        $phucapModel = new Front_Model_EmployeesPhuCap();
        $he_so = $phucapModel->getCurrentHeSo($thang, $nam, $em_id);
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $update_em_id = $this->_request->getParam('pc_cap_nhat_pc_em_id', 0);
            $eh_pc_cong_viec = $this->_request->getParam('eh_pc_cong_viec', 0);
            $eh_pc_trach_nhiem = $this->_request->getParam('eh_pc_trach_nhiem', 0);
            $eh_pc_kv = $this->_request->getParam('eh_pc_kv', 0);
            $eh_tnvk_thang = $this->_request->getParam('eh_tnvk_thang', 0);
            $eh_tnvk_nam = $this->_request->getParam('eh_tnvk_nam', 0);
            $eh_pc_tnvk_phan_tram = $this->_request->getParam('eh_pc_tnvk_phan_tram', 0);
            $eh_pc_udn_phan_tram = $this->_request->getParam('eh_pc_udn_phan_tram', 0);
            $eh_pc_cong_vu_phan_tram = $this->_request->getParam('eh_pc_cong_vu_phan_tram', 0);
            $eh_pc_kiem_nhiem = $this->_request->getParam('eh_pc_kiem_nhiem', 0);
            $eh_pc_khac = $this->_request->getParam('eh_pc_khac', 0);
            $eh_pc_thu_hut = $this->_request->getParam('eh_pc_thu_hut', 0);
            $eh_pc_khac_type = $this->_request->getParam('eh_pc_khac_type', 0);

            $eh_pc_doc_hai = $this->_request->getParam('eh_pc_doc_hai', 0);
            $eh_pc_doc_hai_type = $this->_request->getParam('eh_pc_doc_hai_type', 0);

            $eh_tham_nien_thang = $this->_request->getParam('eh_tham_nien_thang', 0);
            $eh_tham_nien_nam = $this->_request->getParam('eh_tham_nien_nam', 0);
            $eh_pc_tham_nien = $this->_request->getParam('eh_pc_tham_nien', 0);

            $eh_thang_ap_dung = $this->_request->getParam('eh_thang_ap_dung', 0);
            $eh_nam_ap_dung = $this->_request->getParam('eh_nam_ap_dung', 0);


            if (!is_numeric($eh_pc_thu_hut)) {
                $error_message = array('Phụ cấp thu hút phải có dạng số.');
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

            if (!is_numeric($eh_pc_doc_hai)) {
                $error_message = array('Phụ cấp độc hại phải có dạng số.');
            }

            if (!is_numeric($eh_pc_khac)) {
                $error_message = array('Phụ cấp khác phải có dạng số.');
            }
            if (!is_numeric($eh_pc_tham_nien)) {
                $error_message = array('Phụ cấp thâm niên phải có dạng số.');
            }

            if (!sizeof($error_message)) {
                if ($em_id != $update_em_id) {
                    $error_message = array('Có lỗi xảy ra, xin hãy tắt form này và mở lại.');
                } else {
                    $current_time = new Zend_Db_Expr('NOW()');
                    $date_tham_nien = date_create($eh_tham_nien_nam . '-' . $eh_tham_nien_thang . '-1');
                    $date_ap_dung = date_create($eh_nam_ap_dung . '-' . $eh_thang_ap_dung . '-1');

                    $data = array(
                        'eh_pc_kv' => $eh_pc_kv,
                        'eh_pc_thu_hut' => $eh_pc_thu_hut,
                        'eh_pc_cong_viec' => $eh_pc_cong_viec,
                        'eh_pc_trach_nhiem' => $eh_pc_trach_nhiem,
                        'eh_pc_tnvk_phan_tram' => $eh_pc_tnvk_phan_tram,
                        'eh_tham_niem' => date_format($date_tham_nien, "Y-m-d H:iP"),
                        'eh_pc_tham_nien' => $eh_pc_tham_nien,
                        'eh_pc_udn_phan_tram' => $eh_pc_udn_phan_tram,
                        'eh_pc_cong_vu_phan_tram' => $eh_pc_cong_vu_phan_tram,
                        'eh_pc_kiem_nhiem' => $eh_pc_kiem_nhiem,
                        'eh_pc_khac' => $eh_pc_khac,
                        'eh_pc_khac_type' => $eh_pc_khac_type,
                        'eh_pc_doc_hai' => $eh_pc_doc_hai,
                        'eh_pc_doc_hai_type' => $eh_pc_doc_hai_type,
                        'eh_date_modified' => $current_time
                    );

                    if ($eh_tnvk_thang && $eh_tnvk_nam) {
                        $date_tnvk = date_create($eh_tnvk_nam . '-' . $eh_tnvk_thang . '-1');
                        $data['eh_pc_tnvk_time'] = date_format($date_tnvk, "Y-m-d H:iP");
                    } else {
                        $data['eh_pc_tnvk_time'] = '';
                    }

                    $he_so = $phucapModel->checkHeSo($eh_thang_ap_dung, $eh_nam_ap_dung, $em_id);
                    if (!$he_so) {
                        $data['epc_em_id'] = $update_em_id;
                        $data['eh_date_added'] = $current_time;
                        $data['eh_han_ap_dung'] = date_format($date_ap_dung, "Y-m-d H:iP");
                        $phucapModel->insert($data);
                        $he_so_id = $phucapModel->getAdapter()->lastInsertId();
                    } else {
                        $he_so_id = $he_so->epc_id;
                        $phucapModel->update($data, "epc_id=$he_so_id");
                    }
                    $he_so = $phucapModel->fetchRow("epc_id=$he_so_id");
                    $success_message = 'Đã cập nhật thông tin thành công.';
                }
            }
        }
        $this->view->error_message = $error_message;
        $this->view->success_message = $success_message;
        $this->view->he_so = $he_so;
        $this->view->em_id = $em_id;
        $this->view->em_info = $em_info;
    }

    public function gethuyenAction() {
        $this->_helper->layout()->disableLayout();
        $tinhID = $this->_getParam('tid', 0);
        $huyenModel = new Front_Model_Huyen();
        $list_huyen = $huyenModel->fetchData(array('huyen_parent' => $tinhID, 'huyen_status' > 1));
        $this->view->list_huyen = $list_huyen;
    }
    
    public function jqbacluongAction() {
        $this->_helper->layout()->disableLayout();
        $bl_id = $this->_request->getParam('id', 0);
        $ncc_id = $this->_request->getParam('ncc', 0);
        $bacluongModel = new Front_Model_BacLuong();
        $bac_luong = $bacluongModel->fetchRow('bl_id=' . $bl_id);
        if ($bac_luong) {
            $bac_luong = $bac_luong->toArray();
        }
        $this->view->bac_luong = $bac_luong;
        $this->view->ncc_id = $ncc_id;
    }

}
