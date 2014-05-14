<?php

class Front_Model_NgachCongChuc extends Zend_Db_Table_Abstract {

    /**
     * Model Ngach Cong Chuc
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_NGACHCONGCHUC;
    protected $_id = 'ncc_id';

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                if ($feild === 'keyword') {
                    $select->where('ncc_name like?', $keyword . '%')->orWhere('ncc_name like?', '%' . $keyword . '%')->orWhere('ncc_name like?', '%' . $keyword)->group('ncc_id');
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

    public function getByMaNgach($ma, $status = 1) {
        $select = $this->select();
        $select->where('LOWER(ncc_ma_ngach) =?', $ma);
        $select->where('ncc_status =?', $status);
        return $this->fetchRow($select);
    }

}