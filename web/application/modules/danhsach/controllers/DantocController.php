<?php

class Danhsach_DantocController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '5006');
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

    public function xuatAction() {
        $inputFileName = APPLICATION_PATH . "/../tmp/Mau_Ca_Nhan_Excel.xlsx";

        $objPHPExcel = PHPExcel_IOFactory::load($inputFileName);

        $objPHPExcel->getProperties()->setCreator("Cục Hải Quan Hà Tĩnh");
        $objPHPExcel->getProperties()->setLastModifiedBy("Cục Hải Quan Hà Tĩnh");
        $objPHPExcel->getProperties()->setTitle("Bảng thông tin");
        $objPHPExcel->getProperties()->setSubject("Bảng thông tin");
        $objPHPExcel->getProperties()->setDescription("Bảng thông tin nhân viên - Cục Hải Quan Hà Tĩnh");


        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Lọc danh sách theo dân tộc - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'danhsach/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $filter_selected = $this->_getParam('id', 0);
        $hesoModel = new Front_Model_EmployeesHeso();
        $emModel = new Front_Model_Employees();
        $filterModel = new Front_Model_Dantoc();
        $list_filters = $filterModel->fetchData(array('dt_status' => 1));
        $filters = array();
        if ($filter_selected)
            $filters['em_dan_toc'] = $filter_selected;
        $list_items = $emModel->fetchData($filters);
        $i = 0;
        if (sizeof($list_items)) {
            foreach ($list_items as $item) {
                $em_he_so = $hesoModel->fetchRow("eh_em_id=$item->em_id");
                $objPHPExcel->setActiveSheetIndex($i);
                $objPHPExcel->getActiveSheet()->setTitle($item->em_ho . ' ' . $item->em_ten);
                $n = 6;
                foreach (unserialize($item->em_lich_su_dao_tao) as $item_daotao) {
                    $objPHPExcel->getActiveSheet()->SetCellValue('D' . $n, $item_daotao['chuyen_nghanh']);
                    $objPHPExcel->getActiveSheet()->SetCellValue('E' . $n, $item_daotao['ten_truong']);
                    $objPHPExcel->getActiveSheet()->SetCellValue('F' . $n, $item_daotao['van_bang']);
                    $objPHPExcel->getActiveSheet()->SetCellValue('G' . $n, $item_daotao['hinh_thuc']);
                    $n++;
                    if ($n == 8) {
                        break;
                    }
                }
                $objPHPExcel->getActiveSheet()->SetCellValue('H6', $this->view->viewGetQuanLyNhaNuocName($item->em_quan_ly_nha_nuoc));
                $objPHPExcel->getActiveSheet()->SetCellValue('I6', $this->view->viewGetLyLuanChinhTriName($item->em_ly_luan_chinh_tri));
                $objPHPExcel->getActiveSheet()->SetCellValue('J6', $item->em_so_cong_chuc);
                $objPHPExcel->getActiveSheet()->SetCellValue('K6', $item->em_phone);

                if ($em_he_so) {
                    if($em_he_so->eh_tham_niem && $em_he_so->eh_tham_niem != '0000-00-00 00:00:00'){
                        $objPHPExcel->getActiveSheet()->SetCellValue('A6', date('m/Y', strtotime($em_he_so->eh_tham_niem)));
                    } 
                    $objPHPExcel->getActiveSheet()->SetCellValue('A10', $em_he_so->eh_pc_cong_vu_phan_tram . '%');
                    $objPHPExcel->getActiveSheet()->SetCellValue('B10', $em_he_so->eh_pc_thu_hut . '%');
                    $objPHPExcel->getActiveSheet()->SetCellValue('C10', $em_he_so->eh_pc_kiem_nhiem);
                    $objPHPExcel->getActiveSheet()->SetCellValue('D10', $em_he_so->eh_pc_udn_phan_tram . '%');
                    $objPHPExcel->getActiveSheet()->SetCellValue('E10', $em_he_so->eh_pc_khac . ($em_he_so->eh_pc_khac_type ? '%' : ''));
                }

                if ($item->em_anh_the) {
                    $link_anh = UPLOAD_PATH . '/avatars/' . $item->em_anh_the;
                } else {
                    $link_anh = UPLOAD_PATH.'/avatars/anh_the.jpg';
                }
                
                $objDrawing = new PHPExcel_Worksheet_Drawing();
                $objDrawing->setName('Logo');
                $objDrawing->setDescription('Logo');
                $objDrawing->setPath(UPLOAD_PATH.'/avatars/anh_the.jpg');
                $objDrawing->setCoordinates('F15');
                $objDrawing->setHeight(180);
                $objDrawing->setWidth(120);
                $objDrawing->setWorksheet($objPHPExcel->getActiveSheet());
                
                $i++;
            }

            $count_sheet = $objPHPExcel->getSheetCount();
            for ($j = $count_sheet - 1; $j > $i; $j--) {
                $objPHPExcel->removeSheetByIndex($j);
            }
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="Bang_Thong_Tin_Nhan_Vien_Theo_Dan_Toc.xls"');
            header('Cache-Control: max-age=0');
            $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
            $objWriter->save('php://output');
            die();
        } else {
            die('Không có dữ liệu nào');
        }
    }

    public function indexAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Lọc danh sách theo dân tộc - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);

        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'danhsach/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $filter_selected = $this->_getParam('id', 0);

        $emModel = new Front_Model_Employees();
        $filterModel = new Front_Model_Dantoc();
        $list_filters = $filterModel->fetchData(array('dt_status' => 1));
        $filters = array();
        if ($filter_selected)
            $filters['em_dan_toc'] = $filter_selected;
        $list_items = $emModel->fetchData($filters);
        $paginator = Zend_Paginator::factory($list_items);
        $paginator->setItemCountPerPage(NUM_PER_PAGE);
        $paginator->setCurrentPageNumber($this->_page);
        $this->view->page = $this->_page;
        $this->view->paginator = $paginator;
        $this->view->filter = $list_filters;
        $this->view->filter_selected = $filter_selected;
    }

}