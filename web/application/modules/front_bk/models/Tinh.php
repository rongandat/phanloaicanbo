<?php

class Front_Model_Tinh extends Zend_Db_Table_Abstract {

    /**
     * Model Tinh
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_TINH;
    protected $_id = 'tinh_id';

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                if ($feild === 'keyword') {
                    $select->where('tinh_name like?', $keyword . '%')->orWhere('tinh_name like?', '%' . $keyword . '%')->orWhere('tinh_name like?', '%' . $keyword)->group('tinh_id');
                } else {
                    $select->where($feild . ' =?', $keyword);
                }
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

}