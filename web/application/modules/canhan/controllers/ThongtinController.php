<?php

class Canhan_ThongtinController extends Zend_Controller_Action {

    protected $_arrParam;
    protected $_page = 1;
    protected $_kw = '';
    protected $_actionMain;

    public function init() {
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();

        //kiem tra permission
        $check_permission = $this->_helper->global->checkPermission($identity->group_id, '2002');
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
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $employeeModel = new Front_Model_Employees();
        $employeeInfo = $employeeModel->fetchRow('em_id=' . $identity->em_id);
        $this->view->employee_info = $employeeInfo;
    }

    public function printerAction() {
        $this->_helper->layout()->disableLayout();
        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $employeeModel = new Front_Model_Employees();
        $employeeInfo = $employeeModel->fetchRow('em_id=' . $identity->em_id);
        $this->view->employee_info = $employeeInfo;
    }

    public function mau2cAction() {
        $translate = Zend_Registry::get('Zend_Translate');
        $this->view->title = 'Quản lý tài khoản - ' . $translate->_('TEXT_DEFAULT_TITLE');
        $this->view->headTitle($this->view->title);
        $layoutPath = APPLICATION_PATH . '/templates/' . TEMPLATE_USED;
        $option = array('layout' => 'canhan/layout',
            'layoutPath' => $layoutPath);
        Zend_Layout::startMvc($option);

        $auth = Zend_Auth::getInstance();
        $identity = $auth->getIdentity();
        $employeeModel = new Front_Model_Employees();
        $em_info = $employeeModel->fetchRow('em_id=' . $identity->em_id);

        $file_name = $this->loc_tieng_viet($em_info->em_ho) . '_' . $this->loc_tieng_viet($em_info->em_ten) . '.pdf';

        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor(PDF_AUTHOR);
        $pdf->SetTitle(PDF_HEADER_TITLE);
        $pdf->SetSubject(PDF_HEADER_TITLE);
        $pdf->SetKeywords(PDF_HEADER_TITLE, PDF_AUTHOR);
        $pdf->setPrintHeader(false);
        $pdf->setPrintFooter(false);

        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
        $pdf->SetMargins(PDF_MARGIN_LEFT, 12, PDF_MARGIN_RIGHT);
        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
        $pdf->setFontSubsetting(true);
        $pdf->SetFont('dejavusans', '', 9, '', true);
        $pdf->AddPage();

        $html = <<<EOF
<!-- EXAMPLE OF CSS STYLE -->
<style>
    p.top_co_quan{
        line-height: 20px;
    }
    p.title_so_yeu{
        text-transform: uppercase;
        font-size: 11px;
        font-weight: bold;
        text-align: center;
    }
    td{
        padding: 0;
        margin: 0;
        line-height: 20px;
        
    }
    td.td_anh{
        border: 1px solid #000;
    }
    
    tr.content_row > td{
        line-height: 25px;
        vertical-align: bottom;
        padding-top: 20px;
    }
</style>

<p class="top_co_quan">
Cơ quan, đơn vị có thẩm quyền quản lý CBCC .......................................................................................................<br />
Cơ quan, đơn vị sử dụng CBCC ..............................................................................................................................
</p>

<p class="title_so_yeu">SƠ YẾU LÝ LỊCH CÁN BỘ, CÔNG CHỨC</p>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td cellpadding="0" cellspacing="0">
            <br/>
            <table border="0" cellpadding="5" cellspacing="0" width="100%">
                <tr width="100%">
                    <td rowspan="5" align="center" width="100px" height="150px" class="td_anh">Ảnh 4x6 cm</td>
                    <td width="400px">1) Họ và tên khai sinh: NGUYỄN MẠNH HÙNG: </td>
                </tr>
                <tr>
                    <td>2) Tên gọi khác: .............................................................................................................</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="25%">
                                    <br />
                                    3) Sinh ngày: .........
                                </td>
                                <td width="18%">
                                    <br />  
                                    tháng .............
                                </td>
                                <td width="18%">
                                    <br />
                                    năm .............,
                                </td>
                                <td width="39%">
                                    <br />
                                    Giới tính (nam, nữ): .....................
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="44%">
                                    <br />
                                    4) Nơi sinh: Xã ..................................,
                                </td>
                                <td width="28%">
                                    <br />  
                                    Huyện ..........................,
                                </td>
                                <td width="28%">
                                    <br />
                                    Tỉnh ..............................
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="44%">
                                    <br />
                                    4) Quê quán: Xã ................................,
                                </td>
                                <td width="28%">
                                    <br />  
                                    Huyện ..........................,
                                </td>
                                <td width="28%">
                                    <br />
                                    Tỉnh ..............................
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>            
        </td>
    </tr>
    <tr class="content_row">
        <td>
            <br/>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="250px">6) Dân tộc: .................................................................</td>
                    <td width="250px">7) Tôn giáo: .................................................................</td>
                </tr>
            </table>
        </td>
    </tr> 
    <tr class="content_row">
        <td>
            <br />
            8) Nơi đăng ký bộ khẩu thường trú: ....................................................................................................................
            <br />
            (Số nhà, đường phố, thành phố, xóm, thôn, xã, huyện, tỉnh)
        </td>
    </tr>
    <tr class="content_row">
        <td>
            <br />
            9) Nơi ở hiện nay: ...............................................................................................................................................
            <br />
            (Số nhà, đường phố, thành phố, xóm, thôn, xã, huyện, tỉnh)
        </td>
    </tr>
    <tr class="content_row">
        <td>
            <br />
            10) Nghề nghiệp khi được tuyển dụng: ...............................................................................................................
        </td>
    </tr>
    <tr class="content_row">
        <td>
            <br/>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="45%">11) Ngày tuyển dụng: ...........................................</td>
                    <td width="55%">Cơ quan tuyển dụng: ...........................................................</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="content_row">
        <td>
            <br />
            12) Chức vụ (chức danh) hiện tại: .......................................................................................................................
            <br />
            (Về chính quyền hoặc Đảng, đoàn thể, kể cả chức vụ kiêm nhiệm)
        </td>
    </tr>
    <tr class="content_row">
        <td>
            <br />
            13) Công việc chính được giao: ...........................................................................................................................
        </td>
    </tr>
    <tr class="content_row">
        <td>
            <br/>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="45%">14) Ngày tuyển dụng: ...........................................</td>
                    <td width="55%">Cơ quan tuyển dụng: ...........................................................</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
