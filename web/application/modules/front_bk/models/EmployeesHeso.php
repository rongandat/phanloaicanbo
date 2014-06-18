<?php

class Front_Model_EmployeesHeso extends Zend_Db_Table_Abstract {

    /**
     * Model Emloyees He So
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_EMPLOYEESHESO;
    protected $_id = 'eh_id';

    public function getCurrentHeSo($thang = 0, $nam = 0, $em_id = 0) {
        $ngay_gioi_han = "$nam-$thang-01 00:00:00";
        $select = $this->select();
        $select->where('eh_han_ap_dung <=?', $ngay_gioi_han);
        $select->where('eh_em_id =?', $em_id);
        $select->order('eh_han_ap_dung DESC');

        $data_return = $this->fetchRow($select);
        if (!$data_return) {
            $select = $this->select();
            $select->where('eh_han_ap_dung >=?', $ngay_gioi_han);
            $select->where('eh_em_id =?', $em_id);
            $select->order('eh_han_ap_dung ASC');
            $data_return = $this->fetchRow($select);
        }
        return $data_return;
    }
    
    public function checkHeSo($thang, $nam, $em_id){
        $dau_ngay_gioi_han = "$nam-$thang-01 00:00:00";
        $cuoi_ngay_gioi_han = "$nam-$thang-01 23:59:59";
        $select = $this->select();
        $select->where('eh_han_ap_dung >=?', $dau_ngay_gioi_han);
        $select->where('eh_han_ap_dung <=?', $cuoi_ngay_gioi_han);
        $select->where('eh_em_id =?', $em_id);

        $data_return = $this->fetchRow($select);
        return $data_return;
    }

}