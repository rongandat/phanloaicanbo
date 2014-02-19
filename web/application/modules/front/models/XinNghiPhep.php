<?php

class Front_Model_XinNghiPhep extends Zend_Db_Table_Abstract {

    /**
     * Model Xin Nghi Phep
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_XINNGHIPHEP;
    protected $_id = 'xnp_id';

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
                ->joinInner(TABLE_EMPLOYEES, TABLE_EMPLOYEES . '.em_id = ' . $this->_name . '.xnp_em_id', array('em_ten', 'em_ten_dem', 'em_ho', 'em_ngay_sinh'));

        $select->where($this->_name . '.xnp_em_id in (?)', $em_id);
        $select->where($this->_name . '.xnp_from_date >=?', $from_date);
        $select->where($this->_name . '.xnp_from_date <=?', $to_date);
        if ($fetch_status)
            $select->where($this->_name . '.xnp_ptccb_status =?', $status);
        return $this->fetchAll($select);
    }

    public function fetchByPhongBan($list_phong_ban, $from_date, $to_date) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_EMPLOYEES, TABLE_EMPLOYEES . '.em_id = ' . $this->_name . '.xnp_em_id', array('em_ten', 'em_ten_dem', 'em_ho', 'em_ngay_sinh', 'em_phong_ban'));
        if (sizeof($list_phong_ban)) {
            $select->where(TABLE_EMPLOYEES . '.em_phong_ban in (?)', $list_phong_ban);
        }

        $select->where($this->_name . '.xnp_from_date >=?', $from_date);
        $select->where($this->_name . '.xnp_from_date <=?', $to_date);
        $select->order($this->_name . '.xnp_date_created DESC');
        return $this->fetchAll($select);
    }

}