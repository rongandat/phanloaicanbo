<?php

class Front_Model_EmployeesEdit extends Zend_Db_Table_Abstract {

    /**
     * Model Employees
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_EMPLOYEESEDIT;
    protected $_id = 'eme_id';

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

    public function fetchByPhongBan($list_phong_ban) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_EMPLOYEES, TABLE_EMPLOYEES . '.em_id = ' . $this->_name . '.em_id', array('em_ten', 'em_ho', 'em_ngay_sinh'));

        $select->where(TABLE_EMPLOYEES . '.em_phong_ban in (?)', $list_phong_ban);
        $select->order($this->_name.'.eme_date_modified DESC');
        return $this->fetchAll($select);
    }
    
}