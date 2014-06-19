<?php

class Front_Model_Hocham extends Zend_Db_Table_Abstract {

    /**
     * Model Hoc Ham
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_HOCHAM;
    protected $_id = 'hh_id';

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                if ($feild === 'keyword') {
                    $select->where('hh_name like?', $keyword . '%')->orWhere('hh_name like?', '%' . $keyword . '%')->orWhere('hh_name like?', '%' . $keyword)->group('hh_id');
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