<?php

class Front_Model_BangLuong extends Zend_Db_Table_Abstract {

    /**
     * Model Bang Luong
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_BANGLUONG;
    protected $_id = 'bl_id';    

    public function fetchByDate($em_id, $from_date, $to_date) {
        $select = $this->select();
        $select->where('bl_em_id =?', $em_id);
        $select->where('bl_date >=?', $from_date);
        $select->where('bl_date <=?', $to_date);
        return $this->fetchRow($select);
    }
    
    public function getSumHeSo($from_date, $to_date) {
        $select = $this->select()->from($this, array('sum(bl_tong_he_so) as tong_he_so_luong', 'sum(bl_tam_chi_dau_vao) as tong_tam_chi', 'sum(bl_tong_he_so_plld) as tong_he_so_plld'));
        $select->where('bl_date >=?', $from_date);
        $select->where('bl_date <=?', $to_date);
        return $this->fetchRow($select);
        
    }
}