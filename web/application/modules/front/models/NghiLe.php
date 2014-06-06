<?php

class Front_Model_NghiLe extends Zend_Db_Table_Abstract {

    /**
     * Model Dan Toc
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_NGHILE;
    protected $_id = 'nn_id';

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                if ($feild === 'keyword') {
                    $select->where('nn_name like?', $keyword . '%')->orWhere('nn_name like?', '%' . $keyword . '%')->orWhere('nn_name like?', '%' . $keyword)->group('nn_id');
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

    public function fetchByYear($year) {
        $select = $this->select();
        $select->where('nn_tu_ngay >=?', "$year-1-01 00:00:00");
        $select->where('nn_den_ngay <=?', "$year-12-01 00:00:00");
        return $this->fetchAll($select);
    }
    
    public function fetchRowByDate($date) {
        $select = $this->select();
        $select->where('nn_tu_ngay >=?', "$date 00:00:00");
        $select->where('nn_den_ngay <=?', "$date 00:00:00");
        $select->where('nn_status=?', 1);
        return $this->fetchRow($select);
    }

}