<?php

class Front_Model_Employees extends Zend_Db_Table_Abstract {

    /**
     * Model Employees
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_EMPLOYEES;
    protected $_id = 'em_id';

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
    
    public function getUsersByGroupsAndPhong($groups, $room){
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_USERS, TABLE_USERS . '.em_id = ' . $this->_name . '.em_id', array('*'))
                ->joinInner(TABLE_GROUPS, TABLE_USERS . '.group_id = ' . TABLE_GROUPS . '.group_id', array('*'));
        $select->where(TABLE_GROUPS . '.group_id in (?)', $groups);
        $select->where($this->_name . '.em_phong_ban =?', $room);
        return $this->fetchAll($select);
    }
}