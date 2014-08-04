<?php

class Front_Model_LamThemGio extends Zend_Db_Table_Abstract {

    /**
     * Model Lam Them Gio
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_LAMTHEMGIO;
    protected $_id = 'ltg_id';

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                $select->where($feild . ' =?', $keyword);
            }
        }
        //add sort vao truy van
        if (null != $sortFeild) {
            $select->order($sortFeild);
        }
        //add limit - offset vao truy van		
        if (null != $limit) {
            $offset = $page * NUM_PER_PAGE;
            if ($offset <= $limit) {
                $offset = $limit + NUM_PER_PAGE;
            }
            $select->limit($limit, $offset);
        }
        return $this->fetchAll($select);
    }
    
    public function fetchByDate($em_id, $from_date, $to_date, $status = 1, $fetch_status = 0) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_EMPLOYEES, TABLE_EMPLOYEES . '.em_id = ' . $this->_name . '.ltg_em_id', array('em_ten', 'em_ho', 'em_ngay_sinh'));

        $select->where($this->_name . '.ltg_em_id in (?)', $em_id);
        $select->where($this->_name . '.ltg_ngay >=?', $from_date);
        $select->where($this->_name . '.ltg_ngay <=?', $to_date);
        if($fetch_status)
            $select->where($this->_name . '.ltg_don_vi_status =?', $status);
        $select->order('ltg_ngay ASC');
        return $this->fetchAll($select);
    }

    public function fetchRowByDate($em_id, $from_date, $to_date, $status = 1, $fetch_status = 0) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_EMPLOYEES, TABLE_EMPLOYEES . '.em_id = ' . $this->_name . '.ltg_em_id', array('em_ten', 'em_ho', 'em_ngay_sinh'));

        $select->where($this->_name . '.ltg_em_id in (?)', $em_id);
        $select->where($this->_name . '.ltg_ngay >=?', $from_date);
        $select->where($this->_name . '.ltg_ngay <=?', $to_date);
        if($fetch_status)
            $select->where($this->_name . '.ltg_don_vi_status =?', $status);
        $select->order('ltg_ngay ASC');
        return $this->fetchRow($select);
    }
    
    public function fetchByMonth($year, $month) {
        $select = $this->select();
        $select->where('ltg_ngay >=?', "$year-$month-01 00:00:00");
        $select->where('ltg_ngay <=?', "$year-$month-31 23:59:59");
        $select->where('ltg_don_vi_status =?', 1);
        return $this->fetchAll($select);
    }
    
    public function fetchByPhongBan($list_phong_ban, $from_date, $to_date) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_EMPLOYEES, TABLE_EMPLOYEES . '.em_id = ' . $this->_name . '.ltg_em_id', array('em_ten', 'em_ho', 'em_ngay_sinh', 'em_phong_ban'));
        if (sizeof($list_phong_ban)) {
            $select->where(TABLE_EMPLOYEES . '.em_phong_ban in (?)', $list_phong_ban);
        }

        $select->where($this->_name . '.ltg_don_vi_status =?', 1);
        $select->where($this->_name . '.ltg_ngay >=?', $from_date);
        $select->where($this->_name . '.ltg_ngay <=?', $to_date);
        $select->order($this->_name . '.ltg_date_added DESC');
        return $this->fetchAll($select);
    }
}