<?php

class Front_Model_ThongBao extends Zend_Db_Table_Abstract {

    /**
     * Model Thong Bao
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_THONGBAO;
    protected $_id = 'tb_id';

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinLeft(TABLE_EMPLOYEES, TABLE_EMPLOYEES . '.em_id = ' . $this->_name . '.tb_from', array('em_ten', 'em_ho', 'em_phong_ban'));

        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                $select->where(TABLE_THONGBAO . '.' . $feild . ' =?', $keyword);
            }
        }

        //add sort vao truy van
        if (null != $sortFeild) {
            $select->order(TABLE_THONGBAO . '.' . $sortFeild);
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
    
    public function fetchOneRow($filters = array()) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinLeft(TABLE_EMPLOYEES, TABLE_EMPLOYEES . '.em_id = ' . $this->_name . '.tb_from', array('em_ten', 'em_ho', 'em_phong_ban'));

        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                $select->where(TABLE_THONGBAO . '.' . $feild . ' =?', $keyword);
            }
        }
        
        return $this->fetchRow($select);
    }

}