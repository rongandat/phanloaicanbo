<?php

class Canhan_ChamcongController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '2005');
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
        $this->view->title = 'Chấm công - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => '1_column/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $date = time();
        $thang = $this->_getParam('thang', date('m', $date));
        $nam = $this->_getParam('nam', date('Y', $date));

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $em_id = $identity->em_id;

        $holidaysModel = new Front_Model_Holidays();
        $list_holidays = $holidaysModel->fetchData(array(), 'hld_order ASC');
        $xinnghiphepModel = new Front_Model_XinNghiPhep();
        $list_nghi_phep = $xinnghiphepModel->fetchByDate($em_id, "$nam-$thang-01 00:00:00", "$nam-$thang-31 23:59:59");

        $chamcongModel = new Front_Model_ChamCong();
        $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $em_id, 'c_thang' => $thang, 'c_nam' => $nam));
        $error_message = array();
        $success_message = '';
        if ($this->_request->isPost()) {
            $data_cham_cong = $this->_arrParam['cham_cong'];
            $current_time = new Zend_Db_Expr('NOW()');
            if ($cham_cong && ($cham_cong->c_don_vi_status != '-1' || $cham_cong->c_ptccb_status != '-1')) {
                $error_message[] = 'Chấm công đã được duyệt nên không thể thay đổi.';
            }
            if (!sizeof($error_message)) {
                if ($cham_cong) {
                    $chamcongModel->update(array(
                        'c_ngay_1' => (isset($data_cham_cong[1]) ? $data_cham_cong[1] : ''),
                        'c_ngay_2' => (isset($data_cham_cong[2]) ? $data_cham_cong[2] : ''),
                        'c_ngay_3' => (isset($data_cham_cong[3]) ? $data_cham_cong[3] : ''),
                        'c_ngay_4' => (isset($data_cham_cong[4]) ? $data_cham_cong[4] : ''),
                        'c_ngay_5' => (isset($data_cham_cong[5]) ? $data_cham_cong[5] : ''),
                        'c_ngay_6' => (isset($data_cham_cong[6]) ? $data_cham_cong[6] : ''),
                        'c_ngay_7' => (isset($data_cham_cong[7]) ? $data_cham_cong[7] : ''),
                        'c_ngay_8' => (isset($data_cham_cong[8]) ? $data_cham_cong[8] : ''),
                        'c_ngay_9' => (isset($data_cham_cong[9]) ? $data_cham_cong[9] : ''),
                        'c_ngay_10' => (isset($data_cham_cong[10]) ? $data_cham_cong[10] : ''),
                        'c_ngay_11' => (isset($data_cham_cong[11]) ? $data_cham_cong[11] : ''),
                        'c_ngay_12' => (isset($data_cham_cong[12]) ? $data_cham_cong[12] : ''),
                        'c_ngay_13' => (isset($data_cham_cong[13]) ? $data_cham_cong[13] : ''),
                        'c_ngay_14' => (isset($data_cham_cong[14]) ? $data_cham_cong[14] : ''),
                        'c_ngay_15' => (isset($data_cham_cong[15]) ? $data_cham_cong[15] : ''),
                        'c_ngay_16' => (isset($data_cham_cong[16]) ? $data_cham_cong[16] : ''),
                        'c_ngay_17' => (isset($data_cham_cong[17]) ? $data_cham_cong[17] : ''),
                        'c_ngay_18' => (isset($data_cham_cong[18]) ? $data_cham_cong[18] : ''),
                        'c_ngay_19' => (isset($data_cham_cong[19]) ? $data_cham_cong[19] : ''),
                        'c_ngay_20' => (isset($data_cham_cong[20]) ? $data_cham_cong[20] : ''),
                        'c_ngay_21' => (isset($data_cham_cong[21]) ? $data_cham_cong[21] : ''),
                        'c_ngay_22' => (isset($data_cham_cong[22]) ? $data_cham_cong[22] : ''),
                        'c_ngay_23' => (isset($data_cham_cong[23]) ? $data_cham_cong[23] : ''),
                        'c_ngay_24' => (isset($data_cham_cong[24]) ? $data_cham_cong[24] : ''),
                        'c_ngay_25' => (isset($data_cham_cong[25]) ? $data_cham_cong[25] : ''),
                        'c_ngay_26' => (isset($data_cham_cong[26]) ? $data_cham_cong[26] : ''),
                        'c_ngay_27' => (isset($data_cham_cong[27]) ? $data_cham_cong[27] : ''),
                        'c_ngay_28' => (isset($data_cham_cong[28]) ? $data_cham_cong[28] : ''),
                        'c_ngay_29' => (isset($data_cham_cong[29]) ? $data_cham_cong[29] : ''),
                        'c_ngay_30' => (isset($data_cham_cong[30]) ? $data_cham_cong[30] : ''),
                        'c_ngay_31' => (isset($data_cham_cong[31]) ? $data_cham_cong[31] : ''),
                        'c_date_modifyed' => $current_time
                            ), 'c_id=' . $cham_cong->c_id
                    );
                } else {
                    $chamcongModel->insert(array(
                        'c_em_id' => $em_id,
                        'c_thang' => $thang,
                        'c_nam' => $nam,
                        'c_ngay_1' => (isset($data_cham_cong[1]) ? $data_cham_cong[1] : ''),
                        'c_ngay_2' => (isset($data_cham_cong[2]) ? $data_cham_cong[2] : ''),
                        'c_ngay_3' => (isset($data_cham_cong[3]) ? $data_cham_cong[3] : ''),
                        'c_ngay_4' => (isset($data_cham_cong[4]) ? $data_cham_cong[4] : ''),
                        'c_ngay_5' => (isset($data_cham_cong[5]) ? $data_cham_cong[5] : ''),
                        'c_ngay_6' => (isset($data_cham_cong[6]) ? $data_cham_cong[6] : ''),
                        'c_ngay_7' => (isset($data_cham_cong[7]) ? $data_cham_cong[7] : ''),
                        'c_ngay_8' => (isset($data_cham_cong[8]) ? $data_cham_cong[8] : ''),
                        'c_ngay_9' => (isset($data_cham_cong[9]) ? $data_cham_cong[9] : ''),
                        'c_ngay_10' => (isset($data_cham_cong[10]) ? $data_cham_cong[10] : ''),
                        'c_ngay_11' => (isset($data_cham_cong[11]) ? $data_cham_cong[11] : ''),
                        'c_ngay_12' => (isset($data_cham_cong[12]) ? $data_cham_cong[12] : ''),
                        'c_ngay_13' => (isset($data_cham_cong[13]) ? $data_cham_cong[13] : ''),
                        'c_ngay_14' => (isset($data_cham_cong[14]) ? $data_cham_cong[14] : ''),
                        'c_ngay_15' => (isset($data_cham_cong[15]) ? $data_cham_cong[15] : ''),
                        'c_ngay_16' => (isset($data_cham_cong[16]) ? $data_cham_cong[16] : ''),
                        'c_ngay_17' => (isset($data_cham_cong[17]) ? $data_cham_cong[17] : ''),
                        'c_ngay_18' => (isset($data_cham_cong[18]) ? $data_cham_cong[18] : ''),
                        'c_ngay_19' => (isset($data_cham_cong[19]) ? $data_cham_cong[19] : ''),
                        'c_ngay_20' => (isset($data_cham_cong[20]) ? $data_cham_cong[20] : ''),
                        'c_ngay_21' => (isset($data_cham_cong[21]) ? $data_cham_cong[21] : ''),
                        'c_ngay_22' => (isset($data_cham_cong[22]) ? $data_cham_cong[22] : ''),
                        'c_ngay_23' => (isset($data_cham_cong[23]) ? $data_cham_cong[23] : ''),
                        'c_ngay_24' => (isset($data_cham_cong[24]) ? $data_cham_cong[24] : ''),
                        'c_ngay_25' => (isset($data_cham_cong[25]) ? $data_cham_cong[25] : ''),
                        'c_ngay_26' => (isset($data_cham_cong[26]) ? $data_cham_cong[26] : ''),
                        'c_ngay_27' => (isset($data_cham_cong[27]) ? $data_cham_cong[27] : ''),
                        'c_ngay_28' => (isset($data_cham_cong[28]) ? $data_cham_cong[28] : ''),
                        'c_ngay_29' => (isset($data_cham_cong[29]) ? $data_cham_cong[29] : ''),
                        'c_ngay_30' => (isset($data_cham_cong[30]) ? $data_cham_cong[30] : ''),
                        'c_ngay_31' => (isset($data_cham_cong[31]) ? $data_cham_cong[31] : ''),
                        'c_date_created' => $current_time,
                        'c_date_modifyed' => $current_time
                            )
                    );
                }
                $success_message = 'Đã cập nhật thành công.';
                $cham_cong = $chamcongModel->fetchOneData(array('c_em_id' => $em_id, 'c_thang' => $thang, 'c_nam' => $nam));
            }
        }

        $this->view->success_message = $success_message;
        $this->view->error_message = $error_message;
        $this->view->thang = $thang;
        $this->view->nam = $nam;
        $this->view->cham_cong = $cham_cong;
        $this->view->list_holidays = $list_holidays;
        $this->view->list_nghi_phep = $list_nghi_phep;
    }

}