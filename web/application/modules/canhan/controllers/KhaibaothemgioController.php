<?php

class Canhan_KhaibaothemgioController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '2006');
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
        $this->view->title = 'Quản lý làm thêm giờ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $ltgModel = new Front_Model_LamThemGio();
        $list_lam_them_gio = $ltgModel->fetchData(array('ltg_em_id' => $em_id), 'ltg_date_added ASC');
        $paginator = Zend_Paginator::factory($list_lam_them_gio);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
        $this->view->list_lam_them_gio = $list_lam_them_gio;
    }

    public function addAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý làm thêm giờ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $error_message = array();
        $success_message = '';
        $ltgModel = new Front_Model_LamThemGio();
        if ($this->_request->isPost()) {
            $ltg_date = trim($this->_arrParam['ltg_date']);
            $ltg_chi_tiet = trim($this->_arrParam['ltg_chi_tiet']);
            $ltg_gio_bat_dau = $this->_arrParam['ltg_gio_bat_dau'];
            $ltg_phut_bat_dau = $this->_arrParam['ltg_phut_bat_dau'];
            $ltg_gio_ket_thuc = $this->_arrParam['ltg_gio_ket_thuc'];
            $ltg_phut_ket_thuc = $this->_arrParam['ltg_phut_ket_thuc'];

            if (!$ltg_date) {
                $error_message[] = 'Ngày làm thêm giờ không được để trống.';
            }

            if (!$ltg_chi_tiet) {
                $error_message[] = 'Chi tiết công việc không được để trống.';
            }

            if (($ltg_gio_ket_thuc < $ltg_gio_bat_dau) || (($ltg_gio_ket_thuc == $ltg_gio_bat_dau) && ($ltg_phut_bat_dau > $ltg_phut_ket_thuc))) {
                $error_message[] = 'Giờ kết thúc lớn hơn giờ bắt đầu.';
            }

            if (!sizeof($error_message)) {
                $current_time = new Zend_Db_Expr('NOW()');
                $ngay_them_gio = DateTime::createFromFormat('d/m/yy', $ltg_date);
                $ltgModel->insert(array(
                    'ltg_em_id' => $em_id,
                    'ltg_chi_tiet' => $ltg_chi_tiet,
                    'ltg_ngay' => date_format($ngay_them_gio, "Y-m-d H:iP"),
                    'ltg_gio_bat_dau' => $ltg_gio_bat_dau,
                    'ltg_phut_bat_dau' => $ltg_phut_bat_dau,
                    'ltg_gio_ket_thuc' => $ltg_gio_ket_thuc,
                    'ltg_phut_ket_thuc' => $ltg_phut_ket_thuc,
                    'ltg_date_added' => $current_time
                        )
                );
                $success_message = 'Đã khai báo thành công.';
            }
        }
        $this->view->page = $this->_page;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    public function editAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý làm thêm giờ - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;
        $ltg_id = $this->_getParam('id', 0);
        $error_message = array();
        $success_message = '';
        $ltgModel = new Front_Model_LamThemGio();
        $ltg_info = $ltgModel->fetchRow($ltgModel->select()->where('ltg_id = ?', $ltg_id)->where('ltg_em_id=?', $em_id)->where('ltg_don_vi_status=?', '-1')->where('ltg_tccb_status=?', '-1'));
        if ($ltg_info) {
            if ($this->_request->isPost()) {
                $ltg_date = trim($this->_arrParam['ltg_date']);
                $ltg_chi_tiet = trim($this->_arrParam['ltg_chi_tiet']);
                $ltg_gio_bat_dau = $this->_arrParam['ltg_gio_bat_dau'];
                $ltg_phut_bat_dau = $this->_arrParam['ltg_phut_bat_dau'];
                $ltg_gio_ket_thuc = $this->_arrParam['ltg_gio_ket_thuc'];
                $ltg_phut_ket_thuc = $this->_arrParam['ltg_phut_ket_thuc'];

                if (!$ltg_date) {
                    $error_message[] = 'Ngày làm thêm giờ không được để trống.';
                }

                if (!$ltg_chi_tiet) {
                    $error_message[] = 'Chi tiết công việc không được để trống.';
                }

                if (($ltg_gio_ket_thuc < $ltg_gio_bat_dau) || (($ltg_gio_ket_thuc == $ltg_gio_bat_dau) && ($ltg_phut_bat_dau > $ltg_phut_ket_thuc))) {
                    $error_message[] = 'Giờ kết thúc lớn hơn giờ bắt đầu.';
                }

                if (!sizeof($error_message)) {
                    $ngay_them_gio = DateTime::createFromFormat('d/m/yy', $ltg_date);
                    $ltgModel->update(array(
                        'ltg_em_id' => $em_id,
                        'ltg_chi_tiet' => $ltg_chi_tiet,
                        'ltg_ngay' => date_format($ngay_them_gio, "Y-m-d H:iP"),
                        'ltg_gio_bat_dau' => $ltg_gio_bat_dau,
                        'ltg_phut_bat_dau' => $ltg_phut_bat_dau,
                        'ltg_gio_ket_thuc' => $ltg_gio_ket_thuc,
                        'ltg_phut_ket_thuc' => $ltg_phut_ket_thuc
                            ), 'ltg_id = ' . $ltg_id
                    );
                    $success_message = 'Đã cập nhật thành công.';
                }
            }
        }
        $this->view->ltg_info = $ltg_info;
        $this->view->page = $this->_page;
        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
    }

    function deleteAction() {
        $this->_helper->layout()->disableLayout();
        $ltgmodel = new Front_Model_LamThemGio();
        if ($this->_request->isPost()) {
            $auth = Zend_Auth::getInstance();
            $identity = $auth->getIdentity();
            $em_id = $identity->em_id;
            $ltg_id = $this->_arrParam['ltg_id'];
            $ltg_info = $ltgmodel->fetchRow($ltgmodel->select()->where('ltg_id = ?', $ltg_id)->where('ltg_em_id=?', $em_id)->where('ltg_don_vi_status=?', '-1')->where('ltg_tccb_status=?', '-1'));
            if ($ltg_info) {
                $success_message = $ltgmodel->delete(array('ltg_id' => $ltg_id));
                $this->view->success_message = $success_message;
            }
        }
    }

}