EOF;

        $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);

        $pdf->Output($file_name, 'I');
        die();
    }

    function loc_tieng_viet($chuoi_vao) {
        $marTViet = array("à", "á", "ạ", "ả", "ã", "â", "ầ", "ấ", "ậ", "ẩ", "ẫ", "ă",
            "ằ", "ắ", "ặ", "ẳ", "ẵ", "è", "é", "ẹ", "ẻ", "ẽ", "ê", "ề"
            , "ế", "ệ", "ể", "ễ",
            "ì", "í", "ị", "ỉ", "ĩ",
            "ò", "ó", "ọ", "ỏ", "õ", "ô", "ồ", "ố", "ộ", "ổ", "ỗ", "ơ"
            , "ờ", "ớ", "ợ", "ở", "ỡ",
            "ù", "ú", "ụ", "ủ", "ũ", "ư", "ừ", "ứ", "ự", "ử", "ữ",
            "ỳ", "ý", "ỵ", "ỷ", "ỹ",
            "đ",
            "À", "Á", "Ạ", "Ả", "Ã", "Â", "Ầ", "Ấ", "Ậ", "Ẩ", "Ẫ", "Ă"
            , "Ằ", "Ắ", "Ặ", "Ẳ", "Ẵ",
            "È", "É", "Ẹ", "Ẻ", "Ẽ", "Ê", "Ề", "Ế", "Ệ", "Ể", "Ễ",
            "Ì", "Í", "Ị", "Ỉ", "Ĩ",
            "Ò", "Ó", "Ọ", "Ỏ", "Õ", "Ô", "Ồ", "Ố", "Ộ", "Ổ", "Ỗ", "Ơ"
            , "Ờ", "Ớ", "Ợ", "Ở", "Ỡ",
            "Ù", "Ú", "Ụ", "Ủ", "Ũ", "Ư", "Ừ", "Ứ", "Ự", "Ử", "Ữ",
            "Ỳ", "Ý", "Ỵ", "Ỷ", "Ỹ",
            "Đ");

        $marKoDau = array("a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a"
            , "a", "a", "a", "a", "a", "a",
            "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e",
            "i", "i", "i", "i", "i",
            "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o"
            , "o", "o", "o", "o", "o",
            "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u",
            "y", "y", "y", "y", "y",
            "d",
            "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A"
            , "A", "A", "A", "A", "A",
            "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
            "I", "I", "I", "I", "I",
            "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O"
            , "O", "O", "O", "O", "O",
            "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U",
            "Y", "Y", "Y", "Y", "Y",
            "D");
        $chuoi_ra = str_replace($marTViet, $marKoDau, $chuoi_vao);
        return $chuoi_ra;
    }

}